---
layout: post
title:  "Pretending I Have Production"
date:   2020-07-25 21:00:00 +0100
categories: software fitness
---

I've mentioned [previously]({% post_url 2020-06-28-project-management-for-fun %}) that I have a small personal dashboard I maintain for displaying my fitness data. My main usecase is displaying it on an old TV - I think it's important to keep your goals and progress visible, and I've done it for a long time (mostly with whiteboards). One of the decisions I made recently was to establish some form of "production" that wasn't hacked together on a Raspberry Pi.

![Fitdash](/images/2020-07-25-fitdash.png)

## The Basics

The structure of the WebApp is pretty simple:

- Angular Frontend
- .Net Core API
- MongoDB for persistence 

It's evolved a lot over the years to be what it is - it started as a very cludgey ASP.Net website with razor pages, then a Python version, then Angular with a Python API, then finally what it is now. I also used it as a platform to get my head around Docker (in a way that wasn't someone just telling me to run "docker-compose up" after pulling a repo). It's essentially been my way of learning various bits of technology over the years.

The most recent leap forward came from getting into CI/CD in Azure DevOps. I hadn't bothered previously as I'd accepted the clunkiness of manually deploying changes to my Raspberry Pi as part and parcel of a personal project. After reading [The Phoenix Project](https://www.goodreads.com/book/show/17255186-the-phoenix-project) however, I was inspired that I should try and refine my "daily work", rather than focusing purely on throwing new features into my codebase. After half a day of tinkering, I had a pretty robust pipeline, deploying everything to Azure, running pretty cheaply (turns out you get a lot for free).

## The Feel Goods

It's one thing to be told that setting up pipelines and automating things like deployments and builds will speed up your development process, but it's quite another to experience it. Pretty much immediately, I found it just felt better to be writing code that would be deployed as soon as I pushed my changes. It meant I could add a feature to the dashboard, and be using it a few minutes later, once the build completed. The feedback loop suddenly became much smaller. This also meant I didn't mind doing small pieces of work - fixing up bugs, or clearing up some technical debt. 

I also found working with MongoDB recently to be quite a pleasurable experience. I've been using relational databases basically since I started cutting code back in the wordpress/PHP days, but I think my mindset suits NoSQL better. Mostly I look at my datastore as a place to throw data that I'm going to need on future operations - user details, API tokens and API requests, in the case of Fitdash. Naturally, this ability to be flexible and truly code first, where my "schema" is set based on what I want to store, feels great.

## What Next?
I've basically got 3 goals for this right now:

- Make the project open source
- Add some other providers (got my eye on Garmin as a first choice)
- Add the ability to mix data from different providers

I essentially want to work towards producing an API (which is the real core of this), that allows users to pull data from various different fitness providers, with a uniform interface for that data for more general overviews. Whilst different services are going to offer different shapes of data for the same things (steps, sleep patterns, calories etc), ultimately it's all the same under the hood. Admittedly, I think I'm probably going to fall into the XKCD standards trap, but let's see how it goes - and it's a fun project either way.

[![XKCD: Standards - https://xkcd.com/927/](https://imgs.xkcd.com/comics/standards.png)](https://xkcd.com/927/)

## Can I Try It?

Sure! It's up on [fitdash.leejohnmartin.dev](https://fitdash.leejohnmartin.dev/) right now. It requires a Google account to sign in, which is how I'm handling my identities, and you'll also need to be a Fitbit user in order to be able to see any data on your dashboard. I've made some steps toward making it user friendly but I'll freely admit it's not the smoothest thing in the world. If you're concerned about your data, I can say that the "Delete Account" functionality will delete any data on the system associated with you, and I've agressively avoided storing anything even close to a password. If you're really concerned though, wait til I've open sourced the project (mostly need to go through the Git repos and clear out secrets), and you'll be able to have a look for yourself then!