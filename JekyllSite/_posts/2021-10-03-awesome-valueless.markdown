---
layout: post
title:  "You're awesome. Your code is probably worthless though."
date:   2021-10-05 10:00:00 +0100
categories: software opinion
excerpt_separator: <!--more-->
---
 
If you're reading this and you're a software developer - or really anyone that twists programming languages into shape - let's start by saying you're awesome. The work we do is [mentally taxing](https://www.stilldrinking.org/programming-sucks), demanding, and constantly evolving. The goal of this post however is to try and hammer home that your *code* is the least important part of what you do.

![Damaged Punchcard](/images/2021-10-05-damaged-punch-card.jpg)

<!--more-->

## An important precursor

Before wading into the weeds of this, it's important to hammer home a simple truth that *will* improve your work, even if you immediately stop reading. It is vital in all work - not just software development - to **separate your ego from your output**. You should absolutely take pride in your work and the value you breathe into the world. However, work must always be open to criticism and improvement from the people around you, otherwise the output will suffer - and possibly you will too.

I often reflect back on my time as a graphic design student. Whilst I wasn't the *very best* student, there is something humbling about being part of your first group critique. You take a discipline developed over many years, applied to a project you may have worked on for a while, and proceed to have it *attacked* by people round a table - if only to check things have been thought through. Yet the end result is always better than the projects which are either unchallenged, or have not been adjusted based on feedback given.

## So why isn't code important?

One of the early lessons of the software developer journey is to write less code. This can come from a lot of places - keeping code reviews simple, reducing the amount of code that can hide bugs, and being a simple marker to enforce simplicity. To drop a quote from Tony Hoare:

> There are two ways to write code: write code so simple there are obviously no bugs in it, or write code so complex that there are no obvious bugs in it.

As the years have worn on for me, I've come to appreciate a simple extra metric in the code I write - *How easily can I just delete all of this?* The business requirements change, or a critical P0 bug surfaces, or something else demands that the code must be removed. Is it scattered through the codebase, referenced messily in multiple sections of code? Or can you just snip out the file?

This is because all, *okay fine most*, code written is essentially debt to the company. This isn't specifically technical debt - code written in a way that makes changes hard. Instead, it's an acceptance that the code itself is rarely the *value* the company provides.

To construct a simple analogy, think of an oil company. They extract oil from the earth, then sell that oil to a customer. Their customers are not *paying* for the pipe that pulls the oil out of the ground (at least directly). Instead, they're paying for the oil they receive.

## But that's an oil company, not an &lt;insert company type here&gt; company

Most code written in an enterprise setting has a similar vein running through it. Often the company will have an actual core service they are providing - be that analytics, compliance, a physical product, it doesn't really matter. The code itself is a way of automating and "plumbing" the end consumer to this service.

To give a more hip example, imagine Google Search - the actual *value* of the offering is trillions of records of what exists where. For sure the pipes plumbed are certainly blazingly fast and cutting edge - but without the data, it's worthless. If the code was written differently but performed the same operation, no user is going to care. 

This doesn't mean exactly *all* code acts this way. The simplest metric is often to imagine what the product looks like without it. What can quickly be realised from this is that business logic tends to be the valuable part - yet often this is the part that changes the least. This is because most business' logic doesn't drastically change - and often if it does, it usually justifies throwing the code out and starting again.

## So, what, developers are pointless?

Absolutely not. Instead, it's important to understand the work of a good developer means accepting that writing code is a very minor part of the job. Even within just the confines of software development, you have architecture, testing, deployment, infrastructure and experience/performance concerns. Even just within code itself, reading and comprehending code - both for writing and refactoring code yourself, and reviewing other people's output - often takes a magnitude of extra time above and beyond the typing.

Really my experience is that the most valuable part of a developer is an ability to break down complex tasks. To take something that seems almost impossible in scope, and break it down into repeatable, simple, almost *boring* chunks of functionality. That systems-thinking is incredibly valuable, and possibly even rare. In companies which are not built around software, developers can become the body in the room asking the practical questions - like "How exactly is that going to work?"

Even restricting to just the writing of code, the most valuable skill is often the ability to learn. Languages change and evolve constantly, to say nothing of the frameworks that are built using those languages. Different techniques and patterns are constantly falling in and out of vogue. The ability to quickly pick up new paradigms and run with them can be so vital in our daily work - instead of allowing yourself to be sucked into "the way things are".

## Say you're right - what do I actually do with this thought?

There are a few values I hold as valuable, and act as some of my personal guide stars:

### Endeavour to learn as you work

As much as I do it myself, I'm not mad enough to think anyone should be *required* to devote their free time to this practice. Instead, always look for ways to learn as you work. Domain knowledge is vital for helping to understand the business - and exploring new techniques and working practices can sometimes drastically improve throughput.

### Get and give critique, early and often

If another developer asks for your time to look over their code - either in a pair programming context or with a code review - this is often *the* most valuable thing to do with your time. Not only does it improve the flow of work through the system, it helps to stop critique feeling "special" - like someone is calling you out.

### Involve yourself *outside* the code

Make sure you're invested in other parts of the software development lifecycle. I have a soft spot for making sure I'm working closely with QA on a piece of work - especially if I can unlock fast feedback into my code. But involvement in things like product management, scoping, operations - these things are always valuable.

### Prioritise the improvement of daily work

If you're hit with a problem in your daily work, try stopping for a while to see if you can find a way of making that problem go away. It's important not to get *completely* lost in the weeds, but if you can make your working day flow a little better, it can pay dividends in the long run - doubly so if you can share that improvement with others.

## Conclusions

As with previous posts I've made with this kind of tone, this comes from a recent re-read of both [The Phoenix Project](https://www.goodreads.com/book/show/17255186-the-phoenix-project) and [The Unicorn Project](https://www.goodreads.com/book/show/44333183-the-unicorn-project) - which remain relevant and guiding for me as I continue developing my career. It's always important to take a step back from our daily work and ensure we are keeping an eye on the horizon - whilst it's often an idealised target, it's all too easy to drift from what is important if you keep your head buried only in the work directly ahead of you.