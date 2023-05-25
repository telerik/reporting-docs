---
title: Do I Need to Use a Data Source Component?
description: "Learn when to use Telerik Reporting Data Source components and when it may be better to assign data item's DataSource property directly to your custom data objects."
type: how-to
page_title: When to use a Data Source component
slug: do-i-need-to-use-a-data-source-component
tags: Data Source,data item,component
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

The Telerik Reporting [Data Source Components]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/overview%}) allow you to connect [data items]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/overview%}) (e.g. `Report`, `Table`, `Graph`) to different types of data sources such as database or middle-tier business objects, without additional code. Note that they should not be confused with the .NET Data Sources available in the Visual Studio.

Telerik Reporting Data Source Components are intended to specify *declaratively* how to retrieve data for Data Items but do not contain any data themselves. Their purpose is only to specify the means how to obtain it (e.g. in the case of `SqlDataSource` - by executing a SQL query against a database, in the case of `ObjectDataSource` - by invoking a method/property of a custom business object, etc.). You can view the Data Source Components as wrappers for your data that can only read it and cannot modify it.

## Solution

Having the above into account:

1. **Data source components are suitable**:

	* When data can be retrieved from the server in a declarative manner e.g. a **SQL** query, or a custom data access layer that gets data records;
	* In technology specific scenarios, where data can be modified by the user and you need to display the updated records in a report, our recommendation is to save the updated data on the server and to use a data source component. This approach allows to use reports from any type of project - desktop, web.

1. **Data source components are not required**:

	* When the data object is already created in code. You can directly set a [data item]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/overview%})'s DataSource to the existing data object;
	* When [data items]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/overview%}) are using the same data and you use a Reporting version prior to [R3 2019 (13.2.19.918)](https://www.telerik.com/support/whats-new/reporting/release-history/progress-telerik-reporting-r3-2019-13-2-19-918). With the older versions, each data item will execute its data retrieval method on its own, even if all data items are bound to the same data source component. In such case, you can reorganize the layout in order to benefit from data-binding approaches like [Databind to Collection Properties]({%slug how-to-databind-to-collection-properties%}) and [Use DataObject as a datasource for nested data items (Table, List, Crosstab, Graph)]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/how-to-use-the-reportitem.dataobject-property-in-expressions%}#use-dataobject-as-a-datasource-for-nested-data-items-table-list-crosstab-graph).
