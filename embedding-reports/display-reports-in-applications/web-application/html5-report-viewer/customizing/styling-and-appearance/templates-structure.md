---
title: Templates Structure
page_title: HTML5 Report Viewer Templates Structure
description: "Learn how the HTML5 Report Viewer templates are structured, where to find the template file, and what each template identifier controls."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/customizing/styling-and-appearance/templates-structure
tags: templates,structure
published: True
reportingArea: HTML5
components: [html5, general]
position: 2
previous_url: /html5-report-viewer-templates
---

# Templates Structure

The HTML5 Report Viewer uses predefined templates to provide its markup. This article describes the template file location and the purpose of each template identifier.

By default, the HTML5 Report Viewer does not have any content; instead, the entire markup is provided through templates.

All report viewer templates are supplied by a single-page markup file - `C:\Program Files (x86)\Progress\Telerik Reporting {{site.suiteversion}}\Html5\ReportViewer\templates\telerikReportViewerTemplate-{{site.buildversion}}.html`

The templates are recognized by well-known identifiers supplied by the `id` attribute. These templates are:

* __trv-report-viewer__ - the base viewer markup containing a page area, document map, parameters area, desktop menu, and mobile menus;
* __trv-parameter__ - the default markup for report parameter editors, including the title, error message box, and editor;
* __trv-parameter-editor-available-values-multiselect__ - the default ListView editor for report parameters with available values and multiple selections;
* __trv-parameter-editor-available-values-multiselect-combo__ - the default ComboBox editor for report parameters with available values and multiple selections;
* __trv-parameter-editor-available-values__ - the default ListView editor for report parameters with available values and a single selection;
* __trv-parameter-editor-available-values-combo__ - the default ComboBox editor for report parameters with available values and a single selection;
* __trv-parameter-editor-datetime__ - the default editor for date-time report parameters;
* __trv-parameter-editor-text__ - the default editor for string report parameters;
* __trv-parameter-editor-number__ - the default editor for numeric report parameters, such as integers and floats;
* __trv-parameter-editor-boolean__ - the default editor for Boolean report parameters;
* __trv-parameter-editor-multivalue__ - the default editor for report parameters of any type that accepts one or more values;
* __trv-pages-area-kendo-tooltip__ - the default markup for tooltip content;
* __trv-search-dialog__ - the default template for the search dialog;
* __trv-send-email-dialog__ - the default template for the send email dialog;

All templates depend on the HTML5 Report Viewer and the [Kendo UI Sass Themes](https://docs.telerik.com/kendo-ui/styles-and-layout/sass-themes/overview) for the styling and appearance.

>note The default templates distributed with the Telerik HTML5 Report Viewer provide a base (reference) implementation of the report viewer content that you can modify to meet your needs.

## See Also

* [HTML5 Report Viewer](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview)
