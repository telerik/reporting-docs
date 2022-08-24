---
title: Template Items
page_title: Template Items of the Table Report Item 
description: "Learn more about the available table, crosstab, and list template items supported by the Telerik Reporting Table report item."
slug: table_template_items
tags: telerik, reporting, report, items, table, crosstab, list, templates
published: True
position: ...
---

# Template Items of the Table Report Item

The Table report item supports the table, crosstab, and list templates which you can add directly from the Toolbox.

## Table 

Use a table item to display detail data, organize the data in row groups, or both. The Table contains three columns with a table header row and a details row for data. The following figure shows the initial table template, selected on the design surface: 

![](images/table1.png)

## Crosstab 

Use a CrossTab template to display aggregated data summaries, grouped in rows and columns. The number of rows and columns for groups is determined by the number of unique values for each row and column groups. The following figure shows the initial crossTab template, selected on the design surface: 

![](images/table2.png)

## List 

Use a list item to create a free-form layout. You are not limited to a grid layout, but can place fields freely inside the list. You can use a list to design a form for displaying many dataset fields or as a container to display multiple data regions side by side for grouped data. For example, you can define a group for a list; add a table, chart, and image; and display values in table and graphic form for each group value. 

![](images/table3.png)

Of course, you are not limited to your initial template choice. As you add groups, totals, and labels, you may find you want to modify your table design. For example, you might start with a table and then delete the details row and add column groups.

You can continue to develop a Table, crossTab, or List by adding any table feature. Table features include displaying detail data or aggregates for grouped data on rows and columns. You can create nested groups, independent adjacent groups, or recursive groups. You can filter and sort grouped data, and easily combine groups by including multiple group expressions in a group definition.

> [Data Items]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/overview%}) cannot be used in page sections ([PageHeaderSection/PageFooterSection]({%slug telerikreporting/designing-reports/overview%})), because the latter are processed after the report data has been processed. At this moment the report data source is not available anymore. 

