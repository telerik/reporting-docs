---
title: getReportParameters
page_title: getReportParameters property
description: "Returns an immutable array of name-value objects representing the current evaluated report parameters. Array containing the name and value of each report parameter"
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/read-only-properties/getreportparameters
published: True
reportingArea: AngularWrapper
---

# getReportParameters

Returns an immutable array of name-value objects representing the current evaluated report parameters. Array containing the name and value of each report parameter

## Type

`any`

## Examples

````typescript
const params = viewer.getReportParameters();
params.forEach(param => {
  console.log(`${param.name}: ${param.value}`);
});
````

## See Also

* [Angular Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/angular-report-viewer-overview%})
