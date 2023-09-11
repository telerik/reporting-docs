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

The Telerik Reporting engine requires GDI+ (the System.Drawing functionality) that is not available for Android and for non-Windows applications built with .NET 7. For that reason, the Telerik Reports cannot be rendered with MAUI.
