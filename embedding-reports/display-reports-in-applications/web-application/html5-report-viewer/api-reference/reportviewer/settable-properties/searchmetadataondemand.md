---
title: searchMetadataOnDemand
page_title: searchMetadataOnDemand property
description: "Determines whether the search metadata will be delivered on demand (true) or by default (false)."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/settable-properties/searchmetadataondemand
published: True
reportingArea: HTML5
---

# searchMetadataOnDemand

Determines whether the search metadata will be delivered on demand (true) or by default (false).

## Type

`boolean`

## Examples

````JavaScript
// Enable search metadata on demand$("#reportViewer1").telerik_ReportViewer({  serviceUrl: "api/reports/",  reportSource: { report: "Dashboard.trdp" },  searchMetadataOnDemand: true});
````

## See Also

* [HTML5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%})
