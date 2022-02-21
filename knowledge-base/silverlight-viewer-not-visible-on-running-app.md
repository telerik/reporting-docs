---
title: Silverlight ReportViewer Is Not Visible on Running Application
page_title: Silverlight ReportViewer Is Not Visible on Running Application
description: "Learn how to handle the issue if the Silverlight ReportViewer is not visible when the application is run."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/silverlight-application/troubleshooting/silverlight-reportviewer-troubleshooting
previous_url: /using-reports-in-applications/display-reports-in-applications/silverlight-application/troubleshooting/silverlight-reportviewer-troubleshooting.html
tags: telerik, reporting, troubleshoot, silverlight, reportviewer, not, visible, when, running, the, application, app
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

The Silverlight ReportViewer is not visible on running the application.

## Cause

As of Telerik Reporting Q1 2014, the Silverlight ReportViewer uses implicit styles. Therefore, when the `Telerik.ReportViewer.Silverlight.xaml` template file is not loaded correctly, the viewer is not displayed.

## Solution  

To solve the issue, double-check if the XAML resources are loaded in the application. For more details about the settings required by the Silverlight ReportViewer, refer to the article on [adding the report viewer to a Silverlight application]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/silverlight-application/how-to-add-report-viewer-to-a-silverlight-application%}).
