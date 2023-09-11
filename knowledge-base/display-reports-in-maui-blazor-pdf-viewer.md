---
title: Display Telerik Reports in the Telerik Blazor PDF Viewer in a Hybrid .NET MAUI Blazor Application
description: "Learn how you may render a Telerik report in PDF and display it in a Telerik Blazor PDF Viewer hosted in a .NET MAUI Blazor Application."
type: how-to
page_title: Render Telerik Reports and Show Them in Telerik Blazor PDF Viewer in .NET MAUI
slug: display-reports-in-maui-blazor-pdf-viewer
tags: maui,blazor,telerik,report,viewer,pdf
ticketid: 1619041
res_type: kb
---

## Environment

<table>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting</td>
	</tr>
</table>


## Description

The Telerik Reporting engine requires GDI+ (the [System.Drawing](https://learn.microsoft.com/en-us/dotnet/api/system.drawing?view=net-7.0) functionality) that is not available for Android and for non-Windows applications built with .NET 7. For that reason, the Telerik Reports cannot be rendered within a .NET MAUI project. However, the PDF report documents generated with Telerik Reporting may be previewed in the [Telerik UI for Blazor PDF Viewer](https://docs.telerik.com/blazor-ui/components/pdfviewer/overview). The document generated in a Reporting service may be passed to the PDF Viewer through Web requests.

