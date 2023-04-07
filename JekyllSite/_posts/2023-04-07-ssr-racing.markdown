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

## Precursor Tests

## Actual Tests

## Thoughts

## Bonus: Sveltekit