---
title: authenticationToken
page_title: The authenticationToken method of the HTML5 Report Viewer explained
description: "Learn more about the authenticationToken method of the HTML5 Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/authenticationtoken
tags: authenticationtoken
published: True
reportingArea: HTML5
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

    th,
    td:not(:last-child) {
        white-space: nowrap;
    }
</style>

# The `authenticationToken` method of the HTML5 Report Viewer

Sets the authentication token. Used for service requests.

## Parameters

| Parameter | Type | Optional | Description |
|-----------|------|----------|-------------|
| token | `string` | Yes | The authentication token to set. |

## Example

````JavaScript
// Set the authentication token for the viewer
var viewer = $("#reportViewer1").data("telerik_ReportViewer");
viewer.authenticationToken("YOUR_AUTH_TOKEN");
````

## See Also

* [Methods Overview]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/overview%})
* [bind]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/bind%})
* [clearReportSource]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/clearreportsource%})

