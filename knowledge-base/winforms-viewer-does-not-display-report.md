---
title: WinForms ReportViewer Reports Are Not Displayed
page_title: WinForms ReportViewer Reports Are Not Displayed
description: "Learn how to render reports if the WinForms ReportViewer does not display them."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/windows-forms-application/troubleshooting/winforms-reportviewer-troubleshooting
tags: telerik, reporting, winforms, report, viewer, doesn't, display, reports
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
			<td>Q2 2012 and later</td>
		</tr>
	        <tr>
			<td>Report Viewers</td>
			<td>WinForms</td>
		</tr>
	</tbody>
</table>

## Description

The WinForms Report Viewer does not display the report.

## Cause

The WinForms ReportViewer requires you to call its `RefreshReport` method after setting the `ReportSource` property.

## Solution  

To solve this issue, refer to [Assign report to the viewer programatically]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/windows-forms-application/how-to-add-manually-report-viewer-to-a-windows-forms'-.net-framework-project%}) article.
