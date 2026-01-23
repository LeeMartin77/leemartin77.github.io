---
layout: post
title: "Why not approve?"
date: 2026-01-23 10:30:00 +0100
categories: process
excerpt_separator: <!--more-->
---

_This is something I wrote years ago, which I've rescued from my inbox_

I’ve been thinking about pull requests a lot recently. It stems from an impassioned rant one of my former mentors gave over beer-and-boardgames recently, that can be summarised thus:

> “We've got this great system for dealing with a group of perfect strangers working together around a
piece of software - but why do we keep taking this system and using it in businesses where you
can just talk to the person about their changes”

The reason it’s been rattling in my skull, is that after mentoring under him, I’ve basically carried forward an attitude of **approve-by-default**. I know that might sound like a terrifying way to work, you might even call me reckless - but let me try and talk you round.

<!--more-->

## Gotta trust the colleague next to you

This is a really simple, core nugget of an idea. We’re all professionals, who have experience and knowledge that shapes the software we deliver. Especially if you’ve been together on a piece of work, why shouldn’t you just approve it into production? The idea being that approving a PR doesn’t even have to be about the code. It’s a way of saying to your colleague “I trust you, this looks right enough, if you need help, I’m here to help you”

## Pull requests are for the requester (courtesy of Miles Pool)

When Miles said this to me, it really resonated, as it put into words something that I’ve felt around PRs I’ve raised. Broadly I find they fall into two camps:
- This is ready to go and I’m really confident on it - lets get it deployed and delivered
- I think this will work, but I really want some second eyes on it before it goes anywhere

The first kind often leaves me feeling frustrated I can’t just push to main , because as long as the CI passes, it might be unlikely that there is value in the review (especially if I paired on the work). The second though, is usually when I’ll be broadcasting to the team to get more than just one approval, and is usually when it feels like a decision has been made in the course of the work, rather than just implementation.

## You can always change it immediately afterward

Anyone that has worked/paired with me, here or elsewhere, will absolutely have heard me say:

> “Lets push this first and then we’ll do a follow up PR for that right after”

It can be scary to think about pushing something you might not be 100% with, but the key here is to hold onto doing the work. Whilst we have tickets, and points, and roadmaps, and tasks, and all the other abstractions we use to illustrate what we do, it’s important to remember that these abstractions are not the work, and instead are just a way of organising and displaying the work. There isn’t anything stopping you merging a PR with functioning code, then opening a fresh one straight off of main to tweak that one thing you might not be happy with - and it even gives you the time and capacity to digest what doesn’t seem right, without the pressure of delivering value to the business, because that bit is done.

## Lets just put it in production

Without fail, in any system, there will be differences between environments. And whilst I’m a firm believer that you should try and develop, test and deploy to and in identical environments, it’s not practicable to get it perfect. I’ve lost count of the number of times something works locally then fails once it’s deployed - if anything, I think this is the main thing I’ve spent my career debugging and investigating. So making small changes to the production deployment, that are isolated and easy to narrow in on, just makes life so much easier than trying to get it all in, all at once, perfectly, first time. Bigger changes inevitably means a bigger surface area where things could have gone wrong - so hone in on those problem places. It’s a bit like rigorous TDD - when you change just a small bit at a time, the amount of code you have to hold in your head is drastically reduced.


## Okay, when to not approve a PR?

So I’ve been very... aggressive, lets say, in this article about why you should just approve something into production. So when do I tend to hit the brakes? This isn’t really a guideline of when you should hit the brakes, but it might help you form an idea of what you care about.

- Breaking, or potentially breaking, API changes (especially if there isn’t a client-changing PR in place)
- Package installation, if I’m unsure why the package has been installed (the dotnet dev in me refuses to die)
- When I’ve had no exposure to the system being changed (and it’s not just typos/renaming/refactoring/tests that have been done)
- Changes to environment (especially if it looks like the environment has changed but not the code, or vice versa)
- If it looks like there is a risk of data corruption or mangled migrations
- It’s a huge pile of changes, in an old branch

Why these things? Probably because they’re things that have bitten me badly in the past, and so I get overly cautious about them - learned pain is a great teacher and all that.

## Conclusion?

> Your ~~scientists~~ software engineers were so preoccupied with whether they could, they didn’t stop to think if they should.

This approach isn’t for everyone, and I’m not here to try and convince you what your methodology should be. But next time you’re selecting `comment` instead of `approve` when reviewing a PR, ask yourself why.

As an aside, Azure DevOps has/had an explicit option of “Approve with Suggestions” that I used to use all the time, which probably went some way to giving me this mindset along with my mentor(s).