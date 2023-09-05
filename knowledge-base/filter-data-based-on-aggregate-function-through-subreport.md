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

want to show all groups and a different table in each group:
	case 1 - only for those with type='new' and more than 3 records to show.
	case 2 - only for those with type='new' and 2 records to show.
	case 3 - only for those with type='new' and 1 record to show.

## Solution

Filtering for type='new' is possible, however, it is not possible to filter on the count of the filtered items unless you use custom aggregate.

Report with groups for the grouping, and subreport in the group header/footer.
	SubReport DataSource bound to ReportItem.DataObject.
	subreport with Filter for type='new'
	3 tables in the subreport Report Header/Footer - for each case. For each table:
		NoDataMessage set
		NoDataStyle > Visible = False
		DataSource bound to Expression:
			case 1 - = If(CountDistinct(Fields.Name) >= 3, ReportItem.DataObject, Null)
			case 2 - = If(CountDistinct(Fields.Name) = 2, ReportItem.DataObject, Null)
			case 3 - = If(CountDistinct(Fields.Name) = 1, ReportItem.DataObject, Null)

## Example

Download the sample main report and subreport from our Reporting Samples GitHub repository: [FilteringWithSubReport](https://github.com/telerik/reporting-samples/tree/master/FilteringWithSubReport)

## See Also

* [Data Items]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/overview%})
* [Filtering Data]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/filtering-data/overview%})
* [Adding Filtering to Table and Crosstab Items]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/filtering-data/how-to-add-filtering-to-table-item-and-crosstab-item%})
* [Adding Filtering to Report]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/filtering-data/how-to-add-filtering-to-report%})
* [SubReport Item]({%slug telerikreporting/designing-reports/report-structure/subreport%})
