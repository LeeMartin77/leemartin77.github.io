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

It's really important to kick this post off by saying there is nothing fundamentally *wrong* with React. It's a nice enough frontend framework, with a huge amount of flexibility, that took the programming world by storm for good reason. The heart of this post however is a warning - a bit of a Cassandra-esque proclomation which might well be premature, or completely untrue - that React might be on the cusp of going out of vogue. Incepted in 2013 at Facebook, React has had a *phenominally* good run of it - the idea of a frontend library lasting that long almost seems like madness - with it pretty steadfastedly staying at the top of people's list of technologies they want to work with.

## The Web has changed

- The web and browsers were very different before
- JSX almost feels like an over-abstraction of the HTML now

## Developers have shoehorned it everywhere

- Next/Vercel, Those mad kube handlers, (find more examples)
- PHP was on a similar track before it collapsed (long enough to become the villain)

## "React Developer" doesn't mean anything anymore

- Do you use redux forms or formik? how about redux? Functional or class components? Apollo or rest services? 
- With all the derivations of React out there being a "react developer" is almost just a subset of JS developer (cough - python) which is already a complete crapshoot on what the developer will be like

## The swing back to minimalist and opinionated is starting

- More lightweight frameworks like Svelte
- Emphasis on SSR and first-page-loads
- Ability to be scraped by AI
- Would describe react as an maximalist, unopinionated library

## Conclusion

Touch on the glut of developers that joined the industry in the last ~3 years, who have only seen React

This isn't a push to stop using React, but instead a nudge that you should be checking out other technologies.