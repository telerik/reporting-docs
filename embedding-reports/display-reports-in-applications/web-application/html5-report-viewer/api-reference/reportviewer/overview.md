---
title: ReportViewer Object
page_title: ReportViewer Object Explained
description: "Learn what is the ReportViewer Object in the Telerik Reporting HTML5 Report Viewer and how to use its functionality."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/overview
tags: overview
published: True
reporting_area: HTML5
position: 0
previous_url: /html5-report-viewer-reportviewer, /embedding-reports/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/
---

# ReportViewer Object Overview

The `ReportViewer` object is created through the [jQuery.fn.telerik_ReportViewer()]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/report-viewer-initialization%}) function:

````JavaScript
$("#reportViewer1").telerik_ReportViewer({
	serviceUrl: "api/reports/",
	reportSource: { 
		report: "Product Catalog.trdp", 
		parameters: {
			CultureID: "en"
		} 
	}
});
````

To get the `ReportViewer` object from the viewer's target HTML element:

````JavaScript
var reportViewer = $("#reportViewer1").data("telerik_ReportViewer");
````

## Report viewer methods

The report viewer exposes several methods through which you can change the report viewer state or alter it. For more information please check the complete list of [report viewer methods]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/overview%}).

## Report viewer commands

The report viewer exposes a set of commands, which can be invoked from both the report viewer toolbar or from code. Most of those commands require the report viewer to be in a valid state, i.e. to have a valid and rendered report. Those include printing, exporting, page navigation, etc. A few commands - history navigation and refresh report - do not require a rendered report.

The commands are implemented by using a command object with three methods - for more information regarding the methods and their use please check the [command API Reference]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/command%}). All available commands are exposed through the report viewers commands property - for a complete list of the commands check the [commands property]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/properties/commands%}).

## Report viewer events

Along with the commands, the report viewer also exposes events that are fired at different moments during the lifecycle of the report viewer. For a complete list of the available events, check [telerikReportViewer Namespace, Events]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/telerikreportviewer-namespace/events%}). 

For each event handler, an  `Event` object is passed as an argument, and the `e.data.sender` object is set to the report viewer instance. This allows you to check the state of the report viewer through the exposed methods - for example, its view mode or the current page displayed. You can also check the state of a certain command through its `enabled()` and `checked()` (for toggle buttons) methods.

Checking the command state is especially useful if you are implementing your own custom toolbar. In such a case, if you do not rely on [data attributes]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/data-attributes%}), you can attach an event handler to the `updateUi` event. Then, in your event handler, you can set the states of your custom buttons by checking the states of each report viewer command.

Additionally, you can change the state of the report viewer in your event handler if needed through the report viewer methods or commands. Consider the following snippet:

````JavaScript
// $(handler) is jQuery's shorthand for $(document).ready(handler)
$(function () {
	var reportViewer = $("#reportViewer1").data("telerik_ReportViewer");
	reportViewer.commands.goToPage.exec(2);
	reportViewer.scale(1.5);
});
````


## See Also

* [HTML5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%})
