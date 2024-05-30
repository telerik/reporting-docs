---
title: Properties and Settings
page_title: Properties and Settings of the Report Definition
description: "Learn what the properties and settings of the Report item are and how to use them to control the design-time and run-time behavior when working with Telerik Reporting."
slug: report_item_properties_settings
tags: telerik, reporting, report, item, properties, settings
published: True
position: 1
---

# Major Properties and Settings of Report Item

The Report item contains several specific properties that control the design-time and run-time behavior as well as the general layout and functionality of the generated report documents.

## DocumentName

The [`DocumentName`](/api/telerik.reporting.report#Telerik_Reporting_Report_DocumentName) specifies the default document name when exporting from a Report Viewer. The Standalone Report Designer won't use `DocumentName` when exporting. It will rather use the Report `Name`.

The `DocumentName` may be set to an [Expression]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/overview%}) containing [Report Parameters]({%slug telerikreporting/designing-reports/connecting-to-data/report-parameters/overview%}) and other [Gloabal Objects]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/global-objects%}). The DataSource fields are not accessible at this Report level and cannot be used - see [Expression Scope]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/expression-scope-%}) for more details.

## Paging

The Report item delivers the `PageSettings` and `PageNumberingStyle` settings for controlling the paging functionality.

### PageSettings

The [`PageSettings`](/api/Telerik.Reporting.Drawing.PageSettings) determine the layout of the report document in physical page formats like PDF and when printed on paper. This includes the page size, watermarks, [number of columns]({%slug telerikreporting/designing-reports/report-structure/how-to/how-to-create-a-multi-column-report%}), and so on.

The `PageSettings` are entirely respected in physical (hard) pagination formats, whereas some of them are ignored in soft pagination formats. The difference is explained in the article on [interactive and print layout]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/interactive-vs.-print-layout%}).

### PageNumberingStyle

The [`PageNumberingStyle`](/api/Telerik.Reporting.Report#Telerik_Reporting_Report_PageNumberingStyle) property is related only to the [paging of report books]({%slug telerikreporting/designing-reports/report-book/report-book-paging%}) and determines whether to restart the page count with each report.

## Report Parameters

The [Report parameters]({%slug telerikreporting/designing-reports/connecting-to-data/report-parameters/overview%}) are [global objects]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/global-objects%}) that can be used all over the Report. Their main application is for filtering the report data and can also be used for passing external information to the Report and for other purposes.

For more detailed information, refer to the following articles:

* [Adding Report Parameters]({%slug telerikreporting/designing-reports/connecting-to-data/report-parameters/how-to-add-report-parameters%})
* [Using Report Parameters in Expressions]({%slug telerikreporting/designing-reports/connecting-to-data/report-parameters/using-report-parameters-in-expressions%})
* [Using Multi-Value Parameters]({%slug telerikreporting/designing-reports/connecting-to-data/report-parameters/using-multivalue-parameters%})
* [Cascading Parameters with Applied Filtering on Report Level]({%slug telerikreporting/designing-reports/connecting-to-data/report-parameters/how-to-cascade-parameters-with-applied-filtering-on-report-level%})
* [Cascading Parameters with Applied Filtering on Data Source Level]({%slug telerikreporting/designing-reports/connecting-to-data/report-parameters/how-to-cascade-parameters-with-applied-filtering-on-data-source-level%})

## Rendering and Processing

The Report item exposes a set of properties that allow you to control some aspects of its processing and rendering.

* `SkipBlankPages`&mdash; As of [R1 2021 SP1 (15.0.21.224)](https://www.telerik.com/support/whats-new/reporting/release-history/progress-telerik-reporting-r1-2021-sp1-15-0-21-224), you can indicate to the Reporting engine whether to ignore the pages with non-significant content by using the [`SkipBlankPages`](/api/Telerik.Reporting.Report.html#Telerik_Reporting_Report_SkipBlankPages) property. By default, `SkipBlankPages` is `True`.

	For example, `SkipBlankPages` may be kept `True` to remove the empty pages due to horizontal page breaks. For more information, refer to the articles on [horizontal paging]({%slug telerikreporting/designing-reports/rendering-and-paging/understanding-pagination%}#horizontal-paging) and on [skipping blank pages in the rendered report]({%slug telerikreporting/designing-reports/rendering-and-paging/understanding-rendering-behaviors%}#skip-blank-pages-in-the-rendered-report).

* `RuntimeSettings`&mdash; As of [R2 2021 (15.1.21.512)](https://www.telerik.com/support/whats-new/reporting/release-history/progress-telerik-reporting-r2-2021-15-1-21-512), you can specify [device information settings]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-export-formats/overview%}) per particular report as part of its definition by configuring the [`RuntimeSettings`](/api/Telerik.Reporting.Report#Telerik_Reporting_Report_RuntimeSettings) report property.

	Apart from setting the export parameters for a particular extension, `RuntimeSettings` allows you to hide it and change its description when listed to the end-user.

* `ReportEngineSettings`&mdash; As of [R3 2022 SP1 (16.2.22.1109)](https://www.telerik.com/support/whats-new/reporting/release-history/progress-telerik-reporting-r3-2022-sp1-16-2-22-1109), you can set the property [CacheDefinitionProperties](/api/Telerik.Reporting.ReportEngineSettings#Telerik_Reporting_ReportEngineSettings_CacheDefinitionProperties) per particular report as part of its definition by configuring it as an element of the [`ReportEngineSettings`](/api/Telerik.Reporting.Report#Telerik_Reporting_Report_ReportEngineSettings) report property.

	The available values are described in the API Reference in [Enum CacheDefinitionProperties](/api/Telerik.Reporting.CacheDefinitionProperties). Setting the property to `Yes`/`No` would force the Reporting engine to enable/disable the property for the specific report. Selecting `Default` would let the Reporting engine use the 'cacheDefinitionProperties' key in the 'processing' element from the application configuration file - [processing Element]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/processing-element%}).

* `Localizable`&mdash;To start localizing the report, set the `Localizable` property to `True`. For more information about the localization procedure, refer to the article on [localizing reports]({%slug telerikreporting/designing-reports/localizing-reports%}).

	> If at any point the `Localizable` property is set to `False`, all resource files are deleted and the report property values are filled with the currently selected language values.

## Styling and Design

The Report item exposes a set of properties that allow you to control styling and other design-time-related processes.

* `StyleSheet`&mdash; Enables you to create custom styles through a built-in styling model that is similar to CSS. You can assign these styles by using CSS selectors such as `Type`, `Attribute`, `Style`, and `Descendent`.

	For more information about the process, refer to the following articles:

	+ [Using Styles to Customize Reports]({%slug telerikreporting/designing-reports/styling-reports/using-styles-to-customize-reports%})
	+ [Creating Style Rules]({%slug telerikreporting/designing-reports/styling-reports/creating-style-rules%})
	+ [Understanding Style Selectors]({%slug telerikreporting/designing-reports/styling-reports/understanding-style-selectors%})
	+ [Style Inheritance and Overriding]({%slug telerikreporting/designing-reports/styling-reports/style-inheritance-and-overriding%})

* `ExternalStyleSheets`&mdash; Imports StyleSheets previously created and stored in XML files. For more information, refer to the article on [exporting and reusing stylesheets]({%slug telerikreporting/designing-reports/styling-reports/exporting-and-reusing-style-sheets%}).

* `UnitOfMeasure`&mdash; Specifies the default unit of measure for the report. All newly created report items will have their locations, sizes, and so on in this [`UnitType`](/api/Telerik.Reporting.Drawing.UnitType). For new reports, the unit of measure is automatically determined based on the machine's regional settings - if the current machine uses metric culture, the default unit of measure will be set to *cm*, otherwise - *inch*.

* `SnapGridSize`&mdash; Controls the step of the `Rulers` in the [Standalone Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/overview%}#major-ui-elements-in-the-standalone-report-designer) and in the [Visual Studio Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/visual-studio-report-designer/overview%}).

## See Also

* [Getting Started with the Report Item]({%slug report_item_get_started%})
* [Page Headers and Footers]({%slug telerikreporting/designing-reports/report-structure/how-to/how-to-add-remove-page-header---footer-sections%})
* [Report Headers and Footers]({%slug telerikreporting/designing-reports/report-structure/how-to/how-to-add-remove-report-header---footer-sections%})
* [Creating Multi-Column Reports]({%slug telerikreporting/designing-reports/report-structure/how-to/how-to-create-a-multi-column-report%})
