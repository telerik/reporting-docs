---
title: Do I need to use a Data Source component?
description: Data source components are a *declarative* way to specify how data can be retrieved. The reporting engine creates data objects and executes their data retrieval methods based on the data source component's settings.
type: how-to
page_title: When to use a Data Source component
slug: do-i-need-to-use-a-data-source-component
tags: Data Sources
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
  
The Telerik Reporting [Data Source components]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/overview%}) allow you to connect report items (e.g. Report, Table/Crosstab/List and Graph) to different types of data sources such as database or middle-tier business objects, without additional code. Note that they should not be confused with the .NET Data Sources available in the Visual Studio.

Telerik Reporting Data Source Components are intended to specify *declaratively* how to retrieve data for Data Items but do not contain any data themselves. Their purpose is only to specify the means how to obtain it (e.g. in the case of SqlDataSource - by executing a SQL query against a database, in the case of ObjectDataSource - by invoking a method/property of a custom business object, etc.). You can view the Data Source Components as wrappers for your data that can only read it and cannot modify it.
  
## Solution    
  
 Having the above into account:  

1. **Data source components are suitable:**
    - When data can be retrieved from the server in a declarative manner e.g. a **SQL** query, or a custom data access layer that gets data records;
    - In technology specific scenarios, where data can be modified by the user and you need to display the updated records in a report, our recommendation is to save the updated data on the server and to use a data source component. This approach allows to use reports from any type of project - desktop, web.
2. **Data source components are not required:**
    - When the data object is already created in code. You can directly set a [data item]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/overview%})'s DataSource to the existing data object;
    - When [data items]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/overview%}) are using the same data. Each data item will execute its data retrieval method on its own, even if all data items are bound to the same data source component. In such case, you can reorganize the layout in order to benefit from data-binding approaches like [How to Databind to Collection Properties](./how-to-databind-to-collection-properties) and [Use DataObject as a datasource for nested data items (Table, List, Crosstab, Graph)]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/how-to-use-the-reportitem.dataobject-property-in-expressions%}#use-dataobject-as-a-datasource-for-nested-data-items-table-list-crosstab-graph).
