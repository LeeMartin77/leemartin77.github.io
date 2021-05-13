---
layout: post
title:  "Do or do not"
date:   2020-07-05 20:45:00 +0100
categories: process
---

This week, the thing I've experienced the most is a defense of just getting on with the thing, instead of worrying about doing the thing. I find sometimes developers tend to approach things from a risk adverse, cautious position. Usually the focus is on how to minimise changes done and disruption caused - especially when you're dealing with legacy products (and who isn't). I think where this can cause problems is working on personal projects and proving a concept. Getting wrapped up on whether it'll work, rather than just seeing if it will.

![Bit of Master Yoda's wisdom](/images/2020-07-05-do-or-do-not.jpg)

## It's probably easier than you think

The motivation for today's post comes from rebuilding my previously mentioned Fitdash project so it uses [MongoDB][mongodb] in place of the MySQL with Entity Framework I started with. This particular idea has been stuck at the back of my mind for quite a while, but came to the forefront now as I'm looking at getting it hosted somewhere outside of a multi-container docker application on a raspberry pi. Like most things, the motivator was money - realising how much more I'd be paying for a SQL server. I then spent far too long worrying about how to do the change instead of actually doing it.

In the end, the actual refactor wasn't too bad, in part from already having a nice repository layer in place. I've not worked with MongoDB/NoSQL before now, but I think it actually suits my personal attitude of persistence better than SQL. Usually, I just want to shove some pile of non-specific *stuff* somewhere that'll persist when a user logs off. I'm sure Mongo has its own special level of quirks over SQL, but for now I've got it up and spinning again with a different system very quickly.

## It won't get easier for waiting

Of course, it isn't always easier - my day job is a testament to that. But the issue then becomes that things rarely get easier for waiting and not doing. You can plan and strategize for a really long time, and in the process be not much further measurably than when you started. When you just start doing though, you very quickly learn where the pain is. Sometimes this can be pretty cataclysmic, but with people that are more motivated to do the thing than how they do it, you can quickly overcome any obstacle. Obviously this isn't always perfect - god knows, I've had enough times spending hours bashing my head against a subject, for someone to tell me of a 5 minute fix that I'd have known about had I done some planning.

Really, this makes me think of being back in the gym though. Often when between sets on the weights, I'd find myself taking a bit of an extra breather. Just standing there, trying my best to look like I enjoy lifting weights, having a breather. Usually the last thought that goes through my head before I start the next set is "It won't get any lighter for waiting". 

## It's better to deliver imperfect than nothing

There is another advantage to just beginning though, and that is being able to deliver *something* much sooner. It doesn't mean that something will be good, or even close to good. Usually in fact, my first draft of something is pretty terrible. But the key is that it will "work", and fulfil the requirements - even if it comes with a laundry list of caveats. The trick becomes that you then just work through the caveats - break it, to implement, to fix. Even if you don't manage to achieve the feature you at least learn *why* you couldn't, growing stronger from the experience.

[mongodb]: https://www.mongodb.com/