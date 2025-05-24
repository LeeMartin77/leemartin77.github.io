---
layout: post
title: "AI Code tools are a Tarpit"
date: 2025-02-27 14:00:00 +0100
categories: ai process
excerpt_separator: <!--more-->
---

All anyone has wanted to talk about for the last couple of years has been AI - and really, that being a shorthand for LLMs. As a developer who is quite slow to adopt technologies, it's had a fairly minimal impact on my actual process. The main change has been that ChatGPT is a ready replacement for Google - and in honesty, that's in part due to the fact that Google search has been on a massive decline of late.

LLMs have huge potential as part of software development - both as systems to integrate into your code, and tools to help you write them. That's not a position I'm going to try and stand against, because it's just bad faith to pretend these models aren't anything other than a big leap forward. Instead I want to look backward, and really consider the forgotten lessons of the past that - I think - are beginning to repeat themselves.

<!--more-->

## Tarpit Systems

It's a lot easier to get into a tarpit than it is to get out of it - anyone who was traumatised by The Land Before Time as a kid knows this. The imagery of it is evocative - systems where you can quickly get into a situation where nothing can pull you out and fighting against it just makes the whole situation worse. We see systems like this a lot in software development, believe it or not. Ask anyone tied to the hip to Oracle. AWS Lambda with DynamoDB is great right until the minute you need to get out of it, then it's like pulling a tooth without anesthetic. You ever tried to do anything with Active Directory? If not, go find someone who has and offer them alcohol in exchange for reliving the trauma.

The real secret is that companies are _incentivised_ to create tarpit systems - even outside software development. We often describe successful products as "sticky" for this very reason. It's the classic paradigm of a system that makes it trivially easy to create huge amounts of data, value and business knowledge within it - but extracting that information out to be owned by yourself is actually incredibly hard. It is usually portrayed as a hedge against customers leaving (seeing the 6-7 figure bill for a data migration can at least somewhat sway decisions) - although in truth I don't think it really achieves this.

So if these setups are so omnipresent and basically unavoidable, why even ring an alarm bell about LLMs for code generation? Because I think it's entirely different when we use these tools in order to construct other tools, and there are lessons from the past that we're all going to learn, painfully, again.

## VB and PHP

I group VB and PHP together because they emerged at similar times, and wanted to solve similar problems. Which might sound mad at first blush, but let me walk you through it.

Both systems wanted to allow users to quickly and painlessly build interactive software, that could be easily shared and distributed to users. Their focus was on the practicality of "getting software done", rather than any ideas of maintainability or safety. The creator of PHP - Rasmus Lerdorf - for example famously said "there was never any intent to write a programming language" of his process creating PHP. He simply wanted something simpler to use than most of the available languages at the time, that would let him create a dynamic experience on a webpage.

From the VB side, both classic and VB.NET, the drive was in making GUI interfaces for windows programs, using Windows Forms. Building out GUIs was (and is, really) a uniquely painful experience, especially back in the 90s. By stripping away a lot of the complexities of display and layout, you can empower a developer to rapidly prototype and test out software with real users.

The kicker for both these systems, is that _because_ they're so easy to throw something together with, the foundations can be very shaky unless you take deliberate steps to build solid ones. Most developers who have been exposed to any code more than 10 years old (even if they weren't there to write it) can tell horror stories of the organic messes that grow out of this way of building software. Because it's so quick and easy to create something, it's also quick and easy to add new features - except, nothing forces you to actually make the system cohesive.

Eventually, the breadth of the system breaks down. It's not even about the amount of code, or the amount of "mess" in that code. It's just the sheer mismatched chaos of the features and implementations butting against each other. This is where you run into classics like the same logic implemented in half dozen places, in similar but not entirely the same ways, and you never really know what any given piece of the code is related to.

## COBOL

Lets go even further back. COBOL literally stands for "common business-oriented language". It's whole selling point was that you could supposedly take people who knew "nothing" about computers and how they worked, and set them the task of building systems. This has real power as an appeal - suddenly, your domain knowledge experts are empowered to make the system work exactly as it should.

We still see the consequences of this language over 60 years after it's creation. It's an infamous running joke among programmers that while the market for COBOL developers is small, it never actually went away, and that if you are one now you can make huge amounts of money just existing. Large chunks of the world's financial, business and logistics systems run on code older than most developers. 

The problem is that _because_ of how embedded COBOL became, moving the logic and processing to a new language became untennable. And then it became an active risk. Combine this with the fact that the syntax and ways of working with COBOL are basically completely alien to a modern software developer, and we're essentially just doing our best to ride the wave in the hope it doesn't collapse.

## So what does any of this have to do with AI?

Here's my take on AI tooling for generating, editing and maintaining code. The tools are powerful, and you can get a lot done incredibly quickly. The encourage a competent developer to focus on breaking down the business problems presented into logical chunks, and allowing the tool to generate the code itself. It's like having a somewhat-competent, eager, unsleeping junior developer on your computer. 

The problem is, as the eager junior-LLM continues to write their code, the system grows less and less maintainable by an actual human being. You rapidly begin to create huge, complex files where various chunks of code may or may not relate to one another. In its quest for context, the LLM will copy syntax and patterns from itself over and over, slowly degrading the "cleanliness" of what it produces like photocopies of photocopies.

Eventually, and we're even seeing developers talking about this one, the system begins to cross a pair of event horizons. The first is subtler, and harder to catch - and it's that the system becomes unable to be navigated _without_ the support of AI tooling. When boilerplate is "free", suddenly you're freed from having to worry about the boilerplate - until you really need to. Even this is something we've seen before - I've gone on impassioned rants many times about how much I loathe Entity Framework, and even other ORMs. They're libraries often billed as being able to take the "drudgery" out of mapping your code to a database - except instead what they foster is codebases where you _can't_ interact with the database as a database, and are instead having to perform various tricks within your ORM for performance, instead of using the powerful query languages most database systems contain.

The second event horizon is only really starting to appear now, but it's when the system becomes so broad and so heavy with LLM generated code - that even the LLMs themselves aren't able to parse the system fully. It's already being documented that most of the large LLMs are beginning to degrade, as more and more of the publicly available internet is filled with cheap, low quality, generated text. It's the same story with heavily generated codebases. The intent and meaning of the code is largely absent when it's been churned out by an LLM, even if it was there in the initial prompt. This means both a human coming to it later will lack context, but also an LLM coming back to it later as input will suffer in the same way - except, an LLM isn't smart enough to go "hey, maybe I should go ask someone who understands the domain why it's done this way", instead it's going to just merrily best-effort it's way into generating a pile of garbage.

## Everything is cyclical

Here's where the danger lies. These kind of tools are powerful but they're exploited best by experienced developers who - when the system doesn't know what it's doing - can step in and steer the ship. The problem is that the tooling is so ubiquitous and being pushed so hard that a whole cohort of junior developers are coming up writing software entirely dependent on LLMs and AI code generation.

Businesses are loving it because it's a (supposed) factor in driving layoffs and "reducing costs" for developing software. There's a huge glut of (to be frank) under-experienced developers who came up through education and industry entirely with an LLM at their fingertips. We're seeing massive, massive competition for more junior software development roles (with ever higher requirements), putting the "power" back in the hands of businesses.

It is blinkered, short term thinking at it's finest, and it's something we've seen before.

When the [dotcom bust](https://encyclopedia.pub/entry/31800) happened, huge percentages of IT roles were cut. There was a massive glut in the market for software developers. Huge numbers went back to retrain into other industries, or switched degree/trajectory if they were in their early years.

And what did we see later, in the teens? If you could code, you could probably get hired. I took my first "pure" programming job in 2017, and at the time on paper I had very little that actually backed me entering the industry. But I could cut, and at the time that was the bar for getting a job. This quiet need rumbled in the background for a long time - those who had a bit of passion and wanted into the industry could get in. If anything, developers from non-traditional backgrounds could do well.

Then it crunched in 2020. 

All of a sudden businesses needed more developers than ever. And more people were out of work than before. And cross training was a 6 week bootcamp with a guarunteed job at the end. A huge number of new developers entered the industry, and ChatGPT got dropped into their laps like mana from heaven after a year or two. Businesses have always struggled to measure developer performance and now your juniors are churning out thousands of lines of code a day.

But the learning and experience wasn't provided to these new entrants. So now the cycle swings back as companies cut junior and "less skilled" roles to the bone, people are exiting the industry and others are switching degrees to avoid the mess. Except this time we've got this whole gnarly weed in the middle of it of slowly-degrading large language models "replacing" the juniors. Codebases turning into huge incomprehensible messes of code. [Senior developers basically begging LLMs to "git gud"](https://www.reddit.com/r/ExperiencedDevs/comments/1krttqo/my_new_hobby_watching_ai_slowly_drive_microsoft/).

## So we're screwed?

No, but, we're in for a rough decade. 