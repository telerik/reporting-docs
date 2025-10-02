---
title: Templates Structure
page_title: Templates Structure of the HTML5 Report Viewer Explained in details
description: "Learn more about the detailed structure of the HTML5 Report Viewer Templates in Telerik Reporting which is the basic template file."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/customizing/styling-and-appearance/templates-structure
tags: templates,structure
published: True
reporting_area: HTML5
position: 2
previous_url: /html5-report-viewer-templates
---

# Templates Structure of the HTML5 Report Viewer

The article elaborates on the templates included in the HTML template file of the HTML5 Report Viewer.

By default, the HTML5 Report Viewer does not have any content; instead, the entire markup is provided through templates.

All report viewer templates are supplied by a single-page markup - `C:\Program Files (x86)\Progress\Telerik Reporting {{site.suiteversion}}/Html5/ReportViewer/templates/telerikReportViewerTemplate-{{site.buildversion}}.html`

The templates are recognized by well-known identifiers supplied by the `id` attribute. These templates are:

* __trv-report-viewer__ - provides the base viewer markup. The default viewer template contains a page area, a document map, a parameters area, a large menu when displaying on desktop browsers, and a small menu and a side menu optimized for mobile browsers;
* __trv-parameter__ - provides the default markup for the report parameter editors including the title, error message box, and the editor itself;
* __trv-parameter-editor-available-values-multiselect__ - the default ListView editor for report parameters of any type with specified available values and an option to select more than one value;
* __trv-parameter-editor-available-values-multiselect-combo__ - the default ComboBox editor for report parameters of any type with specified available values and an option to select more than one value;
* __trv-parameter-editor-available-values__ - the default ListView editor for report parameters of any type with specified available values and limited to selecting a single value;
* __trv-parameter-editor-available-values-combo__ - the default ComboBox editor for report parameters of any type with specified available values and limited to selecting a single value;
* __trv-parameter-editor-datetime__ - the default editor for date-time report parameters;
* __trv-parameter-editor-text__ - the default editor for string report parameters;
* __trv-parameter-editor-number__ - the default editor for numeric (integer, float) report parameters;
* __trv-parameter-editor-boolean__ - the default editor for boolean report parameters;
* __trv-parameter-editor-multivalue__ - the default editor for report parameters of any type that allows users to input one or more values;
* __trv-pages-area-kendo-tooltip__ - provides the default markup for the tooltip's content;
* __trv-search-dialog__ - provides the default template for the search dialog;
* __trv-send-email-dialog__ - provides the default template for the send email dialog;

All templates depend on the HTML5 Report Viewer and the [Kendo UI Sass Themes](https://docs.telerik.com/kendo-ui/styles-and-layout/sass-themes/overview) for the styling and appearance.

> The default templates distributed with the Telerik HTML5 Report Viewer provide a base (reference) implementation of the report viewer’s content that can be modified according to the needs.

## See Also

* [HTML5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%})
