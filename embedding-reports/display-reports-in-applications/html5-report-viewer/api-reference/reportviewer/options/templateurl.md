---
title: templateUrl
page_title: templateUrl property
description: "URL for a custom viewer template."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/options/templateurl
published: True
reportingArea: HTML5
---

# The `templateUrl` option of the HTML5 Report Viewer

URL for a custom viewer template.

## Type

`string`

## Examples

````JavaScript
// Use a custom template
$("#reportViewer1").telerik_ReportViewer({
  serviceUrl: "api/reports/",
  reportSource: { report: "Dashboard.trdp" },
  // URL for a custom viewer template
  templateUrl: "/templates/customViewer.html"
});
````

## See Also

* [Options Overview]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/options/overview%})
* [viewMode]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/options/viewmode%})
* [authenticationToken]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/options/authenticationtoken%})

