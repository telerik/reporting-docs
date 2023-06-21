---
title: Could Not Load File or Assembly Telerik.Blazor
description: "Learn why the exception 'Could not load file or assembly Telerik.Blazor' may occur in the Native Blazor Viewer."
type: troubleshooting
page_title: The system cannot find the file specified Telerik.Blazor
slug: could-not-load-file-assembly-telerik-blazor
tags: Blazor
res_type: kb
---

## Environment

<table>
	<tbody>
		<tr>
			<td>Product Version</td>
			<td>17.1.23.606</td>
		</tr>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
		</tr>
		<tr>
			<td>Report Viewer</td>
			<td>Native Blazor Report Viewer</td>
		</tr>
	</tbody>
</table>


## Description

Upon installing the `Telerik.ReportViewer.BlazorNative` package and following the [Integrating Native Blazor Viewer in Blazor Server or WebAssembly App]({%slug telerikreporting/embedding-reports/display-reports-in-applications/web-application/native-blazor-report-viewer/how-to-use-native-blazor-report-viewer%}) article, I am met with the below error when I start the project.

## Error Message

`FileNotFoundException: Could not load file or assembly 'Telerik.Blazor, Version=4.1.0.0, Culture=neutral, PublicKeyToken=29ac1a93ec063d92'. The system cannot find the file specified.`

## Cause

The `Telerik.ReportViewer.BlazorNative` NuGet package of the [Telerik Reporting 17.1.23.606](https://www.telerik.com/support/whats-new/reporting/release-history/progress-telerik-reporting-r2-2023-17-1-23-606) release has a dependency on the `Telerik.UI.for.Blazor(4.0.1)` package but is actually built and expected to work with version `4.1.0+` of the Telerik UI for Blazor package.

## Solution

Install the `Telerik.UI.for.Blazor` NuGet package with version `4.1.0+` in the project with the report viewer, and it should override the default version that the `Telerik.ReportViewer.BlazorNative` package uses.
