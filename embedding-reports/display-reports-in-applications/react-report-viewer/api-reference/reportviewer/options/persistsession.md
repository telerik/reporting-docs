---
title: persistSession
page_title: persistSession property
description: "Sets whether the viewer's client session is persisted between page refreshes (e.g., postback). The session is stored in the browser's sessionStorage and is available for the duration of the page session. Default value is false."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/options/persistsession
published: True
reportingArea: React
---

# The `persistSession` option of the React Report Viewer

Sets whether the viewer's client session is persisted between page refreshes (e.g., postback). The session is stored in the browser's sessionStorage and is available for the duration of the page session. Default value is false.

## Type

`boolean`

## Examples

````JavaScript
// Enable session persistence<TelerikReportViewer  serviceUrl="api/reports/"  reportSource={{ report: "Dashboard.trdp" }}  persistSession={true}  id="myConstantId"/>
````

