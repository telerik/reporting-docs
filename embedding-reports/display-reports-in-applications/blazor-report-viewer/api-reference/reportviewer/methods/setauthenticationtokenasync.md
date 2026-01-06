---
title: SetAuthenticationTokenAsync
page_title: The SetAuthenticationTokenAsync method of the Blazor Report Viewer explained
description: "Learn more about the SetAuthenticationTokenAsync method of the Blazor Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/methods/setauthenticationtokenasync
tags: setauthenticationtokenasync
published: True
reportingArea: BlazorWrapper
position: 14
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

# The `SetAuthenticationTokenAsync` method of the Blazor Report Viewer

Sets the authentication token.

## Parameters

| Parameter | Type | Optional | Description |
|-----------|------|----------|-------------|
| token | `System.String` | No | - |

## Example

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

