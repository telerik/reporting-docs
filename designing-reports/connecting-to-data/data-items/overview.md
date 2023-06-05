---
title: Overview
page_title: Data Items at a Glance
description: "Learn which Report Items are considered as Data Items in Telerik Reporting, why they are unique and more about their specifics."
slug: telerikreporting/designing-reports/connecting-to-data/data-items/overview
tags: overview,data,item,report,table,crosstab,subreport,map,graph
published: True
position: 0
previous_url: /data-items
---

# Data Items Overview

The data items display and manipulate data in Telerik Reports. With a data item, you can group, sort, filter, and aggregate data from a single data source. Telerik Reporting provides several types of data items: __Report (SubReport)__, __Table__, __Crosstab__, __List__, __Graph__, and __Map__ . The __Table__, __Crosstab__ and __List__ data items are templates based on the Table data item, and they can be combined in unique ways to customize the data presentation. Charts provide a graphical view of data and aggregates. The type of data item you choose depends on your data: the amount of data, the range in data values, and what you want to convey in your report.

To make the best choice of data item to use for displaying report data, it helps to understand the characteristics of your data and the purpose of the report. The following list describes the features of each data region:

* __Report__ The Report item consists of multiple horizontal sections (bands), one for each part of the report. For example, data and text in the report header section renders at the beginning of the report, data and text in the page header section renders at the beginning of each page, and data and text in the page footer sections renders at the end of each page. In the middle of the report are the report groups and the detail section. The report groups are always nested and display data for each value in the group, which is determined at runtime. The detail section displays at run-time one row for each detail item in the report data source.
* __Table__ The Table item has a fixed number of columns and displays detail or grouped data by rows. The Table expands down the page as needed. You can display all the detail data, row by row, or group the data by creating row groups. Row groups can be nested or adjacent. Each row group displays a dynamic row down the page for each value in the group, which is determined at run-time. You can also add static rows for labels or totals. You can add totals to the table or to a specific group.
* __Crosstab__ The Crosstab item is derived from the Table item and displays data grouped by rows and columns. A Crosstab has at least one row group and one column group. The Crosstab expands across the page for column groups and down the page for row groups. The Crosstab cells display summary and aggregate values scoped to the intersections of the row and column groups. You can create additional nested groups and adjacent groups. The number of rows and columns in a Crosstab depend on the values for each group, determined at run-time. You can also add static rows for labels or totals. You can add totals to the table or to a specific group.
* __List__ The List item is derived from the Table item and contains one row that repeats for each value in the data source and displays data in a free-form format. For example, you might use a list to design a form or display both a table and a chart. Arrange text boxes anywhere in the list to create your layout.
* __Graph__ The Graph item enables you to present large volumes of aggregated information at a glance in a visual format.
* __Map__ The Map item enables you to represent geospatial related data on top of the world map.
* __Gauge__ The Gauge report item enables the display of key performance indicators (KPIs) that track the amount of progress made towards achieving the targets or goals.
