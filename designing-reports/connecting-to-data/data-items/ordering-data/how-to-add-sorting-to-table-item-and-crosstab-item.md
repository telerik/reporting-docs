---
title: Sorting Tables
page_title: Adding sorting to Table and Crosstab items and groups
description: "Learn How to Add sorting to Table and Crosstab items and their groups with the Report Designer and programatically."
slug: telerikreporting/designing-reports/connecting-to-data/data-items/ordering-data/how-to-add-sorting-to-table-item-and-crosstab-item
tags: how,to,add,sorting,to,table,item,and,crosstab,item
published: True
position: 2
previous_url: /data-items-how-to-add-sorting-to-table-item-and-crosstab-item
reportingArea: General
---

# Add Sorting to Table and Crosstab Items

To define a sorting for the __Table__ or __Crosstab__ items use the following steps:

## Adding sorting to Table/Crosstab data item using Report Designer

1. In the [Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/visual-studio-report-designer/overview%}).
1. Click the Sorting ellipsis.
1. For each sort expression, follow these steps:

	1. Click New.
	1. Type or select an expression by which to sort the data.
	1. From the Direction column drop-down list, choose the sort direction for each expression. ASC sorts the expression in ascending order. DESC sorts the expression in descending order.

1. Click OK.

## Adding sorting to Table/Crosstab Group (Row/Column Group) using Report Designer

1. Open the [Group Explorer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/group-explorer%}).
1. In the [Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/visual-studio-report-designer/overview%}), select the Table/Crosstab. This makes the selected item active in the [Group Explorer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/group-explorer%}).
1. Choose a Row/Column Group and click its Sorting ellipsis.
1. For each sort expression, follow these steps:

	1. Click New.
	1. Type or select an expression by which to sort the data.
	1. From the Direction column drop-down list, choose the sort direction for each expression. ASC sorts the expression in ascending order. DESC sorts the expression in descending order.

1. Click OK.

## Adding sorting to Table/Crosstab data item programatically

{{source=CodeSnippets\CS\API\Telerik\Reporting\TableSnippets.cs region=AddNewSortSnippet}}
{{source=CodeSnippets\VB\API\Telerik\Reporting\TableSnippets.vb region=AddNewSortSnippet}}

## See Also

* [Table](/api/Telerik.Reporting.Table)
* [Sorting](/api/Telerik.Reporting.Sorting)
* [SortingCollection](/api/Telerik.Reporting.SortingCollection)
* [How to Add groups to Table item and Crosstab item]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/grouping-data/how-to-add-groups-to-table-item-and-crosstab-item%})
