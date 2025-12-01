---
title: AccessibilityKeyMap)()
page_title: The AccessibilityKeyMap)() method of the Blazor Report Viewer explained
description: "Learn more about the AccessibilityKeyMap)() method of the Blazor Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/methods/accessibilitykeymap)()
tags: accessibilitykeymap)
published: True
reportingArea: BlazorWrapper
position: 13
---

# The `AccessibilityKeyMap)()` method of the Blazor Report Viewer

Sets the <xref href="Telerik.ReportViewer.Blazor.AccessibilityKeyMap" data-throw-if-not-resolved="false"></xref>, used when the report viewer is in accessible mode.

Returns: the current *System.Threading.Tasks.ValueTask* object.

````JavaScript
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


## See Also

* [Blazor Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/overview%})

