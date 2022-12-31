---
layout: post
title: "Cut Down to Size: Doing Less to Ship More"
date: 2022-12-31 11:00:00 +0100
categories: process software
excerpt_separator: <!--more-->
---

Working on [mincepierank.co.uk](https://mincepierank.co.uk) over the last little while has been an absolute pleasure. However there was something that hadn't been implemented - mince pies aren't sold all year.

Rather than talking too specifically about the code, I'm going to take this chance to talk about how I break down features into smaller chunks, with a focus on getting value shipped.

![A Slice of Reality: https://commons.wikimedia.org/wiki/File:A_Slice_of_Reality_by_Richard_Wilson,_Greenwich_Peninsula_-_geograph.org.uk_-_3850722.jpg](/images/2022-12-31-cut-down-to-size.jpg)

<!--more-->

## What should the website be able to do?

The first part is figuring out all the aspects of the problem, without any concept of how painful it'll be to implement solutions. This is one of the core ideas of ideation - instead of appraising anything, the focus is on creating a flock of ideas to compare against each other.

For the subject of mince pies not being sold all year, we could look at:

- Supporting pies across multiple years
- Stopping users ranking old pies
- Letting the user know what's happening
- Allowing users to see old rankings/pies
- Communicating a "season" for ranking pies

Obviously there is a lot of work that could be done here, and even without knowing the code, some of this would be complex to implement. With knowing the code, some of these suggestions are multi-day or multi-week endeavours. I was working on December 30th, and wanted the "season" to end on January 1st. Time to narrow the scope.

## What impact do these solutions have on users?

The important angle is what does a user actually _see_ of these solutions - and especially if multiple solutions have a single unifying appearance. In all of the above ideas, there was a key unifying thing that users would experience.

- Users can't rank "2022" pies in 2023

It doesn't really matter that there aren't any other pies than 2022 pies. It doesn't matter if the site will unlock again at some future date. We just need to put the site into some equivalent of a readonly mode at the right time. Now, we've got our scope.

## What's the real minimum to offer that experience?

The key now is to _not_ take shortcuts on defining and implementing the solution, because we've taken the shortcuts with the scope. The code should be robust, wrapped in tests that aren't fragile and easily extended upon in the future. Really, we want to deliver four linked features, with certain types of abstractions.

### Define a "in season" function

Rather than coding in a specific date all over the place, we should offer a function that can tell the caller if the date provided is "in season". Working this way as opposed to just dropping dates in, we're leaving an abstraction for us to work with on future features. I think of this as "not boxing myself into a corner".

It's also important that the implementation doesn't need an engineer to sit and throw a switch - the times can be set, so just set and forget.

### Disable ranking controls when out of season

Users shouldn't be shown enabled controls for ranking mince pies. Simple enough with our "in season" function, in that we lock the rankings to be readonly.

### Prevent API requests to add rankings

With the UI disabled/hidden, we should make sure direct access to the API is also rejected.

### Add some messaging to let the user know the site is out of season

Finally we should add some messaging to the website that tells the user the "season" is over. We don't even need to specify _when_ the next season starts, as we have not decided that yet - just let them know why the site is readonly.

In the end, the [changes looked like this](https://github.com/LeeMartin77/mincepierank.co.uk/compare/77a5643..59bab18). Took less time to implement than even writing this blogpost.

## What's the tradeoff?

Pros:

- We gain many months to work out the harder problems of true years and proper start/stop seasons
- We get a "readonly" state immediately, to make it trouble free to keep the site up
- It's not been a lot of code, even if it all has to be deleted later

Cons:

- It's literally technical debt

## Wait, _willingly_ adding technical debt!?

I so often see the term technical debt thrown out just to mean "code that someone thinks is bad". It can be bad because it's hard to understand. It can be bad because the person reading it didn't write it. It can be bad because it's causing bugs in production.

I prefer this definition:

> Decisions developers make that prioritise delivering software to users over anything else.

The key is that the technical debt taken on here, unlocks more time to deliver follow up value. This is a clear example of how delivering value _now_ buys time to deliver more value _later_, instead of holding back value until all the future value is available. In a lot of ways, this is about what a user actually sees, rather than what you have to tell them you've built.

If you want to read a similar post I've written in the past, here's one on [how code is the least valuable part of being an engineer]({% post_url 2021-10-03-awesome-valueless %}).
