---
layout: post
title:  "Project management for fun (not profit)"
date:   2020-06-28 18:00:00 +0100
categories: process
---

I've got this long running personal project I like to call "Fitdash". It's essentially a dashboard for my Fitbit data ([they have a quite nice API that's easy to access][fitbit-api]), to help me keep on top of maintenance and have a longer term view on  my fitness goals. It's had a lot of iterations and versions over the years, and essentially I use it as my testbed when I want to learn about a piece of tech. One of the most impactful (and surprisingly fun) changes I've made however has happened recently, and it has nothing to do with trying to write more code.

![Devops Board](/images/2020-06-28-devops-board.png)

## Organised Chaos

One of the things I find toughest when working on a passion project, is keeping focus on exactly what it is you're working on. Without time or budget pressure, it's really easy to stay theoretical, and keep coming up with new ideas. I'll sit down to work on it and go "Ah man, today, I really want it to do X, let's add that!" - ignoring the half dozen part-completed or buggy features I've previously implemented.

Recently however I've been making use of [Azure Devops][devops] - Microsoft's collection of developer tools for managing projects and code. I've got a simple one-board system (pictured above) - and suddenly, I'm really starting to churn through things. WIP (Work in Progress) limits is definitely the killer feature for me - forcing me to focus on finishing rather than starting. It also helps that whenever I want to add something, or find a bug I don't want to deal with right then, I just throw it into the todo column. This means ideas don't just slip away into the ether, without me feeling like I have to drop everything to work on the new hotness.

## Keep it simple

I also found it helped to stick to the out-of-the-box agile process, and it's work items. It's just semantics really, but breaking down what I'm doing to either being a *User Story* or a *Bug* again helps with keeping things focused. I've found Technical Debt to be an interesting concept in this, where I ended up putting it under the category of a bug - and that's been a really good mindset. It allows me to sometimes take shortcuts if I really want to just get a concept into the system - then swing back around later to make it "nice".

User stories also feel like a great mindset for features - usually with tasks if I find it's going to be a large piece of development to deliver. It means I don't get lost in the realms of "Oh, well, do I do it this way, or that way". Instead, I focus on adding functionality - I want users to be able to do X. They should see a popup at Y point. In a lot of ways, I'm really just extolling the benefits of using an Agile workflow for personal projects. What I've found most surprising is that I actually find it more fun than just working off the cuff. 

I think when you're working in a business, software development processes can just feel like paperwork. Especially with a good team - everyone knows what they should be doing, and you collaborate enough without relying on the process you adhere to. But when you're just applying it to yourself, there is nothing forcing you into doing any more of the process than you feel is necessary. 

## Delivering

Ultimately, what this has meant is that my personal projects have become a lot more focused on actually delivering... *something*. It doesn't even really matter what that *something* is, or if that *something* gets delivered to anyone other than me. God knows, I'm not about to be trying to make a run on the tech giants or "disrupt an industry" anytime soon. But a focus on actually creating a *something* means that I feel I can confidently pick up, and put down, projects that I'm working on.

That's the real benefit of digitising your workflow. When you take the things you're tinkering with and put them on *the cloud*, it means there is a lot less chance of things being left half done. And if they are left half done, it's significantly easier to pick them back up again. I'd imagine I'm not alone as a developer when I decide to pick up a repository I've not touched in a few months, and immediately find myself spending half a day just figuring out exactly what the hell it was I was building. That worry when working on things has been removed, and it makes me much more willing to sit down and put time into my little side projects.

[fitbit-api]: https://dev.fitbit.com/build/reference/web-api/
[devops]: https://azure.microsoft.com/en-gb/services/devops/