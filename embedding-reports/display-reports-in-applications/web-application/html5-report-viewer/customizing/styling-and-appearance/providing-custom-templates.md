---
title: Providing Custom Templates
page_title: Providing Custom Templates for the HTML5 Report Viewer Explained
description: "Learn how to provide Custom Templates for changing the layout of the HTML5 Report Viewer in Telerik Reporting."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/customizing/styling-and-appearance/providing-custom-templates
tags: providing,custom,templates
published: True
reporting_area: HTML5
position: 3
previous_url: /html5-report-viewer-customizing-providing-template
---

# Providing Custom Templates for the HTML5 Report Viewer

The article elaborates on how to use a customized HTML template for the HTML5 Report Viewer.

Once you create a custom HTML template, you can provide it to the HTML5 Report through the `templateUrl` property:

{{source=CodeSnippets\BlazorAppSnippets\wwwroot\customize\AddTemplate.html}}

The HTML template file is essentially a page that includes HTML document fragments nested inside __template__ tags. For example, this is what the report parameter template looks like:

{{source=CodeSnippets\BlazorAppSnippets\wwwroot\customize\HtmlTemplate.html}}

The templates are loaded during the initialization of the __telerik_ReportViewer__ widget. Since this is an asynchronous network operation(the template HTML is loaded with an `HTTP GET` request) that takes an unpredictable amount of time, the widget is not functional until the template is loaded successfully. 

To find when the report viewer is loaded, provide an event handler function for the __telerik_ReportViewer__ widget's [ready()]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/events/ready()%}) event:

{{source=CodeSnippets\BlazorAppSnippets\wwwroot\customize\AddTemplateAndReadyEvent.html}}

## See Also

* [HTML5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%})
