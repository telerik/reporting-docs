---
title: How to Add a Dynamic Gauge in Telerik Report Designer
description: Add a Gauge to a Report with Telerik Report Designer
type: how-to
page_title: Add a Gauge in Telerik Report Designer
slug: add-dynamic-gauge-report-designer
position: 
tags: 
ticketid: 1473889
res_type: kb
---

## Environment
<table>
	<tbody>
		<tr>
			<td>Product Version</td>
			<td>all</td>
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
Telerik Report Designer does not have a built-in Gauge control. You can add an image instead.   

## Suggested Workaround
As a workaround, you can use another tool to render the gauge with the desired value, for example, [RadGauge for ASP.NET AJAX](https://demos.telerik.com/aspnet-ajax/gauge/examples/overview/defaultcs.aspx).
The following steps represent one possible approach:

1. Render the desired value in a gauge tool of your choice. 

1. Capture or export the image.

1. Use the [PictureBox](https://docs.telerik.com/reporting/report-items-picture-box) item to display the image in your report.
