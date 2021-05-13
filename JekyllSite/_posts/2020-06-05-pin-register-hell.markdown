---
layout: post
title:  "Pin Register Hell — Jumping from software to hardware"
date:   2020-06-05 18:00:00 +0100
categories: hardware n64adapter
---

My latest project is setting up an emulation machine in my living room, so playing retro games doesn’t mean pulling dusty hardware from cupboards. However, as a consequence I discovered that N64 to USB adapters are relatively hard to find, at least here in the UK.

Ever eager for a project, a bit of googling led me to the conclusion that it should be possible to put together an N64 to USB converter of my own — [most][jekyll-docs] of the [code][instructable] was even [written][controller-tester] for me. I’d just have to glue it all together, classic web developer style.

I ran into a problem pretty much immediately however. I could complete the circuit through the controller power pins, but whatever I tried (different controllers, different wiring, even soldering directly to the cables), I couldn’t seem to read from the data line.

I’d messed around with the code I could understand at a glance, but I hadn’t dared touch the knot of assembly that lurked in the middle. It deals with the dirty work of sending and receiving the timing-sensitive serial signal up and down a single pin — basically, the actually important bit. I resigned myself that I’d need to understand what it was doing, and fired up a new project to do the classic blinking LED “Hello world” of Arduinos in assembly.

I copy-pasted a tutorial and got the built in LED flashing with no issues. But when I lifted the register from the N64 code, it didn’t seem to make the relevant pin flash. That’s when it hit me. I was using a knock-off Arduino, and it must use different registers for the numbered pins.

Debugging is much slower when it involves pulling LEDs from one breadboard hole to another. I tediously sat down, and pumped signals out registers until I found one that matched an external pin. I wire the pin back to the data line on the controller, push the previously-thought-broken code up, and it works immediately. All the buttons register, and everything looks solid.

For anyone interested in replicating this, [here’s the Gist][gist] of the code on my Arduino.

Hardware quirks are a thing of the past in the web world — but they’re still alive and well in the real one it turns out.

[joystick-library]: https://github.com/MHeironimus/ArduinoJoystickLibrary
[instructable]:   https://www.instructables.com/id/Use-an-Arduino-with-an-N64-controller/
[controller-tester]: https://github.com/sanni/controllertest
[gist]: https://gist.github.com/LeeMartin77/ff9db9eaed0d54a8bbdc3c987226ec98