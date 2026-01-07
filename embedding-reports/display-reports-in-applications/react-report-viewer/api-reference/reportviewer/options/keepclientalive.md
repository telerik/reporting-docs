---
title: keepClientAlive
page_title: keepClientAlive property
description: "Determines whether the client will be kept alive. Default value is true."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/options/keepclientalive
published: True
reportingArea: React
---

# The `keepClientAlive` option of the React Report Viewer

Determines whether the client will be kept alive. Default value is true.

## Type

`boolean`

## Examples

````JavaScript
// Keep client alive
<TelerikReportViewer
  serviceUrl="api/reports/"
  reportSource={{ report: "Dashboard.trdp" }}
  keepClientAlive={true}
/>
````

## See Also

* [Options Overview]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/options/overview%})
* [pageMode]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/options/pagemode%})
* [parameterEditors]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/options/parametereditors%})

