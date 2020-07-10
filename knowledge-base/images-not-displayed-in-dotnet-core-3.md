---
title: In ASP.NET Core 3.0 applications the PictureBox and CheckBox images are not displayed
description: In ASP.NET Core 3.0 the resources that are loaded synchronously such as PictureBox and CheckBox images are not displayed in the Html5 Report Viewer
type: troubleshooting
page_title: In .NET Core 3.0 images are not shown in the viewer
slug: images-not-displayed-in-dotnet-core-3
position: 
tags: 
ticketid: 1432242
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
			<td>Visual Studio version</td>
			<td>Visual Studio 2019</td>
		</tr>
	</tbody>
</table>


## Description
PictureBox images and CheckBox marks are not displayed by the Html5 Report Viewer in .NET Core 3 application.

## Error Message
__"Synchronous operations are disallowed. Call WriteAsync or set AllowSynchronousIO to true instead."__

## Cause\Possible Cause(s)
In .NET Core 3 by default __Synchronous operations are disallowed__. Synchronous operations are necessary to download resources such as images used in the reports.

## Solution
The Synchronous operations need to be manually allowed, for example by setting the __AllowSynchronousIO__ to __True__ in the container services. This can be done by adding the following code in the __ConfigureServices__ method of the __Startup.cs__ file for __IIS__.
```CSharp
this.services.Configure<IISServerOptions>(options =>
{
        options.AllowSynchronousIO = true;
 });
```
For __Kestrel__ you may use code like the following in the __Program.cs__ file:
```CSharp
public static IWebHostBuilder CreateWebHostBuilder(string[] args) =>
     WebHost.CreateDefaultBuilder(args)
         .UseStartup<Startup>()
         .ConfigureKestrel((context, options) =>
         {
             options.AllowSynchronousIO = true;
         })
```
## See Also
[Manual Setup of HTML5 Report Viewer in an ASP.NET Core 3+ application](../manual-setup-of-html5-report-viewer-in-asp-net-core-3)
