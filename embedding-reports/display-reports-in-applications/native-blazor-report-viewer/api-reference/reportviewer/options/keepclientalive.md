---
title: KeepClientAlive
page_title: KeepClientAlive property
description: "Gets or sets a value indicating whether the client will be kept alive.   When set to true a request will be sent to the server to stop the client from expiring, determined by the ClientSessionTimeout server configuration    When set to false, the client will be left to be expired"
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/options/keepclientalive
published: True
reportingArea: NativeBlazor
---

# The `KeepClientAlive` option of the Native Blazor Report Viewer

Gets or sets a value indicating whether the client will be kept alive.

When set to true a request will be sent to the server to stop the client from expiring, determined by the ClientSessionTimeout server configuration

When set to false, the client will be left to be expired

## Type

`System.Boolean`

## Examples

````C#
<ReportViewer 
    KeepClientAlive="true">
</ReportViewer>
````

## See Also

* [Native Blazor Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/overview%})
