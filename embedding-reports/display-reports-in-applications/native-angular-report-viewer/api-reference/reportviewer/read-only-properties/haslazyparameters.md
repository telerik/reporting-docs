---
title: hasLazyParameters
page_title: hasLazyParameters property
description: "Gets whether the current report has parameters that have AutoRefresh disabled. true if at least one parameter has AutoRefresh disabled, false otherwise."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/read-only-properties/haslazyparameters
published: True
reportingArea: NativeAngular
---

# The `hasLazyParameters` read-only property of the Native Angular Report Viewer

Gets whether the current report has parameters that have AutoRefresh disabled. true if at least one parameter has AutoRefresh disabled, false otherwise.

## Type

`boolean`

## Examples

````typescript
if (this.viewer.hasLazyParameters) {
 console.log("This report has lazy parameters.");
}
````



