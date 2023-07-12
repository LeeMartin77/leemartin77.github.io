---
layout: post
title: "React is a Relic of a Bygone Age"
date: 2023-06-28 07:00:00 +0100
categories: software frontend javascript
excerpt_separator: <!--more-->
---

It's a lazy Tuesday afternoon at work, when you get pinged by your manager that something is very wrong with the customer-facing application. There haven't been any critical changes but for some reason all pages are blank, or showing some kind of obtuse error message. The underlying services seem fine, but the frontend application is refusing to stay up, constantly tripping over itself. After some frantic checking of logs, you discover that the whole frontend is absolutely chewing through memory on the server after a dependency version bump - and issue which only shows in prod under a moderate load. You bump it back down, pin the version, and watch things settle back down - vowing that you'll find a better framework soon. After all, no one wants to deal with React's nonsense anymore.

<!--more-->

## Nothing is wrong with React

It's really important to kick this post off by saying there is nothing fundamentally *wrong* with React. It's a nice enough frontend framework, with a huge amount of flexibility, that took the programming world by storm for good reason. The heart of this post however is a warning - a bit of a Cassandra-esque proclomation which might well be premature, or completely untrue - that React might be on the cusp of going out of fashion. Incepted in 2013 at Facebook, React has had a *phenominally* good run of it - the idea of a frontend library lasting that long almost seems like madness - with it pretty steadfastedly staying at the top of people's list of technologies they want to work with.

## The Web has changed

The seed that started this idea in my head was the evolution of the browser API. My earliest reference point for working with JavaScript on the web was my university days, back around 2010-2013, however even that small distance ago feels like aeons. Here's a (small fraction) of the things that have been released as part of the standard browser HTML5 and JS APIs since then:

```
Date and Time input types
Form Validation
OffscreenCanvas
WebGL
Dialog Elements
Search input type

BigInt
Arrow functions
Object.entries
Promises
Fetch
IndexedDB
```

The heady days of 2013 is where React was incepted though - so in a lot of ways, a framework from this time would have to provide a degree of support for these things. Is it that simple? No - the actual library itself has of course been updated many, many times since then. But the core idea of using JSX to template your DOM hasn't gone anywhere. For me, it almost feels like an overabstraction now - HTML has become significantly more expressive, and the JavaScript to support it has become more consise. Yet we still think in terms of the Shadow DOM and render loops - something that I'll come back to for another part of this post.

## Developers have shoehorned it everywhere

One of the key selling points of React when it was put up against it's top rivals (Vue and Angular), is that _it isn't a framework_. React by design tries not to have opinions about how you should build your application - you can bring whatever tooling you want to handle things like state, styling and networking, and it'll take care of templating and re-rendering the webpage based on the data. Simple enough a premise. I'll expand on how this can be as much of a curse as a benefit later in terms of how people build react applications, but the other drawback of this flexibility is that enterprising developers have shoehorned React everywhere.

Want to use it for a full application? Try Next, Gatsby, or Remix. You can try and use it for templating your kubernetes resources with Rekube. Build whole infrastructures with Adapt. The heart of this is that developers are wanting to use a library they understand, to do things it was never really designed for. For example, take Next - with one of it's biggest selling points being SSR, what exactly is the advantage of using a reactive framework, other than using the "same" language on both the serverside and the client side. If you ignore all the asterisks and things you have to "know" the framework is doing.

The nearest analogy I can think to this is PHP, and more specifically WordPress, which is where I started my career. Developers were using WordPress for everything - it was free, "simple", and widely supported. A platform for handling blogs was quickly turned into ecommerce stores, SaaS platorms and company websites. The "rough edges" were filed down or ignored, and endless plugins were produced. The end state of this was swathes of unmaintainable websites that quickly fell apart at the seams as soon as they stopped being actively added to. Sound familiar at all?

## "React Developer" doesn't mean anything anymore

The other side of flexibility of the React ecosystem, is that saying you "work with React" doesn't really tell the full story. Do you use Redux, Recoil or the Context api? How about for talking to a backend - are you a committed Apollo user, are you sticking with Axios, or have you been lucky enough to use the fetch API directly? What about visual frameworks - Chakra, MUI or keeping it oldschool with React Bootstrap? With each of these choices, the application(s) you work with either as an individual or as a company become more facetted and bespoke. While it's true a developer can pick up any framework or language given enough time, it's still a painful process moving between libraries as while React may be unopinionated - the libraries built to enhance it are often _very_ opinionated.

Compare this to something like Angular, and you can see where there difference lies. Angular is highly opinionared about how things like state and service calls should be handled, with a robust dependency injection system forming a big part of the puzzle, mixed in with RxJS. While this might not be as _cool_ as something like React, it does make Angular developers largely interchangeable - while the specifics of an application may change, the heart will look very similar.

## The swing back to minimalist and opinionated is starting

Software development seems to have a natural pattern to it, in terms of what it sees as fashionable. You have periods of lightweight "libraries" dominating the scene (express, React, Flask), followed by popularity of heavily opinionated frameworks (things like .NET, Angular, Ruby on Rails, Laravel). Teams will often use one end or the other of the spectrum to death, then trying the other end feels like a rejuvinating breath of fresh air.

This I think is where a rising tide of popularity for svelte and sveltekit comes from. At first blush, it'll seem quite unopinionated because it looks a lot like vanilla HTML/JS/CSS, but in reality it actually cares quite a lot about how you write your application. React in comparison is very unopinionated about how you write your app, but I would say it's almost maximalist in that you have to *learn* a lot about how React works in order to get the most from it - where the docs for Svelte are, well, svelte.

## It just might not be the right tool for the job

To call back to the title of a "bygone age", React's inception was very much in a time when minimising network load was the game. It made a lot of sense to ship a package of javascript across the wire and have it make the necessary API requests to get it's data, and no one minded that it needed a whole browser because it was all behind logins anyway.

Except now, SSR is becoming king again. First-page-load, publicly visible & cacheable data, and the ability to be easily scraped by automated tools all pay dividends. It's just easier to scrape data from a bunch of HTML than it is to have to actually render a page to get to the information it contains.

## Conclusion

Touch on the glut of developers that joined the industry in the last ~3 years, who have only seen React

This isn't a push to stop using React, but instead a nudge that you should be checking out other technologies.