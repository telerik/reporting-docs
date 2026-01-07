---
title: viewerContainerStyle
page_title: viewerContainerStyle property
description: "CSS styles to apply to the viewer container div."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/options/viewercontainerstyle
published: True
reportingArea: React
---

# The `viewerContainerStyle` option of the React Report Viewer

CSS styles to apply to the viewer container div.

## Type

`Object`

## Examples

````JavaScript
// Set container styles
<TelerikReportViewer
  serviceUrl="api/reports/"
  reportSource={{ report: "Dashboard.trdp" }}
  viewerContainerStyle={{
    width: '100%',
    height: '600px',
    border: '1px solid #ccc'
  }}
/>
````



