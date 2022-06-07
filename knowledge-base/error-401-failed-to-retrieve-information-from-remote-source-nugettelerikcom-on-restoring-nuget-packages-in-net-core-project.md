---
title: Error 401 Failed to retrieve information from remote source https://nuget.telerik.com on restoring Nuget packages in a .NET Core project
description: Error 401 Failed to retrieve information from remote source https://nuget.telerik.com on adding Telerik Nuget packages in .NET Core project
type: troubleshooting
page_title: Error 401 Failed to retrieve information from remote source https://nuget.telerik.com on using Telerik Nuget packages in .NET Core project
slug: error-401-failed-to-retrieve-information-from-remote-source-nugettelerikcom-on-restoring-nuget-packages-in-net-core-project
res_type: kb
---
  
## Environment

<table>
    <tbody>
	    <tr>
	    	<td>Product</td>
	    	<td>Progress® Telerik® Reporting</td>
	    </tr>
      <tr>
	    	<td>Framework</td>
	    	<td>.NET Core</td>
	    </tr>
    </tbody>
</table>  

## Desciption  

Telerik products, including Telerik Reporting, can be used via Nuget packages. To access Nuget packages, you need Telerik account allowing you to connect to the private Telerik Nuget feed - <a href="https://www.telerik.com/blogs/we-maintain-a-telerik-nuget-feed" target="_blank">We Maintain a Telerik NuGet Feed</a>. 

## Error Message

```
Error 401: Failed to retrieve information from remote source https://nuget.telerik.com
```

## Cause

The connection to the private Nuget feed requires user and password credentials, which are not stored automatically.   
  
## Solution  

This is an issue with .NET Core tooling and its options for storing passwords for private feeds - <a href="https://github.com/dotnet/cli/issues/3174" target="_blank">Restore fails when a NuGet feed with Encrypted Credentials (default) is defined on the system</a>. The comment in the first post elaborates on how to store the username and password in plain text to allow the restore operation.  
  
### See Also

<a href="https://docs.microsoft.com/en-us/nuget/consume-packages/consuming-packages-authenticated-feeds" target="_blank">Consuming packages from authenticated feeds</a>.

<a href="../add-the-telerik-private-nuget-feed-to-visual-studio" target="_blank">How to add the Telerik private NuGet feed to Visual Studio</a>.
