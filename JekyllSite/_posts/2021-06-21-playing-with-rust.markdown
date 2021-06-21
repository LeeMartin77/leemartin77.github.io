---
layout: post
title:  "Playing with Rust"
date:   2021-06-21 22:00:00 +0100
categories: software rust
excerpt_separator: <!--more-->
---
 
Recently when working on hobby projects on weekends and evenings, increasingly my language of choice is becoming Rust. I've been writing code in Rust near-enough daily for a couple of months, and to say that the experience is enjoyable would probably be an understatement. The language isn't perfect, and it's definitely got some rough edges - as you'd expect given how new it is. But the packages and ecosystem grows daily, and for good reason - more than anything else, it's just a pleasure to write.

<!--more-->

## What makes it so good?
 
One of the key things I've experienced in getting boots-on-the-ground with Rust, is that it puts a heavy emphasis on code being correct at compile time. This brings the oft-touted benefits of memory and type safety, but it has another more ethereal benefit - a fast feedback loop to the developer. Sure, if you put in the wrong values, your program might still behave unexpectedly - but you're not about to run into true runtime errors when you're running your application, as the compiler will catch it and throw an error before you get there.
 
Tooling around Rust has clearly been built with developers in mind, entirely run and used from the CLI - which works really nicely within an environment like VSCode. Package management, language updates and running code have been thought of from the very start - rather than the paradigm with older languages, where modern tooling and workflows are having to be grafted onto older underlying systems.
 
The syntax is also a pleasure to work with, especially once you get into the groove of it. There is a drive within the community to avoid endless right-indenting of code, so there is a lot of syntax sugar that helps with common situations that could cause code to start drifting off the side of developers screens. This is somewhere where the youth of Rust really shines - there is a lot less legacy and "that's-how-it-is" within the language, instead just doing something simple and legible. A nice example of this is the `if let` statement:
 
```rust
if let Ok(value) = result_value {
   // use value
}
```
 
It's a simple solution to the problem of not wanting to handle every property of an enum when dealing with them, and is especially useful when dealing with Result/Option enums.
 
## What the hell is this enum/Result thing?
 
It's impossible to talk about the language without mentioning it's enums. They're something that at first glance look a bit insane, especially for me coming from a C# background. Instead of just being a number-string relationship, enums can carry a value in Rust. This means you can have a function return an enum, but that enum can carry different types within it depending upon it's value. Whilst simple, this allows for developers to handle multiple types being returned from a function in a graceful way.

The peak example of this is the Result enum, which is part of the standard library. A Result defines two enum values - one Ok, the other Err, both carrying a value of a defined type. This means you can have a function that returns one type when everything is okay, and when it throws an error it can return a different type. The initial reaction to this is to wonder why you wouldn't just use an exception - but once you start working with it, it's hard to go back to using exceptions in other languages. Returning a result very quickly lets developers using a method/api know two things:
 
- This method may fail, and return an error
- You should be prepared to handle that error, and it will return a certain type
 
Compare this to an exception, where you often have to know the method being called could return an exception - wrapping it in something like a try/catch block. It also just makes better semantic sense - "Expected Exceptions" (for things like validation/format issues) don't really make a lot of sense when you think about it from the outside, and returning an Ok/Err response just seems sensible.
 
## What about the ecosystem?
 
I'd be lying if I said the ecosystem around Rust was a solid as something like .NET, or as vast as something like node. What I have noticed in Rust is that a lot of the developers getting involved in creating packages and frameworks are bringing a lot of experience to the party. When you stack this up alongside the recent investment from companies like Google and Microsoft, as well as the roots inside Mozilla, it's clear that the language is really making waves.
 
In a lot of ways, I think what Rust is waiting for is it's killer application/framework. Looking back in time, most languages had a particular setting that propelled them to greatness. C# is synonymous with .NET at this point, and the old ASP.NET days were foundational for it. PHP would probably not be as big as it is if it wasn't for WordPress (for its sins). Javascript was a bit neglected (I still remember deliberately avoiding using JS in webpages) until Node and things like React burst onto the scene. Whilst Rust has a lot of great emerging frameworks (I'm playing with the excellent [Bevy](https://github.com/bevyengine/bevy) a lot at the moment), and some real success stories of components of larger systems being rewritten - I think the language hasn't quite tipped into the `dotnet new mvc` level of getting projects spun up and moving.
 
## Sounds great? How do I learn.
 
I tell anyone I can convince to talk to me about Rust to checkout the [Rustlings tutorial](https://github.com/rust-lang/rustlings). This is a relatively short set of exercises that will introduce you to writing Rust in a practical way. The language also has a fantastic series of documentation called [The Book](https://doc.rust-lang.org/book/).
 
More than anything though, I'd encourage people interested in Rust to just start writing it. The language is *significantly* friendlier than other languages at its level, especially for people who haven't written system level code before. I've personally found the transition from the web world relatively painless. If you are a web developer, definitely have a play around with the WebAssembly build targeting - the fact you can pretty seamlessly write something as performant as Rust, then drop it into a webpage, is a properly exciting idea.

Given the colour of the logo/mascot, I'll end with a cheesy marketing like - the future's bright. The future's orange.