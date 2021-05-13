---
layout: post
title:  "Progress Not Perfection"
date:   2020-09-18 13:00:00 +0100
categories: process
---

One of the common sayings in the fitness community is "progress, not perfection". This is the idea that you'll never do something perfectly, especially not on the first try - but that unless you attempt to do it, you'll never get any better. I think the same mindset is important to hold when working as a software developer. I've found both developers and designers (myself included) can be prone to hesitating on delivering work. Hitting that "release" button or dropboxing that print-ready file to the printer. This week I'm going to share some hints on how to worry less about getting started.

![Blank Sheet of Paper](/images/2020-09-20-progress-not-perfection.jpg)

## Analysis paralysis

I think the first hurdle you'll have to cross on any project is spending so long worrying about what the right decision is, you'll not actually make a decision. It's the same reason when doing pieces of art and design in the past, I'd pretty much immediately turn down any work where the only guidance received was "Do whatever you think works". Staring at a blank piece of paper leaves infinite opportunity, but that can really hold you back. It can be tempting in the world of software development to spend weeks agonising over things like architecture and approach on a project. 

Instead, I'd encourage just grabbing what you know and getting something built, in the knowledge that if it doesn't work out you can rework it. The argument then becomes that your effort could be wasted - but I don't believe this to be the case. Even if you radically change stack, even language, in getting something built you've codified the logic for that piece of functionality. I've had a couple of projects that I've rewritten a few times when I've picked them up again, and the second time through is always dramatically faster than the first.

## How do you swallow a whale? One bite at a time

A classic problem in agile development is the feature that "cannot be split down". A knot of code and functionality that seems so intertwined, so dependent on itself, that you could never hope to split it up. In my experience this tends to crop up when the approach to splitting the feature is approached from a purely technical perspective. If you have a button that is "Compute X, Y and Z" as that is the requirement - instead of trying to build that button, start with one that computes X. Then Y, then Z, then finally do another piece of work to call the three functions from one button. Keep a handle on solid, vertical slices of functionality you can deliver, even if it's not an entire user flow.

## Don't develop things that don't work

This sounds really dismissive, I know - "just be a better programmer". I'm not really talking about bugs here though, rather a focus on avoiding placeholder controls and values. The problem that can arise is that any form of placeholder - to a user - is indistinguishable from an actual control. Even if you disable it, the question will be "why is this disabled?" This very much follows on from the previous point of focusing on vertical slices of functionality - instead of, for example, building a frontend, then an API to feed it - build each feature from top to bottom of the stack.

## Get development in front of people

It's always cheaper to change something early in the development process, rather than later. Even ignoring any technical concerns, the process of returning through a release cycle or raising bugs when something doesn't meet expectations is higher than a five minute conversation. Obviously this is somewhat harder to do these days, but it increases the need to have a development environment you are free to push changes to. "Works on my machine"-itis is very real, but it's also avoiding working on software in isolation. The only caution to have is managing expectations on what people will see on your development environment - have a conversation with your test analysts or product owners, so if they see what you're working on and it's broken in some way (that you already know about), they're not immediately worried by why.

## Users will break it anyway

There is that old saying about how you can try and make something foolproof, but a better fool will just come along. Beyond that though, I think the real reason users seem to "break" code that you've developed and tested yourself is that you're too close to the workings. It's the same reason when a developer sees something "go wrong" with their software, they'll have an innate idea of where it went wrong - you know what *actually* happens when that button gets clicked, not what the user expects. As a developer the idea of not making assumptions is top of mind - but a user makes assumptions every time they use a piece of software. In a way, it's why any software exists at all - an abstraction layer, turning several steps into a single action. 

## You ain't gonna need it

The last and most important lesson in getting features shipped quickly is that you have no idea how much use they're going to get until you do. You can have the best predictions and models in the world. The loudest stakeholders shouting how important it is. It can seem like such a logical, simple idea. But until real users have it in their hands, it's a guess - if you're lucky, an educated one. If you work in isolation trying to deliver all the features at once (good old waterfall style), you might end up maintaining an application where 80% of the codebase is used by less than 20% of the users. Maintenance carries real cost and the idea of the best code being the least code really is true. Retiring a feature is also more expensive (both in terms of development and user goodwill) than adding a new feature at a user request.

## Nothing is perfect

I don't expect I've told any seasoned developers anything they don't already know, and there are definitely downsides to this approach. But similar to my previous [post]({% post_url 2020-07-19-not-my-job %}) on how I felt I might have been a better developer when I had less knowledge, I really want to encourage developers to take more risks in the code they write. This doesn't mean getting lazy or sloppy, instead not being afraid of trying something new - staying focused on making cogs actually turn. I believe software development is something anyone could learn to do, and keeping a childlike curiosity as you work will do wonders.