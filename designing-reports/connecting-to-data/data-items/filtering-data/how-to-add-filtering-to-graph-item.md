---
title: Filtering the Graph
page_title:  Filtering the Graph Item At a Glance
description: "Learn how to add filtering to the Graph item with the Report Designers or dynamically with custom code."
slug: telerikreporting/designing-reports/connecting-to-data/data-items/filtering-data/how-to-add-filtering-to-graph-item
tags: how,to,add,filtering,to,graph,item,designer,programatically,code,report
published: True
position: 4
previous_url: /data-items-how-to-add-filtering-to-chart-item
reportingArea: General
---

# Adding Filtering to Graph Item

This topic illustrates how to add filters to a Graph item's Filters using the Report Designer or Report API, where the filtering occurs after data is retrieved by the report.

If you need to filter data on retrieval, see [Using Parameters with Data Source objects]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/using-parameters-with-data-source-objects%})

## Adding filters to Graph using Report Designer

1. Open a report in __Design__ view.
1. Left-click a __Graph__ item to select it.
1. Click __Filters__ ellipsis in the property grid. This displays the current list of filters. By default, the list is empty.
1. Click __New__. A new blank filter equation appears.
1. In __Expression__, type or select the expression for the field to filter. To open the __Edit Expression__ Dialog, select the `<Expression>` option.
1. In the __Operator__ box, select the operator that you want the filter to use to compare the values in the Expression box and the Value box.
1. In the __Value__ box, type the expression or value against which you want the filter to evaluate the value in Expression.
1. Click __OK__.

## Adding filters to Graph programatically

{{source=CodeSnippets\CS\API\Telerik\Reporting\GraphSnippets.cs region=AddNewFilterSnippet}}
{{source=CodeSnippets\VB\API\Telerik\Reporting\GraphSnippets.vb region=AddNewFilterSnippet}}

> The Graph item has a complex [structure]({%slug telerikreporting/designing-reports/report-structure/graph/structure%}) built by CategoryGroups and SeriesGroups collections, where each collection has its own Filters. If you need to limit slots, filter the CategoryGroups collection. If you need to filter dynamically created series, filter the SeriesGroups collection. The [Group Explorer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/group-explorer%}) can be used for checking the Graph item's Series and Categories groups.

## See Also

* [Graph](/api/telerik.reporting.graph)
* [Filter](/api/Telerik.Reporting.Filter)
* [FilterCollection](/api/Telerik.Reporting.FilterCollection)
* [Using Expressions]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/using-expressions/overview%})
