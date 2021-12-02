---
title: How to Add filtering to Graph item
page_title: How to Add filtering to Graph item | for Telerik Reporting Documentation
description: How to Add filtering to Graph item
slug: telerikreporting/designing-reports/connecting-to-data/data-items/filtering-data/how-to-add-filtering-to-graph-item
tags: how,to,add,filtering,to,graph,item
published: True
position: 4
---

# How to Add filtering to Graph item



This topic illustrates how to add filters to a Graph item's Filters using the Report Designer or Report API,         where the filtering occurs after data is retrieved by the report.       

If you need to filter data on retrieval, see [Using Parameters with Data Source objects]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/using-parameters-with-data-source-objects%})

## Adding filters to Graph using Report Designer

1. Open a report in __Design__  view.             

1. Left-click a __Chart__  item to select it.             

1. Click __Filters__  ellipsis in the property grid. This displays the current list of filters. By default, the list is empty.             

1. Click __New__ . A new blank filter equation appears.             

1. In __Expression__ , type or select the expression for the field to filter. To open the __Edit Expression__  Dialog, select the ```<Expression>``` option.             

1. In the __Operator__  box, select the operator that you want the filter to use to compare the values in the Expression box and the Value box.             

1. In the __Value__  box, type the expression or value against which you want the filter to evaluate the value in Expression.             

1. Click __OK__ .             

## Adding filters to Graph programatically

{{source=CodeSnippets\CS\API\Telerik\Reporting\GraphSnippets.cs region=AddNewFilterSnippet}}
````C#
	
	            Telerik.Reporting.Filter filter1 = new Telerik.Reporting.Filter();
	            filter1.Expression = "=Fields.ProductID";
	            filter1.Operator = Telerik.Reporting.FilterOperator.GreaterThan;
	            filter1.Value = "=10";
	
	            graph1.Filters.Add(filter1);
	
````
{{source=CodeSnippets\VB\API\Telerik\Reporting\GraphSnippets.vb region=AddNewFilterSnippet}}
````VB
	
	        Dim filter1 As New Telerik.Reporting.Filter()
	        filter1.Expression = "=Fields.ProductID"
	        filter1.Operator = Telerik.Reporting.FilterOperator.GreaterThan
	        filter1.Value = "=10"
	
	        graph1.Filters.Add(filter1)
	
````



## 

>tip The Graph item has a complex [structure]({%slug telerikreporting/designing-reports/report-structure/graph/structure%}) built by CategoryGroups and SeriesGroups collections, where each collection has its own Filters.             If you need to limit slots, filter the CategoryGroups collection. If you need to filter dynamically created series, filter the SeriesGroups collection.           The [Group Explorer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/group-explorer%}) can be used for checking the            Graph item's Series and Categories groups.           


# See Also


 * [Chart](/reporting/api/Telerik.Reporting.Chart) 

 * [Filter](/reporting/api/Telerik.Reporting.Filter) 

 * [FilterCollection](/reporting/api/Telerik.Reporting.FilterCollection) 

 * [Using Expressions]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/using-expressions/overview%})
