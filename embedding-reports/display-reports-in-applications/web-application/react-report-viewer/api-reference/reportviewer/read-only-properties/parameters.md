---
title: parameters
page_title: parameters property
description: "Allows the user to define parameter options for the report parameters."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/read-only-properties/parameters
published: True
reportingArea: React
---

# parameters

Allows the user to define parameter options for the report parameters.

## Type

`ParametersOptions`

## Examples

````JavaScript
// Configure parameter editors<TelerikReportViewer  serviceUrl="api/reports/"  reportSource={{ report: "Dashboard.trdp" }}  parameters={{    editors: {      singleSelect: "COMBO_BOX",      multiSelect: "LIST_VIEW"    }  }}/>
````

## See Also

* [React Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/react-report-viewer-overview%})
