---
title: Overview
page_title: Report Item at a Glance
description: "Learn more about the Telerik Reporting Report item, what are its key features and how you may use them."
slug: report_item
tags: telerik, reporting, report, items, item, overview
published: True
position: 0
previous_url: /report-items/report-item/
reportingArea: General
---

# Report Item Overview

The Report item is a special item that hosts report items placed in report sections.

The Report is a descendant of [Data Item]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/overview%}) and as such exposes [filtering]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/filtering-data/how-to-add-filtering-to-report%}), [grouping]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/grouping-data/how-to-add-groups-to-report%}), and [sorting]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/ordering-data/how-to-add-sorting-to-report%}).

The Report is the __Data Item__ at the highest hierarchical level. This means that it doesn't have a parent [data scope]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/expression-scope-%}), hence the `ReportItem.DataObject` [Global Object]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/global-objects%}) is undefined/null on its surface and cannot be used in the Filtering Rules and Grouping and Sorting [Expressions]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/overview%}). The _Expressions_ in the [Bindings]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/using-expressions/bindings%}) and [Conditional Formattings]({%slug telerikreporting/designing-reports/styling-reports/conditional-formatting%}) cannot use `Fields` and `ReportItem.DataObject` Global Objects for the same reason.

For more information on the specific structure of the Report item, refer to the article about the [report structure]({%slug report_structure_groups_sections%}).

## Key Features 

* [Settings and properties]({%slug report_item_properties_settings%})—The Report item provides specific properties for controlling the design-time and run-time behavior, and the general layout and functionality of the generated report documents.
* [Creating multi-column reports]({%slug telerikreporting/designing-reports/report-structure/barcode/barcode-types/supported-types%})—You can create reports divided into columns that are treated as logical pages rendered on the same physical page.
* [Creating page headers and footers]({%slug 2d_barcodes_overview%})—When you create new reports, they are generated with a page header section and a page footer section by default.
* [Creating report headers and footers]({%slug 2d_barcodes_overview%})—By default, new reports are created with no report headers or footers but you can add these sections if required.

## Next Steps

* [Getting Started with the Report Item]({%slug report_item_get_started%})
* [Page Headers and Footers]({%slug telerikreporting/designing-reports/report-structure/how-to/how-to-add-remove-page-header---footer-sections%})
* [Report Headers and Footers]({%slug telerikreporting/designing-reports/report-structure/how-to/how-to-add-remove-report-header---footer-sections%})
* [Creating Multi-Column Reports]({%slug telerikreporting/designing-reports/report-structure/how-to/how-to-create-a-multi-column-report%})
* [Demo Page for Telerik Reporting](https://demos.telerik.com/reporting)
* [Knowledge Base Section](/knowledge-base)

## See Also

* [Telerik Reporting Homepage](https://www.telerik.com/products/reporting)
* [Reporting Forums](https://www.telerik.com/forums/reporting)
* [Reporting Blog](https://www.telerik.com/blogs/tag/reporting)
* [Reporting Videos](https://www.telerik.com/videos/reporting)
* [Reporting Roadmap](https://www.telerik.com/support/whats-new/reporting/roadmap)
* [Reporting Pricing](https://www.telerik.com/purchase/individual/reporting)
* [Reporting Training](https://learn.telerik.com/learn/course/external/view/elearning/19/reporting-report-server-training)
