---
title: Methods
page_title: Methods of the Blazor Report Viewer
description: Complete list of methods available in the Blazor Report Viewer
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/methods
tags: methods
published: True
reportingArea: BlazorWrapper
position: 1
---

# Methods of the Blazor Report Viewer

## BindAsync

Binds event handlers to the specified [`Telerik.ReportViewer.Blazor.Event`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/enumerations%}#event).

### Parameters

| Parameter | Type | Optional | Description |
|-----------|------|----------|-------------|
| eventName | [`Telerik.ReportViewer.Blazor.Event`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/enumerations%}#event) | No | - |
| eventHandlerName | `System.String` | No | - |

### Example

````C#
<ReportViewer @ref="reportViewer" />
<button @onclick="BindEvent">Bind Event Handler</button>

@code {
    ReportViewer reportViewer;
    async void BindEvent()
    {
        await reportViewer.BindAsync(Event.ExportBegin, "myExportBeginHandler");
    }
}
````


## ClearReportSourceAsync

Clears the current reportSource from the viewer internal state and from its persisted session in the browser.

### Example

````C#
<ReportViewer @ref="reportViewer" />
<button @onclick="ClearSource">Clear Report Source</button>

@code {
    ReportViewer reportViewer;
    async void ClearSource()
    {
        await reportViewer.ClearReportSourceAsync();
        // (Optional) Refresh the viewer in order to see the empty report area
        await reportViewer.RefreshReportAsync();
    }
}
````


## GetAccessibilityKeyMapAsync

Gets the current [`Telerik.ReportViewer.Blazor.AccessibilityKeyMap`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types%}#accessibilitykeymap), used when the report viewer is in accessible mode.

### Example

````C#
<ReportViewer @ref="reportViewer" />
<button @onclick="GetKeyMap">Get Accessibility Key Map</button>

@code {
    ReportViewer reportViewer;
    async void GetKeyMap()
    {
        var keyMap = await reportViewer.GetAccessibilityKeyMapAsync();
        // Use keyMap as needed
    }
}
````


## GetCurrentPageAsync

Gets the page number of the report page currently displayed in the viewer.

### Example

````C#
<ReportViewer @ref="reportViewer" />
<button @onclick="GetCurrentPage">Get Current Page</button>
<p>Current Page: @currentPage</p>

@code {
    ReportViewer reportViewer;
    int currentPage = 0;
    async void GetCurrentPage()
    {
        currentPage = await reportViewer.GetCurrentPageAsync();
        StateHasChanged();
    }
}
````


## GetPageCountAsync

Gets the total page count of the report displayed in the viewer.

### Example

````C#
<ReportViewer @ref="reportViewer" />
<button @onclick="GetPageCount">Get Page Count</button>
<p>Page Count: @pageCount</p>

@code {
    ReportViewer reportViewer;
    int pageCount = 0;
    async void GetPageCount()
    {
        pageCount = await reportViewer.GetPageCountAsync();
        StateHasChanged();
    }
}
````


## GetPageModeAsync

Gets the current [`Telerik.ReportViewer.Blazor.PageMode`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/enumerations%}#pagemode).

### Example

````C#
<ReportViewer @ref="reportViewer" />
<button @onclick="GetPageMode">Get Page Mode</button>
<p>Page Mode: @pageMode</p>

@code {
    ReportViewer reportViewer;
    PageMode pageMode;
    async void GetPageMode()
    {
        pageMode = await reportViewer.GetPageModeAsync();
        StateHasChanged();
    }
}
````


## GetReportParameters

Gets the report viewer's current parameters as a dictionary of parameter name and value pairs.

### Example

````C#
<ReportViewer @ref="reportViewer" />
<button @onclick="GetParameters">Get Report Parameters</button>

@code {
    ReportViewer reportViewer;
    async void GetParameters()
    {
        var parameters = await reportViewer.GetReportParameters();
        // Use parameters as needed
    }
}
````


## GetReportSourceAsync

Gets the current [`Telerik.ReportViewer.Blazor.ReportSourceOptions`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types%}#reportsourceoptions) containing the report identifier and report parameters values.

### Example

````C#
<ReportViewer @ref="reportViewer" />
<button @onclick="GetReportSource">Get Report Source</button>

@code {
    ReportViewer reportViewer;
    async void GetReportSource()
    {
        var reportSource = await reportViewer.GetReportSourceAsync();
        // Use reportSource as needed
    }
}
````


## GetScaleAsync

Gets the report viewer's scale factor.

### Example

````C#
<ReportViewer @ref="reportViewer" />
<button @onclick="GetScale">Get Scale</button>
<p>Scale: @scale</p>

@code {
    ReportViewer reportViewer;
    double scale = 0;
    async void GetScale()
    {
        scale = await reportViewer.GetScaleAsync();
        StateHasChanged();
    }
}
````


## GetScaleModeAsync

Gets the report viewer's [`Telerik.ReportViewer.Blazor.ScaleMode`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/enumerations%}#scalemode).

### Example

````C#
<ReportViewer @ref="reportViewer" />
<button @onclick="GetScaleMode">Get Scale Mode</button>
<p>Scale Mode: @scaleMode</p>

@code {
    ReportViewer reportViewer;
    ScaleMode scaleMode;
    async void GetScaleMode()
    {
        scaleMode = await reportViewer.GetScaleModeAsync();
        StateHasChanged();
    }
}
````


## GetViewModeAsync

Gets the current [`Telerik.ReportViewer.Blazor.ViewMode`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/enumerations%}#viewmode).

### Example

````C#
<ReportViewer @ref="reportViewer" />
<button @onclick="GetViewMode">Get View Mode</button>
<p>View Mode: @viewMode</p>

@code {
    ReportViewer reportViewer;
    ViewMode viewMode;
    async void GetViewMode()
    {
        viewMode = await reportViewer.GetViewModeAsync();
        StateHasChanged();
    }
}
````


## RefreshReportAsync

Reloads/refreshes the current report.

### Example

````C#
<ReportViewer @ref="reportViewer" />
<button @onclick="RefreshReport">Refresh Report</button>

@code {
    ReportViewer reportViewer;
    async void RefreshReport()
    {
        await reportViewer.RefreshReportAsync();
    }
}
````


## SetAccessibilityKeyMapAsync

Sets the [`Telerik.ReportViewer.Blazor.AccessibilityKeyMap`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types%}#accessibilitykeymap), used when the report viewer is in accessible mode.

### Parameters

| Parameter | Type | Optional | Description |
|-----------|------|----------|-------------|
| keyMap | [`Telerik.ReportViewer.Blazor.AccessibilityKeyMap`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types%}#accessibilitykeymap) | No | - |

### Example

````C#
<ReportViewer @ref="reportViewer" />
<button @onclick="SetKeyMap">Set Accessibility Key Map</button>

@code {
    ReportViewer reportViewer;
    async void SetKeyMap()
    {
        var keyMap = new AccessibilityKeyMap();
        await reportViewer.SetAccessibilityKeyMapAsync(keyMap);
    }
}
````


## SetAuthenticationTokenAsync

Sets the authentication token.

### Parameters

| Parameter | Type | Optional | Description |
|-----------|------|----------|-------------|
| token | `System.String` | No | - |

### Example

````C#
<ReportViewer @ref="reportViewer" />
<button @onclick="SetToken">Set Authentication Token</button>

@code {
    ReportViewer reportViewer;
    async void SetToken()
    {
        await reportViewer.SetAuthenticationTokenAsync("your-new-token");
    }
}
````


## SetPageModeAsync

Sets the [`Telerik.ReportViewer.Blazor.PageMode`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/enumerations%}#pagemode) and automatically reloads the current report (if any) into the new view.

### Parameters

| Parameter | Type | Optional | Description |
|-----------|------|----------|-------------|
| pageMode | [`Telerik.ReportViewer.Blazor.PageMode`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/enumerations%}#pagemode) | No | - |

### Example

````C#
<ReportViewer @ref="reportViewer" />
<button @onclick="SetPageMode">Set Page Mode to Single Page</button>

@code {
    ReportViewer reportViewer;
    async void SetPageMode()
    {
        await reportViewer.SetPageModeAsync(PageMode.SinglePage);
    }
}
````


## SetReportSourceAsync

Sets the [`Telerik.ReportViewer.Blazor.ReportSourceOptions`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types%}#reportsourceoptions) and reloads the report.

### Parameters

| Parameter | Type | Optional | Description |
|-----------|------|----------|-------------|
| reportSourceOptions | [`Telerik.ReportViewer.Blazor.ReportSourceOptions`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types%}#reportsourceoptions) | No | - |

### Example

````C#
<ReportViewer @ref="reportViewer" />
<button @onclick="SetReportSource">Set New Report Source</button>

@code {
    ReportViewer reportViewer;
    async void SetReportSource()
    {
        var newReportSource = new ReportSourceOptions("NewReport.trdp");
        await reportViewer.SetReportSourceAsync(newReportSource);
        // Refresh the report viewer to display the new report
        await reportViewer.RefreshReportAsync();
    }
}
````


## SetScaleAsync

Sets the report viewer's scale factor.

### Parameters

| Parameter | Type | Optional | Description |
|-----------|------|----------|-------------|
| scale | `System.Double` | No | - |

### Example

````C#
<ReportViewer @ref="reportViewer" />
<button @onclick="SetScale">Set Scale to 150%</button>

@code {
    ReportViewer reportViewer;
    async void SetScale()
    {
        await reportViewer.SetScaleAsync(1.5);
    }
}
````


## SetScaleModeAsync

Sets the report viewer's [`Telerik.ReportViewer.Blazor.ScaleMode`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/enumerations%}#scalemode).

### Parameters

| Parameter | Type | Optional | Description |
|-----------|------|----------|-------------|
| scaleMode | [`Telerik.ReportViewer.Blazor.ScaleMode`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/enumerations%}#scalemode) | No | - |

### Example

````C#
<ReportViewer @ref="reportViewer" />
<button @onclick="SetScaleMode">Set Scale Mode to Fit Page Width</button>

@code {
    ReportViewer reportViewer;
    async void SetScaleMode()
    {
        await reportViewer.SetScaleModeAsync(ScaleMode.FitPageWidth);
    }
}
````


## SetViewModeAsync

Sets the [`Telerik.ReportViewer.Blazor.ViewMode`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/enumerations%}#viewmode) and automatically reloads the current report (if any) into the new view.

### Parameters

| Parameter | Type | Optional | Description |
|-----------|------|----------|-------------|
| viewMode | [`Telerik.ReportViewer.Blazor.ViewMode`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/enumerations%}#viewmode) | No | - |

### Example

````C#
<ReportViewer @ref="reportViewer" />
<button @onclick="SetViewMode">Set View Mode to Print Preview</button>

@code {
    ReportViewer reportViewer;
    async void SetViewMode()
    {
        await reportViewer.SetViewModeAsync(ViewMode.PrintPreview);
    }
}
````


## UnbindAsync

Unbinds all event handlers from the specified [`Telerik.ReportViewer.Blazor.Event`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/enumerations%}#event) including anonymous ones.

### Parameters

| Parameter | Type | Optional | Description |
|-----------|------|----------|-------------|
| eventName | [`Telerik.ReportViewer.Blazor.Event`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/enumerations%}#event) | No | - |

### Example

````C#
<ReportViewer @ref="reportViewer" />
<button @onclick="UnbindEvent">Unbind All Event Handlers</button>

@code {
    ReportViewer reportViewer;
    async void UnbindEvent()
    {
        await reportViewer.UnbindAsync(Event.ExportBegin);
    }
}
````


## UnbindAsync

Unbinds event handlers from the specified [`Telerik.ReportViewer.Blazor.Event`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/enumerations%}#event).

### Parameters

| Parameter | Type | Optional | Description |
|-----------|------|----------|-------------|
| eventName | [`Telerik.ReportViewer.Blazor.Event`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/enumerations%}#event) | No | - |
| eventHandlerName | `System.String` | No | - |

### Example

````C#
<ReportViewer @ref="reportViewer" />
<button @onclick="UnbindEvent">Unbind Event Handler</button>

@code {
    ReportViewer reportViewer;
    async void UnbindEvent()
    {
        await reportViewer.UnbindAsync(Event.ExportBegin, "myExportBeginHandler");
    }
}
````

