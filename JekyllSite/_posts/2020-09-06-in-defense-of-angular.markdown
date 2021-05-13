---
layout: post
title:  "In Defense of Angular"
date:   2020-09-06 17:45:00 +0100
categories: devops
---

It would probably be hard to argue that React hasn't very much won the frontend javascript framework war. Even a cursory look at the [stats](https://gist.github.com/tkrotoff/b1caa4c3a185629299ec234d2314e190) on GitHub, React is both vastly more popular and remains loved despite it's heavy use. I've even fooled around with React myself, despite most of my experience and development on the frontend being in Angular. So why should you care about Angular in 2020? 

![Angular Logo](/images/2020-09-06-in-defense-of-angular.png)

## The Toolchain and Standards

I'll be honest - I really like the Angular CLI. For those that haven't interacted with Angular before, a lot of the simple things you might do in a frontend framework (Adding a component, starting a project, adding services) can be done via a command line interface. It just feels slick and powerful, and takes away a lot of the mundane boilerplate work. It feels reminiscent of working with something like Razor pages in a .Net MVC WebApp - which is maybe why I like it. I enjoy the experience of a computer doing the stuff that computers are good at, letting me focus on what I want to produce - especially in the context of frontend work.

I also am a fan of Typescript being baked in from the start. Javascript is about as far away as you can get from type safe, so anything that helps codify standards for how things should be shaped and what things can do is a blessing in my eyes. It's not perfect, but you're not *forced* to use it - you can still drop into the classic looseness of javascript if you need to do something more loose.

## Less Time Researching

Angular has very much been built with the idea of decisions having been made. For example, it's built in to lean heavily on rxjs Subscriptions, rather than sticking to the more standard javascript Promises. This could rub you the wrong way if you've worked with other frameworks - there is essentially an "Angular" way of doing things, that you'll be expected to adhere to. What this does mean though, is that Angular comes pre-packaged with implementations for the common problems of writing a frontend - maintaining state, calling APIs & serving responses, cross-browser compatibility. How you'd be expected to do these things is all laid out in the (in my opinion) quite excellent documentation.

## It's Not All Roses

The convenience of Angular does come at a cost. Using other npm packages not specifically built for angular can be a bit of a wrestling match. For example, I used Leaflet in an Angular project, and getting that to work as a component was something of a pain. This is also reflected in that the ecosystem is much smaller - there are a lot less Angular specific packages. I think this could be a consequence of Angular's enterprise aspirations - where there tends to be a lot less sharing of code. Finally, Angular is built with specific use cases in mind - if you're not building a Single Page App, you might find yourself in sticky waters quite quickly. There is also a lot of boilerplate code involved in Angular - probably as a consequence of the CLI populating a lot of it for you. 

## Conclusion

There isn't an epic conclusion to this post. If you were to ask me, as a green developer, what framework to look into, I'd probably still recommend React. Using it will teach you the intricacies of the Node ecosystem, and you'll be writing javascript a lot closer to the metal, which can be a real learning experience. I also think if you're a seasoned node/javascript developer, you might find yourself feeling hamstrung by the lack of choice and freedom working with Angular.

However if you're primarily an enterprise backend developer, used to working with languages like C# and Java, I think you'll find the framework familiar. This is less to do with things like Typescript, and more to do with the fairly rigid documentation and way of doing things. It's also a nice framework to pick up when you just need to get an interface on a page, especially if you're expecting a lot of interactivity.
