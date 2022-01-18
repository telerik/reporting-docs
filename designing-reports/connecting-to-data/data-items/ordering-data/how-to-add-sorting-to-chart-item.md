---
title: How to Add sorting to Chart item
page_title: How to Add sorting to Chart item | for Telerik Reporting Documentation
description: How to Add sorting to Chart item
slug: telerikreporting/designing-reports/connecting-to-data/data-items/ordering-data/how-to-add-sorting-to-chart-item
tags: how,to,add,sorting,to,chart,item
published: False
position: 3
---

# How to Add sorting to Chart item



In the Chart item the sorting is performed at data item level and sets       the order of appearance of the detail rows.

## Adding sorting to Table/Crosstab data item using Report Designer

1. In the[Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/visual-studio-report-designer/overview%})

1. Click the Sorting ellipsis.

1. 

For each sort expression, follow these steps:                      

1. Click New.

1. Type or select an expression by which to sort the data.

1. From the Direction column drop-down list, choose the sort direction                 for each expression. ASC sorts the expression in ascending order. DESC sorts                 the expression in descending order.

1. Click OK.

## Adding sorting to Chart data item programatically

{{source=CodeSnippets\CS\API\Telerik\Reporting\ChartSnippets.cs region=AddNewSortSnippet}}
````C#
Telerik.Reporting.Sorting sorting1 = new Telerik.Reporting.Sorting();
sorting1.Expression = "=Fields.ProductID";
sorting1.Direction = Telerik.Reporting.SortDirection.Asc;

chart1.Sortings.Add(sorting1);
````
{{source=CodeSnippets\VB\API\Telerik\Reporting\ChartSnippets.vb region=AddNewSortSnippet}}
````VB
Dim sorting1 As New Telerik.Reporting.Sorting()
sorting1.Expression = "=Fields.ProductID"
sorting1.Direction = Telerik.Reporting.SortDirection.Asc

chart1.Sortings.Add(sorting1)
````


# See Also
 

* [Chart](/reporting/api/Telerik.Reporting.Chart)  

* [Sorting](/reporting/api/Telerik.Reporting.Sorting)  

* [SortingCollection](/reporting/api/Telerik.Reporting.SortingCollection)

