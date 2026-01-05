---
title: getReportParameters
page_title: The getReportParameters method of the Angular Report Viewer explained
description: "Learn more about the getReportParameters method of the Angular Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/methods/getreportparameters
tags: getreportparameters
published: True
reportingArea: AngularWrapper
position: 20
---

# The `getReportParameters` method of the Angular Report Viewer

Returns an immutable array of name-value objects representing the current evaluated report parameters. Array containing the name and value of each report parameter

## Example

````typescript
const params = viewer.getReportParameters();
params.forEach(param => {
  console.log(`${param.name}: ${param.value}`);
});
````


## See Also

* [Angular Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/angular-report-viewer-overview%})

