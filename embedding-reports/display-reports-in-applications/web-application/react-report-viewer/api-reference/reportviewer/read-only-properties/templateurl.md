---
title: templateUrl
page_title: templateUrl property
description: "Sets the address of the html page that contains the viewer templates. If omitted, the default template will be downloaded from the REST service. Note: Internally mapped to trvTemplateUrl property."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/read-only-properties/templateurl
published: True
reportingArea: React
---

# templateUrl

Sets the address of the html page that contains the viewer templates. If omitted, the default template will be downloaded from the REST service. Note: Internally mapped to trvTemplateUrl property.

## Type

`string`

## Examples

````JavaScript
// Use a custom template<TelerikReportViewer  serviceUrl="api/reports/"  reportSource={{ report: "Dashboard.trdp" }}  templateUrl="/templates/customViewer.html"/>
````

## See Also

* [React Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/react-report-viewer-overview%})
