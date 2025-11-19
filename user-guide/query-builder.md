---
title: Query Builder
page_title: Query Builder in the Web Report Designer
description: "Learn more about the Query Builder in the Web Report Designer and how to use it to create basic queries easily in Telerik Reporting."
slug: user-guide/query-builder
tags: query,builder,web,report,designer
published: True
reportingArea: WRDHTML5, WRDBlazorWrapper
position: 200
---

<style>
img[alt$="><"] {
  border: 1px solid lightgrey;
}

</style>

# Web Report Designer – Query Builder for Easy Data Selection

The Web Report Designer gives you two easy ways to build queries: a visual tool (where you click and select options) and a text tool (where you type the query). A query is just a set of instructions that tells the system what data you want from a database. This data is used by something called a SqlDataSource, which connects your report to the database. The Query Builder works with most common data providers (like ADO.NET, ODBC, or OLEDB) as long as they can share details about the columns in the database using a feature called `GetSchema`.

![The Graphical SQL Query Builder Form of the Web Report Designer ><](images/QueryBuilderWRD.png)

The graphical query builder helps you find information in a database without writing code. You can click to choose the tables and columns you need, and then see the results. If you use more than one table, you need to show how the tables are connected.

## Schema Restrictions

As of 2025 Q1, the Web Report Designer’s Query Builder has a new option called [Schema Restrictions](/api/telerik.reporting.sqldatasource#Telerik_Reporting_SqlDataSource_SchemaRestrictions). This option lets you choose which parts of the database to load by listing them with commas. It helps report creators see only the needed information and makes loading faster.

````
null,Production,ProductCategory
````

> Schema restrictions are sensitive to uppercase and lowercase letters, and empty values are allowed. If you need to set a value to nothing, use the word null as shown in the example. These rules only work with .NET 8 or newer.

![Image of the SQL Data Source wizard showing the schema restrictions field ><](images/SchemaRestrictionsQueryBuilderWDR_1.png)

![Image of the SQL Data Source wizard showing the query builder dialog ><](images/SchemaRestrictionsQueryBuilderWDR_2.png)

## Query Builder Areas

The following sections describe the function of each area

| Name | Description |
| ------ | ------ |
| [Database View](#database-view-pane) | Displays a structured list of tables and views grouped by database sections |
| [Selected Fields](#selected-fields-pane) | Displays the list of field names from the selected items in the database view |
| [Relationships](#relationships-pane) | Displays how the selected tables are connected |
| [Filters](#filters-pane) | Displays a list of options you can use to filter tables or views |
| [Result](#result-pane) | Displays example data for the query that was created automatically |

### Database View Pane

On the left side of the screen, you’ll see the Database View. It shows details about the database items you’re allowed to access, based on your login. The items are organized in a tree structure by category. Click a category to see its tables and views, and click a table or view to see its columns.

When you check a column in this pane, it will automatically move to the Selected Fields pane. If you check a table, all its columns will be added to the Selected Fields pane. If you check more than one table, the Relationship Editor pane will open automatically.

### Selected Fields Pane

The Selected Fields pane shows the columns you chose to include in your query. These columns become the set of fields used for your report. You can use these fields to display data in tables, charts, and other report elements when viewing the report.

The following columns are displayed:

| Name | Description |
| ------ | ------ |
| Column name | Shows the names of the selected fields, grouped by the table or view they come from |
| Alias | If the last added field name is already used, an alias will be created automatically. You can also change or add aliases manually. |
| Grouped | Shows a checkbox that lets you choose if the field should be used for grouping |
| Aggregate |  |
| Sorting type |  |
| Sort order |  |
| Remove |  |

### Relationships Pane

### Filters Pane

### Result Pane
