---
title: Sorting Report
page_title: Adding Sorting to Report Item
description: "Learn how to add sorting to Telerik Reports and Report Groups with the Report Designers and programatically."
slug: telerikreporting/designing-reports/connecting-to-data/data-items/ordering-data/how-to-add-sorting-to-report
tags: how,to,add,sorting,to,report
published: True
position: 1
previous_url: /data-items-how-to-add-sorting-to-report-item
reportingArea: General
---

# Adding Sortings to Report

1. Click the Report selector button located in the upper left hand of the[Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/visual-studio-report-designer/overview%})
1. Click the Sorting ellipsis.
1. For each sort expression, follow these steps:

	1. Click New.
	1. Type or select an expression by which to sort the data.
	1. From the Direction column drop-down list, choose the sort direction for each expression. ASC sorts the expression in ascending order. DESC sorts the expression in descending order.

1. Click OK.

## Adding sorting to Report Group using Report Designer

1. Open the[Group Explorer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/group-explorer%})
1. Click the Report selector button located in the upper left corner of the[Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/visual-studio-report-designer/overview%}). This makes the report active in the[Group Explorer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/group-explorer%})
1. Choose a Report Group and click its Sorting ellipsis.
1. For each sort expression, follow these steps:

	1. Click New.
	1. Type or select an expression by which to sort the data.
	1. From the Direction column drop-down list, choose the sort direction for each expression. ASC sorts the expression in ascending order. DESC sorts the expression in descending order.

1. Click OK.

## Adding sorting to Report programatically

{{source=CodeSnippets\CS\API\Telerik\Reporting\ReportSnippets.cs region=AddNewSortSnippet}}
{{source=CodeSnippets\VB\API\Telerik\Reporting\ReportSnippets.vb region=AddNewSortSnippet}}

## See Also

* [Report](/api/Telerik.Reporting.Report)
* [Sorting](/api/Telerik.Reporting.Sorting)
* [SortingCollection](/api/Telerik.Reporting.SortingCollection)
* [How to Add groups to Report]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/grouping-data/how-to-add-groups-to-report%})
