---
title: Page Level Summary for Table Groups Data
description: "Learn how to Display summary per page for table groups in the page section of Telerik Reporting reports."
type: how-to
page_title: Page Aggregates for Table Groups
slug: page-level-summary-for-table-groups
position: 
tags: 
ticketid: 1544305
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

The requirement is to display a summary per page in a Page section for the data displayed in [Table Groups]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/grouping-data/how-to-add-groups-to-table-item-and-crosstab-item%}). For example, the number and count of the pages taken by the Table Group.

## Suggested Workarounds

The [scope]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/expression-scope-%}) that may be provided in the _PageExec_ and other [Page Functions]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/functions/page-functions%}) should be linked to a report item, for example, a TextBox. The Table Groups are not directly related to report items and that's why the page aggregates cannot be based on the Table Group scope. That said, you cannot provide the name of the Table Group as a scope for a [Page Function]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/functions/page-functions%}). There are two approaches to work around this limitation.

1. You may replace the Table Groups with [Report Groups]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/grouping-data/how-to-add-groups-to-report%}). The Report groups are associated with a dedicated report item. For example, you may place the table in the Report Group Header section, and [Bind]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/using-expressions/bindings%}) its DataSource to the parent's DataSource, that would be the group data. The table will display the entire group data in the Table once. You may use the Report Group name in the _scope_ of the Page Functions. Note that in the detail section of the group you may still display Group data. If this is not necessary, you may set its _Visible_ property to _False_. A sample based on this approch may be found in the [`PageAggregateFromTableWithReportGroup.trdp`](https://github.com/telerik/reporting-docs/blob/master/knowledge-base/resources/PageAggregateFromTableWithReportGroup.trdp) demo report.

1. The second approach is to keep the Table Grouping and introduce a Parent group to it. It needs to be grouped by the same [Expression]({% slug telerikreporting/designing-reports/connecting-to-data/expressions/overview %}) (e.g. field) as the original group. This parent group will generate a new report item that spans the entire group. You may use this new item's name in the _scope_ of the Page Functions. You may delete the content of this item and make it very small. It should be visible in order for the Expression to consider it though. A sample based on this approch may be found in the [`PageAggregateFromTableWithParentTableGroup.trdp`](https://github.com/telerik/reporting-docs/blob/master/knowledge-base/resources/PageAggregateFromTableWithParentTableGroup.trdp) demo report.

## See Also

* [Table Groups]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/grouping-data/how-to-add-groups-to-table-item-and-crosstab-item%})
* [Page Functions]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/functions/page-functions%})
* [Report Groups]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/grouping-data/how-to-add-groups-to-report%})
* [Expression Scope]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/expression-scope-%})
* [Demo Report `PageAggregateFromTableWithReportGroup.trdp`](https://github.com/telerik/reporting-docs/blob/master/knowledge-base/resources/PageAggregateFromTableWithReportGroup.trdp)
* [Demo Report `PageAggregateFromTableWithParentTableGroup.trdp`](https://github.com/telerik/reporting-docs/blob/master/knowledge-base/resources/PageAggregateFromTableWithParentTableGroup.trdp)
