---
layout: post
title: "Beware the Increment"
date: 2023-02-09 18:00:00 +0100
categories: process
excerpt_separator: <!--more-->
---

Conflict and grief in our working lives often comes from expectations of what is happening not matching the reality. Misrepresentation of work can take different forms - such as unrealistic expectations from upper management, teams not being transparent in what they're doing, and trying to force tactical work to fit with a predetermined strategic plan. What this blog post focuses on is projects that are planned incrementally, then try to be executed with iterations.

![Picture of mushrooms growing on an old tree stump: https://commons.wikimedia.org/wiki/File:Daedalea_quercina_-_Eichen-Wirrling_-_oak_mazegill_-_maze-gill_fungus_-_d%C3%A9dal%C3%A9e_du_ch%C3%AAne_-_08.jpg](/images/2023-02-09-beware-the-increment.jpg)

<!--more-->

## Definitions

### Iteration

```mermaid!
flowchart TD
    a{{Deliverable}}
    b{{Deliverable}}
    c{{Deliverable}}
    d{{Deliverable}}
    b --> ba{{Deliverable}}
    c --> ba
```

A standalone period of work that can be delivered mostly independently of the work surrounding it. Imagine bricks - each brick alone is useful, can be used in many places, and you can stack and combine bricks into a building more useful than the component parts. The key is that an iteration is focused on itself - while there might be some consideration of what can come next, the iteration itself should be inherently valuable. Whomever is involved in an iteration should be able to walk away from it confident that value was delivered.

### Increment

```mermaid!
flowchart LR
    a([Work])
    a --> b([Work])
    ba([Work]) --> c
    b --> c([Work])
    c --> d{{Deliverable}}
```

Work you have to do in a particular order to deliver value. Imagine baking a cake - I have to mix the flour and eggs before putting the cake into the oven. The tasks are still discrete in nature, and can even be done by multiple people - but they're useless unless they're part of the whole and done in order. In a positive light, people involved in an increment should come away excited to get into the next piece of work, and feeling like they took a step closer to the overall goal.

## What causes the mismatch

My experience in confusing iterations and increments often comes from breaking up a large piece of work into "smaller deliverables" - that are not actually deliverable in isolation. This results in a collection of small pieces of work, filled with chains of dependency between items, but also without the context of a coherent whole. Change is hindered because it makes it hard to consider a piece of work as part of its whole, while pieces are also risky to change (or disregard) as they may be assumed to be complete further in the plan. The project ends up looking agile from the outside - but with few of the actual benefits of fast change, feedback loops or targeted focus.

There are two core issues that often lie at the heart of this mismatch. The first is the reluctance of a business to rethink (or even just throw away) "completed" planning work, taking forms like customer interviews, prototype designs, roadmap exercises or quarterly/annual goals. While there is a need to plan ahead at a strategic level, the pain is when this plan becomes overly prescriptive and specific - doubly so if it is then communicated to users or shareholders. The business might then choose to change its tactical plan for delivering the work, only to find itself hobbled by a strategic plan that stands at odds to this delivery.

Specificity forms the second source of friction between iterative working and incremental plans - seeing software development as an expensive "end step" in the production of value. Grounded in the idea of seeing developers as an expensive cost centre that must only be handed highly-specific work in order to not "waste their time", rather than as just more workers within the business. The best rationale for this I have is a very archaic perception of programming - while working with very low-level code and applications can take a long time, most modern programming frameworks and platforms have a high level of abstraction to enable fast delivery of value.

## How to test for increments

Testing if work has been structured into increments instead of iterations is relatively easy. Take a piece of work, preferably a piece of work that is slated for slightly further into the future, and ask the following questions:

- Could you do this now, without any of the other planned work?
- If you do need to do other work first, is it just one piece that you need to do first?
- If it's just one piece you need to do first, does that piece have other work you need to do first?
- If you did _just_ this one piece of work, would it be valuable without any following work?

Dependencies should be avoided but they are somewhat inevitable - what you're trying to find is whether there are long, unbroken chains of dependency. Often more iteratively structured projects will have a sense of layers - accomplishing these things will let us move on to do this other set of things - this first layer in itself is valuable and the component pieces lack dependencies. Too many layers implies you might have planned too much - but that's very different to a "short" plan which can only be traversed in one direction.

## So increments are always bad?

The only thing worse than a bad strategy is a dogmatic one. In reality sometimes work will need to be done in order - for example, it's hard to iterate when there isn't even a foundation of the project to iterate on. In these cases, it's best to try and do as absolutely little as possible to unlock iteration, and make sure that the incremental work to get there is being done as a collective. What tends to be surprising is how little you actually need to unlock iterative working - and in a lot of ways it gets easier to iterate from less.

The other occasion for increments is when a deliverable genuinely is too big to do all at once - and has no value being delivered in component parts. While this is rare, it can happen. In these cases I'd actually encourage going as far as embracing a more traditional waterfall approach - specify exactly what it is that is too big to deliver in parts, plan the work, give a reasonable estimate for completion, then work to that deadline. It still requires honesty, courage, and working in stages toward the goal - but no one is under the illusion that being half done has value.

## Ideas on un-incrementing a project

Getting to an iterative approach often involves a big step back - an incremental project is usually a solutionised one. A problem has been "solved" and all that is "left" is the implementation of the solution, but the problem itself has been forgotten about in the definition of the increments. A lot of planning is probably going to need to be thrown away, and that's okay - don't be scared of losing a plan that's only going to hold back delivering value.

Instead, go back to the original problem the project was trying to solve. What is actually wrong, and if you only had a week or two, what could you do to try and improve the problem. If something seems like it'd nearly fit, knock every possible corner or consideration off of it that can make it smaller. Then what other pieces of work can you do that don't need this first solution. Then when you've got a few potential work items - that's your list of work to do. Select what seems like a reasonable timespan of work (maybe a week or two), intuit whether that amount of work seems reasonable - then get to it!

Work will probably end up with "If X is done, then Y is possible" - but the key is to not have a long, unbroken chain of stuff leading to a conclusion. Instead you want to iterate to a critical mass of value, building up layers that then unlock new layers. The best solutions deliver from their earliest days, growing over time to provide better experiences, along lines driven by feedback from their users.
