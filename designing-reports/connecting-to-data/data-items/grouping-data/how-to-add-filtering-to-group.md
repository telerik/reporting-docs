---
title: Filtering Groups
page_title: Filtering Groups Tutorial
description: "Learn how to add filtering to a data item Group with the Report Designers by following these step-by-step instructions for a Crosstab column group."
slug: telerikreporting/designing-reports/connecting-to-data/data-items/grouping-data/how-to-add-filtering-to-group
tags: how,to,add,filtering,to,group
published: True
position: 1
previous_url: /data-items-how-to-add-filtering-to-group
reportingArea: General
---

# Adding Filtering to Group

A filter defined on a report/table group limits the group members to certain values. These filters operate over the group members after the groups are calculated. Group filters are similar to the `HAVING` clause in a SQL statement.

We will use the filter to hide/show the dynamic groups members. Additionally we add the possibility for dynamic filtering by using report parameters. The example shown is based on the [ProductSales](https://demos.telerik.com/reporting/product-sales) demo report.

## Using dynamic filter to show/hide crosstab group members

1. Open the report in the designer and show the Group Explorer

	>caption Group Explorer

	![Show the Group Еxplorer in the Visual Studio Report Designer](images/DataItems/diGroupExplorer.PNG)

1. Define a new [Report Parameter]({%slug telerikreporting/designing-reports/connecting-to-data/report-parameters/how-to-add-report-parameters%}) _DetailsForYear_ as shown on the picture. Use the same DataSource as for the report. The parameter should be MultiValue.

	>caption Define Report Parameter

	![Define a multivalue Report Parameter in the demo report ProductSales.cs in the Visual Studio Report Designer](images/DataItems/diReportParameter.PNG)

1. Select the Crosstab (or any cell in it) and invoke the [Edit Filters dialog]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/edit-filter-dialog%}) for the _Qtr Column_ group. Enter the filter expression as shown on next picture

	>caption Set Filter

	![Set Filter to the Column group Qtr of the Crosstab in the Visual Studio Report Designer](images/DataItems/diSetFilter.PNG)

1. Preview the report. Now it is possible to select for which year to show Quarter columns and hide for the rest. 

	>caption Preview

	![Preview of the final report with the filtered Crosstab column group in the Visual Studio Report Designer](images/DataItems/diPreview.PNG)

## See Also

* [Filter Group members]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/filtering-data/overview%}#filter-group-members)
