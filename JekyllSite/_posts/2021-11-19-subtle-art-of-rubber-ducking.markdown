---
layout: post
title:  "Being Emptyheaded: The Subtle Art of Being a Rubber Duck"
date:   2021-11-19 10:00:00 +0100
categories: software process
excerpt_separator: <!--more-->
---
 
It's not hard to find writing about the benefits of pair programming. As much as I sometimes enjoy tinkering away with a problem in isolation, it is easy to see that working in a pair (or sometimes even a mob) easily improves both the speed and quality of output. Throw in the extra benefits of having multiple people understanding the code, different perspectives unlocking simpler solutions, the ability to mentor members of the team - makes it hard to argue against the practice. One of the trickiest things to learn when pair programming is how to take your hands off the wheel and let someone else drive - here is my perspective on it, and maybe you'll find some good advice here.

![Rubber Duck](/images/2021-11-19-rubber-duck.jpg)

<!--more-->

## You're not there to just watch

Jokes aside about being a rubber duck, you shouldn't just be passively watching someone else typing. The core idea of the second person in a pair programming context is to try and hold onto thoughts that will slip away from the author. Everyone's been there when writing code - you're fully gripped in [flow state](https://learn.canvas.net/courses/3/pages/level-6-dot-3-flow-states-in-games) and motoring through the task. You've built a solid mental model of the paths through the code, the values in the variables, you can practically see it working. What's the odds in this state that you'll remember to check that slack message from 2 days ago with that clarification on the requirements?

This then, is the "hard and practical" side of being a co-pilot when pairing. If the person driving has a question, you should be able to retrieve the answer quickly (or at least let them know not to worry about it). Bonus points if you're following well enough to have the info to hand. Make notes on `TODO` items and things you're going to need to circle back on. Try and think of paths that might not be being covered in the current chain of development you're watching. The idea is to be able to take that half step back - the way you would for a good code review, except you're doing it in real time.

## Avoid disrupting the flow state

It's important to remember that you're not the author, and avoid telling the author what to do. This doesn't mean you shouldn't offer advice, especially if they seem to have stumbled a little and lost momentum. However there is a world of difference between *"Don't do that, it's a bad idea, you need to do X instead"* and *"If you're getting tripped up, you could try X to solve this"*.  A lot of this is tone, but tone is incredibly important. What you don't want to do is close off a potentially better solution by prescribing a solution from the back seat.

Not backseat driving is vitally important when pairing in order to mentor a more junior developer. Ideally, I find the best way to mentor is to try and avoid writing code at all - unless it's something properly knotty that could do with a couple of minutes of focused knowledge and demonstration. Instead you want the focus to be on leading over someone's shoulder, and trying to impart the knowledge you have to them via the medium of written code.

## Be concious when things are slowing down

The quickest way I've found to get both myself or someone else back into the flow state is to tackle something discrete and simple. Keeping a short list (either physically written, or just in your head), of little things that can be looped back can be really handy. Some good examples of this would be things like null reference checks, error handling, or missing switch behaviors. Little things that might just be a copy/paste job, or a quick `if` statement to throw an error in itself - just something that doesn't really need to be thought about, but serves to make the code a little more defensive and clean.

One thing to *not* try and use as an example of this, is changing up naming. While it's important when pair programming to make sure your names of methods, classes and variables are all clear and sensible - try and save it til a mop up exercise at the end of the session. I've yet to meet a developer who can flawlessly name things off the cuff (sorry anyone who has worked with me, but you know it's true, don't hurt me), so trying to do it as a "quick win" will probably end in a long discussion that doesn't drive development forward.

## Encourage the author share their thoughts

Following the train of thought of the author can be incredibly challenging at the best of times. It's pretty common when coding that you'll be writing lines with the following lines actually being what fills your mind. This can be helpful to express out loud, however it's not a skill everyone naturally possesses. I'm lucky in that while I can't do *two* things at once, doing more of *one* thing is quite easy for me - so verbalising what I'm doing comes quite naturally. When co-piloting for someone else, it usually only takes a couple of prompts - a quick "Why are you doing that?" will usually suffice. The key though when someone talks through their thought process is to avoid interrupting it until it reaches a more natural break (unless they're about to do something truly mad like roll their own crypto).

To be a little unconventional, this can be a powerful tool if the observer part of the pair isn't a developer first and foremost. It's quite possible to "pair program" with a setup like this - maybe they're a member of the test department, or part of operations. When working with only one developer in the pair, the benefit is the developer explaining what they're doing - the context and logical decisions you're making, even if the observer can't read the written code.

## Offer to switch at meaningful intervals

Ultimately part of the pair development paradigm is allowing for developers to take turns on writing the code. That tactical flow state mindset can start to burn you out after a while - especially when dealing with complex domains, or problems where you're trying to fight the environment you're developing for. Try and keep an eye on the pacing of your author: Are they starting to just repeat the same step over and over? Stuck in a particularly knotty bug? Haven't switched the actual problem they're developing for a while? It might be time to step in and take up the reins.

Usually I also try and encourage it as a moment to have a breather. In the pre-COVID era, this would have been wandering into the kitchen together to grab a coffee. These days, it's usually doing a virtual equivalent - get up from the desk, stretch the legs, grab some water. As I've gotten older and grumpier, I've really begun to appreciate that I can't really just glue myself to a screen for a solid 8 hours a day cranking out code without it having a seriously negative effect - and I'd wager the same is true for a lot of people. Sometimes getting a breather away from the code itself can cause that final piece of the puzzle to slot into place - the classic "morning shower problem solving".

## Have some fun!

We're all human. As much as it can be beneficial to pretend we're able to crank out code without a "human factor" interfering, the truth is that a little emotional input can be really important to keep the brain engaged. It's important to be sensitive to how the author works, but I've found sometimes providing some light relief with a human voice can be beneficial. Even just a bit of encouragement can do the trick: "I see where you're going with this...", "Ah, that's a neat solution!" etc. Don't be afraid to just have a conversation for a minute around the work as well - it can be easy to see developer output purely in lines of code, but the knowledge gained and shared is often so much more useful.