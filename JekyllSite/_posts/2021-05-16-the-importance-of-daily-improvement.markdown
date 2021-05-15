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

Even without that, 