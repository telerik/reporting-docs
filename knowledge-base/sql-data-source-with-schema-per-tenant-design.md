---
title: Configure SqlDataSource to use database with schema-per-tenant design
description: SQL data source with bindings to utilize different schema for each user according to report parameter
type: how-to
page_title: Set SQL query to use user-based schema
slug: sql-data-source-with-schema-per-tenant-design
position: 
tags: 
ticketid: 1349183
res_type: kb
---

<style>
table th:first-of-type {
	width: 28%;
}
table th:nth-of-type(2) {
	width: 72%;
}
</style>

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

The database feeding the report with data may use a schema-per-tenant design, i.e. a new schema will be added every time a new user is set up. The query for fetching the data will differ only in its 'schema' part. Here is how to avoid creating a data source for each schema/user.

## Solution

1. Declare the SqlDataSource that should use 'schema-per-tenant'. Set its `ConnectionString`. Note that this can be done [dynamically through a report parameter]({%slug how-to-pass-connectionstring-to-report-dynamically-through-report-parameter%}). Assign the DataSource to the corresponding [Data item]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/overview%}).

1. Declare a Report Parameter (i.e. 'Schema') to provide the name of the user schema.

1. Use the [Bindings]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/using-expressions/bindings%}) property of the Data item to provide the `SelectCommand` property:

| Property path | Expression |
| ------ | ------ |
| `DataSource.SelectCommand` | `= Format("SELECT {0}.[Production].[Product].[Name],{0}.[Production].[Product].[ProductNumber],{0}.[Production].[Product].[ListPrice],{0}.[Production].[Product].[StandardCost] FROM {0}.[Production].[Product]", Parameters.Schema.Value)` |

The `DataSource.SelectCommand` property path is not listed in the dropdown and must be typed manually. The sample code uses the _Format_ [Text function]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/functions/text-functions%}) to integrate the schema name in the query string.

You may provide also the entire _SelectCommand_ as a value taken from a Report parameter:

| Property path | Expression |
| ------ | ------ |
| `DataSource.SelectCommand` | `= Parameters.Query.Value` |

## Notes

* Use this technique only within trusted environment as SQL concatenation allows SQL injection.
* Bindings are not available on the ReportParameter-s, so this technique cannot be applied on a data source feeding the available values of a ReportParameter

## See Also

[Change Connection String dynamically through a report parameter]({%slug how-to-pass-connectionstring-to-report-dynamically-through-report-parameter%})
