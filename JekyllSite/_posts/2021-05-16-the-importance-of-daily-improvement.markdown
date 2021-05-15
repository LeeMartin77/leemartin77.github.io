---
layout: post
title:  "The Importance of the Daily Improvement"
date:   2021-05-16 13:00:00 +0100
categories: software infrastructure devops
---

Over the last 6 months, Docker and containerised applications have gone from being a minor part of my life - and often a source of annoyance - to being critical in how I work. I use containers literally every day now - both in work, and when I'm tinkering outside of it. In fact when I began ressurecting this blog recently, the first thing I did was throw a docker-compose and devcontainer setup into it. I'm not late to the party out of ignorance, but because recently my mindset has really focused on one key goal - the importance of improving daily work.

IMG HERE

Ask yourself is this:

> How long would it take me to run this solution on a new laptop?

Not necessarily a new developer to start with, but you, yourself. Someone who intimately knows the solution, every pitfall and issue it has, every nook and cranny of config required. Really good solutions you ```git pull``` and you're ready to run. Bad solutions will take days of undocumented scrabbling about to get them running, and even then might not be running feature complete.

Essentially, this is the livestock vs. pet idea from [infrastructure as code]({% post_url 2020-08-30-its-a-kind-of-magic-infrastructure-as-code %}) applied to your working laptop. You wouldn't expect a professional plumber to be completely floored and unable to do his job if his hammer broke. So why is it so accepted that developers will spend hours messing with their local setup - to be greeted with sage nods and agreement that the solution is a mess when something breaks.

## But I Can't Just Containerise It!

The sad truth is, you're probably right. If you're working with a legacy monolith solution, you might be unable to containerise the application. Or even if you could, the images would be fragile, just adding another pet into the already overflowing kennel. The undertaking of breaking it up might be huge, and won't include the half-dozen satelite applications which surround it. 

Thing is though, containers aren't the only solution. We're simply talking about getting from a clean install to a running solution. Having a series of scripts for example can do that - it's just about making sure the scripts are kept up to date with the reality of the system. There is a lot of talk about *documentation*, and even more talk about *self-documenting code*, but for my money the best is **code that documents**. Rather than writing a load of steps to follow in a wiki or README.md in order to setup a solution, write those steps into scripts. If someone really needs to know how something is setup, they can read the script - if not, just run it and get typing.

## What does this have to do with Daily Improvement?

Writing scripts or containerising (or both) in order to setup solutions is nice, but why do we do it? I've found the thing that kills most software projects eventually is *entropy*. People like to call it technical debt in this field, but I feel this term tends to be locked to the code itself. The truth is the longer a piece of code sits on the shelf without being updated, the worse it is going to be. This isn't because old programmers are worse than new programmers - far from it - but because the world changes, and so do the requirements.

This ties back into a solid local environment for projects, in that it allows a project to be picked up and worked on by anyone, at any time. You see this a lot in good open source projects - the repositories/solutions are strongly geared towards allowing new developers to pick up the code, make some changes, and submit them back to the core codebase. The more impediment you put inbetween writing the code and using the code, the less likely it is someone will work on it.

Companies overcome this by paying software developers to continue to work on solutions, even if the work is causing unnecessary mental taxation. A business will want features first, so it's natual to try and put daily improvement in the back seat - except all this does is force the cost of each feature higher as the codebase grows.

## Trust Yourself

How you tackle this is up to you, but I've found the easiest way is to simply trust your own abilities as a developer, and focus yourself on improving your daily work. The vast majority of people do not know, and probably won't even care, about the specifics of what you're actually typing - only the outcome. It's not lying about what you're doing - after all, a lot of these practices bear the best fruit when you share them with other developers. Rather, it's telling people what's relevant to them. A stakeholder doesn't need a 9-slide presentation on how you containerised a service, meaning you can bring it up in seconds, in the same way a developer doesn't need an essay on the positioning of a new button you've implemented. 

What people will care about however, is the results you deliver. A focus on daily work means your throughput will increase, meaning you'll get results (and feedback!) delivered faster. This then means you have more time to improve your daily work, and more time to work on features. This kind of positive feedback loop is the surest way to stave off entropy in your software projects - especially as it incentivises 