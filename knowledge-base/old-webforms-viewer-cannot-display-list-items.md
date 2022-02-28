---
title: The Old ASP.NET Webforms ReportViewer Cannot Display Table, List, or Crosstab Item Reports (IE)
page_title: The Old ASP.NET Webforms ReportViewer Cannot Display Table, List, or Crosstab Item Reports (IE)
description: "Learn how to handle the situation when the old ASP.NET Webforms ReportViewer does not display reports holding Table, List, or Crosstab items."
slug: old-webforms-viewer-cannot-display-list-items
tags: telerik, reporting, troubleshoot, asp, net, webforms, old, reportviewer, doesn't, display, list, table, crosstab, item, report
published: False
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
			<td>Legacy ASP.NET WebForms Viewer</td>
		</tr>
	</tbody>
</table>

## Description

>The described scenario and suggested solution relate to the legacy ASP.NET WebForms ReportViewer. It is recommended that you migrate to the [HTML5 ReportViewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-asp.net-web-forms-report-viewer/overview%}).  

The old ASP.NET Webforms ReportViewer does not display a report that uses `Table`, `List`, or `Crosstab` items in Internet Explorer.

## Cause

If the data visualized by the [`Table`, `List`, or `Crosstab` item]({%slug telerikreporting/designing-reports/report-structure/table-crosstab-list/overview%}) results in a great number of HTML elements, Internet Explorer may fail to visualize the content of the report.  

## Solution  

To solve this issue, refer to the solutions suggested in the [Design Considerations for HTML Rendering (Browsers Limitations)]({%slug telerikreporting/designing-reports/rendering-and-paging/design-considerations-for-report-rendering/html-rendering-design-considerations%}) article.         
