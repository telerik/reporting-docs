---
title: SetAccessibilityKeyMapAsync
page_title: The SetAccessibilityKeyMapAsync method of the Blazor Report Viewer explained
description: "Learn more about the SetAccessibilityKeyMapAsync method of the Blazor Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/methods/setaccessibilitykeymapasync
tags: setaccessibilitykeymapasync
published: True
reportingArea: BlazorWrapper
position: 13
---

<style>
    table {
        display: grid;
        grid-template-columns: min-content min-content min-content 1fr;
    }

    thead, tbody, tr {
        display: contents;
    }

    th {
        white-space: nowrap;
    }

    td:not(:last-child) {
        white-space: nowrap;
    }
</style>

# The `SetAccessibilityKeyMapAsync` method of the Blazor Report Viewer

Sets the [`Telerik.ReportViewer.Blazor.AccessibilityKeyMap`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types/accessibilitykeymap%}), used when the report viewer is in accessible mode.

## Parameters

| Parameter | Type | Optional | Description |
|-----------|------|----------|-------------|
| keyMap | `Telerik.ReportViewer.Blazor.AccessibilityKeyMap` | No | - |

## Example

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

