---
title: The WPF Application Cannot Be Built Error Occurs
page_title: The WPF Application Cannot Be Built Error Occurs
description: "Learn how to handle the issue if the WPF application cannot be built when working with the WPF ReportViewer."
slug: wpf-app-cannot-be-built
tags: telerik, reporting, troubleshoot, wpf, reportviewer, application, cannot, be, built
published: True
res_type: kb
type: troubleshooting
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
			<td>Q2 2012 and later</td>
		</tr>
	        <tr>
			<td>Report Viewers</td>
			<td>WinForms, WPF, ASP.NET</td>
		</tr>
	</tbody>
</table>

## Description

An error that the WPF application cannot be built occurs.

## Error Message

`The name "XYZControl" does not exist in the namespace "clr-namespace:Telerik.XXXX;assembly=Telerik.XXXX". [path]\Themes\[theme_name]\Telerik.XXXX.xaml.`

## Cause

The possible causes for the error are the following:

* This error message may appear after upgrading to a later Telerik Reporting version.

* As of Telerik Reporting Q1 2014, the WPF ReportViewer uses implicit styles. Therefore, the error may also occur if the styles that are applied to the WPF ReportViewer are not implicit.

* The `Telerik.ReportViewer.Wpf.xaml` template file may not be loaded correctly and the viewer is not displayed.

* The additionally required XAML files may not be loaded or may not be of a version synchronized with Telerik Reporting.

## Solution  

To solve this issue, double-check if the XAML resources are loaded in the application and [if the dependencies between Telerik Reporting and Telerik UI for WPF are considered]({%slug telerikreporting/upgrade/overview%}). For more information about the settings required by the WPF ReportViewer, refer to the article on the [manual setup of the WPF ReportViewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/wpf-application/how-to-add--manually-report-viewer-to-a-wpf-.net-framework-project%}).         

Note that the [Telerik Reporting Upgrade Wizard]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/visual-studio-report-designer/upgrade-wizard%}) will update only references to Telerik Reporting assemblies and configuration settings. You will have to manually update the related  `Telerik.ReportViewer.Wpf.xaml` files, and Telerik UI for WPF XAML files distributed by Telerik Reporting. The manual update includes the Telerik UI for WPF assemblies distributed by Telerik Reporting. If you use Telerik UI for WPF as a separate product, run the [Telerik UI for WPF Upgrade Wizard](http://docs.telerik.com/devtools/wpf/visual-studio-extensions/for-wpf-vs-extensions-upgrading)  which will automatically update the Telerik UI for WPF assembly references and XAML resources.
