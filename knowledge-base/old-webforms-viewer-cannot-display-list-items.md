---
title: The Old ASP.NET Webforms ReportViewer Cannot Display Table, List, or Crosstab Item Reports (IE)
page_title: The Old ASP.NET Webforms ReportViewer Cannot Display Table, List, or Crosstab Item Reports (IE)
description: "Learn how to handle the situation when the old ASP.NET Webforms ReportViewer does not display reports holding Table, List, or Crosstab items."
slug: old-webforms-viewer-cannot-display-list-items
tags: telerik, reporting, troubleshoot, asp, net, webforms, old, reportviewer, doesn't, display, list, table, crosstab, item, report
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

The old ASP.NET Webforms ReportViewer does not display a report that uses `Table`, `List`, or `Crosstab` items in Internet Explorer.

## Cause

If the data visualized by the [`Table`, `List`, or `Crosstab` item]({%slug telerikreporting/designing-reports/report-structure/table-crosstab-list/overview%}) results in a great number of HTML elements, Internet Explorer may fail to visualize the content of the report.  

## Solution  

To solve this issue, refer to the solutions suggested in the [Design Considerations for HTML Rendering (Browsers Limitations)]({%slug telerikreporting/designing-reports/rendering-and-paging/design-considerations-for-report-rendering/html-rendering-design-considerations%}) article.         
