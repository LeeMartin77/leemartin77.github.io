---
layout: post
title:  "Expert Tricycle Riding - Modern User Interfaces"
date:   2020-08-16 17:00:00 +0100
categories: software user-interface
---

Back in the halcyon days of 1968, an engineer named Douglas Engelbart gave a [presentation](https://www.youtube.com/watch?v=yJDv-zdhzMY), nicknamed "The Mother of All Demos". If you've got the spare couple of hours, you should *absolutely* go watch it, however here are some of the things demonstrated.

- Remote desktops
- Word processing
- Collaborative editing
- Teleconferencing
- Hypertext links
- An early prototype mouse

For context, in 1968 you would have struggled to find anything remotely close to a modern PC, and the size of most computers was still measured in kilos and rooms. Weirdly, the actual impact of this demo was pretty muted. In a lot of ways it was just so far ahead of its time, that it seems people couldn't even see it as remotely possible - even with it being demonstrated. The mouse definitely endured however, but Engelbart saw this as a first-step to using a computer. There is an excellent [99 Percent Invisible](https://99percentinvisible.org/episode/of-mice-and-men/) podcast on the subject, but to summarise, the computer mouse and graphical UI could be considered a "point and grunt" solution on how to use a computer.

![Expert Tricycle](/images/2020-08-16-expert-tricycle.jpg)

> If ease of use was the only requirement, everybody would still be riding tricycles - Douglas Engelbart

## The Power of Pointing

The idea of pointing and pressing a button in order to interact with software is one of the cornerstones of any modern UI. It's survived from way back in the 70's to the 2020's - and is unlikely to ever really go away. Even on the transition from desktop, to laptop, to smartphone, we've always interacted by pointing at what we want. The notion is so simple, there are countless viral videos of small children using smartphones with no guidance - because it doesn't need any, even transcending languages and cultures. 

This is very much the beating heart of user interfaces since the Macintosh. Whilst it wasn't the first computer to have a GUI and a mouse, it would be hard to say that the Macintosh wasn't one of the first computers to put *usability* at the forefront. Before - and even after - the first Macintosh, computers were seen as a specialist tool that you'd be expected to learn to use. This caused computer users to largely be confined to two groups - those using them for productivity and hobbyists.

Since then, usability has increasingly become a key part of any software. Command line interfaces were replaced with graphical ones. Wizards, quick setups and one-click functionality are not just necessary - they're expected. Users expect to be able to navigate a system with ease, from multiple devices, without having to learn how a piece of software works.

## Closed for Your Own Good

One of the other key features of the Macintosh that has really stuck around is the idea of the closed system. The first macintosh supported very minimal IO for the time, with no option to use expansion slots. The intention of this was that a user wouldn't *need* that extra functionality - that was the realm of the hobbyist. The intent behind this was to ensure a good experience for the people using the machine - rather than trying to cater to everyone, and potentially making things more complicated for the 99th percentile.

As the years have worn by, this mindset of a closed system - ensuring the user experience can be tightly controlled and guided - has continued into the software we use. Throughout the user experience, actions are performed without the user really knowing what they're causing. Cookie warnings are a great example of this - in part because they're so ubiquitous that most users just tune them out and click whatever makes them go away fastest. This also touches on the idea of a [Dark Pattern](https://darkpatterns.org/) - relying on the point, click and go expectations of most users.

## What Can We Learn From This

One of my favourite books on UI/UX design is Steve Krug's [Don't Make Me Think](https://www.goodreads.com/book/show/18197267-don-t-make-me-think-revisited). Which seems weird to say at the end of a blog post that is basically talking about how "point and grunt" might not be the greatest way of interacting with systems. Where I think modern interfaces fall down the hardest however, is when they don't let the user know what is actually happening. In a focus on keeping interfaces "simple", you can end up making assumptions on what the user actually wants. Even when this is done with good intentions, it can cause frustration later when a user discovers something seems to have happened "at random".

I think the best way to avoid doing this is to avoid *side effects* that happen invisibly. If something is going to happen because of a user's action, that user should be explicitly told this. Better yet, present that side effect as an additional option, if possible.  You can even leave the option selected for that 99th percentile of users - but having it able to be turned off at the point of action still supports the power user.

On a more holistic level, designing software that rewards learning of the system is not inherently a bad thing. There is a fine line to this - software that needs specialist knowledge to use should at best be restricted to work which requires that knowledge anyway (eg. film making, photo editing, software development). But this can swing too far the other way, with so few user-interactable features (which, themselves, perform complex multi-step actions) that a piece of software is essentially making huge, sweeping assumptions about what a user actually wants.