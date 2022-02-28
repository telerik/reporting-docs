---
title: Table, List, and Crosstab Items Reports Are Not Displayed in HTML5 Report Viewer (IE)
page_title: Table, List, and Crosstab Items Reports Are Not Displayed in HTML5 Report Viewer (IE)
description: "Learn how to fix the issue if a table, list, or crosstab items reports are not visualized by the Telerik Reporting HTML5 ReportViewer in Internet Explorer."
slug: table-list-crosstab-reports-not-displayed-ie
tags: telerik, reporting, troubleshoot, html5, reportviewer, denied, access, to, path, error, occurs
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
			<td>HTML5-Based</td>
		</tr>
	</tbody>
</table>

## Description

The HTML5 Report Viewer does not display a report that uses `Table`, `List`, or `Crosstab` items in Internet Explorer.

## Cause

If the data that is visualized by the [`Table`, `List`, or `Crosstab` item]({%slug telerikreporting/designing-reports/report-structure/table-crosstab-list/overview%}) results in a great number of HTML elements, Internet Explorer may fail to visualize the content.

## Solution  

To solve this issue, refer to the solutions suggested in the article on [designing considerations for HTML rendering (browsers limitations)]({%slug telerikreporting/designing-reports/rendering-and-paging/design-considerations-for-report-rendering/html-rendering-design-considerations%}).
