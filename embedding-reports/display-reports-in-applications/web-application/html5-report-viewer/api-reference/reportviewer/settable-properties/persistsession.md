---
title: persistSession
page_title: persistSession property
description: "Sets whether the viewer’s client session is persisted between page refreshes."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/settable-properties/persistsession
published: True
reportingArea: HTML5
---

# persistSession

Sets whether the viewer’s client session is persisted between page refreshes.

## Type

`boolean`

## Examples

````JavaScript
$("#reportViewer1").telerik_ReportViewer({  serviceUrl: "api/reports/",  reportSource: { report: "Dashboard.trdp" },  persistSession: true});
````

## See Also

* [HTML5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%})
