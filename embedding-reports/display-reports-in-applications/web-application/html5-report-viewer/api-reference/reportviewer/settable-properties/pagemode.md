---
title: pageMode
page_title: pageMode property
description: "Gets or sets the page mode (e.g., Single Page or Continuous Scroll)."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/settable-properties/pagemode
published: True
reportingArea: HTML5
---

# pageMode

Gets or sets the page mode (e.g., Single Page or Continuous Scroll).

## Type

`string`

## Examples

````JavaScript
// Get the current page modevar viewer = $("#reportViewer1").data("telerik_ReportViewer");var pageMode = viewer.pageMode();
````

````JavaScript
// Set the page mode to Single Pagevar viewer = $("#reportViewer1").data("telerik_ReportViewer");viewer.pageMode(telerikReportViewer.PageModes.SINGLE_PAGE);
````

## See Also

* [HTML5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%})
