---
title: ASP.NET Core project throws 'The type initializer for Telerik.Reporting.Cache.Lock threw an exception'
description: ASP.NET Core project throws 'The type initializer for Telerik.Reporting.Cache.Lock threw an exception'
type: troubleshooting
page_title: ASP.NET Core project crashes as external assemblies cannot be found
slug: asp-dot-net-core-error-the-type-initializer-for-telerik-reporting-cache-lock
position: 
tags: 
ticketid: 1416003
res_type: kb
---

## Environment
<table>
    <tbody>
	    <tr>
	    	<td>Product Version</td>
	    	<td>13.0.19.116 or higher</td>
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
In ASP.NET Core projects targeting the .NET Core framework if the __Telerik Reporting__ assemblies are referred locally, as References instead of NuGet packages you may get the following error.

## Error Message
__'The type initializer for Telerik.Reporting.Cache.Lock threw an exception'__

## Solution
Telerik Reporting assemblies depend on external assemblies that get added automatically when referred from NuGet packages.
When the reporting assemblies are referenced directly, these dependencies should be added manually. The particular error is due to the lack of the **_System.Threading.AccessControl_** assembly. If you add it, there will be another error related to other missing assembly and so on.  
You may get the list of the dependencies for **Telerik.Reporting**, **Telerik.Reporting.Services.AspNetCore**, etc. if you open the packages in the NuGet Package Manager in Visual Studio.  
  
Our strong recommendation is to add Telerik Reporting assemblies as NuGet packages. Note that you may create a [local NuGet repository](https://docs.microsoft.com/en-us/nuget/hosting-packages/local-feeds) and download there the NuGet packages.  
If this is not an option, you need to add also the necessary dependencies manually (check the packages in the NuGet Package Manager as suggested above).
