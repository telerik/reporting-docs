---
title: Field not found Telerik.Reporting.Processing.UserIdentity.Current error when displaying report in ASP.NET Core application
description: Field not found Telerik.Reporting.Processing.UserIdentity.Current error occurs in HTML5 report viewer
type: troubleshooting
page_title: Report shows Field not found Telerik.Reporting.Processing.UserIdentity.Current error in HTML5 report viewer
slug: field-not-found-telerik-reporting-processing-useridentity-current-error
position: 
tags: asp.net core,nuget packages
ticketid: 1162729
res_type: kb
---

## Environment
<table>
	<tr>
		<td>Product Version</td>
		<td>12.0.18.416</td>
	</tr>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting </td>
	</tr>
	<tr>
		<td>.Net framework</td>
		<td>ASP.NET Core</td>
	</tr>
</table>


## Description

For adding Reporting engine and Reporting REST service to .NET Core application we provide NuGet packages: **Telerik.Reporting** and **Telerik.Reporting.Services.AspNetCore**.
Using those packages in the application results in an error dispalyed in HTML5 report viewer.

## Error Message
```
Unable to get report parameters.
An error has occured.
Field not found: 'Telerik.Reporting.Processing.UserIdentity.Current'
```

## Cause\Possible Cause(s)

It is a known issue with NuGet packages we provide for ASP.NET Core projects that was introduced in R1 2018 SP3 release.

## Solution

The fix is provided in the next internal build, i.e. *12.0.18.424*.

## Suggested workarounds

With the current version, i.e. 12.0.18.416, the workaround for the error is to downgrade the packages.


