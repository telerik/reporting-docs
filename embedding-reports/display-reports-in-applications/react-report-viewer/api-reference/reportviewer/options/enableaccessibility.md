---
title: enableAccessibility
page_title: enableAccessibility property
description: "Determines whether the viewer should provide support for accessibility features. Default value is false."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/options/enableaccessibility
published: True
reportingArea: React
---

# The `enableAccessibility` option of the React Report Viewer

Determines whether the viewer should provide support for accessibility features. Default value is false.

## Type

`boolean`

## Examples

````JavaScript
// Enable accessibility features
// Use with component: enableAccessibility={true}
<TelerikReportViewer
  serviceUrl="api/reports/"
  reportSource={{ report: "Dashboard.trdp" }}
  enableAccessibility={true}
/>
````

## See Also

* [Options Overview]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/options/overview%})
* [id]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/options/id%})
* [initialPageAreaImageUrl]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/options/initialpageareaimageurl%})

