---
title: XAML Resources-Related Errors Occur after Upgrading Silverlight Applications
page_title: XAML Resources-Related Errors Occur after Upgrading Silverlight Applications
description: "Learn how to handle the errors related to XAML resources after upgrading a Silverlight application."
slug: silverlight-viewer-xaml-resources-error-after-upgrade
tags: telerik, reporting, troubleshoot, silverlight, reportviewer, xaml, resources, errors, occur, after, upgrade, applications, apps
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

XAML resources-related errors occur after upgrading an application that uses the Silverlight ReportViewer.


## Error Message

The error messages are similar to `The name "XYZControl" does not exist in the namespace "clr-namespace:Telerik.XXXX;assembly=Telerik.XXXX". [path]\Themes\[theme_name]\Telerik.XXXX.xaml`.

## Cause

The possible causes are the following:

* As of Telerik Reporting Q1 2014, the Silverlight ReportViewer uses implicit styles. Therefore, when the `Telerik.ReportViewer.Silverlight.xaml` template file is not loaded correctly, the viewer is not displayed.

* Error messages may occur if the additionally required XAML files are not loaded or are not of a version synchronized with Telerik Reporting.

## Solution  

Double-check if the XAML resources are loaded in the application and [if the dependencies between Telerik Reporting and Telerik UI for Silverlight are considered]({%slug telerikreporting/upgrade/overview%}). For more details about the settings required by the Silverlight ReportViewer, refer to the article on [adding the report viewer to a Silverlight application]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/silverlight-application/how-to-add-report-viewer-to-a-silverlight-application%}).

Note that the [Telerik Reporting Upgrade Wizard]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/visual-studio-report-designer/upgrade-wizard%}) will update only references to the Telerik Reporting assemblies and configuration settings. You will have to manually update the related  `Telerik.ReportViewer.Silverlight.xaml` files, and the Telerik UI for Silverlight XAML files distributed by Telerik Reporting. The manual update includes the Telerik UI for Silverlight assemblies distributed by Telerik Reporting. If you use Telerik UI for Silverlight as a separate product, run the [Telerik UI for Silverlight Upgrade Wizard](http://docs.telerik.com/devtools/silverlight/visual-studio-extensions/for-silverlight-vs-extensions-upgrading) which will automatically update the Telerik UI for Silverlight assembly references and XAML resources.
