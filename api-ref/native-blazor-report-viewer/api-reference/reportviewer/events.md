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

### Example

````C#
<ReportViewer 
    DocumentMapVisibleChanged="@OnDocumentMapVisibleChanged">
</ReportViewer>

@code {
    private void OnDocumentMapVisibleChanged(bool visible)
    {
    }
}
````


## OnExportEnd

Event triggered when the export process has finished.

### Example

````C#
<ReportViewer 
    OnExportEnd="@OnExportEnd">
</ReportViewer>

@code {
    private void OnExportEnd(ExportEndEventArgs args)
    {
    }
}
````


## OnExportStart

Occurs when the export process is starting.

### Example

````C#
<ReportViewer 
    OnExportStart="@OnExportStart">
</ReportViewer>

@code {
    private void OnExportStart(ExportStartEventArgs args)
    {
    }
}
````


## OnRenderingBegin

Occurs when the report rendering process begins, allowing for custom actions or logic to be executed prior to the rendering of the report.

### Example

````C#
<ReportViewer
    OnRenderingBegin="@OnRenderingBegin">
</ReportViewer>

@code {
    private void OnRenderingBegin(RenderingBeginEventArgs args)
    {
    }
}
````


## OnRenderingEnd

Occurs when the rendering of the report has ended. This event can be used to perform actions after the report has been rendered, such as updating the user interface or logging the rendering status.

### Example

````C#
<ReportViewer 
    OnRenderingEnd="@OnRenderingEnd">
</ReportViewer>

@code {
    private void OnRenderingEnd(RenderingEndEventArgs args)
    {
    }
}
````


## ParametersAreaVisibleChanged

Gets or sets a value for the callback that will be called when the value of ParametersAreaVisible changes.

### Example

````C#
<ReportViewer 
    ParametersAreaVisibleChanged="@OnParametersAreaVisibleChanged">
</ReportViewer>

@code {
    private void OnParametersAreaVisibleChanged(bool visible)
    {
    }
}
````


## ReportSourceChanged

Gets or sets a value for the callback that will be called when the value of ReportSource changes.

### Example

````C#
<ReportViewer 
    ReportSourceChanged="@OnReportSourceChanged">
</ReportViewer>

@code {
    private void OnReportSourceChanged(ReportSourceOptions options)
    {
    }
}
````


## ScaleChanged

Gets or sets a value for the callback that will be called when the value of Scale changes.

### Example

````C#
<ReportViewer 
    ScaleChanged="@OnScaleChanged">
</ReportViewer>

@code {
    void OnScaleChanged(double scale)
    {
    }
}
````


## ScaleModeChanged

Gets or sets a value for the callback that will be called when the value of ScaleMode changes.

### Example

````C#
<ReportViewer 
    ScaleModeChanged="@OnScaleModeChanged">
</ReportViewer>

@code {
    private void OnScaleModeChanged(ScaleMode mode)
    {
    }
}
````


## ViewModeChanged

Gets or sets a value for the callback that will be called when the value of ViewMode changes.

### Example

````C#
<ReportViewer
    ViewModeChanged="@OnViewModeChanged">
</ReportViewer>

@code {
    private void OnViewModeChanged(ViewMode mode)
    {
    }
}
````

