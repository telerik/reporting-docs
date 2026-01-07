---
title: Telerik.ReportViewer.Blazor.CommandOptions
page_title: Telerik.ReportViewer.Blazor.CommandOptions Type
description: "Exposes the available report viewer commands."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types/commandoptions
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

# The `CommandOptions` type of the Blazor Report Viewer

Exposes the available report viewer commands.

## Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| Export | [`Telerik.ReportViewer.Blazor.ExportCommand`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types/exportcommand%}) | Gets the Export command. Execute to export the report in the respective format. |
| GoToFirstPage | [`Telerik.ReportViewer.Blazor.Command`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types/command%}) | Gets the GoToFirstPage command. Execute to go to the first page of the report. |
| GoToLastPage | [`Telerik.ReportViewer.Blazor.Command`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types/command%}) | Gets the GoToLastPage command. Execute to go to the last page of the report. |
| GoToNextPage | [`Telerik.ReportViewer.Blazor.Command`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types/command%}) | Gets the GoToNextPage command. Execute to go to the next page of the report. |
| GoToPage | [`Telerik.ReportViewer.Blazor.GoToPageCommand`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types/gotopagecommand%}) | Gets the GoToPage command. Execute to go to a specific page of the report. |
| GoToPrevPage | [`Telerik.ReportViewer.Blazor.Command`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types/command%}) | Gets the GoToPrevPage command. Execute to go to the previous page of the report. |
| HistoryBack | [`Telerik.ReportViewer.Blazor.Command`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types/command%}) | Gets the HistoryBack command. Execute to go back to the previously rendered report from history. |
| HistoryForward | [`Telerik.ReportViewer.Blazor.Command`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types/command%}) | Gets the HistoryForward command. Execute to go forward to the previously rendered report from history. |
| Print | [`Telerik.ReportViewer.Blazor.Command`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types/command%}) | Gets the Print command. Execute to print the report. |
| Refresh | [`Telerik.ReportViewer.Blazor.Command`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types/command%}) | Gets the Refresh command. Execute to refresh the report. |
| ToggleDocumentMap | [`Telerik.ReportViewer.Blazor.Command`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types/command%}) | Gets the ToggleDocumentMap command. Execute to show or hide the document map. |
| ToggleParametersArea | [`Telerik.ReportViewer.Blazor.Command`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types/command%}) | Gets the ToggleParametersArea command. Execute to show or hide the parameters area. |
| TogglePrintPreview | [`Telerik.ReportViewer.Blazor.Command`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types/command%}) | Gets the TogglePrintPreview command. Execute to toggle between Print Preview and Interactive view modes. |
| ToggleSearchDialog | [`Telerik.ReportViewer.Blazor.Command`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types/command%}) | Gets the ToggleSearchDialog command. Execute to show or hide the search dialog. |
| ToggleSideMenu | [`Telerik.ReportViewer.Blazor.Command`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types/command%}) | Gets the ToggleSideMenu command. Execute to show or hide the side menu. |
| ToggleZoomMode | [`Telerik.ReportViewer.Blazor.Command`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types/command%}) | Gets the ToggleZoomMode command. Execute to change the zoom mode of the report. |
| Zoom | [`Telerik.ReportViewer.Blazor.ZoomCommand`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types/zoomcommand%}) | Gets the Zoom command. Execute to zoom the report with a specified ratio. |
| ZoomIn | [`Telerik.ReportViewer.Blazor.Command`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types/command%}) | Gets the ZoomIn command. Execute to zoom the report in. |
| ZoomOut | [`Telerik.ReportViewer.Blazor.Command`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types/command%}) | Gets the ZoomOut command. Execute to zoom the report out. |

## See Also

* [Types Overview]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types/overview%})
* [BindAsync]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/methods/bindasync%})
* [ClearReportSourceAsync]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/methods/clearreportsourceasync%})
* [GetAccessibilityKeyMapAsync]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/methods/getaccessibilitykeymapasync%})

