---
title: A Type Initializer Exception Thrown in the ASP.NET Core Project
page_title: ASP.NET Core Project Crashes as External Assemblies Cannot Be Found
description: "Learn how to handle the type initializer for Telerik.Reporting.Cache.Lock threw an exception error in an ASP.NET Core project."
type: troubleshooting
slug: asp-dot-net-core-error-the-type-initializer-for-telerik-reporting-cache-lock
tags: telerik, reporting, type, exception, thrown, as, net, core, project
ticketid: 1416003
res_type: kb
---

## Environment

<table>
    <tbody>
	    <tr>
	    	<td>Product Version</td>
	    	<td>13.0.19.116 or later</td>
	    </tr>
	    <tr>
	    	<td>Product</td>
	    	<td>Progress® Telerik® Reporting</td>
	    </tr>
	    <tr>
	    	<td>.NET Framework</td>
	    	<td>.NET Core 2.1, ASP.NET Core</td>
	    </tr>
    </tbody>
</table>


## Description

How can I handle the `The type initializer for Telerik.Reporting.Cache.Lock threw an exception` error in ASP.NET Core projects?

## Cause

In ASP.NET Core projects which target the .NET Core framework and if the Telerik Reporting assemblies are referred locally as References instead of NuGet packages, you may get the `The type initializer for Telerik.Reporting.Cache.Lock threw an exception` error.

## Solution

The Telerik Reporting assemblies depend on external assemblies that get added automatically when referred from NuGet packages. When the Reporting assemblies are referenced directly, you have to add these dependencies manually.

The particular error is due to the lack of the `System.Threading.AccessControl` assembly. If you add it, another error related to another missing assembly will occur.

To get the list of the dependencies for `Telerik.Reporting`, `Telerik.Reporting.Services.AspNetCore`, and so on, open the packages in the NuGet Package Manager in Visual Studio.  

It is strongly recommended that you add the Telerik Reporting assemblies as NuGet packages. Note that you can create a [local NuGet repository](https://docs.microsoft.com/en-us/nuget/hosting-packages/local-feeds) and download the NuGet packages in it. If this is not an option, add the necessary dependencies manually too after checking the packages in the NuGet Package Manager as previously suggested.
