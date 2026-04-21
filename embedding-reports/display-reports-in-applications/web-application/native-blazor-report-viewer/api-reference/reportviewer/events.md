---
title: Events
page_title: Events of the Native Blazor Report Viewer
description: Complete list of events available in the Native Blazor Report Viewer
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/events
tags: events
published: True
reportingArea: NativeBlazor
position: 4
---

# Events of the Native Blazor Report Viewer

## DocumentMapVisibleChanged

Gets or sets a value for the callback that will be called when the value of DocumentMapVisible changes.

### Event Arguments

| Parameter | Type | Description |
|-----------|------|-------------|
| value | `bool` | The new value. |

### Example

```C#
<ReportViewer 
    DocumentMapVisibleChanged="@OnDocumentMapVisibleChanged">
</ReportViewer>

@code {
    private void OnDocumentMapVisibleChanged(bool visible)
    {
    }
}
```


## OnExportEnd

Event triggered when the export process has finished.

### Event Arguments

| Parameter | Type | Description |
|-----------|------|-------------|
| Format | `string` | Gets or sets the format of the exported report. |
| Handled | `bool` | Gets or sets a value indicating whether the export process should be handled manually. |
| Url | `string` | Represents the URL of the exported report in the ExportEnd event of the Telerik Report Viewer. |
| WindowOpenTarget | `string` | Represents the target for opening the export window in the Telerik Report Viewer. |

### Example

```C#
<ReportViewer 
    OnExportEnd="@OnExportEnd">
</ReportViewer>

@code {
    private void OnExportEnd(ExportEndEventArgs args)
    {
    }
}
```


## OnExportStart

Occurs when the export process is starting.

### Event Arguments

| Parameter | Type | Description |
|-----------|------|-------------|
| DeviceInfo | [`Telerik.ReportViewer.BlazorNative.DeviceInfo`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/types%}#deviceinfo) | Represents device information settings used during the report export process. |
| Format | `string` | Gets or sets the format the report should be exported to. |
| IsCancelled | `bool` | Gets or sets a value indicating whether the export operation has been canceled. |

### Example

```C#
<ReportViewer 
    OnExportStart="@OnExportStart">
</ReportViewer>

@code {
    private void OnExportStart(ExportStartEventArgs args)
    {
    }
}
```


## OnRenderingBegin

Occurs when the report rendering process begins, allowing for custom actions or logic to be executed prior to the rendering of the report.

### Example

```C#
<ReportViewer
    OnRenderingBegin="@OnRenderingBegin">
</ReportViewer>

@code {
    private void OnRenderingBegin(RenderingBeginEventArgs args)
    {
    }
}
```


## OnRenderingEnd

Occurs when the rendering of the report has ended. This event can be used to perform actions after the report has been rendered, such as updating the user interface or logging the rendering status.

### Example

```C#
<ReportViewer 
    OnRenderingEnd="@OnRenderingEnd">
</ReportViewer>

@code {
    private void OnRenderingEnd(RenderingEndEventArgs args)
    {
    }
}
```


## ParametersAreaVisibleChanged

Gets or sets a value for the callback that will be called when the value of ParametersAreaVisible changes.

### Event Arguments

| Parameter | Type | Description |
|-----------|------|-------------|
| value | `bool` | The new value. |

### Example

```C#
<ReportViewer 
    ParametersAreaVisibleChanged="@OnParametersAreaVisibleChanged">
</ReportViewer>

@code {
    private void OnParametersAreaVisibleChanged(bool visible)
    {
    }
}
```


## ReportSourceChanged

Gets or sets a value for the callback that will be called when the value of ReportSource changes.

### Event Arguments

| Parameter | Type | Description |
|-----------|------|-------------|
| Parameters | `System.Collections.Generic.IDictionary<string,object>` | Gets or sets an object with properties name/value equal to the report parameters names and values used in the report ... |
| Report | `string` | Gets or sets a string that uniquely identifies a report from the Reporting REST service or the Telerik Report Server.... |

### Example

```C#
<ReportViewer 
    ReportSourceChanged="@OnReportSourceChanged">
</ReportViewer>

@code {
    private void OnReportSourceChanged(ReportSourceOptions options)
    {
    }
}
```


## ScaleChanged

Gets or sets a value for the callback that will be called when the value of Scale changes.

### Event Arguments

| Parameter | Type | Description |
|-----------|------|-------------|
| value | `double` | The new value. |

### Example

```C#
<ReportViewer 
    ScaleChanged="@OnScaleChanged">
</ReportViewer>

@code {
    void OnScaleChanged(double scale)
    {
    }
}
```


## ScaleModeChanged

Gets or sets a value for the callback that will be called when the value of ScaleMode changes.

### Event Arguments

| Parameter | Type | Description |
|-----------|------|-------------|
| FitPage | [`Telerik.ReportViewer.BlazorNative.ScaleMode`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/enumerations%}#scalemode) | The whole report will fit on the page (will zoom in or out), regardless of its width and height. |
| FitPageWidth | [`Telerik.ReportViewer.BlazorNative.ScaleMode`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/enumerations%}#scalemode) | The report will be zoomed in or out so that the width of the screen and the width of the report match. |
| Specific | [`Telerik.ReportViewer.BlazorNative.ScaleMode`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/enumerations%}#scalemode) | Uses the scale to zoom in and out the report. |

### Example

```C#
<ReportViewer 
    ScaleModeChanged="@OnScaleModeChanged">
</ReportViewer>

@code {
    private void OnScaleModeChanged(ScaleMode mode)
    {
    }
}
```


## ViewModeChanged

Gets or sets a value for the callback that will be called when the value of ViewMode changes.

### Event Arguments

| Parameter | Type | Description |
|-----------|------|-------------|
| Interactive | [`Telerik.ReportViewer.BlazorNative.ViewMode`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/enumerations%}#viewmode) | Displays the report in its original width and height with no paging. Additionally interactivity is enabled. |
| PrintPreview | [`Telerik.ReportViewer.BlazorNative.ViewMode`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/enumerations%}#viewmode) | Displays the paginated report as if it is printed on paper. Interactivity is not enabled. |

### Example

```C#
<ReportViewer
    ViewModeChanged="@OnViewModeChanged">
</ReportViewer>

@code {
    private void OnViewModeChanged(ViewMode mode)
    {
    }
}
```

