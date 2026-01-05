---
title: pageMode
page_title: The pageMode method of the HTML5 Report Viewer explained
description: "Learn more about the pageMode method of the HTML5 Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/pagemode
tags: pagemode
published: True
reportingArea: HTML5
position: 5
---

# The `pageMode` method of the HTML5 Report Viewer

Gets or sets the page mode (e.g., Single Page or Continuous Scroll).

## Example

````JavaScript
// Get the current page modevar viewer = $("#reportViewer1").data("telerik_ReportViewer");var pageMode = viewer.pageMode();
````

````JavaScript
// Set the page mode to Single Pagevar viewer = $("#reportViewer1").data("telerik_ReportViewer");viewer.pageMode(telerikReportViewer.PageModes.SINGLE_PAGE);
````


## See Also

* [HTML5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%})

