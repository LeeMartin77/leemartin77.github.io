---
layout: post
title:  "Some Registration Required"
date:   2020-06-12 18:00:00 +0100
categories: hardware n64adapter
---

Following on from my last post about turning a stock N64 gamepad into a USB gamepad— I want to support four controllers from one Arduino, simultaneously. I’m waiting for some salvaged N64 ports to arrive, but in the meantime I’ve still got problems I can solve. Today’s problem is how are we going to know which controllers are connected, and only talk to those controllers, quickly.

Reading and writing to singular Arduino pins is slow — in computer terms. If you look at the code I used last time, you can see we actually use a macro to read the status of the register, and check a specific bit. This is significantly faster than the conventional code you’d use, the “digitalWrite” and “digitalRead” functions. You also get the ability to read/write to multiple pins simultaneously — as in, the exact same cycle. That’s what we’re going to use.

Here’s the testing setup:

![Our Testing Setup](/images/2020-06-12-arduino.jpeg)

We have four input pins connected to buttons and LEDs, and our four output pins connected to LEDs of matching colours. The goal is that when a button is pressed (the controller is connected), the matching LED (the communication line) lights up.

And here are three versions of the code:

![Code Versions](/images/2020-06-12-code.png)

The first version is written “normally”, using the built in functions to control individual pins. The middle version reads the register containing our input values to a byte, then checks the relevant bits. The last version uses some slight rewiring in order to achieve the same effect by mapping the input register straight to the output register.

You can see from the compiled output, that the same operation takes significantly less storage (~13% less) when talking to the registers directly. It should also be faster, because there is less happening to read and write each pin — the bitwise operations working out the output value are incredibly quick.

So why not just go with the final version? It consumes even less space, and should theoretically be even quicker. Three reasons: We’re going to be performing operations on the compiled value anyway, it forces us to only use specific pins, and without any kind of masking we might send random signals to other pins.

I’ve also found that certain pins on my board don’t seem to want to respond when called through the register — probably because I’m using a cheap variant. Either that, or my hack soldering job connecting the header pins.

The plan is to mask out the register values we don’t care about (to avoid any noise), then compare with the previous loop to see if there have been any changes. If there are, we can perform the more expensive operation of “disconnecting/connecting” our Joysticks before reading — if not, just start reading from the connected pads immediately.

I also want to change how we’re reading the controllers from the original code. Rather than sloppily dropping a single bit into a byte, I can drop the entire byte of responses into the raw data dump, then parse it after I’ve communicated with all my controllers simultaneously.

This kind of instantaneous, simultaneous communication feels almost decadent. My career essentially revolves around the web — and even the code I write to run on single machines, isn’t instant. I’m used to writing code that will send some request, then wait for a result. Sometimes you’ll send multiple requests at once, but you still end up waiting for them all to complete.

Working with hardware in this mini-project means I get to try a totally different mindset. Timing matters, and anything I can do to bring my number of operations down helps. We’re ultimately dealing with gamepads — devices that users expect to respond instantly to input. Any delay that isn’t absolutely necessary (such as from connecting a controller) is unacceptable.