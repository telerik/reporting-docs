---
title: XAML Resources-Related Errors Occur on Building Silverlight Applications
page_title: XAML Resources-Related Errors Occur on Building Silverlight Applications
description: "Learn how to handle the errors related to XAML resources when building a Silverlight application."
slug: silverlight-viewer-xaml-resources-error-on-building
tags: telerik, reporting, troubleshoot, silverlight, reportviewer, xaml, resources, errors, occur, on, building, applications, apps
published: True
type: troubleshooting
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
			<td>Version</td>
			<td>Q2 2012 and newer</td>
		</tr>
	        <tr>
			<td>Report Viewers</td>
			<td>WinForms, WPF, ASP.NET</td>
		</tr>
	</tbody>
</table>

## Description

XAML resources-related errors occur on building an application that uses the Silverlight ReportViewer.

## Error Message

The error messages are similar to `The name "XYZControl" does not exist in the namespace "clr-namespace:Telerik.XXXX;assembly=Telerik.XXXX". [path]\Themes\[theme_name]\Telerik.XXXX.xaml`.

## Cause

The possible causes are the following:

* As of Telerik Reporting Q1 2014, the Silverlight ReportViewer uses implicit styles. Therefore, when the `Telerik.ReportViewer.Silverlight.xaml` template file is not loaded correctly, the viewer is not displayed.

* Error messages may occur if the additionally required XAML files are not loaded or are not of a version synchronized with Telerik Reporting.

## Solution  

Double-check if the XAML resources are loaded in the application and [if the dependencies between Telerik Reporting and Telerik UI for Silverlight are considered]({%slug telerikreporting/upgrade/overview%}). For more details about the settings required by the Silverlight ReportViewer, refer to the article on [adding the report viewer to a Silverlight application]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/silverlight-application/how-to-add-report-viewer-to-a-silverlight-application%}).
