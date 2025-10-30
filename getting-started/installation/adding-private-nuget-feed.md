---
title: Adding the Telerik NuGet Feed
page_title: Adding Telerik NuGet Feed
description: "Get up and running with Telerik Reporting and learn how to add quickly and easy the Telerik private NuGet feed to Visual Studio with the NuGet Package Manager or NuGet CLI in this step-by-step tutorial."
slug: telerikreporting/using-reports-in-applications/how-to-add-the-telerik-private-nuget-feed-to-visual-studio
previous_url: /using-reports-in-applications/how-to-add-the-telerik-private-nuget-feed-to-visual-studio, /add-the-telerik-private-nuget-feed-to-visual-studio
tags: how,to,add,the,telerik,private,nuget,feed,to,visual,studio
published: True
position: 5
---

# Adding the Telerik NuGet Feed to Your System

Telerik maintains a publicly accessible NuGet server, providing a collection of NuGet packages to authenticated users. You can add the NuGet feed to your system by using [Visual Studio's NuGet package manager](#setup-in-visual-studio) or the [NuGet CLI](#setup-with-nuget-cli).

To access the NuGet server, you need an active license for Telerik Reporting (trial or commercial) and an API key that you will use instead of a password.

## Generate an API Key

As the Telerik NuGet server requires authentication, the first step is to obtain an API key that you will use instead of a password. Using an API key instead of a password is a more secure approach, especially when working with [.NET CLI]({% slug using-nuget-keys %}#using-only-cli-commands) or the [`NuGet.Config` file]({% slug using-nuget-keys %}#using-a-nugetconfig-file-with-your-projects).

1. Go to the [API Keys](https://www.telerik.com/account/downloads/api-keys) page in your Telerik account.
1. Click **Generate New Key +**.

   ![Manage API Keys](./images/account-generate-api-key.png)

1. In the **Key Note** field, add a note that describes the API key.
1. Click **Generate Key**.
1. Select **Copy and Close**. Once you close the window, you can no longer copy the generated key. For security reasons, the **API Keys** page displays only a portion of the key.
1. Store the generated NuGet API key as you will need it in the next steps. Whenever you need to authenticate your system with the Telerik NuGet server, use `api-key` as the username and your generated API key as the password.

>API keys expire after two years. Telerik will send you an email when a key is about to expire, but we recommend that you set your own calendar reminder with information about where you used that key: file paths, project links, AzDO and GitHub Action variable names, and so on.

## Setup in Visual Studio

1. Open Visual Studio.
1. Go to __Tools__ > __NuGet Package Manager__ > __Package Manager Settings__, select __Package Manager Sources__ and click the __+__ button.
1. Choose the feed __Name__, set the feed __URL__ to __https://nuget.telerik.com/v3/index.json__ and click __OK__.

	>caption The Visual Studio NuGet Package Manager and the Telerik NuGet Feed

	![Telerik Nuget Feed in Visual Studio NuGet Package Manager](images/nuged-feed-in-npm.png)

1. Create or load your project.
1. Go to __Tools__ > __NuGet Package Manager__ > __Manage NuGet Packages for solution__.
1. In the upper right-hand corner of the __Manage Packages for Solution__ window, select the Telerik __Package source__ that you just added.
1. Click the **Browse** tab to see the available packages.
1. In the authentication window, enter `api-key` in the **User name** field and the [generated API key](#generate-an-api-key) in the **Password** field.

	>caption Enter your Telerik.com credentials to access the Telerik NuGet feed

	![Telerik.com credentials form to access the Telerik NuGet Feed](images/vs-nuget-auth-window.png)

After adding the Telerik server, all packages licensed to the authenticated user become available in the Visual Studio NuGet package manager.

## Setup with NuGet CLI

If you work with Visual Studio Code on Linux or Mac OS, use the Nuget CLI to set up the Telerik NuGet feed.

1. Download the latest [NuGet executable](https://dist.nuget.org/win-x86-commandline/latest/nuget.exe).
1. Open a Command Prompt and change the path to the `nuget.exe` location.
1. The command from the example below stores your API key in the `%AppData%\NuGet\NuGet.config` file.

````powershell
NuGet Sources Add -Name "telerik.com" -Source "https://nuget.telerik.com/v3/index.json" ^
	-UserName "api-key" -Password "YOUR-API-KEY" ^
	-StorePasswordInClearText
````

To update expired or invalid login credentials, update the definition in the `%AppData%\NuGet\NuGet.config` file by using the following command:

````powershell
NuGet Sources Update -Name "telerik.com" -Source "https://nuget.telerik.com/v3/index.json" ^
	-UserName "api-key" -Password "YOUR-API-KEY" ^
	-StorePasswordInClearText
````

## See Also

* [Restoring NuGet Packages in Your CI Workflow]({%slug using-nuget-keys%})
* [NuGet V2 Feed Error about Returned Unexpected 401 Status Code]({%slug nuget-feed-returned-unexpected-401-status-error%})
* [Setup a Local NuGet Package Feed]({%slug setup-local-nuget-feed%})
