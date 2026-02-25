---
title: Events
page_title: Events of the Blazor Report Viewer
description: Complete list of events available in the Blazor Report Viewer
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/events
tags: events
published: True
reportingArea: BlazorWrapper
position: 4
---

# Events of the Blazor Report Viewer

> The report viewer exposes two ways for binding event handlers to events. You may attach event handlers when you instantiate the report viewer, or after that, using the [bind]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/methods%}#bindasync) method.

## Error

Gets or sets the viewer's error event handler function name. Called when an error is thrown in the report viewer.


## ExportBegin

Gets or sets the viewer's exportBegin event handler function name. Occurs before exporting the report.


## ExportEnd

Gets or sets the viewer's exportEnd event handler function name. Occurs after exporting the report.


## InteractiveActionEnter

Gets or sets the viewer's interactiveActionEnter event handler function name. Occurs when the mouse cursor enters the area of an interactive action.


## InteractiveActionExecuting

Gets or sets the viewer's interactiveActionExecuting event handler function name. Occurs before an interactive action is executed, providing the ability to cancel the execution.


## InteractiveActionLeave

Gets or sets the viewer's interactiveActionLeave event handler function name. Occurs when the mouse cursor leaves the area of an interactive action.


## PageReady

Gets or sets the viewer's pageReady event handler function name. Occurs after a page of the report is ready.


## PrintBegin

Gets or sets the viewer's printBegin event handler function name. Occurs before printing the report.


## PrintEnd

Gets or sets the viewer's printEnd event handler function name. Occurs after printing the report.


## Ready

Gets or sets the viewer's ready event handler function name. Called when the viewer content has been loaded from the template and is ready to display reports or perform any other  operations on it. The function is executed in the context of the ReportViewer object that is available through the this object.


## RenderingBegin

Gets or sets the viewer's renderingBegin event handler function name. Occurs before rendering the report.


## RenderingEnd

Gets or sets the viewer's renderingEnd event handler function name. Occurs after rendering the report.


## SendEmailBegin

Gets or sets the viewer's sendEmailBegin event handler function name. Occurs before the report is exported and the e-mail message is sent.


## SendEmailEnd

Gets or sets the viewer's sendEmailEnd event handler function name. Occurs after the report is exported and before the e-mail message is sent.


## UpdateUi

Gets or sets the viewer's updateUi event handler function name. Occurs when the UI state of the viewer changes.


## ViewerToolTipOpening

Gets or sets the viewer's viewerToolTipOpening event handler function name. The event occurs before a tooltip is opened, providing the ability to cancel its opening.

