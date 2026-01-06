---
title: parameters
page_title: parameters property
description: "Allows the user to define parameter options for the report parameters."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/options/parameters
published: True
reportingArea: React
---

# The `parameters` option of the React Report Viewer

Allows the user to define parameter options for the report parameters.

## Type

[`ParametersOptions`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/types/parametersoptions%})

## Examples

````JavaScript
// Configure parameter editors<TelerikReportViewer  serviceUrl="api/reports/"  reportSource={{ report: "Dashboard.trdp" }}  parameters={{    editors: {      singleSelect: "COMBO_BOX",      multiSelect: "LIST_VIEW"    }  }}/>
````



