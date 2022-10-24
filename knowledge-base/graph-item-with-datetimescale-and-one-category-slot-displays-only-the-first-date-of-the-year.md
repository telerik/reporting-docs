---
title: Graph Item with DateTimeScale and One Category Slot Displays Only the First Date of the Year
description: Graph item with DateTimeScale and one category slot is rendered with only the first date of the year.
type: how-to
page_title: The Graph item displays only the first date of the year when DateTimeScale and one category slot.
slug: graph-item-with-datetimescale-and-one-category-slot-displays-only-the-first-date-of-the-year
res_type: kb
---

## Environment

<table>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting</td>
	</tr>
  	<tr>
		<td>Report Items</td>
		<td>Graph</td>
	</tr>
</table>

## Description

Тhe Graph item with `DateTimeScale` and one category slot displays only the first date of the year. 

The [DateTime](/reporting/api/telerik.reporting.datetimescale) scale is designed to work with a date range and it needs at least two dates in order to determine the minimum and maximum range values, and then - the used [BaseUnit](/reporting/api/telerik.reporting.datetimescale#Telerik_Reporting_DateTimeScale_BaseUnit). When the data doesn't supply such a range, the algorithm sets the [BaseUnit](/reporting/api/telerik.reporting.datetimescale#Telerik_Reporting_DateTimeScale_BaseUnit) to [Years](/reporting/api/telerik.reporting.datetimescaleunits) and falls back to the first date of the current year. That's why you will get a date like *2016-01-01*, if you change the `BaseUnit` to `Auto` 

## Solution 

Set the `Minimum` and `Maximum` of the scale dynamically using [Bindings]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/using-expressions/bindings%}) and the approach from the KB article [Use Bindings to Control the Coordinate System Properties in the Graph]({%slug telerikreporting/designing-reports/report-structure/graph/how-to/how-to-use-bindings-to-control-the-coordinate-system-properties%}).
