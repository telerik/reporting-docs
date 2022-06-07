---
title: The type initializer for Lock threw an exception error in HTML5 viewer in ASP.NET Core application
description: The type initializer for Lock threw an exception error in HTML5 viewer in ASP.NET Core application
type: troubleshooting
page_title: The type initializer for Lock threw an exception error in HTML5 viewer in ASP.NET Core application
slug: the-type-initializer-for-lock-threw-an-exception
position: 
tags: lock,html5,viewer,core
ticketid: 1149503
res_type: kb
---

## Environment
<table>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting</td>
	</tr>
	<tr>
		<td>Project Type</td>
		<td>.NET Core</td>
	</tr>
</table>

## Important note
The following article is applicable to Telerik Reporting versions prior to R1 2019. It elaborates on how to host Telerik Reporting REST Service and add HTML5 Report Viewer in an ASP.NET Core 2 web application.

As of [Telerik Reporting R1 2019](https://www.telerik.com/support/whats-new/reporting/release-history/progress-telerik-reporting-r1-2019-13-0-19-116) we support report rendering runtime targeting .NET Core 2.1+ applications. For more information how to use reports in a .NET Core application for Windows and Linux platforms, please refer to [.NET Core Support](https://docs.telerik.com/reporting/use-reports-in-net-core-apps) help article.

## Description
When using HTML5 report viewer to display reports in .NET Core application an error is displayed in the viewer: "Error registering the viewer with the service. An error has occurred. The type initializer for 'Lock' threw an exception."

## Solution
Such errors occur when Telerik Reporting NuGet packages we provide for .NET Core projects are not compatible with the project. The packages are built against the full .NET Framework because the Reporting engine relies on the GDI+ API. Therefore, the packages will not work in the project that targets .NET Core framework as GDI+ is missing there.

If you wish to use the packages in .NET Core project use the following steps for creating the project:

1. In the New Project dialog, expand Installed > Visual C# > .NET Core, and select ASP.NET Core Web Application project template. Choose a name for the project and click OK.
2. On the New ASP.NET Core Web Application dialog select from the drop downs **.NET Framework** and ASP.NET Core 2. Next from the list of templates select Web API.

It is important to select .NET Framework from the drop down on the second step as this will set full .NET framework as the target framework of the project.

If the above requirement cannot be met you can add just HTML5 Viewer in the project as it does not require any NuGet packages. Reporting REST service can be hosted separately in a project that targets full .NET framework. HTML5 Viewer will only need the address of the service set as its **serviceUrl** option.

When the service and the viewer are hosted in different domains it will be required to [enable CORS](https://docs.microsoft.com/en-us/aspnet/web-api/overview/security/enabling-cross-origin-requests-in-web-api) in order to enable communication between the viewer and the service.

### See Also

[HTML5 Report Viewer in ASP.NET Core 2](../html5-report-viewer-asp-net-core-2)

[How To: Add Telerik Reporting REST Web API to Web Application](../telerik-reporting-rest-host-http-service-using-web-hosting)

