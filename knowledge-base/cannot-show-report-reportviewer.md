---
title: Cannot Show Reports in the ReportViewer
page_title: Unable to Show Reports in the ReportViewer
description: "Learn how to programmatically specify a report in a separate class library in the Telerik ReportViewer."
slug: cannot-show-report-reportviewer
previous_url: /troubleshooting/design-time
tags: telerik, reporting, design, time, cannot, show, report, reportviewer
published: True
component: reportviewer
type: troubleshooting
res_type: kb
---

## Environment

<table>
	<tbody>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
			<td>Progress® Telerik® ReportViewer</td>
		</tr>
		<tr>
			<td>Version</td>
			<td>Q2 2012 and later</td>
		</tr>
		<tr>
			<td>Report Viewers</td>
			<td>Legacy ASP.NET WebForms Viewer</td>
		</tr>
	</tbody>
</table>

## Description

>The described scenario and suggested solution relate to the legacy ASP.NET WebForms ReportViewer. It is recommended that you migrate to the [HTML5 ReportViewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-asp.net-web-forms-report-viewer/overview%}).

I want to show my report in a ReportViewer control, but when I click the arrow in the **ReportSource** property from the property grid, it does not show available reports. What is wrong?

## Cause

....

## Solution  

Follow the Telerik Reporting [best practices]({%slug on-telerik-reporting%}) and specify the report in a separate class library that is referenced in the application or website. Check if the class library containing the report is referenced in your application or website and that you have rebuilt the project.

The most reliable way to handle this scenario is to programmatically specify a report for the ReportViewer. For example, if you're using the ASP.NET ReportViewer, state the following in the `Page_Load` event of the page:         

{{source=CodeSnippets\CS\API\Telerik\ReportViewer\WebForms\WebForm1.aspx.cs region=Webviewer_SetReportSource}}
{{source=CodeSnippets\VB\API\Telerik\ReportViewer\WebForms\WebForm1.aspx.vb region=Webviewer_SetReportSource}}


