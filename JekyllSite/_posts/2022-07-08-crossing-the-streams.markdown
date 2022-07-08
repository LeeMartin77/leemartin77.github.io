---
layout: post
title: "Crossing the Streams: Pure functions with C# dependency injection"
date: 2022-07-08 10:00:00 +0100
categories: functional programming csharp
excerpt_separator: <!--more-->
---

<!-- mostly write js now, enjoy c#, but want to use functional techniques -->

![KubeCube Image](/images/2022-05-31-traefik-control.jpg)

<!--more-->

## "Pure" functions in C#

The immediate salt in the wound for writing C# in a functional style is that everything needs to live in a class. You end up throwing `static` around a lot in both class and method declarations to make the intent clear. It was pretty telling that a lot of the methods I was writing started looking a bit extension-like. Disclaimer out of the way, the language itself feels good. I have been making heavy use of the excellent [CSharpFunctionalExtensions](https://www.nuget.org/packages/CSharpFunctionalExtensions/) to give me nice `Result` responses (something I've waxed lyrical about before), and that means you get some quite nice looking functions. We'll give ourselves a quick function to work with in this blogpost.

```csharp
using CSharpFunctionalExtensions;

public enum MathError {
  DivideByZero
}

public static class BusinessMath {
  public static Result<decimal, MathError> DivideAbyB(decimal a, decimal b) {
    if (b == 0) {
      return MathError.DivideByZero;
    }
    return a / b;
  }
}
```

The key thing with returning a `Result` from our methods is that we are both saying things _can_ go wrong, and that the caller should expect to handle these problems. Normally in C# you'd just throw an exception and expect the caller to catch it (or not...), however you're not really giving the caller any hints that the exception could be thrown. Critically in my mind this means you shouldn't be throwing exceptions in your functions unless you've got a really, really good reason - the only one I've found myself using is the ever useful `NotImplementedException` as something to throw when I'm writing my tests.

Tests are the payoff (aside from practical things I'll get to later) for writing your code functionally. Knowing that your code should always execute, knowing the paths it should take, the particular errors it should exhibit/not exhibit, makes arranging your test resources pretty trivial. You don't have to worry about instantiating lots of mocks you don't care about on a test case - you just arrange, act, assert. This also makes it easier to write your tests _first_ - instead of the old classic of C# testing where you add a dependancy in your constructor, and suddenly you break half a dozen other tests, unless you have some kind of abstraction... in your tests. Where you don't really want any abstractions.

## Registering implementations of delegates

So we've got our pure function, it's nice, but how do we then put it to use? Of course you can just drop the function into code and use it, but if you're writing tests through your application, suddenly you're having to arrange your test case of the caller of your function based on the function's implementation - not great.

This is where delegates come into the picture. [The documentation is here](https://docs.microsoft.com/en-us/dotnet/csharp/programming-guide/delegates/), my personal shorthand for delegates however is that they're interfaces for functions. Any method on a class can act as an implementation of a delegate as long as the types match.

To keep expanding on our function above, we can add a delegate like this:

```csharp
using CSharpFunctionalExtensions;

public enum MathError {
  DivideByZero
}

public delegate Result<decimal, MathError> DivideAbyB(decimal a, decimal b);

public static class BusinessMath {
  public static Result<decimal, MathError> DivideAbyB(decimal a, decimal b) {
    if (b == 0) {
      return MathError.DivideByZero;
    }
    return a / b;
  }
}
```

The little secret of delegates however is that you can register them the same as a class can be registered as an implementation of an interface. It looks a little like this:

```csharp
var builder = WebApplication.CreateBuilder(args);
builder.Services.AddSingleton<DivideAbyB>(BusinessMath.DivideAbyB);
```

You can then just refer to your delegate in your constructor, the same as you would a class via an interface.

```csharp
public class CriticalBusinessApplication {
  private readonly DivideAbyB _divideAbyB;
  public CriticalBusinessApplication(DivideAbyB divideAbyB) {
    this._divideAbyB = divideAbyB;
  }

  public int PerfectDivider(decimal target, decimal divisor) {
    var result = this._divideAbyB(target, divisor);
    if (result.IsFailure) {
      switch(result.Error) {
        case MathError.DivideByZero:
          // In reality you'd probably do something more useful here with the error.
          return 0;
        default:
          throw new NotImplementedException();
      }
    }
    return result.Value;
  }
}
```

Doing this means you can mock out your function responses, and instead of having to test situations based on inputs, you just have to test on what a mocked function returns.

```csharp
using Moq;

[TestClass]
public class CriticalBusinessApplication_Tests {
  [TestMethod]
  // These numbers are deliberately nonsesnsical, as we're not testing
  // the implementation, just that it's called.
  [DataRow(1, 3, 5)]
  [DataRow(7, 2, 9)]
  [DataRow(2, 3, 6)]
  [DataRow(9, 2, 1)]
  public void HappyPath_PassesNumbersToFunctionAndReturnsResult(decimal inputTarget, decimal inputDivisor, decimal functionResult) {
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

## Practical application

## Conclusion

- Missed ducktyping
- Feels like something you'd use in niche things
- Can be a good way of really cutting business logic away from application scaffolding
