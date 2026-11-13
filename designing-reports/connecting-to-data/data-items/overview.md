---
title: Overview
page_title: Data Items at a Glance
description: "Learn which Telerik Reporting items are data items, how they change data context, and how to choose the right item for your report."
slug: telerikreporting/designing-reports/connecting-to-data/data-items/overview
tags: overview,data,item,report,table,crosstab,subreport,map,graph
published: True
position: 0
previous_url: /data-items, /designing-reports/connecting-to-data/data-items/
reportingArea: General
components: [general]
---

# Data Items Overview

Data items display and manipulate data in Telerik Reporting. With a data item, you can group, sort, filter, and aggregate data from a single data source. Telerik Reporting provides several types of data items: **Report**, **SubReport**, **Table**, **Crosstab**, **List**, **Graph**, **Map**, and **Gauge**. The **Table**, **Crosstab**, and **List** data items support tabular layouts that you can combine to customize data presentation. Graphs provide a visual view of data and aggregates. Choose a data item based on your data and what you want to convey in your report.

> Starting with [R3 2019 (13.2.19.918)](https://www.telerik.com/support/whats-new/reporting/release-history/progress-telerik-reporting-r3-2019-13-2-19-918), when two or more **data items** use the same `DataSource` component, the raw data is reused between them. For example, if a Table and a Graph use the same `SqlDataSource`, the data is fetched only once from the database when rendering the report.

The data item changes the data context. In expressions evaluated within a data item, the `ReportItem.DataObject` [global object](slug:telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/global-objects) represents the parent data, while the `Fields` global object represents the current data item. This context determines how expressions applied to the data item's properties are evaluated.

For example, in [data item bindings](slug:telerikreporting/designing-reports/connecting-to-data/expressions/using-expressions/bindings) and [conditional formatting expressions](slug:telerikreporting/designing-reports/connecting-to-data/expressions/using-expressions/conditional-formatting), the `Fields` global object refers to the parent data scope. In [data item filtering](slug:telerikreporting/designing-reports/connecting-to-data/data-items/filtering-data/how-to-add-filtering-to-report), [data item grouping](slug:telerikreporting/designing-reports/connecting-to-data/data-items/grouping-data/how-to-add-groups-to-report), and [data item sorting](slug:telerikreporting/designing-reports/connecting-to-data/data-items/ordering-data/how-to-add-sorting-to-report), `Fields` refers to the current data item scope. You can use both scopes in expressions. For example, to filter child data by a parent value, use a filtering rule such as `=ReportItem.DataObject.ParentFieldName = Fields.ChildFieldName`.

To make the best choice of data item to use for displaying report data, it helps to understand the characteristics of your data and the purpose of the report. The following list describes the features of each data region:

* **Report** The Report item consists of multiple horizontal sections (bands), one for each part of the report. For example, data and text in the report header section are rendered at the beginning of the report, data and text in the page header section are rendered at the beginning of each page, and data and text in the page footer sections are rendered at the end of each page. In the middle of the report are the report groups and the detail section. The report groups are always nested and display data for each value in the group, which is determined at runtime. The detail section displays one row for each detail item in the report data source.
* **SubReport** The SubReport item is a placeholder for another report you would like to integrate into the current one. Its structure is the same as the Report item except for the Page sections and PageSettings, which are ignored. Starting with [R3 2022 SP1 16.2.22.1109](https://www.telerik.com/support/whats-new/reporting/release-history/progress-telerik-reporting-r3-2022-sp1-16-2-22-1109), the SubReport item has [its own DataSource property](slug:telerikreporting/designing-reports/report-structure/subreport#the-property-datasource-of-the-subreport-item) that lets you pass data from the main report.
* **Table** The Table item has a fixed number of columns and displays detailed or grouped data by rows. The Table expands down the page as needed. You can display all the detailed data, row by row, or group the data by creating row groups. Row groups can be nested or adjacent. Each row group displays a dynamic row down the page for each value in the group, which is determined at runtime. You can also add static rows for labels or totals. You can add totals to the table or to a specific group.
* **Crosstab** The Crosstab item is derived from the Table item and displays data grouped by rows and columns. A Crosstab has at least one row group and one column group. The Crosstab expands across the page for column groups and down the page for row groups. The Crosstab cells display summary and aggregate values scoped to the intersections of the row and column groups. You can create additional nested groups and adjacent groups. The number of rows and columns in a Crosstab depends on the values for each group, determined at runtime. You can also add static rows for labels or totals. You can add totals to the table or to a specific group.
* **List** The List item is derived from the Table item and contains one row that repeats for each value in the data source and displays data in a free-form format. For example, you might use a list to design a form or display both a table and a graph. Arrange text boxes anywhere in the list to create your layout.
* **Graph** The Graph item enables you to present large volumes of aggregated information at a glance in a visual format.
* **Map** The Map item enables you to represent geospatial data on a world map.
* **Gauge** The Gauge item displays key performance indicators (KPIs) that track progress toward targets or goals.
