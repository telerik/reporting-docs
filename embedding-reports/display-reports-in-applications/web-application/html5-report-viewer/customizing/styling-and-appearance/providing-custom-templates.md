---
title: Providing Custom Templates
page_title: Providing Custom Templates for the HTML5 Report Viewer Explained
description: "Learn how to use custom HTML templates with the Telerik HTML5 Report Viewer to change its layout, appearance, and initialization behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/customizing/styling-and-appearance/providing-custom-templates
tags: providing,custom,templates
published: True
reportingArea: HTML5
components: [html5, general]
position: 3
previous_url: /html5-report-viewer-customizing-providing-template
---

# Providing Custom Templates

Use a custom HTML template to change the layout and appearance of the Telerik HTML5 Report Viewer.

After you create a custom HTML template, set the viewer's `templateUrl` property to its location:

{{source=CodeSnippets\Blazor\Docs\JavaScript\Html5ReportViewerCustomTemplate.js region=Html5ReportViewerCustomTemplate}}

The HTML template file is a page that contains HTML document fragments nested in `template` tags. The report parameter template has the following structure:

{{source=CodeSnippets\Blazor\Docs\ReportViewers\Html5ViewerTemplates.html region=Html5ViewerParameterTemplate}}

The widget loads the templates during initialization. This asynchronous network operation sends an `HTTP GET` request for the template HTML and can take an unpredictable amount of time. The widget is not functional until the template loads successfully.

To determine when the report viewer is loaded, provide an event handler for the `telerik_ReportViewer` widget's [ready() event](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/events#ready):

{{source=CodeSnippets\Blazor\Docs\JavaScript\Html5ReportViewerCustomTemplate.js region=Html5ViewerCustomTemplateReadyEvent}}


## See Also

* [HTML5 Report Viewer overview](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview)
