---
title: String)()
page_title: The String)() method of the Blazor Report Viewer explained
description: "Learn more about the String)() method of the Blazor Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/methods/string)()
tags: string)
published: True
reportingArea: BlazorWrapper
position: 14
---

# The `String)()` method of the Blazor Report Viewer

Sets the authentication token.

Returns: the current *System.Threading.Tasks.ValueTask* object.

````JavaScript
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


## See Also

* [Blazor Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/overview%})

