---
layout: post
title: "Crossing the Streams: Static functions with C# dependency injection"
date: 2022-07-08 10:00:00 +0100
categories: functional programming csharp
excerpt_separator: <!--more-->
---

Most of my time writing code is spent in JavaScript/TypeScript/node these days, but I still like to keep an eye on C#/dotnet. It's important to keep yourself exposed to different languages and ecosystems, as often neat solutions to problems can be found in other languages, because the common uses are different. One aspect of JavaScript I've really grown to love is the functions. Being able to declare and use functions like variables unlocks some really nice code patterns, and using libraries like [neverthrow](https://www.npmjs.com/package/neverthrow) or just raw promises can allow you to enforce error handling into your application. So recently writing some C#, I've wanted to bring this kind of thinking with me, and it's been quite an experience.

![KubeCube Image](/images/2022-05-31-traefik-control.jpg)

<!--more-->

## Functions in C#

The immediate salt in the wound for writing C# in a functional style is that everything needs to live in a class. You end up throwing `static` around a lot, both in class and method declarations. It was pretty telling that a lot of the methods started looking a bit like extensions, passing a record as the first argument and returning the new record out at the end. Disclaimer out of the way, the language itself feels good written this way. I have been making heavy use of the excellent [CSharpFunctionalExtensions](https://www.nuget.org/packages/CSharpFunctionalExtensions/) to give me nice `Result` responses (something I've [waxed lyrical]({% post_url 2021-06-21-playing-with-rust %}) about before), and that means you get some quite nice looking methods. We'll give ourselves a quick method to work with.

```csharp
using CSharpFunctionalExtensions;

public enum MathError {
  DivideByZero
}

public static class BusinessMath {
  public static Result<float, MathError> DivideAbyB(float a, float b) {
    if (b == 0) {
      return MathError.DivideByZero;
    }
    return a / b;
  }
}
```

The key thing with returning a `Result` from our methods is that we are both saying things _can_ go wrong, and that the caller should expect to handle these problems. Normally in C# you'd just throw an exception and expect the caller to catch it (or not...), however you're not really giving the caller any hints that the exception could be thrown in the code itself. Critically this means when using result objects, you shouldn't be throwing exceptions in your methods unless you've got a really, _really_ good reason - the only one I've found myself using is the ever useful `NotImplementedException` as something to throw when scaffolding tests.

Tests feel really pleasant to write when working functionally. Knowing that your code should always execute, knowing the paths it should take, the particular errors it should exhibit/not exhibit, makes arranging your test resources pretty trivial. You don't have to worry about instantiating lots of mocks you don't care about on a test case - you just arrange your inputs, act, assert. This also makes it easier to write your tests _first_ - instead of the old classic of C# testing where you add a dependency in your constructor, and suddenly you break half a dozen other tests, unless you have some kind of abstraction... in your tests. Where you don't really want any abstractions.

## Registering implementations of delegates

So we've got our method, it's nice, but how do we then put it to use? Of course you can just drop the method into code and use it, but if you're writing tests through your application, suddenly you're having to arrange your test case for the the caller of your method based on the method's implementation - not great.

This is where delegates come into the picture. [The documentation is here](https://docs.microsoft.com/en-us/dotnet/csharp/programming-guide/delegates/), my personal shorthand for delegates however is that they're interfaces for methods. Any method on a class can act as an implementation of a delegate as long as the types match.

To keep expanding on our method above, we can add a delegate like this:

```csharp
using CSharpFunctionalExtensions;

public enum MathError {
  DivideByZero
}

public delegate Result<float, MathError> DivideAbyB(float a, float b);

public static class BusinessMath {
  public static Result<float, MathError> DivideAbyB(float a, float b) {
    if (b == 0) {
      return MathError.DivideByZero;
    }
    return a / b;
  }
}
```

The little secret of delegates however is that you can register methods against them the same as a class can be registered as an implementation of an interface. It looks a little like this:

```csharp
var builder = WebApplication.CreateBuilder(args);
builder.Services.AddSingleton<DivideAbyB>(BusinessMath.DivideAbyB);
```

You can then just refer to your delegate in your constructor, the same as you would an interface, throw the method onto a property, and suddenly you have an injectable static method.

```csharp
public class CriticalBusinessApplication {
  private readonly DivideAbyB _divideAbyB;
  public CriticalBusinessApplication(DivideAbyB divideAbyB) {
    this._divideAbyB = divideAbyB;
  }

  public float PerfectDivider(float target, float divisor) {
    var result = this._divideAbyB(target, divisor);
    if (result.IsFailure) {
      switch(result.Error) {
        case MathError.DivideByZero:
          // In reality you'd probably do something more useful here with the error.
          return 0f;
        default:
          throw new NotImplementedException();
      }
    }
    return result.Value;
  }
}
```

Doing this means you can mock out your method responses, and instead of having to test situations based on inputs, you just test on what a mocked function returns.

```csharp
using Moq;

[TestClass]
public class CriticalBusinessApplication_Tests {
  [TestMethod]
  // These numbers are deliberately nonsesnsical, as we're not testing
  // the implementation, just that it's called.
  [DataRow(1f, 3f, 5f)]
  [DataRow(7f, 2f, 9f)]
  [DataRow(2f, 3f, 6f)]
  [DataRow(9f, 2f, 1f)]
  public void PassesNumbersToFunctionAndReturnsResult(float inputTarget, float inputDivisor, float functionResult) {
    //Arrange
    var mockFunction = new Mock<DivideAbyB>();
    mockFunction.Setup(x => x(inputTarget, inputDivisor)).Returns(functionResult);
    var cba = new CriticalBusinessApplication(mockFunction.Object);
    //Act
    var output = cba.PerfectDivider(inputTarget, inputDivisor);
    //Assert
    Assert.AreEqual(functionResult, output);
    mockFunction.Verify(x => x(inputTarget, inputDivisor), Times.Once);
  }
}
```

## Practical applications(?) and conclusion

This is all very fun, but what does it really let us do, other than just mixing functional-style code with our classes? Not to sound like a broken record, but the key thing with delegates used in this way is testing. Something that is an absolute _classic_ to run into is testing if something has the time set to `DateTime.UtcNow`. Problem being that the time that the line will be executed will be different from when it's asserted against. Using a delegate, you can implement something like the below constructor, to give you a function you can control:

```csharp

public class MyClassThatNeedsNow {
  private readonly Func<DateTime> _getDateTimeNow = () => { return DateTime.UtcNow; };
  public MyClassThatNeedsNow(Func<DateTime>? getDateTimeNow = null) {
    // Rather than checking for null and providing a default, you could
    // enforce a single dependency across the app, which would in
    // turn allow you to control how it functions
    if (getDateTimeNow is not null)
        _getDateTimeNow = getDateTimeNow;
  }
}

```

How useful is this? I'm pretty conflicted in the end. On the one hand, I really enjoy thinking about code in a more functional style - working with functions as variables in their own right that can be manipulated and used within the code. C#/dotnet has been adding features to push developers in this direction as well, such as records and pattern matching most recently in C# 9, and local functions back in C# 7. I think there is real power in a language allowing you to choose using functional features whilst still having the tools of OOP patterns when you need them.

On the flip side, it's really apparent when doing this that you end up having to work _around_ parts of C# to treat methods as functions. While you can create lambdas and local functions that you can assign to variables, if you want to use them in other places in your codebase, you end up wrapping them in a class. And if you're grouping your function-methods together, you might as well put them into the same class, then give it an interface, and you're basically back where you started. In the introduction I mentioned mostly writing TypeScript and JavaScript in recent times, and I've played around with Rust, all of which feel much more friendly to functional programming. So give it a go, especially the `Result` responses and using records, but beware that stepping outside the OOP paradigm means your code can certainly start looking a little... _esoteric_.

