---
title: Events
page_title: Events of the React Report Viewer
description: "Find a list of all of the available React Report Viewer events. Understand the purpose of each event, using the provided descriptions."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/events
tags: react, report, viewer, events
published: True
reportingArea: React
position: 1
previous_url: /react-report-viewer-api-reference-events
---

<style>
table th:first-of-type {
    width: 28%;
}
table th:nth-of-type(2) {
    width: 72%;
}
</style>

# React Report Viewer Events

Below is a list of all available report viewer events.

| Parameter                      | Description                                                                                                                                                                                                                                                                                                          |
| ------------------------------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **ready**                      | _function();_ _optional;_ A callback function that will be called when the viewer content has been loaded from the template and is ready to display reports or perform any other operations on it. The function is executed in the context of the ReportViewer object that is available through the **this** object. |
| **exportBegin**                | _function(e, args);optional;_ A callback function that will be called prior to starting the report export command.                                                                                                                                                                                                   |
| **exportEnd**                  | _function(e, args);optional;_ A callback function that will be called when the exported document is ready for download, but prior to the actual downloading.                                                                                                                                                         |
| **printBegin**                 | _function(e, args);optional;_ A callback function that will be called prior to starting the print report command.                                                                                                                                                                                                    |
| **printEnd**                   | _function(e, args);optional;_ A callback function that will be called when the print document (Adobe PDF) is ready for download, but prior to being send to the printer.                                                                                                                                             |
| **renderingBegin**             | _function(e, args);optional;_ A callback function that will be called when the rendering of the report begins.                                                                                                                                                                                                       |
| **renderingEnd**               | _function(e, args);optional;_ A callback function that will be called when the rendering of the report ends.                                                                                                                                                                                                         |
| **sendEmailBegin**             | _function(e, args);optional;_ A callback function that will be called before the report is exported and the E-mail message is sent.                                                                                                                                                                                  |
| **sendEmailEnd**               | _function(e, args);optional;_ A callback function that will be called after the report is exported and before the E-mail message is sent.                                                                                                                                                                            |
| **updateUi**                   | _function(e);optional;_ A callback function that will be called every time the UI needs an update; can be used for changing the UI of the report viewer while interacting with the reports.                                                                                                                          |
| **pageReady**                  | _function(e, args);optional;_ A callback function that will be called every time a page from the report is rendered and ready for display.                                                                                                                                                                           |
| **error**                      | _function(e, args);optional;_ A callback function that will be called when an error occurs.                                                                                                                                                                                                                          |
| **interactiveActionExecuting** | _function(e, args);optional;_ A callback function that will be called before an interactive action is executed, providing the ability to cancel the execution.                                                                                                                                                       |
| **interactiveActionEnter**     | _function(e, args);optional;_ A callback function that will be called when the mouse cursor enters the area of an interactive action.                                                                                                                                                                                |
| **interactiveActionLeave**     | _function(e, args);optional;_ A callback function that will be called when the mouse cursor leaves the area of an interactive action.                                                                                                                                                                                |
| **viewerToolTipOpening**       | _function(e, args);optional;_ A callback function that will be called when a tooltip is being opened.                                                                                                                                                                                                                |

## See Also

[HTML5 Report Viewer Events]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/events/error(e,-args)%})
