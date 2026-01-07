---
title: Telerik.ReportViewer.Blazor.ClientEventsOptions
page_title: Telerik.ReportViewer.Blazor.ClientEventsOptions Type
description: "Specifies the viewer's event options. Each option can be assigned an event handler name. The JavaScript API of the event handlers is available in  https://docs.telerik.com/reporting/html5-report-viewer-reportviewer-events-ready."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types/clienteventsoptions
published: True
reportingArea: BlazorWrapper
---

<style>
    table {
        display: grid;
        grid-template-columns: min-content min-content 1fr;
    }

    thead, tbody, tr {
        display: contents;
    }

    th,
    td:not(:last-child) {
        white-space: nowrap;
    }
</style>

# The `ClientEventsOptions` type of the Blazor Report Viewer

Specifies the viewer's event options. Each option can be assigned an event handler name. The JavaScript API of the event handlers is available in  https://docs.telerik.com/reporting/html5-report-viewer-reportviewer-events-ready.

## Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| Error | `System.String` | Gets or sets the viewer's error event handler function name.<br>Called when an error is thrown in the report viewer. |
| ExportBegin | `System.String` | Gets or sets the viewer's exportBegin event handler function name.<br>Occurs before exporting the report. |
| ExportEnd | `System.String` | Gets or sets the viewer's exportEnd event handler function name.<br>Occurs after exporting the report. |
| InteractiveActionEnter | `System.String` | Gets or sets the viewer's interactiveActionEnter event handler function name.<br>Occurs when the mouse cursor enters the area of an interactive action. |
| InteractiveActionExecuting | `System.String` | Gets or sets the viewer's interactiveActionExecuting event handler function name.<br>Occurs before an interactive action is executed, providing the ability to cancel the execution. |
| InteractiveActionLeave | `System.String` | Gets or sets the viewer's interactiveActionLeave event handler function name.<br>Occurs when the mouse cursor leaves the area of an interactive action. |
| PageReady | `System.String` | Gets or sets the viewer's pageReady event handler function name.<br>Occurs after a page of the report is ready. |
| PrintBegin | `System.String` | Gets or sets the viewer's printBegin event handler function name.<br>Occurs before printing the report. |
| PrintEnd | `System.String` | Gets or sets the viewer's printEnd event handler function name.<br>Occurs after printing the report. |
| Ready | `System.String` | Gets or sets the viewer's ready event handler function name.<br>Called when the viewer content has been loaded from the template and is ready to display reports or perform any other <br>operations on it. The function is executed in the context of the ReportViewer object that is available through the this object. |
| RenderingBegin | `System.String` | Gets or sets the viewer's renderingBegin event handler function name.<br>Occurs before rendering the report. |
| RenderingEnd | `System.String` | Gets or sets the viewer's renderingEnd event handler function name.<br>Occurs after rendering the report. |
| SendEmailBegin | `System.String` | Gets or sets the viewer's sendEmailBegin event handler function name.<br>Occurs before the report is exported and the e-mail message is sent. |
| SendEmailEnd | `System.String` | Gets or sets the viewer's sendEmailEnd event handler function name.<br>Occurs after the report is exported and before the e-mail message is sent. |
| UpdateUi | `System.String` | Gets or sets the viewer's updateUi event handler function name.<br>Occurs when the UI state of the viewer changes. |
| ViewerToolTipOpening | `System.String` | Gets or sets the viewer's viewerToolTipOpening event handler function name.<br>The event occurs before a tooltip is opened, providing the ability to cancel its opening. |

## See Also

* [Types Overview]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types/overview%})
* [BindAsync]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/events/bindasync%})
* [ClearReportSourceAsync]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/options/clearreportsourceasync%})
* [GetAccessibilityKeyMapAsync]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/options/getaccessibilitykeymapasync%})

