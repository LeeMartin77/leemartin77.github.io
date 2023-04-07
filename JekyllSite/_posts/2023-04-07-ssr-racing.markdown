---
layout: post
title: "Server Side Rendering Racing - Next.js vs. PHP"
date: 2023-04-07 14:00:00 +0100
categories: software node php
excerpt_separator: <!--more-->
---



When working on [Mince Pie Rank](https://mincepierank.co.uk) at christmas, I was caught a little off guard when I was working on the "All pies" page. It seemed like the page would take a good 3-5 seconds to load - at first I thought it was the cassandra queries being slow, or just returning too much data. After a bit of playing around, what I actually found was that the HTML of the page seemed to be taking much longer to render that I would have expected.

<!--more-->

After adding some "lazy-rendering" based on the user scrolling to the bottom of the page, I made a mental note to come back to the subject. Server side rendering performance was important to me for Mince Pie Rank, as I wanted the website to be easily found via search engines and indexing - and better page performance is a simple way to improve page rankings.

My formative years of development were with PHP, and I'd never had to even think about HTML rendering performance, which made me immediately wonder how PHP would stack up next to Next.js in rendering time. but it's always best to test your assumptions, so that's what I'm here to do today.

![Drag Racing - Source https://commons.wikimedia.org/wiki/File:USATrip-Day15_BandimereKBPIRocknRollShow_24.8.2014_SW190.jpg](/images/2023-04-07-ssr-racing.jpeg)

## The Test

The goal was to try and isolate the environment to being *just* concerned with rendering basic HTML. As such, I setup the following criteria:

- Read a JSON file
- The JSON file contains a long array of data
- Render the following block for each piece of data:

```jsx
<div>
  <h1>{md.dob}</h1>
  <h2>{md.salary}</h2>
  <p>{md.description}</p>
  <ul>
    <li>{md.address.street}</li>
    <li>{md.address.town}</li>
    <li>{md.address.postode}</li>
  </ul>
  <button>{md.verified ? "Yes" : "No"}</button>
</div>
```

No styling, no components, no tricks - read the data, render it as fast as possible, on a single page, and serve that page to the caller. The concern wasn't to have an incredibly complicated nested DOM - instead the focus was on just having a lot of elements on the page.

In order to try and give everything the even-est shot possible, the "applications" would be served from a container - nothing volume mounted, just built and served locally. Then light up the container with a simple [k6](https://k6.io/) test, to see how they measure up under load.

There are definitely flaws in the methodology - but the flaws are at least equally affecting everything, and I was primarily looking to put some numbers to my assumptions.

## Initial Tests

To start, I threw together a quick Next.js application using `create-next-app`, ripped out most of the boilerplate, and then setup the index page to read the mock data JSON file and render the HTML. Then, the same for PHP - created an index.php file, and mounted it into a PHP container alongside the mock data. Anecdotally, it was quicker to do this with PHP - but on the flip side, I'm not delving into the world of PHP dependencies or frameworks. Once this was setup, I ran my initial K6 tests to see how the applications fared - two things were quickly obvious.

First, while PHP was slightly ahead (635 requests served vs. Next's 481), neither application was being pushed to its limit. My K6 test would sleep for a second after each request, which is fairly common when writing them. However it meant the test was spending the majority of it's time just waiting - so I removed the sleep. Second, Next was complaining that the page data generated was larger than its [suggested limit](https://nextjs.org/docs/messages/large-page-data). So, in the name of fairness, I dropped the JSON used in both tests to 200 items to get under the limit. 

The result - to be frank, PHP completely creamed Next.js. 
- Next.js: 2,158 requests, with a p(90) request duration of 364ms
- PHP: 10,202 requests, with a p(90) request duration of 96ms

## More Tests

So, PHP is faster - but I was compelled to go further. I tested:

- PHP 5.6
- PHP 7.2 (initial version)
- PHP 8
- Next.js
- Sveltekit
- Raw node http (using template literals to write HTML)

And here's a table of the results, in requests-served order.

| Engine | Request Count | p(90) |
|------|-----|--------|
| Next.js | 2,158  | 364ms   |
| Sveltekit | 3,968  | 197.94ms |
| PHP5.6  | 7,625  | 118.71ms   |
| PHP7.2  | 10,202  | 96.44ms    |
| PHP8  | 10,567 | 92.68ms  |
| Node | 43,458   | 19.36ms   |

Here's [the repository](https://github.com/LeeMartin77/php-nextjs-drag-race) with all the test code, and the full k6 summaries of the tests that I ran, if you're curious.

## Thoughts

You could just [look this information up](https://www.techempower.com/benchmarks/#section=data-r21&test=composite) if you care about raw nuts-and-bolts performance - after all, if it was only about performance, we'd be writing C/Assembly all day or serving purely static content. However, this was more of an exercise that we shouldn't judge languages and engines based purely on their popularity and the amount of people talking about them. This was coupled with really wanting to isolate HTML rendering as the aspect I cared about.

It's simple to reason that PHP would be faster than Next.js for rendering and serving a webpage - after all, there is a lot of code in-between the JSX a developer writes and sees, and the HTML that gets generated. It's also fair to level the criticism that comparing a framework for Next.js/Sveltekit, and native execution for PHP isn't an even fight.

Where the point comes for me though, is that PHP is *by its nature* a framework for producing webpages. It's baked into the DNA of the language and engine. In order to serve up HTML, you just write the HTML you want to serve up. It even supports dropping in and out of the HTML at a whim with it's tags. This is a far cry from a *clean* way to write code - dropping logic in together with your markup is a quick way to have a very unfun time. 

There are two main lessons I took away from this. The first is that it is important to validate the performance of your application, especially initial page load times. It's easy for this metric to slip out of sight when working in the development environment with more modern features like Hot Module Reloading. I highly recommend having a way of running a "production" build locally (such as with containers) so you can see somewhat how the application will behave in the real world - especially try clearing caches, and doing hard reloads.

The other lesson is that while it's important to experiment with and use new technologies, it's worth keeping old ones in mind as well - PHP remains good at solving the problems it was created to solve, and has in fact improved over the years. How much would you celebrate if the patch notes for your favourite framework boasted a 20-25% uplift in rendering performance? I find the best way of doing this for languages and frameworks I don't use every day, is to read through release notes for major releases - as the maintainers often want to go into detail on improvements they've been working hard on.

I'm still going to primarily use Node based frameworks - although I do need to give sveltekit a closer look - because I prefer Typescript as a developer experience. But it's always important to know the limitations of what you work with, so you can know where your application might catch you out.