---
title: parametersAreaVisible
page_title: parametersAreaVisible property
description: "Determines whether the viewer's parameters area is displayed if any parameter editor exists."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/options/parametersareavisible
published: True
reportingArea: React
---

# The `parametersAreaVisible` option of the React Report Viewer

Determines whether the viewer's parameters area is displayed if any parameter editor exists.

## Type

`boolean`

## Examples

````JavaScript
// Hide parameters area
<TelerikReportViewer
  serviceUrl="api/reports/"
  reportSource={{ report: "Dashboard.trdp" }}
  parametersAreaVisible={false}
/>
````

## See Also

* [Options Overview]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/options/overview%})
* [persistSession]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/options/persistsession%})
* [printMode]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/options/printmode%})

