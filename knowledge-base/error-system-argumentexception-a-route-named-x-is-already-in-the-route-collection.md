---
title: System.ArgumentException A route named X is already in the route collection.
description: In an ASP.NET MVC application an error of type System.ArgumentException is thrown
type: troubleshooting
page_title: Getting an error System.ArgumentException A route named X is already in the route collection. Route names must be unique. Parameter name name
slug: error-system-argumentexception-a-route-named-x-is-already-in-the-route-collection
position: 
tags: 
ticketid: 1419185
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
	    	<td>Project Type</td>
	    	<td>ASP.NET MVC</td>
	    </tr>
    </tbody>
</table>


## Description
The following error occurs at the following line:
```CSharp
Telerik.Reporting.Services.WebApi.ReportsControllerConfiguration.RegisterRoutes(config); 
```


## Error Message
```
System.ArgumentException: 'A route named 'X' is already in the route collection. Route names must be unique.
Parameter name: name' 
```

## Cause/Possible Causes
The most common reasons are renaming the project files or having duplicate using of Telerik.Reporting.Services.WebApi.ReportsControllerConfiguration.RegisterRoutes(config).

## Solution
1. In case of experiencing the issue locally
	- Delete the project's **bin** directory and then clean and rebuild the solution. Here, you can find more suggestions related to this Rest API error: [A route named “x” is already in the route collection. Route names must be unique. Exception with ASP.NET MVC 3](https://stackoverflow.com/questions/10986909/a-route-named-x-is-already-in-the-route-collection-route-names-must-be-unique). 
	- Check if there is only one routes registering. For example in the Application_Start() method of Global.asax.cs.

2. In case of publishing the application to Azure environment
    - On the Visual Studio publish screen go to Settings
    - Expand File Publish Options
    - Tick the 'Remove additional files at destination' checkbox.
    
    For more information, check [Azure deployment: A route named 'HelpPage_Default' is already in the route collection. Route names must be unique. Parameter name: name](https://stackoverflow.com/questions/47294036/azure-deployment-a-route-named-helppage-default-is-already-in-the-route-colle?rq=1) stackoverflow thread.
