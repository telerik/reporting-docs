---
title: Overview
page_title: Report Item Overview 
description: "Learn more about the Telerik Reporting Report Item."
slug: report_item
tags: telerik, reporting, report, items, item, overview
published: True
position: 
---

# Report Item Overview

The `Report` report item is a special item that hosts the rest of the report items grouped in report sections. It has a special structure explained in the [Report Structure]({%slug report_structure_groups_sections%}) article. The `Report` is also a special [Data Item]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/overview%}) and as such exposes [Filtering]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/filtering-data/how-to-add-filtering-to-report%}), [Grouping]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/grouping-data/how-to-add-groups-to-report%}) and [Sorting]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/ordering-data/how-to-add-sorting-to-report%}).

The `Report` item has also a list of specific properties that defines the general layout and functionality of the generated report documents. This article elaborates on these specifics that distinguish the `Report` from the rest of the report items.

## Page Settings

The [`PageSettings`](/api/Telerik.Reporting.Drawing.PageSettings) determine the layout of the report document in physical page formats like PDF and when printed on paper. This includes the page size, watermarks, [number of columns]({%slug telerikreporting/designing-reports/report-structure/how-to/how-to-create-a-multi-column-report%}), etc. The PageSettings are entirely respected in physical paging formats, whereas some of them are ignored in soft paging formats. The difference is explained in the article [Interactive vs. Print Layout]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/interactive-vs.-print-layout%}).
The property [`PageNumberingStyle`](/api/Telerik.Reporting.Report#Telerik_Reporting_Report_PageNumberingStyle) is related only to [Report Book Paging]({%slug telerikreporting/designing-reports/report-book/report-book-paging%}).

## Report Parameters

The [Report Parameters]({%slug telerikreporting/designing-reports/connecting-to-data/report-parameters/overview%}) are [Global Objects]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/global-objects%}) available all over the Report. Their main application is for filtering the reaport data. They can be used also for passing external information to the Report. More detailed information may be found in the following resources:

 * [How to Add Report Parameters]({%slug telerikreporting/designing-reports/connecting-to-data/report-parameters/how-to-add-report-parameters%})

 * [Using Report Parameters in Expressions]({%slug telerikreporting/designing-reports/connecting-to-data/report-parameters/using-report-parameters-in-expressions%})

 * [Using Multivalue Parameters]({%slug telerikreporting/designing-reports/connecting-to-data/report-parameters/using-multivalue-parameters%})

 * [How to Cascade Parameters with applied filtering on Report level]({%slug telerikreporting/designing-reports/connecting-to-data/report-parameters/how-to-cascade-parameters-with-applied-filtering-on-report-level%})

 * [How to Cascade Parameters with applied filtering on data source level]({%slug telerikreporting/designing-reports/connecting-to-data/report-parameters/how-to-cascade-parameters-with-applied-filtering-on-data-source-level%})

## DataSource components

The [DataSource components]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/overview%}) are used to link the Report and its data items to the corresponding data sources. They contain meta information telling the Reporting engine how to access the data when needed. The DataSource components do not hold any data.

For example, the [SqlDataSource component]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/sqldatasource-component/overview%}) holds the Data Provider name, the ConnectionString and the Query/Stored Procedure name to allow the Reporting engine to connect to the database and fetch the data when needed.

You may get the collection of all DataSource components in the Report programmatically with the [GetDataSources method](/api/Telerik.Reporting.Report#Telerik_Reporting_Report_GetDataSources).

## Special Settings

### SkipBlankPages

### RuntimeSettings

### Localizable

## Design Settings

### SnapGridSize

### UnitOfMeasure

### StyleSheet

### ExternalStyleSheets

## See Also

[Creating Multi-Column Reports]({%slug telerikreporting/designing-reports/report-structure/how-to/how-to-create-a-multi-column-report%})
