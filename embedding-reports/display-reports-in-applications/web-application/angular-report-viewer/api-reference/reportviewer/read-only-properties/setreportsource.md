---
title: setReportSource
page_title: setReportSource property
description: "Sets the report source (report and parameters). Automatically reloads the report into the view. The current ReportViewer object"
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/read-only-properties/setreportsource
published: True
reportingArea: AngularWrapper
---

# setReportSource

Sets the report source (report and parameters). Automatically reloads the report into the view. The current ReportViewer object

## Type

`any`

## Examples

````typescript
viewer.setReportSource({
  report: 'NewReport.trdp',
  parameters: { param1: 'value1' }
});
````

## See Also

* [Angular Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/angular-report-viewer-overview%})
