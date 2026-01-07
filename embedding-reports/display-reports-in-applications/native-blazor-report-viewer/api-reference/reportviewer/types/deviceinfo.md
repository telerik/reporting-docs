---
title: Telerik.ReportViewer.BlazorNative.DeviceInfo
page_title: Telerik.ReportViewer.BlazorNative.DeviceInfo Type
description: "Represents the device information settings sent to the server by the viewer when the report rendering is initiated (the RenderingBegin and ExportStart events)."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/types/deviceinfo
published: True
reportingArea: NativeBlazor
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

# The `DeviceInfo` type of the Native Blazor Report Viewer

Represents the device information settings sent to the server by the viewer when the report rendering is initiated (the RenderingBegin and ExportStart events).

## Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| BasePath | `System.String` | Gets the base path. |
| ContentOnly | `System.Boolean` | A flag specifying whether the rendered document will be stripped down HTML without HTML, HEAD, Script and Body elements.<br>All of the HTML content will be placed in a div element.<br>The actions meta data and the page style will be served as resources.<br>The default value is false. |
| ContentTabIndex | `System.Int32` | Gets or sets the content tab index for the Blazor Report Viewer.<br>This property is used to specify the tab order of the report viewer's content, <br>allowing for better accessibility and navigation through keyboard input. |
| EnableAccessibility | `System.Boolean` | Gets or sets a value indicating whether accessibility features are enabled. |
| EnableSearch | `System.Boolean` | Enables or disables the search functionality. |
| ImmediatePrint | `System.Boolean` | Represents the device information related to immediate printing capabilities. |
| UseSVG | `System.Boolean` | A flag specifying whether to render Map and Graph items as SVG or Bitmap images.<br>The default value is true. |

## See Also

* [Types Overview]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/types/overview%})
* [ExecuteCommand]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/commands/executecommand%})
* [ExecuteCommand]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/commands/executecommand%})
* [GetReportParameters]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/options/getreportparameters%})

