---
title: Filter Data Based on Aggregate Function through SubReport
description: "Learn how you may apply complex filtering to a data item or group through inner subreport and proper data binding."
type: how-to
page_title: Complex Data Filtering Based on Aggregate Function with an Inner SubReport
slug: filter-data-based-on-aggregate-function-through-subreport
tags: filter,subreport,aggregate,function,data,item
ticketid: 1616214
res_type: kb
---

## Environment

<table>
	<tbody>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
		</tr>
	</tbody>
</table>

## Description

Imagine the following scenario.
We want to group a report, and in each group to show a table that is filtered to show only records with a specific field value, for example, set as a [Report Parameter]({%slug telerikreporting/designing-reports/connecting-to-data/report-parameters/overview%}) value. We also want the table to be with a different layout depending on the number of records it will display. Here are the more specific requirements for clarity:

We want to show all groups and a different table in each group:

* Case 1 - only for those with specific `Fields.Type` and more than 3 records to show.
* Case 2 - only for those with specific `Fields.Type` and 2 records to show.
* Case 3 - only for those with specific `Fields.Type` and 1 record to show.

Filtering by the value of the `Fields.Type` is possible, however, it is not possible to filter on the count of the filtered items or another [aggregate function]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/functions/aggregate-functions%}). The latter leads to the error message in the report stating that `DataItem Filtering expression should not contain aggregate functions.`

Aggregates may be used on the group filtering level, however, this will take into account the entire report data and not only the data shown in the group.

## Solution

Let's use a [SubReport]({%slug telerikreporting/designing-reports/report-structure/subreport%}) in the [Report Group Header or Footer]({%slug telerikreporting/designing-reports/report-structure/how-to/how-to-add-remove-report-header---footer-sections%}) instead of a Table. We will bind its DataSource to its parent DataSource, which is the group data. The idea is to apply the filtering on the value of `Fields.Type` in the subreport and pass different DataSource with [Bindings]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/using-expressions/bindings%}) to the Tables that are going to represent each case.

We simulate the filtering with aggregate functions with a Binding for the inner [Data Items']({%slug telerikreporting/designing-reports/connecting-to-data/data-items/overview%}) DataSources.

Here are the steps for implementation

1. Add `SubReport` in the Report Group Header and use Bindings to set its DataSource to `ReportItem.DataObject`. 
1. Create a new report and use it in the ReportSource of the main report. 
1. Add a new `Filter` to the subreport with [Filtering Rule]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/filtering-data/filter-rules%}) to display only particular Types. 
1. Set the subreport Report Header/Footer `CanShrink` to `True` to allow the section to shrink when some of its items are hidden. 
1. Add 3 (three) tables in the subreport Report Header/Footer - one for each case. For each table configure the following properties: 

	* Set `NoDataMessage` to a valid string or whitespace. 
	* Set `NoDataStyle` > `Visible` to `False`. 
	* Bind the `DataSource` of each table to the following Expressions: 

		1. Case 1 `= If(CountDistinct(Fields.Name) >= 3, ReportItem.DataObject, Null)` 
		1. Case 2 `= If(CountDistinct(Fields.Name) = 2, ReportItem.DataObject, Null)` 
		1. Case 3 `= If(CountDistinct(Fields.Name) = 1, ReportItem.DataObject, Null)` 

	* Configure and Style each table as required. 

With the above settings, for any number of names in the corresponding type only one table will have data and will be shown, simulating filtering based on an aggregate of its inner data.

## Example

Download the sample main report and subreport from our Reporting Samples GitHub repository: [FilteringWithSubReport](https://github.com/telerik/reporting-samples/tree/master/FilteringWithSubReport)

## See Also

* [Data Items]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/overview%})
* [Filtering Data]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/filtering-data/overview%})
* [Adding Filtering to Table and Crosstab Items]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/filtering-data/how-to-add-filtering-to-table-item-and-crosstab-item%})
* [Adding Filtering to Report]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/filtering-data/how-to-add-filtering-to-report%})
* [SubReport Item]({%slug telerikreporting/designing-reports/report-structure/subreport%})
