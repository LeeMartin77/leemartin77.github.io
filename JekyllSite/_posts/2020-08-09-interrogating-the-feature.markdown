---
layout: post
title:  "Interrogating the Feature"
date:   2020-08-09 17:00:00 +0100
categories: process
---

A lot of this week has been spent digging around in Selenium (recently discovered it has a pretty nice C# implementation) and throwing it into release pipelines. That's a topic that has been done to death in various ways, so this week I'm writing about something which is more from my design background - but has been incredibly helpful in my time as a developer. That being the process of figuring out if you're asking the right questions - and if you're not, how do you craft that right question? "Garbage In, Garbage Out" applies as much to delivering software as it does to data science, after all.

![Interrogating the Brief](/images/2020-08-09-interrogating-the-feature.svg)

## What is Interrogating the Feature?

When interrogating a feature request, the goal is to identify the problem you're trying to solve. It's not uncommon in both the design and development worlds that the problem being solved becomes detached from what's being requested. In design, this is the classic "I need some flyers, business cards and leaflets for an event I'm running". In development, it's the "We need a date dropdown on this page". In both cases, the business (or client) has decided what the solution to their problem is - however in doing this without consulting those who are doing the work (designers/developers), amazing value can often be missed.

## How Do We Interrogate the Feature?

One thing I am going to absolutely stress here:

> **Interrogating a feature is never about trying to say that a problem is not worth solving**

It's quite easy to fall into the trap of the obstinate developer, refusing to do work because they don't see the point. If you work for a business, you have a whole mess of people that are exceptionally good at gathering and filtering requests from clients. Even working solo, your client *will* know more about the "Why" of the feature, possibly than you ever will. What people outside of development lack however, is an understanding of the effort and time involved in what it is they're requesting. Most importantly, solutions may have been dismissed as "too hard" because of an assumption that they would be a much greater amount of work to do - when in fact, sometimes it will take just as long, or longer, to do the "quick feature" they have asked of you.

I've found the most effective way of teasing out the real problem being attacked is to ask business-centric questions - some examples:

- Who is the client that has asked for it, and what do they do? 
- What's their environment and usecase like? 
- How often do they use this other, related feature?
- How much time could this save them?

What you're trying to do is build a mental picture of your client's day. Stay away from the "How" of what it is you're going to implement until it comes time to split hairs on how long you've got to deliver it, or other constraints. As a department or individual you might passionately care what technology is used in what way, but a business (justifiably I might add) *will not care* - and an end user will care even less. Instead, stay laser focused on getting away from a proposed solution, transforming the feature request from an explicit list of things (we need a dropdown, it must be cornflower blue, it must have 27 options, these options are...) into a problem to solve (Our users need a way of categorising things by a list of categories).

## Why Do We Interrogate the Feature?

First and foremost, we interrogate features because it can create value for the business. When you can deliver a great solution to a client problem, the client will be delighted, which leads to more clients and more money. This is of course predicated on a robust feedback loop - empowering the end user to give feedback on the application and their daily struggles. I'd encourage any developer, if they can, to try and watch an end user use their product. I guarantee that you'll see people doing things you could never have expected or predicted - user flows that seem nonsensical, people spending 90% of their time in something you spent 10% of your time on, etc.

Secondly, even if it transpires that the feature request doesn't change in any meaningful way (meaning the business correctly identified a solution without your help), your understanding of the domain will level up significantly. Domain knowledge is such a vital part of being both a developer or a designer, as it allows you to more easily understand the woes of your users/consumers, leading to better outcomes. The way you implement the feature might change as well - for example, implementing parameters in configuration files to allow adjustment later. 

Finally, it provides a more interesting challenge. I'm a firm believer that being a developer isn't about being paid to write code - it's about being paid to solve problems. Either automating, streamlining or digitising the way people interact with the world. When you can start approaching your day-to-day job with this mindset, I find that the work becomes much more satisfying. Otherwise you run the risk of your programming career being something more akin to a data entry job - punching values into a keyboard based on things assigned to you.

## I Don't Feel Comfortable Doing This - It Feels Adversarial

I wish I could tell you that learning this skill is something you get from a book - both the confidence to ask the questions, and doing it in a way that doesn't get people's noses out of joint. You can certainly read up on the subject, but the real progress will come when you just start doing it. If you're worried about frustrating the business, start small - question your friend's implementations on personal projects. Ask your colleagues why they're doing things the way they are. Try and break away from doing things by rote and "because someone told me to do it that way". 

One of the toughest things I had to learn as a designer was giving feedback and asking questions. We used to have round table sessions where students would present what they'd been working on, and essentially asking for criticism. Receiving feedback, to me at least, is the easy part. You learn to put your ego in the bin where it belongs, and see criticism of work as exactly that - not criticism of you. Being willing to question someone else's work however, is difficult. But when you ask these questions, you'll get one of two things - either an answer, in which case, you've learned something. Or you'll get a non-answer - in which case, there is an assumption that needs to be checked.

And assumptions are the real enemy.
