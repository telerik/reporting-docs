---
title: How to Add filtering to Group
page_title: How to Add filtering to Group | for Telerik Reporting Documentation
description: How to Add filtering to Group
slug: telerikreporting/designing-reports/connecting-to-data/data-items/grouping-data/how-to-add-filtering-to-group
tags: how,to,add,filtering,to,group
published: True
position: 1
---

# How to Add filtering to Group



A filter defined on a report/table group limits the group members to       a certain values. These filters operate over the group members after the       groups are calculated. Group filters are similar to the HAVING clause in       a SQL statement. 		

We will use the filter to hide/show the dynamic groups members. 		Additionally we add the possibility for dynamic filtering by using report 		parameters. The example shown is based on the  [ProductSales](https://demos.telerik.com/reporting/product-sales/silverlight-demo.aspx)   demo report

## Using dynamic filter to show/hide crosstab group members

1. Open the report in the designer and show the Group explorer               

  ![](images/DataItems/diGroupExplorer.PNG)

1. Define new Report Parameter DetailsForYear as shown on             picture. Use the same DataSource as for the report. The parameter             should be MultiValue parameter.
>caption Define Report Parameter

  

  ![](images/DataItems/diReportParameter.PNG)

1. Select the Crosstab (or any cell in it) and invoke the             [Edit Filters             dialog]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/edit-filter-dialog%}) for the Qtr Column group. Enter the filter             expression as shown on next picture  

  ![](images/DataItems/diSetFilter.PNG)

1. Preview the report - see the Preview.png. Now it is possible             to select for which year to show Quarter columns and hide for the rest.  

  ![](images/DataItems/diPreview.PNG)
