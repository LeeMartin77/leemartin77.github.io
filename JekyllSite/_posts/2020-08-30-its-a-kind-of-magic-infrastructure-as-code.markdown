---
layout: post
title:  "It's a Kind of Magic: Infrastructure as Code"
date:   2020-08-30 15:45:00 +0100
categories: devops
---

This week has been a pretty relaxed one, as I'm transitioning between two jobs. I've tried to keep a habit of my working hours however, just to keep consistency. This has meant tinkering with a lot of new things! I've been diving into the world of React and Azure Functions, I've even had a bit of a play with Monogame! But I think the most exciting lesson for me came from doing my first bit of infrastructure as code in Azure. Nothing fancy, in fact incredibly simple, and this isn't going to be a guide on the how. Instead I wanted to touch on why you should be considering the approach as an extension of your development, rather than just something you do at the end to host/run your code.

![Messages in Magic: https://commons.wikimedia.org/wiki/File:Messages_in_magic,_First_sergeant_reaches_Airmen,_veterans_through_tricks_151021-F-YC840-064.jpg](/images/2020-08-30-kind-of-magic.jpeg)

### What is a Cloud Provider? Hell, what's the Cloud?

Cloud computing is the idea of on-demand computer resources - things like networking, processing data, storing information. The key idea in cloud computing is that you don't own or worry about the hardware. If a hard drive somewhere in the server dies, it's not your problem - the provider takes care of it, and you shouldn't be affected. It has good and bad sides - at the end of the day, you're essentially just using someone else's computer, which can be a security headache for some. At the same time, you can scale up and down as you need - you don't need to have a monster of a server and network connection that sits idle 99% of the time.

Providers are the companies that actually own these platforms. Loads of companies exist, probably the biggest being AWS (Amazon), Azure (Microsoft) and Google Cloud (Google). Each provider is going to be slightly different, with its own products, services, pricing and toolchain. Personally I use Azure, because I am already pretty heavily in .NET/Microsoft land, but the concept of Infrastructure as Code could apply with any provider.

### And Infrastructure as Code?

So Infrastructure as Code is the idea of not clicking through interfaces in order to provision cloud computing resources - instead writing repeatable, predictable scripts. This can be done in a number of ways, but the big providers all have some form of API - for example, Azure has the [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/?view=azure-cli-latest). This lets me write a simple Powershell or Bash script, to setup whatever cloud resources I need.

The obvious implementation of this is in build and release pipelines. If you can successfully automate creating your environments (be them development, staging or production), you can release with confidence knowing what works on one, will work on others. This also opens the door to easier setup/teardown of environments, meaning you don't need to be precious about them. This allows you to act much earlier on a badly behaving service, taking it down safe in the knowledge it can be restored in a few keystrokes.

But this is all very ops-land talk (as much as I abhor the idea of [things being one person's job]({% post_url 2020-07-19-not-my-job %})), so how can this help development? I want to give an example I ran into this week around Table Storage

## The Problem

So for my new project, I wanted to use Azure Table Storage as the data persistence option. This is, bluntly, because it's cheap as hell to run and I prefer to keep the things that I do in my own time relatively cheap. I'll gladly take a bit of development overhead in exchange. But there is a problem - emulating this kind of storage locally is really tricky. The docker image for emulating it is pretty old, and only runs on windows. The newer open source [Azurite](https://github.com/Azure/Azurite) storage emulator (as great as it is), doesn't support Table storage. 

## The Solution

After spending a couple of days wrestling with the problem, I eventually just decided to throw up an actual storage account to develop against. At this point, I'd never really delved into the world of Infrastructure as Code, despite plenty of reading about the subject. After a bit of digging into how to run scripts that would work with Azure (there are a few different options), I got the Azure CLI installed, logged in with my subscription, and was able to fire commands to make things go bloop in Azure. This is always the moment of development I've been hooked on - when you write out some text, and it makes something happen.


In the end, the powershell script was pretty lean (I've omitted the user prompts and default values for brevity):

```Powershell
if(!(az group exists --name $resourceGroupName | ConvertFrom-Json)) 
{
    az group create --location $location --name $resourceGroupName
}

$result = az storage account check-name --name $storageAccountName | ConvertFrom-Json

if($result.nameAvailable)
{
    az storage account create --name $storageAccountName --resource-group $resourceGroupName --sku Standard_LRS --location $location
}

$keys = az storage account keys list -g $resourceGroupName -n $storageAccountName | ConvertFrom-Json

$exampleJson = Get-Content -Raw -Path '../azure-function-app/local.settings.example.json' | ConvertFrom-Json

$exampleJson.Values.AzureStorageAccountName = $storageAccountName
$exampleJson.Values.StorageAccountKey = $keys[0].value

Set-Content -Path '../azure-function-app/local.settings.json' -Value ($exampleJson | ConvertTo-Json)
```

All this does in human terms is create a new resource group with a given name, creates a storage account on that group, then writes the storage account name and key to my local settings for the solution's azure function app. Tearing it back down again is as simple as

```Powershell
if(az group exists --name $resourceGroupName) 
{
    az group delete --name $resourceGroupName
}
```

And that's it! This code isn't overly elegant or smart, but what it does do is make the problem of "how do I emulate Table Storage to develop against?" to just... go away. Because I'm not emulating my data persistence, I can also get a degree of confidence that my code is going to work on the Real Thing™ when it comes time to actually deploy it somewhere.

## Just Try It. You'll be Pleasantly Surprised.

I think what surprised me the most when I did this was how damn easy it was. Once the Azure CLI was installed and I'd logged into my account, creating resources and following the documentation was a breeze. As a developer, it's a very familiar experience - it's just like learning any other language or framework, except now the output is provisioned cloud resources. I'd always worked under the assumption that this style of work was reserved for big companies and ops guys - that it wouldn't have any real bearing on what I was doing in my own time. Truthfully I think it might have more impact on my personal projects. In a company you're often going to be waiting on maintenance windows, or at least slow periods, to take infrastructure down. With something I've thrown together that I just want to show someone, being able to just throw an environment up (potentially at the press of a button), is a real game changer. 