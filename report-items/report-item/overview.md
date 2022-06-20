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
The property [`PageNumberingStyle`](/api/Telerik.Reporting.Report.html#Telerik_Reporting_Report_PageNumberingStyle) is related only to [Report Book Paging]({%slug telerikreporting/designing-reports/report-book/report-book-paging%}).

## Report Parameters

links to how to get them



## DataSource components


## Special Settings

### SkipBlankPages

### RuntimeSettings

### Localizable

## Design Settings

### SnapGridSize

### UnitOfMeasure

### ExternalStyleSheets

## See Also

[Creating Multi-Column Reports]({%slug telerikreporting/designing-reports/report-structure/how-to/how-to-create-a-multi-column-report%})
