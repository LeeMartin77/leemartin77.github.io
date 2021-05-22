---
layout: post
title:  "Why are you using a SQL database?"
date:   2021-xx-xx 18:00:00 +0100
categories: software data infrastructure
---

I'm going to preface this by saying if you spend any time with NoSQL solutions, this will probably sound incredibly basic. Really thinking about infrastructure and the choices we make every day is a new development (hah) for me, as I move away from just punching code. 

If you're a software developer, there is a reasonable chance you'll have day-to-day interaction with a SQL database. For decades, they're been the persistence layer of choice for software and a powerful tool in their own right. However as I start to spin up small side projects, I'm really beginning to turn away from them, for several reasons.

## They're Expensive

Let's not mince words - SQL databases are expensive to run, whole SQL servers even moreso, especially in the cloud. When this is a business expense, it's pretty trivial - throwing £10-50 a month at a PaaS solution, or finding some compute backed with storage, 