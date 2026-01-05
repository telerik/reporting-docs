---
title: clearReportSource
page_title: The clearReportSource method of the React Report Viewer explained
description: "Learn more about the clearReportSource method of the React Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/methods/clearreportsource
tags: clearreportsource
published: True
reportingArea: React
position: 18
---

# The `clearReportSource` method of the React Report Viewer

Clears the current reportSource from the viewer internal state and from its persisted session in the browser. Called in order to force the viewer to respect the newly set reportSource on the next postback.

## Example

````JavaScript
// Clear report source before setting a new onereportViewerRef.current.clearReportSource();reportViewerRef.current.setReportSource({ report: "NewReport" });
````


## See Also

* [React Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/react-report-viewer-overview%})

