---
title: Overview
page_title: Methods of the HTML5 Report Viewer at a Glance
description: Learn more about the Methods of the HTML5 Report Viewer and how you may use them to customize its appearance and functionality.
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/overview
tags: overview
published: True
reportingArea: HTML5
position: 0
---

<style>
table th:first-of-type {
	width: 35%;
}
table th:nth-of-type(2) {
	width: 65%;
}
</style>

# Methods of the HTML5 Report Viewer

| Method | Description |
| ------ | ------ |
| [accessibilityKeyMap]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/accessibilitykeymap%})|Gets or sets the accessibility key map for keyboard navigation.<br>Allows customization of keyboard shortcuts for accessibility features.|
| [authenticationToken]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/authenticationtoken%})|Sets the authentication token. Used for service requests.|
| [bind]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/bind%})|Binds event handlers to the specified event.|
| [clearReportSource]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/clearreportsource%})|Clears the current reportSource from the viewer's internal state and its persisted session in the browser.<br>Called in order to force the viewer to respect the newly set reportSource on a server postback.|
| [currentPage]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/currentpage%})|Gets the viewer’s current page that is displayed.|
| [dispose]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/dispose%})|Disposes the viewer instance, cleaning up resources and event handlers.<br>After calling this method, the viewer instance should not be used.<br>Stops sending keep alive requests to the server, if keep client alive was enabled.|
| [getReportParameters]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/getreportparameters%})|Returns an object with properties, the names of which are the report parameters’ IDs, and values - the report parameters’ values. The values of multivalue parameters include their display and value members.|
| [isReportAutoRun]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/isreportautorun%})|Returns whether auto-run is enabled for the report (i.e., whether the report runs automatically when parameters change).|
| [pageCount]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/pagecount%})|Gets the total page count of the viewer’s currently displayed report.|
| [pageMode]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/pagemode%})|Gets or sets the page mode (e.g., Single Page or Continuous Scroll).|
| [parametersAreaVisible]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/parametersareavisible%})|Shows or hides the parameters area in the viewer UI.|
| [printMode]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/printmode%})|Gets or sets the print mode for the viewer.|
| [refreshReport]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/refreshreport%})|Refreshes the currently loaded report.<br>Forces the viewer to reload the report from the server. Optionally ignores the cache.|
| [reportSource]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/reportsource%})|Gets or sets the report source for the viewer.<br>When called with an argument, sets the report source<br>When called without arguments, gets the current report source - report and parameters. The viewer's report source is updated dynamically as the users navigate between reports and change parameter values.|
| [scale]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/scale%})|Gets or sets the scale and scale mode for the viewer.|
| [unbind]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/unbind%})|Unbinds an event handler from a viewer event.|
| [viewMode]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/viewmode%})|Gets or sets the view mode of the viewer (e.g., Interactive or Print Preview).|

