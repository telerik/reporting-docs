---
title: How to Use a Single SQL DataSet in Master-Detail scenario
description: When a parent data item is bound to a SqlDataSource you may still use part of the returned columns as DataSource for child data items
type: how-to
page_title: How to Pass SqlDataSource Columns as DataSource for Nested Data Items
slug: pass-sqldatasource-columns-as-datasource-for-nested-data-items
position: 
tags: 
ticketid: 1454415
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
When you need to pass data from a [SqlDataSource]({% slug telerikreporting/designing-reports/connecting-to-data/data-source-components/sqldatasource-component/overview %}) bound to a data item to its child [data item]({% slug telerikreporting/designing-reports/connecting-to-data/data-items/overview %}), for example in the Master-Detail scenario, you need to pass all of the data. This is due to the fact that SqlDataSource can return only a single DataTable. Even if the query returns a DataSet, only the first of the tables will be used - [Selecting Data with the SqlDataSource component]({% slug telerikreporting/designing-reports/connecting-to-data/data-source-components/sqldatasource-component/selecting-data-with-the-sqldatasource-component %}). In some cases, this may significantly deteriorate the performance.  
The general approach for binding the DataSource of the child data item to parent data is explained in the 
_Use DataObject as a datasource for nested data items (Table, List, Crosstab, Graph)_ section of 
[How to use the ReportItem.DataObject property in expressions]({% slug telerikreporting/designing-reports/connecting-to-data/data-items/how-to-use-the-reportitem.dataobject-property-in-expressions %}) article. 

## Suggested Workarounds
MS SQL Server 2016 introduced the [JSON functions](https://docs.microsoft.com/en-us/sql/relational-databases/json/json-data-sql-server?view=sql-server-ver15) 
that enable you to combine classic relational columns with columns that contain data formatted as JSON text. This way you may 
compose a query that returns the main data as regular columns of a DataTable, and the data for the child data item converted 
into a single JSON field. Here is a sample query:
```SQL
select c.ProductCategoryId, c.Name, 
(select * from Production.ProductSubcategory sc where sc.ProductCategoryID = c.ProductCategoryID for Json Auto) as JSONOUT
from Production.ProductCategory c
```
The fields _ProductCategoryId_ and _Name_ can be used for the main data item. The field _JSONOUT_ can be used as a _Source_ for a 
[JsonDataSource]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/jsondatasource-component%}) providing data to the nested data item. This source that will become available only at 
runtime can be [bound]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/using-expressions/bindings%}) to the DataSource property of the child data item with the following Expression:
```
Property path		|	Expression
DataSource.Source	|	=ReportItem.DataObject.JSONOUT
```

## Design Time Support
The above Binding will replace the design time _JsonDataSource_ -> _Source_ property of the JsonDataSource attached to the 
child data item. Therefore, you may assign a dummy JSON data with the same schema (in the particular case the schema of the _ProductSubcategory_ table) to the child data item's DataSource for design purposes. This will allow you to use the 
[Fields]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/global-objects%}#fields) Global Object to easily design the layout of the nested data item.

## Notes
Applicable for MS SQL Server 2016 and later

## See Also
[Format Query Results as JSON with FOR JSON (SQL Server)](https://docs.microsoft.com/en-us/sql/relational-databases/json/format-query-results-as-json-with-for-json-sql-server?view=sql-server-ver15)
