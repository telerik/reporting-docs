---
title: Overview
page_title: Filtering Data at a Glance
description: "Learn more about the Filtering options in Telerik Reporting with their pros and cons, and the major recommendations for applying them."
slug: telerikreporting/designing-reports/connecting-to-data/data-items/filtering-data/overview
tags: overview
published: True
position: 0
previous_url: /data-items-filtering-data, /designing-reports/connecting-to-data/data-items/filtering-data/
reportingArea: General
---

# Filtering Data Overview

In Telerik Reporting the expressions are the main tool for describing the run-time behavior of the report. They are used to determine the number of records in the [Data Source]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/overview%}) or the number of Group members. In Conditional Formatting rules filters are used to express the conditions on which the styling rules are applied. Filters are predicate expressions that should be evaluated as True or False.

You can determine where you want to set a filter by the effect you want to achieve in your report. At run time, the report processor applies the defined filters in the following order: on the [Data Source]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/overview%}), and then on the DataItem, and then on Groups from the top down in each Group hierarchy. On a Crosstab, Table, and List, filters for row groups, column groups, and adjacent groups are applied independently. On a Graph, filters for CategoryGroups and SeriesGroups are applied independently. When the report processor calculates a filter, all filter equations are applied in the order they are defined in the Filters collection which is the equivalent of combining them with Boolean AND operations.

## Filter DataSource records

The idea behind filtering the retrieved data source records is the same as in the WHERE clause in a SQL statement. However, there are two ways to achieve this effect:

### "Server-side" filtering

__The most efficient way to save bandwidth__ is to filter data records before they are retrieved by the DataSource component. This is called filtering on the “server-side”. To accomplish this you can use a parameterized DataSource component for each DataSource component that supports this. The next step is to map each DataSource parameter to Report Parameters using expressions. In this approach, no Filters are needed. If however the data source does not support parameters, or you must run stored procedures and cannot modify the query use report filters.

### "Client-side" filtering

A filter can be added to the Filters collection on a Report, a DataItem level, or in the Report Parameter’s AvailableValues. Filters are applied to the data set after it is retrieved by the DataSource. This method of filtering is called "client-side" filtering and should be avoided for big data. Usually, the Filter expressions compare fields of the data against report parameters or master data fields. These filters are calculated over the entire set of data and should not use the aggregate functions for the Expressions.

## Filter Group members

Set a filter on a Group when you want to include or exclude certain members for a Group. These filters operate over the group members after the groups are calculated and can contain aggregate functions. Group filters are similar to the HAVING clause in a SQL statement.

Filters applied to Report Groups will control the visibility of the Group members and GroupHeader/GroupFooter sections.

Filters applied to Crosstab, Table, and List Row/Column Groups will change the visibility of corresponding rows and columns and also their headers.

For Graph Filters can be applied to SeriesGroups and CategoryGroups and will control the visibility of Series and Category members.

## Using Filters in Conditional Formatting

To apply the Style of report items dynamically Telerik Reporting uses Filter expressions. At run time, the report processor evaluates the filter expressions and substitutes the result for the property value, just as if you had set the property to a static value at design time. When the report is rendered, the run-time value is used. The filter expressions can contain aggregate functions.

## See Also

* [Using Parameters with the SqlDataSource component]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/sqldatasource-component/using-parameters-with-the-sqldatasource-component%})
* [Using Parameters with the ObjectDataSource Component]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/objectdatasource-component/using-parameters-with-the-objectdatasource-component%})
* [Using parameters with the EntityDataSource component]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/entitydatasource-component/using-parameters-with-the-entitydatasource-component%})
* [Using parameters with the OpenAccessDataSource component]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/openaccessdatasource-component/using-parameters-with-the-openaccessdatasource-component%})
* [Specifying query parameters with the CubeDataSource component]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/cubedatasource-component/specifying-query-parameters-with-the-cubedatasource-component%})
* [How to Add filtering to Report]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/filtering-data/how-to-add-filtering-to-report%})
* [How to Add filtering to Table item and Crosstab item]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/filtering-data/how-to-add-filtering-to-table-item-and-crosstab-item%})
* [How to Add filtering to Graph item]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/filtering-data/how-to-add-filtering-to-graph-item%})
