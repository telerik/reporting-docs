---
title: Overview
page_title: Report Item Overview 
description: "Learn more about the Telerik Reporting Report Item."
slug: report_item
tags: telerik, reporting, report, items, item, overview
published: True
position: 0
---

# Report Item Overview

The `Report` report item is a special item that hosts the rest of the report items grouped in report sections. It has a special structure explained in the [Report Structure]({%slug report_structure_groups_sections%}) article. The `Report` is also a special [Data Item]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/overview%}) and as such exposes [Filtering]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/filtering-data/how-to-add-filtering-to-report%}), [Grouping]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/grouping-data/how-to-add-groups-to-report%}) and [Sorting]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/ordering-data/how-to-add-sorting-to-report%}).

The `Report` item has also a list of specific properties that define the general layout and functionality of the generated report documents. This article elaborates on these specifics that distinguish the `Report` from the rest of the report items.

## Page Settings

The [`PageSettings`](/api/Telerik.Reporting.Drawing.PageSettings) determine the layout of the report document in physical page formats like PDF and when printed on paper. This includes the page size, watermarks, [number of columns]({%slug telerikreporting/designing-reports/report-structure/how-to/how-to-create-a-multi-column-report%}), etc. The PageSettings are entirely respected in physical/hard pagination formats, whereas some of them are ignored in soft pagination formats. The difference is explained in the article [Interactive vs. Print Layout]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/interactive-vs.-print-layout%}).

The property [`PageNumberingStyle`](/api/Telerik.Reporting.Report#Telerik_Reporting_Report_PageNumberingStyle) is related only to [Report Book Paging]({%slug telerikreporting/designing-reports/report-book/report-book-paging%}).

## Report Parameters

The [Report Parameters]({%slug telerikreporting/designing-reports/connecting-to-data/report-parameters/overview%}) are [Global Objects]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/global-objects%}) that can be used all over the Report. Their main application is for filtering the reaport data. They can be used also for passing external information to the Report and other purposes. More detailed information may be found in the following resources:

 * [How to Add Report Parameters]({%slug telerikreporting/designing-reports/connecting-to-data/report-parameters/how-to-add-report-parameters%})

 * [Using Report Parameters in Expressions]({%slug telerikreporting/designing-reports/connecting-to-data/report-parameters/using-report-parameters-in-expressions%})

 * [Using Multivalue Parameters]({%slug telerikreporting/designing-reports/connecting-to-data/report-parameters/using-multivalue-parameters%})

 * [How to Cascade Parameters with applied filtering on Report level]({%slug telerikreporting/designing-reports/connecting-to-data/report-parameters/how-to-cascade-parameters-with-applied-filtering-on-report-level%})

 * [How to Cascade Parameters with applied filtering on data source level]({%slug telerikreporting/designing-reports/connecting-to-data/report-parameters/how-to-cascade-parameters-with-applied-filtering-on-data-source-level%})

## Rendering and Processing Settings

The Report item exposes several properties that let you control some aspects of its processing and rendering.

 * __SkipBlankPages__

	Starting with [R1 2021 SP1 (15.0.21.224)](https://www.telerik.com/support/whats-new/reporting/release-history/progress-telerik-reporting-r1-2021-sp1-15-0-21-224), you can tell the Reporting engine whether to ignore the pages with non-significant content through the report property [SkipBlankPages](/api/Telerik.Reporting.Report.html#Telerik_Reporting_Report_SkipBlankPages). The default value is `True`.

	For example, the property may be kept True to remove the empty pages due to horizontal page brakes - see [Understanding Pagination - Horizontal Paging]({%slug telerikreporting/designing-reports/rendering-and-paging/understanding-pagination%}#horizontal-paging).

	More details may be found in the article section [Skip Blank Pages in the Rendered Report]({%slug telerikreporting/designing-reports/rendering-and-paging/understanding-rendering-behaviors%}#skip-blank-pages-in-the-rendered-report).

 * __RuntimeSettings__

	Starting with [R2 2021 (15.1.21.512)](https://www.telerik.com/support/whats-new/reporting/release-history/progress-telerik-reporting-r2-2021-15-1-21-512), you can specify device information settings per particular report as part of its definition, configuring the [RuntimeSettings](/api/Telerik.Reporting.Report#Telerik_Reporting_Report_RuntimeSettings) report property.

	Besides setting the export parameters for particular extension, it allows hiding it and changing its description when listed to the end-user.

 * __Localizable__
 
	Set the property `Localizable` to `True` to start localizing the report. The localization procedure is explained in the article [Localizing Reports]({%slug telerikreporting/designing-reports/localizing-reports%}).

	> If at any point the Localizable property is set to `False` all the resource files are deleted and the report property values are filled with the currently selected language values.

## Style and Design Settings

These properties let you control the styling and other design-time related processes.

 * __StyleSheet__
 
	Enables you to create custom styles through a built-in styling model that is similar to CSS. You can assign these styles by using CSS selectors such as Type, Attribute, Style, and Descendent. The process is explained in details in the following articles:

	+ [Using Styles to Customize Reports]({%slug telerikreporting/designing-reports/styling-reports/using-styles-to-customize-reports%})

	+ [Creating Style Rules]({%slug telerikreporting/designing-reports/styling-reports/creating-style-rules%})

	+ [Understanding Style Selectors]({%slug telerikreporting/designing-reports/styling-reports/understanding-style-selectors%})

	+ [Style Inheritance and Overriding]({%slug telerikreporting/designing-reports/styling-reports/style-inheritance-and-overriding%})

 * __ExternalStyleSheets__
 
	You can use this Report property to import StyleSheets created previously and stored in XML files. See the article [Exporting and Reusing Style Sheets]({%slug telerikreporting/designing-reports/styling-reports/exporting-and-reusing-style-sheets%}) for details.

 * __UnitOfMeasure__
 
	Specifies the default unit of measure for the report. All newly created report items will have their locations, sizes, etc. in this [UnitType](/api/Telerik.Reporting.Drawing.UnitType).

 * __SnapGridSize__
 
	Controls the step of the `Rulers` in the [Standalone Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/overview%}#major-ui-elements-in-the-standalone-report-designer) and in the [Visual Studio Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/visual-studio-report-designer/overview%}).

## See Also

[Page Headers and Footers]({%slug telerikreporting/designing-reports/report-structure/how-to/how-to-add-remove-page-header---footer-sections%})

[Report Headers and Footers]({%slug telerikreporting/designing-reports/report-structure/how-to/how-to-add-remove-report-header---footer-sections%})

[Creating Multi-Column Reports]({%slug telerikreporting/designing-reports/report-structure/how-to/how-to-create-a-multi-column-report%})

[How to Add Report Parameters]({%slug telerikreporting/designing-reports/connecting-to-data/report-parameters/how-to-add-report-parameters%})

[Localizing Reports]({%slug telerikreporting/designing-reports/localizing-reports%})

[Using Styles to Customize Reports]({%slug telerikreporting/designing-reports/styling-reports/using-styles-to-customize-reports%})

[Standalone Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/overview%})

[Visual Studio Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/visual-studio-report-designer/overview%})

[Data Item]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/overview%})

[Filtering]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/filtering-data/how-to-add-filtering-to-report%})

[Grouping]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/grouping-data/how-to-add-groups-to-report%})

[Sorting]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/ordering-data/how-to-add-sorting-to-report%})
