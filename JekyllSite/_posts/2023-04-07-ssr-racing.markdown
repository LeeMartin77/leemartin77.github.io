---
layout: post
title: "Server Side Rendering Racing - Next.js vs. PHP"
date: 2023-04-07 14:00:00 +0100
categories: software node php
excerpt_separator: <!--more-->
---

When working on [Mince Pie Rank](https://mincepierank.co.uk) at christmas, I was caught a little off guard when I was working on the "All pies" page. It seemed like the page would take a good 3-5 seconds to load - at first I thought it was the cassandra queries being slow, or just returning too much data. After a bit of playing around, what I actually found was that the HTML of the page seemed to be taking much longer to render that I would have expected.

After adding some "lazy-rendering" based on the user scrolling to the bottom of the page, I made a mental note to come back to the subject. My formative years of development were with PHP, and I'd never had to even think about HTML rendering performance - but it's always best to test your assumptions, so that's what I'm here to do today.


![Drag Racing - Source https://commons.wikimedia.org/wiki/File:USATrip-Day15_BandimereKBPIRocknRollShow_24.8.2014_SW190.jpg](/images/2023-04-07-ssr-racing.jpeg)


<!--more-->

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

There are definitely flaws in the methodology - but my thinking is the flaws are at least equally affecting everything, and I was looking to put some numbers to my assumptions.

## Initial Tests

To start, I threw together a quick Next.js application using `create-next-app`, ripped out most of the boilerplate, and then setup the index page to read the mock data JSON file and render the HTML. Then, the same for PHP - created an index.php file, and mounted it into a PHP container alongside the mock data. Anecdotally, it was quicker to do this with PHP - but on the flip side, I'm not delving into the world of PHP dependencies or frameworks. Once this was setup, I ran my initial K6 tests to see how the applications fared - two things were quickly obvious.

First, while PHP was slightly ahead (635 requests served vs. Next's 481), neither application was being pushed to it's limit. My K6 test would sleep for a second after each request, which is fairly common when writing them. However it meant the test was spending the majority of it's time just waiting - so I removed the sleep. Second, Next was complaining that the page data generated was larger than it's [suggested limit](https://nextjs.org/docs/messages/large-page-data). So, in the name of fairness, I dropped the JSON used in both tests to 200 items to get under the limit. 

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
- Raw node http (serving up a string)

And here's a table of the results, in requests-served order.

| Engine | Request Count | p(90) |
|------|-----|--------|
| Next.js | 2,158  | 364ms   |
| Sveltekit | 3,968  | 197.94ms |
| PHP5.6  | 7,625  | 118.71ms   |
| PHP7.2  | 10,202  | 96.44ms    |
| PHP8  | 10,567 | 92.68ms  |
| Node | 43,458   | 19.36ms   |

## Thoughts