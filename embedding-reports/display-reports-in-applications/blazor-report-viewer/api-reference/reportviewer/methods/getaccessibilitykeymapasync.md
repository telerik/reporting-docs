---
title: GetAccessibilityKeyMapAsync
page_title: The GetAccessibilityKeyMapAsync method of the Blazor Report Viewer explained
description: "Learn more about the GetAccessibilityKeyMapAsync method of the Blazor Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/methods/getaccessibilitykeymapasync
tags: getaccessibilitykeymapasync
published: True
reportingArea: BlazorWrapper
position: 3
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
</style>

# The `GetAccessibilityKeyMapAsync` method of the Blazor Report Viewer

Gets the current [`Telerik.ReportViewer.Blazor.AccessibilityKeyMap`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types/accessibilitykeymap%}), used when the report viewer is in accessible mode.

## Example

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
