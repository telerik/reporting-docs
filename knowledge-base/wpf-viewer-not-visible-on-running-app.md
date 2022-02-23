---
title: The WPF ReportViewer Is Not Visible on Running the Application
page_title: The WPF ReportViewer Is Not Visible on Running the Application
description: "Learn how to display the WPF ReportViewer on running the application."
slug: wpf-viewer-not-visible-on-running-app
tags: telerik, reporting, troubleshoot, wpf, reportviewer, not, displayed, on, running, the, application
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
			<td>WPF</td>
		</tr>
	</tbody>
</table>

## Description

The WPF ReportViewer is not visible on running the application.

## Cause

As of Telerik Reporting Q1 2014, the WPF ReportViewer uses implicit styles. When the `Telerik.ReportViewer.Wpf.xaml` template file is not loaded correctly, the viewer is not displayed.

>For other possible causes, refer to the article on [missing controls in the WPF UI](https://docs.telerik.com/devtools/wpf/common-information/troubleshooting/invisible-controls).

## Solution  

Double-check if the XAML resources are loaded in the application. For more details about the required WPF ReportViewer settings, refer to the article on the [manual setup of the viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/wpf-application/how-to-add--manually-report-viewer-to-a-wpf-.net-framework-project%}).
