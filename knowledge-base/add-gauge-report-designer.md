---
title: Add a Dynamic Gauge in the Telerik Report Designer
page_title: Add a Gauge in Telerik Report Designer
description: "Learn how to add a Gauge to a report with the Telerik Report Designer."
type: how-to
slug: add-dynamic-gauge-report-designer
tags: telerik, reporting, add, dynamic, gauge, in, report, designer
ticketid: 1473889
res_type: kb
---

## Environment
<table>
	<tbody>
		<tr>
			<td>Product Version</td>
			<td>All</td>
		</tr>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
		</tr>
	</tbody>
</table>

## Description

I need to add a dynamic gauge that represents a specific value to my report.

## Solution

By design, the Telerik Report Designer does not provide a built-in Gauge control. However, as a workaround, you can use an image instead.

Alternatively, you can use another tool to render the gauge with the desired value. The following steps demonstrate how to add the [Gauge for ASP.NET AJAX](https://demos.telerik.com/aspnet-ajax/gauge/examples/overview/defaultcs.aspx):

1. Render the desired value in a gauge tool of your choice.

1. Capture or export the image.

1. Use the [PictureBox]({% slug telerikreporting/designing-reports/report-structure/picturebox %}) item to display the image in your report.
