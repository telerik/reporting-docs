---
title: Telerik.ReportViewer.Blazor.Event
page_title: Telerik.ReportViewer.Blazor.Event Enumeration
description: "Specifies the available built-in events that can be used with Telerik.ReportViewer.Blazor.ReportViewer.BindAsync and Telerik.ReportViewer.Blazor.ReportViewer.UnbindAsync."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/enumerations/event
published: True
reportingArea: BlazorWrapper
---

<style>
    table {
        display: grid;
        grid-template-columns: min-content 1fr;
    }

    thead, tbody, tr {
        display: contents;
    }

    th {
        white-space: nowrap;
    }
</style>

# The `Event` enumeration of the Blazor Report Viewer

Specifies the available built-in events that can be used with [`BindAsync`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/methods/bindasync%}) and [`UnbindAsync`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/methods/unbindasync%}).

## Values

| Value | Description |
| ------ | ------ |
| Error | Occurs when an error is thrown in the report viewer. |
| ExportBegin | Occurs before exporting the report. |
| ExportEnd | Occurs after exporting the report. |
| InteractiveActionEnter | Occurs when the mouse cursor enters the area of an interactive action. |
| InteractiveActionExecuting | Occurs before an interactive action is executed, providing the ability to cancel the execution. |
| InteractiveActionLeave | Occurs when the mouse cursor leaves the area of an interactive action. |
| PageReady | Occurs after a page of the report is ready. |
| PrintBegin | Occurs before printing the report. |
| PrintEnd | Occurs after printing the report. |
| Ready | Occurs when the viewer content has been loaded from the template and is ready to display reports or perform any other <br>operations on it. The function is executed in the context of the ReportViewer object that is available through this object. |
| RenderingBegin | Occurs before rendering the report. |
| RenderingEnd | Occurs after rendering the report. |
| SendEmailBegin | Occurs before the report is exported and the e-mail message is sent. |
| SendEmailEnd | Occurs after the report is exported and before the e-mail message is sent. |
| UpdateUi | Occurs when the UI state of the viewer changes. |
| ViewerTooltipOpening | The event occurs before a tooltip is opened, providing the ability to cancel its opening. |

