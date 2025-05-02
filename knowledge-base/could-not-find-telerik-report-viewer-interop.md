---
title: Could not find telerikReportViewerInterop.createReportViewerWidget
description: The interop.js file is missing and the report viewer does not show up on the page
type: troubleshooting
page_title: telerikReportViewerInterop was undefined
slug: could-not-find-telerik-report-viewer-interop
position: 
tags: BlazorReportViewer 
res_type: kb
---

## Environment

<table>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting</td>
	</tr>
	<tr>
		<td>Report Viewer</td>
		<td>Blazor Report Viewer</td>
	</tr>
</table>

## Description
The [Blazor Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/overview%}) is not showing up on the page and there are errors in the console.

![Blazor Report Viewer Interop is missing](resources/BlazorInteropNotFound.png)

## Possible Causes

- The **interop.js** dependency of the Blazor viewer is not referenced at the end of the body element of the **Pages/_Host.cshtml (Blazor Server)** or **wwwroot/index.html (Blazor WebAssembly)**;
- The **interop.js** dependency of the Blazor viewer is referenced but with **incorrect casing**. In this case, the Blazor viewer will show up if the project is running on Windows but on Linux, it will throw an error in the console that the interop file is not found;

## Solution

The following is an example of correctly referencing the Blazor viewer's interop.js file and should be the solution for both cases:

````cshtml
<script src="_content/Telerik.ReportViewer.Blazor/interop.js" defer /script>
````

