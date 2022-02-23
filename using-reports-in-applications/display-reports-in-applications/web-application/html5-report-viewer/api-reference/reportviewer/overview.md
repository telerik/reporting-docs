---
title: ReportViewer Overview
page_title: Overview 
description: Overview
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/overview
tags: overview
published: True
position: 0
---

# ReportViewer Overview

The *ReportViewer* object is created through the [jQuery.fn.telerik_ReportViewer()]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/report-viewer-initialization%}) function: 
    
````js
$("#reportViewer1").telerik_ReportViewer({
  serviceUrl: "../api/reports/",
  templateUrl: 'src/templates/telerikReportViewerTemplate-x.x.x.x.html',
  reportSource: { report: "product catalog.trdp", parameters: {CultureID: "en"} }
});
````

where x.x.x.x is the version of the HTML5 ReportViewer/Telerik Reporting (e.g. 16.0.22.119).

To get the *ReportViewer* object from the target HTML element: 
    
````js
var reportViewer = $("#reportViewer1").data("telerik_ReportViewer");
````

## Report viewer methods

The report viewer exposes several methods through which you can change the report viewer state or alter it. For more information please check the complete list of [report viewer methods]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/overview%}). 

## Report viewer commands

The report viewer exposes a set of commands, which can be invoked from both the report viewer toolbar or from code. Most of those commands require the report viewer to be in a valid state, i.e. to have a valid and rendered report. Those include printing, exporting, page navigation, etc. A few commands - history navigation and refresh report - do not require a rendered report. 

The commands are implemented by using a command object with three methods - for more information regarding the methods and their use please check the [command API Reference]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/command%}). All available commands are exposed through the report viewers commands property - for a complete list of the commands check the [commands property]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/properties/commands%}). 

## Report viewer events

Along the commands the report viewer also exposes events, which are fired at different moments during the lifecycle of the report viewer. For a complete list of the events please check [telerikReportViewer Namespace, Events]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/telerikreportviewer-namespace/events%}). Each event passes the Event object as an argument and for each event the [jQuery's event.data](https://api.jquery.com/event.data/) is used and e.data.sender is set to be the report viewer. This gives you the option to check the state of the report viewer in each event through the methods exposed - for example the view mode or the current page displayed. You can also check the state of a certain command through its enabled() and checked() (for toggle buttons) methods. 

Checking the command state is especially useful if you are implementing your own custom toolbar - in such case if you do not rely on [data attributes]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/data-attributes%}) you can attach an event handler to the updateUi event. Then in your event handler you can set the states of your custom buttons by checking the states of each report viewer command. 

Additionally you can change the state of the report viewer in your event handler if needed through the report viewer methods or commands. Consider the following snippet: 
    
````js
// $(handler) is jQuery's shorthand for $(document).ready(handler)
$(function () {
  var reportViewer = $("#reportViewer1").data("telerik_ReportViewer");
  reportViewer.commands.goToPage.exec(2);
  reportViewer.scale(1.5);
});
````

