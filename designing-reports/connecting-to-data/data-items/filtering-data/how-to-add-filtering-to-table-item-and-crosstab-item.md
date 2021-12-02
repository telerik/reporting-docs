---
title: How to Add filtering to Table item and Crosstab item
page_title: How to Add filtering to Table item and Crosstab item | for Telerik Reporting Documentation
description: How to Add filtering to Table item and Crosstab item
slug: telerikreporting/designing-reports/connecting-to-data/data-items/filtering-data/how-to-add-filtering-to-table-item-and-crosstab-item
tags: how,to,add,filtering,to,table,item,and,crosstab,item
published: True
position: 3
---

# How to Add filtering to Table item and Crosstab item



This topic illustrates how to add filters to a Table or Crosstab item's Filters collection using the Report Designer or Report API,         where the filtering occurs after data is retrieved by the report.       

If you need to filter data on retrieval, see [Using Parameters with Data Source objects]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/using-parameters-with-data-source-objects%})

## Adding filters to Table or Crosstab item using Report Designer

1. Open a report in __Design__  view.             

1. Left-click a __Table__  or __a Crosstab__  item on the design surface to select it.             

1. Click __Filters__  ellipsis in the property grid. This displays the current list of filters. By default, the list is empty.             

1. Click __New__ . A new blank filter equation appears.             

1. In __Expression__ , type or select the expression for the field to filter. To open the __Edit Expression__  Dialog, select the ```<Expression>``` option.             

1. In the __Operator__  box, select the operator that you want the filter to use to compare the values in the Expression box and the Value box.             

1. In the __Value__  box, type the expression or value against which you want the filter to evaluate the value in Expression.             

1. Click __OK__ .             

## Adding filters to Table or Crosstab item programatically

{{source=CodeSnippets\CS\API\Telerik\Reporting\TableSnippets.cs region=AddNewFilterSnippet}}
````C#
	
	            Telerik.Reporting.Filter filter1 = new Telerik.Reporting.Filter();
	            filter1.Expression = "=Fields.ProductID";
	            filter1.Operator = Telerik.Reporting.FilterOperator.GreaterThan;
	            filter1.Value = "=10";
	
	            table1.Filters.Add(filter1);
	
````
{{source=CodeSnippets\VB\API\Telerik\Reporting\TableSnippets.vb region=AddNewFilterSnippet}}
````VB
	
	        Dim filter1 As New Telerik.Reporting.Filter()
	        filter1.Expression = "=Fields.ProductID"
	        filter1.Operator = Telerik.Reporting.FilterOperator.GreaterThan
	        filter1.Value = "=10"
	
	        table1.Filters.Add(filter1)
	
````



## 

>tip The Table/Crosstab/List item has a complex [structure]({%slug telerikreporting/designing-reports/report-structure/table-crosstab-list/understanding-table-cells,-rows-and-columns%}) built by Rows and Column groups,             where each group has its own Filters.             If you need to limit column, add filters to the corresponding column groups. If you need to limit rows, add filters to the corresponding row groups.           The [Group Explorer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/group-explorer%}) can be used for checking the             Table/Crosstab/List item's Row and Column groups.           


# See Also


 * [Table](/reporting/api/Telerik.Reporting.Table) 

 * [Filter](/reporting/api/Telerik.Reporting.Filter) 

 * [FilterCollection](/reporting/api/Telerik.Reporting.FilterCollection) 

 * [Using Expressions]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/using-expressions/overview%})
