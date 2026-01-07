---
title: initialPageAreaImageUrl
page_title: initialPageAreaImageUrl property
description: "The image URL for the PageArea background image. Used only when the parameter values are missing or invalid. The image should be in PNG, GIF, or JPG file format."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/options/initialpageareaimageurl
published: True
reportingArea: React
---

# The `initialPageAreaImageUrl` option of the React Report Viewer

The image URL for the PageArea background image. Used only when the parameter values are missing or invalid. The image should be in PNG, GIF, or JPG file format.

## Type

`string`

## Examples

````JavaScript
// Set a background image for empty page area
<TelerikReportViewer
  serviceUrl="api/reports/"
  reportSource={{ report: "Dashboard.trdp" }}
  initialPageAreaImageUrl="/images/reportBackground.png"
/>
````

## See Also

* [Options Overview]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/options/overview%})
* [keepClientAlive]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/options/keepclientalive%})
* [pageMode]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/options/pagemode%})

