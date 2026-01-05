---
title: reportSource
page_title: reportSource property
description: "Specifies the report and initial report parameter values to be displayed. The report property can be a relative path to a physical file (TRDP/TRDX/TRBP) or an assembly qualified name for type definitions. The ReportSourceOptions type should be imported from '@progress/telerik-common-report-viewer'."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/options/reportsource
published: True
reportingArea: NativeAngular
---

# The `reportSource` option of the Native Angular Report Viewer

Specifies the report and initial report parameter values to be displayed. The report property can be a relative path to a physical file (TRDP/TRDX/TRBP) or an assembly qualified name for type definitions. The ReportSourceOptions type should be imported from '@progress/telerik-common-report-viewer'.

## Type

`any`

## Examples

````html
<reporting-angular-viewer
  [reportSource]="reportSource">
</reporting-angular-viewer>
````

````typescript
reportSource: ReportSourceOptions = {
 report: 'Dashboard.trdx', // or '{Category}/{ReportName}' when connected to a Report Server
 parameters: { ReportYear: 2004 }
};
````

