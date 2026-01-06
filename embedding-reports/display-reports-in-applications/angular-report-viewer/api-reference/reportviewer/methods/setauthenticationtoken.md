---
title: setAuthenticationToken
page_title: The setAuthenticationToken method of the Angular Report Viewer explained
description: "Learn more about the setAuthenticationToken method of the Angular Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/methods/setauthenticationtoken
tags: setauthenticationtoken
published: True
reportingArea: AngularWrapper
position: 10
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

# The `setAuthenticationToken` method of the Angular Report Viewer

Sets the authentication token for REST service requests. The current ReportViewer object

## Parameters

| Parameter | Type | Optional | Description |
|-----------|------|----------|-------------|
| token | `string` | No | The authentication token string |

## Example

    ````typescript
viewer.setAuthenticationToken("your-authentication-token");
````
