---
title: Filtering the Report
page_title: Filtering the Report at a Glance
description: "Learn how to add filtering to the Report item with the Report Designers or dynamically with custom code."
slug: telerikreporting/designing-reports/connecting-to-data/data-items/filtering-data/how-to-add-filtering-to-report
tags: how,to,add,filtering,to,report
published: True
position: 2
previous_url: /data-items-how-to-add-filtering-to-report-item
reportingArea: General
---

# Adding Filtering to Report

This topic illustrates how to add filters to the Report's Filters collection using the Report Designer or Report API, where the filtering occurs after data is retrieved by the report.

If you need to filter data on retrieval, see [Using Parameters with Data Source objects]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/using-parameters-with-data-source-objects%})

## Adding filters to Report using Report Designer

To add filters to the Report use the following steps:

1. Open a report in __Design__ view.
1. Click the Report selector button located in the upper left hand of the [Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/visual-studio-report-designer/overview%}). This makes the report active in the Properties window.
1. Click __Filters__ ellipsis in the property grid. This displays the current list of filters. By default, the list is empty.
1. Click __New__. A new blank filter equation appears.
1. In __Expression__, type or select the expression for the field to filter. To open the __Edit Expression__ Dialog, select the `<Expression>` option.
1. In the __Operator__ box, select the operator that you want the filter to use to compare the values in the Expression box and the Value box.
1. In the __Value__ box, type the expression or value against which you want the filter to evaluate the value in Expression.
1. Click __OK__.

## Adding filters to Report programatically

{{source=CodeSnippets\CS\API\Telerik\Reporting\ReportSnippets.cs region=AddNewFilterSnippet}}
{{source=CodeSnippets\VB\API\Telerik\Reporting\ReportSnippets.vb region=AddNewFilterSnippet}}

> The Report can have a complex structure due to added groups. You can filter data per group by using the corresponding group's Filters collection.
>
>The [Group Explorer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/group-explorer%}) can be used for checking the Report's structure and the each group's properties.

## See Also

 * [Report](/api/Telerik.Reporting.Report)
 * [Filter](/api/Telerik.Reporting.Filter)
 * [FilterCollection](/api/Telerik.Reporting.FilterCollection)
 * [Using Expressions]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/using-expressions/overview%})
