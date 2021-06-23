---
title: Error 401 'Failed to retrieve information from remote source https://nuget.telerik.com' on restoring Nuget packages in .NET Core project
description: Error 401 'Failed to retrieve information from remote source https://nuget.telerik.com' on restoring Nuget packages in .NET Core project.
type: how-to
page_title: Error 401 'Failed to retrieve information from remote source https://nuget.telerik.com' on restoring Nuget packages in .NET Core project
slug: error-401-failed-to-retrieve-information-from-remote-source-nugettelerikcom-on-restoring-nuget-packages-in-net-core-project
res_type: kb
---

## Problem
Error 401: "Failed to retrieve information from remote source https://nuget.telerik.com" on restoring Nuget packages in .NET Core project. The error and the package that cannot be restored will be listed in <a href="https://msdn.microsoft.com/en-us/library/3hk6fby3.aspx" target="_blank">Visual Studio Output Window</a>  
  
## Desciption  

Telerik products, including Telerik Reporting, can be used via Nuget packages. To access Nuget packages you need Telerik account allowing you to connect to the private Telerik Nuget feed - <a href="https://www.telerik.com/blogs/we-maintain-a-telerik-nuget-feed" target="_blank">We Maintain a Telerik NuGet Feed</a>.  
  

The connection to the private Nuget feed requires user and password, which are not stored automatically.  
  
## Solution  

This is an issue with .NET Core tooling and it options for storing passwords for private feeds - <a href="https://github.com/dotnet/cli/issues/3174" target="_blank">Restore fails when a NuGet feed with Encrypted Credentials (default) is defined on the system</a>. The comment in the first post elaborates how to store the username and password in plain text to allow the restore operation.  
  

For more details, please check <a href="https://www.visualstudio.com/en-us/docs/package/nuget/auth" target="_blank">Authenticating to feeds with NuGet</a>.


