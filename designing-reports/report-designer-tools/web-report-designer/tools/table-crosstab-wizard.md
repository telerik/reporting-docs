---
title: Table/Crosstab Wizard
page_title: Table/Crosstab Wizard Tutorial
description: "Learn how to display tables in Telerik Reports via the dedicated Web Report Designer's Table/Crosstab Wizard."
slug: telerikreporting/designing-reports/report-designer-tools/web-report-designer/tools/table-crosstab-wizard
tags: table/crosstab,wizard
published: True
reportingArea: WRDHTML5, WRDBlazorWrapper
position: 2
previous_url: /web-report-designer-table-crosstab-wizard
---

# Table/Crosstab Wizard Overview

This wizard guides you through the process of adding a Table or a Crosstab item to a report that you created with the Telerik Web Report Designer. To invoke the wizard, click on the `Table Wizard` or `Crosstab Wizard` item in the toolbox. As a result, a new tab will appear on the right-hand side of the Web Report Designer. 

## Wizard Structure

1. __Data__ 

   + __Data Source__ - it is required to select a data source that will be used to fetch data for the Table or the Crosstab. If no data sources are present in the report, you will need to create one before starting the wizard. 

   + __Data Source Fields__ - the data fields of the selected data source will be listed here. Drag and drop the fields to the __Fields Arrangement__ section to configure your Table/Crosstab. 

1. __Fields Arrangement__ 

   + __Column Groups__ - drag data source fields and drop them here to set up the column group hierarchy (available only in the Crosstab Wizard). 

   + __Row Groups__ - drag data source fields and drop them here to set up the row group hierarchy (available only in the Crosstab Wizard). 

   + __Detail Values__ - drag data source fields and drop them here to set up the content of the detail rows. In the Crosstab Wizard, you can use the context menu on each dragged item to select an appropriate aggregate function that will be used to display the row/column group subtotals and grand totals. 

1. __Appearance__ 

   + __Layout__ - there are four different layouts to select from (available only in the Crosstab Wizard). 

   + __Style__ - select a pre-defined style sheet that will be applied to the new Table or Crosstab item.
