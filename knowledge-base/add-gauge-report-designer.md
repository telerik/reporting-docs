---
title: Add a Dynamic Gauge in the Telerik Report Designer
page_title: Add a Gauge in Telerik Report Designer
description: "Learn how to add a Gauge item to a report with the Report Designer in Telerik Reporting before and after version R2 2023 (17.1.23.606)."
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
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
		</tr>
		<tr>
			<td>Product Version</td>
			<td>R1 2023 SP1 (17.0.23.315) and older</td>
		</tr>
	</tbody>
</table>

> With [R2 2023 (17.1.23.606)](https://www.telerik.com/support/whats-new/reporting/release-history/progress-telerik-reporting-r2-2023-17-1-23-606) we introduced the [Gauge report item]({%slug telerikreporting/designing-reports/report-structure/gauge/overview%}).

## Description

I need to add a dynamic gauge that represents a specific value to my report.

## Solution

### After R2 2023 (17.1.23.606)

Use the built-in [Gauge report item]({%slug telerikreporting/designing-reports/report-structure/gauge/overview%}).

### Before R2 2023 (17.1.23.606)

The Telerik Report Designer did not provide a built-in Gauge control in the older versions. As a workaround, you can use an image instead with these versions.

Alternatively, you can use another tool to render the gauge with the desired value. The following steps demonstrate how to add the [Gauge for ASP.NET AJAX](https://demos.telerik.com/aspnet-ajax/gauge/examples/overview/defaultcs.aspx):

1. Render the desired value in a gauge tool of your choice.
1. Capture or export the image.
1. Use the [PictureBox]({%slug telerikreporting/designing-reports/report-structure/picturebox%}) item to display the image in your report.

## See Also

* [Gauge Overview]({%slug telerikreporting/designing-reports/report-structure/gauge/overview%})
* [Radial Gauge]({%slug telerikreporting/designing-reports/report-structure/gauge/radial-gauge%})
