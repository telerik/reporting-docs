---
title: Data Explorer Does Not Show Data Fields
description: "Learn why after configuring a data source component, the Data Explorer may lists none or only part of the properties of the wrapped data object."
type: troubleshooting
page_title: The fields of the Data Explorer are missing
slug: data-explorer-does-not-show-all-or-any-data-fields
res_type: kb
---

## Environment

<table>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting Report Designers</td>
	</tr>
</table>

## Description

After configuring a data source component, the [Data Explorer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/data-explorer%}) lists only the *direct* properties of the wrapped data object. These properties must be *public*, and must have a proper *getter*.

Cases in which the Data Explorer does not load all or any fields:

1. The configured data source component is [SqlDataSource]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/sqldatasource-component/overview%}), and the SQL query uses temporary tables. No fields will be listed in the Data Explorer.
1. The configured data source component wraps a custom data model, which properties are not *public* or do not have *getters*. Only public properties with getters will be displayed in the Data Explorer.
1. The configured data source component wraps a custom data model, which has a *collection* property. The *collection* will be displayed as an array of objects in the Data Explorer. You won't be able to see the inner properties of the *collection* items.
1. The selected [data item]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/overview%})'s DataSource is not set to any data source component. The Data Explorer will not load any fields.
1. The wrapped data object does not have a specific data schema e.g. a DataTable object loaded with data dynamically, where columns are not declared - [Adding Columns to a DataTable](https://learn.microsoft.com/en-us/dotnet/framework/data/adonet/dataset-datatable-dataview/adding-columns-to-a-datatable).

## Solution

Per case from the [Description](#description) section:

1. Apply the settings from the [Configuring Stored Procedure with Temporary Tables]({%slug use-temporary-tables-in-stored-procedure%}) KB article.
1. Update the data model to expose its properties - make them `public` and verify each has at least a `Get` method.
1. To get the properties of the type of the collection property, you can use a temporary data source component to design the item. Details how to use collection properties are available in the [How to Databind to Collection Properties]({%slug how-to-databind-to-collection-properties%}) KB article.
1. Set the data item's DataSource to a configured data source component, and on selecting the item the Data Explorer will list its data source's fields. The same apply if you want to use the [Edit Expression dialog]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/edit-expression-dialog%}).
1. The data object should expose a data schema - public properties with getters, exposing their names and types, and etc.
