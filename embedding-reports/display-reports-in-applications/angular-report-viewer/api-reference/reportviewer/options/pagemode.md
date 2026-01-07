---
title: pageMode
page_title: pageMode property
description: "Sets if the report is displayed in single page or continuous scroll mode. - \"SINGLE_PAGE\" - Only one page loaded in viewport. Pages are changed using the page navigation buttons in the viewer's toolbar. - \"CONTINUOUS_SCROLL\" - Multiple pages can be loaded in viewport. Pages can be changed using the scroll wheel, by dragging the scroll bar, or by clicking the page navigation buttons in the viewer's toolbar."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/options/pagemode
published: True
reportingArea: AngularWrapper
---

# The `pageMode` option of the Angular Report Viewer

Sets if the report is displayed in single page or continuous scroll mode.

- "SINGLE_PAGE" - Only one page loaded in viewport. Pages are changed using the page navigation buttons in the viewer's toolbar.
- "CONTINUOUS_SCROLL" - Multiple pages can be loaded in viewport. Pages can be changed using the scroll wheel, by dragging the scroll bar, or by clicking the page navigation buttons in the viewer's toolbar.

## Type

`string`

## Examples

````html
<tr-viewer
  [pageMode]="pageMode">
</tr-viewer>
````

````typescript
pageMode: string = "SINGLE_PAGE";
````

## See Also

* [Options Overview]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/options/overview%})
* [parameterEditors]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/options/parametereditors%})
* [parameters]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/options/parameters%})

