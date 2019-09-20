---
title: Export to PDF fails from ASP.NET Core 2.2 projects
description: Export to PDF fails from ASP.NET Core 2.2 projects when using InProcess Hosting
type: troubleshooting
page_title: Export to PDF fails from ASP.NET Core 2.2 projects
slug: export-to-pdf-fails-from-asp-dot-net-core-2-2-projects 
position: 
tags: 
ticketid: 1422389
res_type: kb
---

## Environment
<table>
	<tbody>
		<tr>
			<td>Product Version</td>
			<td>13.1.19.618</td>
		</tr>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
		</tr>
		<tr>
			<td>Project Type</td>
			<td>ASP.NET Core 2.2</td>
		</tr>
		<tr>
			<td>Rendering Format</td>
			<td>PDF</td>
		</tr>
	</tbody>
</table>


## Description
The __InProcess__ hosting is new in ASP.NET Core 2.2 - check for example [ASP.NET Core In Process Hosting on IIS with ASP.NET Core 2.2](https://weblog.west-wind.com/posts/2019/Mar/16/ASPNET-Core-Hosting-on-IIS-with-ASPNET-Core-22). This setting results in a problem when exporting a report in PDF in ASP.NET Core 2.2 projects. The problem is general and is reproducible with our demos.

## Solutions
1. Open the __CSPROJ__ file (you must unload the project to open the file) and remove the following code (if contained):

```XML
<AspNetCoreHostingModel>InProcess</AspNetCoreHostingModel>
```

2. Use .NET Core 2.1 - _InProcess_ hosting is not available there, hence the problem does not exist.

3. Use .NET Core 3.0 - The problem is fixed in this version.
