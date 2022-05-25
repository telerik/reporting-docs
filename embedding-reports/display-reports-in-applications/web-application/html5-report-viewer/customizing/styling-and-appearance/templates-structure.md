---
title: Templates Structure
page_title: Templates Structure 
description: Templates Structure
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/customizing/styling-and-appearance/templates-structure
tags: templates,structure
published: True
position: 2
---

# Templates Structure

The article elaborates on the templates included in the HTML template file of the HTML5 Report Viewer.

By default the HTML5 Report Viewer does not have any content; instead the entire markup is provided through templates.

All report viewer templates are supplied by a single page markup:

* __ReportViewer/templates/telerikReportViewerTemplate-x.x.x.x.html__ 

where x.x.x.x is the version of the HTML5 ReportViewer/Telerik Reporting (ex. 8.1.14.618).

The templates are recognized by well-known identifiers supplied by the __id__ attribute. These  templates are: 

* __trv-report-viewer__ - provides the base viewer markup. The default viewer template contains a pages area, a document map, a parameters area, a large menu when displaying on desktop browsers and a small menu and a side menu optimized for the mobile browsers; 

* __trv-parameter__ - provides the default markup for the report parameter editors including the title, error message box and the editor itself; 

* __trv-parameter-editor-available-values-multiselect__ - the default editor for report parameters of any type with specified available values and an option to select more than one value; 

* __trv-parameter-editor-available-values__ - the default editor for report parameters of any type with specified available values and limited to selecting a single value; 

* __trv-parameter-editor-datetime__ - the default editor for date-time report parameters; 

* __trv-parameter-editor-text__ - the default editor for string report parameters; 

* __trv-parameter-editor-number__ - the default editor for numeric (integer, float) report parameters; 

* __trv-parameter-editor-boolean__ - the default editor for boolean report parameters; 

* __trv-parameter-editor-multivalue__ - the default editor for report parameters of any type that allows users to input one or more values; 

* __trv-pages-area-kendo-tooltip__ - provides the default markup for the tooltips content; 

All templates depend on the HTML5 Report Viewer and Kendo UI css styles for the styling and appearance. 

> The default templates distributed with the Telerik HTML5 Report Viewer provide a base (reference) implementation of the report viewer’s content that can be modified according to the needs.
