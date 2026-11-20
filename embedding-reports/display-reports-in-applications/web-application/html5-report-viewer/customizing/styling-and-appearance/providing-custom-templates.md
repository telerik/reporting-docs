---
title: Providing Custom Templates
page_title: Providing Custom Templates for the HTML5 Report Viewer Explained
description: "Learn how to provide custom HTML templates that change the layout and behavior of the Telerik Reporting HTML5 Report Viewer."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/customizing/styling-and-appearance/providing-custom-templates
tags: providing,custom,templates
published: True
reportingArea: HTML5
components: [html5, general]
position: 3
previous_url: /html5-report-viewer-customizing-providing-template
---

# Providing Custom Templates

Learn how to use a custom HTML template to change the layout of the HTML5 Report Viewer.

After you create a custom HTML template, set the `templateUrl` property to provide it to the HTML5 Report Viewer:

{{source=CodeSnippets\Blazor\Docs\JavaScript\Html5ReportViewerCustomTemplate.js region=Html5ReportViewerCustomTemplate}}

The HTML template is a page that contains HTML document fragments nested in `template` tags. For example, the report parameter template looks like this:

{{source=CodeSnippets\Blazor\Docs\ReportViewers\Html5ViewerTemplates.html region=Html5ViewerParameterTemplate}}

The templates load when the `telerik_ReportViewer` widget initializes. Loading the template requires an asynchronous `HTTP GET` request, so the load time can vary. The widget is unavailable until the template loads successfully.

To detect when the report viewer is loaded, provide an event handler for the `telerik_ReportViewer` widget's [ready event](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/events#ready):

{{source=CodeSnippets\Blazor\Docs\JavaScript\Html5ReportViewerCustomTemplate.js region=Html5ViewerCustomTemplateReadyEvent}}


## See Also

* [HTML5 Report Viewer](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview)
