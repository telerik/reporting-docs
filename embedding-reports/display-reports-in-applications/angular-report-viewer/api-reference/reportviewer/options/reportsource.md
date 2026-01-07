---
title: reportSource
page_title: reportSource property
description: "Sets the report and initial report parameter values to be displayed. Available properties: - report (string) - A string that represents a report on the back end. - parameters (JSON object) - An object with name/value properties equal to the report parameters’ names and values used in the report definition."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/options/reportsource
published: True
reportingArea: AngularWrapper
---

# The `reportSource` option of the Angular Report Viewer

Sets the report and initial report parameter values to be displayed.
Available properties:

- report (string) - A string that represents a report on the back end.
- parameters (JSON object) - An object with name/value properties equal to the report parameters’ names and values used in the report definition.

## Type

`any`

## Examples

````html
<tr-viewer
  [reportSource]="reportSource">
</tr-viewer>
````

````typescript
reportSource: any ={
  report: 'Report1.trdp', // or '{Category}/{ReportName}' when connected to a Report Server
  parameters: {
    param1: 'value1',
    param2: 3,
    param3: true
  }
}
````

## See Also

* [Options Overview]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/options/overview%})
* [scale]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/options/scale%})
* [scaleMode]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/options/scalemode%})

