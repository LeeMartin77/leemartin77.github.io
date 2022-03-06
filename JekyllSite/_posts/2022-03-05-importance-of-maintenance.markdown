---
layout: post
title:  "Happy Path: Build Projects You'll Come Back To"
date:   2022-03-05 10:00:00 +0100
categories: software process
excerpt_separator: <!--more-->
---
 
You've got that side project you were working on, right? It's been a few months, work has been busy, life has been happening, so it's not like you've done much with it. But you've got a nice clear weekend afternoon, with a few free hours you've already mentally earmarked to work on that new thing you wanted to add to it. Except you pick it up, and it's like it's been written by another person - spaghetti everywhere, dozens of TODO comments, the styling is completely broken and doing an `npm i` reveals a frankly terrifying list of packages needing updating.

Maybe I'll just go do the washing up instead...

![Messy Workshop - Source https://commons.wikimedia.org/wiki/File:Railway_workshop_museum_exhibition_in_Ljubljana,_Slovenia.jpg](/images/2022-03-05-importance-of-maintenance.jpg)

<!--more-->

## Good Intentions

It all starts with good intentions. You've sat down with that initial "Hello world" script and started throwing some features together. You got the auth and user system in place, then figured out what infrastructure you wanted to use. Sorted out the data layer (and if you're working with SQL, got those schemas in place), and started adding some initial data. The interface is up, you can click things, it's working, it's great! Maybe you even show it to a couple of friends, they give you some feedback, it's looking really slick, and you've not even taken that long!

Then you notice that a weird bug you weren't expecting. You spend a frustrating evening unpicking how you've initialised everything, to find an errant race condition in how you setup your handlers. But it's fixed! Except you stray off the happy path a little bit, and now there are bugs everywhere. Not remotely friendly bugs either - weird edge cases that cause real issues in the application. It's just a side project though, so it's fine, it all still works when you use it.

Problem now though, is that every time you come back to the project, the spark isn't there. You were full of ideas and motivation for the project, but the technical debt has piled up and making progress is slow and unpredictable. Maybe it's time to just rewrite it in a different language, might help, except you know you'd just be building the same thing over again. The discovery phase is well and truly over, and what you're left with is something that sorta works, but that you know you don't want to come back to.

## Not the Day Job

The problem is you've boxed yourself into the corner most business codebases end up in, without even getting paid for the privilege. It's often easy to paint technical debt as the result of bad developers, when really it's just a perfectly reasonable tradeoff of putting business needs above the development experience. This is fine and makes sense when it's a project where the focus is on building a business and income, but when we apply the same mindset to a personal project, we are just making life hard for ourselves.

A solution is to make sure that when we're building out a personal project, we take a step back and prioritse ourselves as developers. We categorically have the time to ourselves so why not make sure the codebase is *exactly* as we want it. The system can be initialised with a couple of well documentated scripts. Everything is written down and can be brought up from a clean slate easily. The code has a good suite of tests that let you make changes with confidence. You don't need to do any manual futzing in order to get it working. All of this is in service of making sure you can pick the codebase back up after a break.

## Future You

Projects setup this way are so nice to come back to, because it tends toward small pieces of improvement

Being able to open your laptop for half an hour, make small but measurable improvements, then walk away again

Also means your project can be an exemplar of your best work - even if the end result isn't useful to anyone else