---
title: Adding the Private Telerik NuGet Feed
page_title: Adding the Private Telerik  NuGet Feed to Visual Studio 
description: "Get up and running with Telerik Reporting and learn how to add the Telerik private NuGet feed to Visual Studio."
slug: telerikreporting/using-reports-in-applications/how-to-add-the-telerik-private-nuget-feed-to-visual-studio
previous_url: /using-reports-in-applications/how-to-add-the-telerik-private-nuget-feed-to-visual-studio
tags: how,to,add,the,telerik,private,nuget,feed,to,visual,studio
published: True
position: 8
---

# Adding the Telerik Private NuGet Feed to Visual Studio

> The legacy https://nuget.telerik.com/nuget server is now deprecated. Make sure you are using the new https://nuget.telerik.com/v3/index.json server, which is faster, lighter, and reduces the number of requests from your NuGet client. 

Telerik provides NuGet packages from the private Telerik NuGet feed which you can add to the Visual Studio NuGet package manager. 

## Prerequisites

* Visual Studio 2012 or later.

* Valid Telerik Reporting trial or commercial license.

## Setup

1. Open Visual Studio. 

1. Go to __Tools__ > __NuGet Package Manager__ > __Package Manager Settings__, select __Package Manager Sources__ and click the __+__ button. 

1. Choose the feed __Name__ and set the feed __URL__ to __https://nuget.telerik.com/v3/index.json__. Click __OK__. 
	
	>caption The Visual Studio NuGet Package Manager and the Telerik NuGet Feed 

	![nuged feed](images/nuged-feed-in-npm.png)

1. Create or load your project. 

1. Go to __Tools__ > __NuGet Package Manager__ > __Manage NuGet Packages for solution__. 

1. In the upper right-hand corner of the __Manage Packages for Solution__ window, select the Telerik __Package source__ that you just added. 

1. Depending on your Visual Studio version, choose the __Online__ or __Browse__ list of packages. 

1. In the Windows **Authentication** dialog, enter your Telerik credentials. For example, **user: my.name@my.company.com** and **password: myPassPhraseForTelerikDotCom**. 

1. Enter your credentials only once by selecting the __Remember my password__ checkbox. 

	>caption Enter your Telerik.com credentials to access the Telerik NuGet feed   

	![nuget Wcredentials](images/nuget-credentials.png)

Now all the packages that are licensed to the above users are available in the Visual Studio NuGet Package manager. 

## Setup with NuGet CLI          

1. Download the latest [NuGet executable](https://dist.nuget.org/win-x86-commandline/latest/nuget.exe). 

1. Open a Command Prompt and change the path to the `nuget.exe` location. 

1. The command from the example below stores a token in the `%AppData%\NuGet\NuGet.config` file. Your original credentials cannot be obtained from this token. 
    
	````powershell
NuGet Sources Add -Name "telerik.com" -Source "https://nuget.telerik.com/v3/index.json" ^
	-UserName "your login email" -Password "your password"
````

	If you are unable to connect to the feed by using encrypted credentials, store your credentials in clear text. 
    
	````powershell
NuGet Sources Add -Name "telerik.com" -Source "https://nuget.telerik.com/v3/index.json" ^
	-UserName "your login email" -Password "your password" ^
	-StorePasswordInClearText
````

	If you have already stored a token instead of storing the credentials as clear text, update the definition in the `%AppData%\NuGet\NuGet.config` file by using the following command: 
    
	````powershell
NuGet Sources Update -Name "telerik.com" -Source "https://nuget.telerik.com/v3/index.json" ^
	-UserName "your login email" -Password "your password" ^
	-StorePasswordInClearText
````


## See Also 

* [NuGet V2 Feed Error about Returned Unexpected 401 Status Code]({% slug nuget-feed-returned-unexpected-401-status-error %})
