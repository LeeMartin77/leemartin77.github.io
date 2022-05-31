---
layout: post
title: "Traefik Control: Using OAuth2 Proxy with Traefik"
date: 2022-05-31 10:00:00 +0100
categories: infrastructure kubernetes
excerpt_separator: <!--more-->
---

In recent months a lot of my world has revolved around kubernetes. Full disclosure on my biases - K8S has routinely impressed me and I've found it really easy to work with. The only thing that has given me trouble has been Ingress - in a lot of ways because in my downtime I'm working with a "bare metal" cluster on some Raspberry Pi's (a subject for another day). [This podcast episode](https://kubernetespodcast.com/episode/041-ingress/) is a great listen into why this can be problematic, as it talks about how K8S basically expects you to be using a load balancer from a cloud provider.

Initially using [nginx-ingress](https://kubernetes.github.io/ingress-nginx/), I then migrated to [Traefik](https://traefik.io/) when I moved from MicroK8S to [K3s](https://k3s.io/). The performance and stability improvements have been amazing, but I struggled to find a good explanation on how I could continue to use [Oauth2 Proxy](https://github.com/oauth2-proxy/oauth2-proxy) to protect my applications.

![KubeCube Image](/images/2022-05-31-traefik-control.jpg)

<!--more-->

## The Code

I'm an engineer. I get it. If you just want to copy-paste some code and figure it out, here's an end-to-end example:

```yaml
---
apiVersion: traefik.containo.us/v1alpha1
kind: IngressRoute
metadata:
  name: traefik-ingress
  namespace: 
spec:
  routes:
    - match: "Host(`my.host.name`) && PathPrefix(`/oauth2`)"
      kind: Rule
      services:
        - name: oauth2-proxy
          namespace: my-namespace
          port: 4180
      middlewares:
        - name: oauth-errors
    - match: Host(`my.host.name`)
      kind: Rule
      middlewares:
        - name: oauth-errors
        - name: oauth2-proxy
      services:
        - name: my-app
          port: http
---
apiVersion: traefik.containo.us/v1alpha1
kind: Middleware
metadata:
  name: oauth-errors
spec:
  errors:
    status:
      - "401-403"
    service:
      name: oauth2-proxy
      port: 4180
    query: "/oauth2/sign_in"
---
apiVersion: traefik.containo.us/v1alpha1
kind: Middleware
metadata:
  name: oauth2-proxy
  namespace: my-namespace
spec:
  forwardAuth:
    address: http://oauth2-proxy.my-namespace.svc:4180/oauth2/auth
    trustForwardHeader: true
    authResponseHeaders:
      - X-Auth-Request-User
      - Set-Cookie
---
apiVersion: v1
kind: Service
metadata:
  labels:
    app: oauth2-proxy
  name: oauth2-proxy
  namespace: my-namespace
spec:
  type: ClusterIP
  ports:
  - name: http
    port: 4180
    protocol: TCP
    targetPort: 4180
  selector:
    k8s-app: oauth2-proxy
---
apiVersion: apps/v1
kind: Deployment
metadata:
  labels:
    k8s-app: oauth2-proxy
  name: oauth2-proxy
  namespace: my-namespace
spec:
  replicas: 1
  selector:
    matchLabels:
      k8s-app: oauth2-proxy
  template:
    metadata:
      labels:
        k8s-app: oauth2-proxy
    spec:
      containers:
      - args:
        - --provider=oidc
        - --oidc-issuer-url=[OIDC Issuer URL here]
        - --email-domain=*
        - --upstream=file:///dev/null
        - --http-address=0.0.0.0:4180
        - --pass-user-headers=true
        - --set-authorization-header=true
        - --set-xauthrequest=true
        - --reverse-proxy=true
        env:
        - name: OAUTH2_PROXY_CLIENT_ID
          value: my-client-id-123
        - name: OAUTH2_PROXY_CLIENT_SECRET
          value: my-client-secret-123
        - name: OAUTH2_PROXY_COOKIE_SECRET
          value: somerandomstringasacookiesecret
        image: quay.io/oauth2-proxy/oauth2-proxy:latest
        imagePullPolicy: Always
        name: oauth2-proxy
        ports:
        - containerPort: 4180
          protocol: TCP
```

## The Explanation

Lets try and break down the code block above into meaningful chunks however, so we can see how the pieces fit together.

### Oauth2 Proxy

For those that haven't encountered it, Oauth2 Proxy is a fantastic project to act as a uniform interface for many different authentication providers. In my particular case I was using it with an OIDC endpoint for a generic OAuth2 experience, however other providers in the project have bespoke implementations. The documentation is pretty good, and you can get most things working with it. In terms of passing the authentication onto the actual application, you can forward on trustable headers with values such as a user ID or an email. 

In this example, we have a very simple deployment and service for the oauth2 proxy, setup to be as minimal as possible.

#### But, why?

A pattern I've been experiencing and using quite a lot recently is having authentication logic entirely removed from the application being built. It massively streamlines the entire process when you have a trusted header set by your ingress (whether that's in the cloud or in your cluster). Your app has an easy time in that it just checks for given value(s), and for local development you either set the header (if calling to the resource) or hard code values for development environments.

### Middlewares

The middlewares are the real meat of this example, so let's go through them both:

#### ForwardAuth


```yaml
apiVersion: traefik.containo.us/v1alpha1
kind: Middleware
metadata:
  name: oauth2-proxy
  namespace: my-namespace
spec:
  forwardAuth:
    address: http://oauth2-proxy.my-namespace.svc:4180/oauth2/auth
    trustForwardHeader: true
    authResponseHeaders:
      - X-Auth-Request-User
      - Set-Cookie
```

[This middleware](https://doc.traefik.io/traefik/v2.0/middlewares/forwardauth/) is responsible for calling out to the given address to check the user's credentials. The documentation is pretty short and worth a read, but the important bit for your application (and might change depending on your auth provider) is probably the `authResponseHeaders`. This sets the cookies you want to forward on from the auth middleware. `Set-Cookie` helps with making sure that the user gets given a cookie/their cookie is refreshed, meaning they won't have to keep logging back in.

#### Errors


```yaml
apiVersion: traefik.containo.us/v1alpha1
kind: Middleware
metadata:
  name: oauth-errors
spec:
  errors:
    status:
      - "401-403"
    service:
      name: oauth2-proxy
      port: 4180
    query: "/oauth2/sign_in"
```

[This middleware](https://doc.traefik.io/traefik/v2.0/middlewares/errorpages/) was the interesting bit. With `nginx-ingress`'s integration to an auth service, if the auth failed the user would be redirected based on some configuration. In contrast, in traefik you want to stack some middlewares, rerouting the user to the signin endpoint if any invalid authentication status codes are returned. This has a nice advantage in that it's not just the auth system that'll kick a user back to signin - if your application returns a `401-403` response (say, a user tries to access something they're not supposed to), it'll also redirect them to login.

## Closing

This particular issue has been an interesting one for me. Initially I felt that 0auth2 proxy wasn't suitable - briefly using a traefik-specific oauth2 proxy service - because the application wouldn't redirect to login when it was an unauthenticated request. The traefik specific implementation was okay, but I had to fork the project in order to modify it, as I needed to send on the user id value rather than email. It also didn't automatically refresh the token - not ideal as the end application for me is an always-on dashboard. After some time away, I had a realisation that I'd missed a bit of a fundamental with the traefik middlewares - that I could stack them. With that revelation getting the application working with 0auth2 proxy was a breeze - maybe half an hour's work.

Hopefully, this blog might come in use to someone else who finds themselves in the same position as I was - trying to migrate from `nginx-ingress` to `traefik`, with `oauth2-proxy` in the mix.