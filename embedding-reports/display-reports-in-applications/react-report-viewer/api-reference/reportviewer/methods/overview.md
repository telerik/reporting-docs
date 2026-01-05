---
title: Overview
page_title: Methods of the React Report Viewer at a Glance
description: Learn more about the Methods of the React Report Viewer and how you may use them to customize its appearance and functionality.
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/methods/overview
tags: overview
published: True
reportingArea: React
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

# Methods of the React Report Viewer

| Method | Description |
| ------ | ------ |
| [bind]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/methods/bind%})|Binds an event handler to the specified event.|
| [clearReportSource]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/methods/clearreportsource%})|Clears the current reportSource from the viewer internal state and from its persisted session in the browser. Called in order to force the viewer to respect the newly set reportSource on the next postback.|
| [currentPage]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/methods/currentpage%})|Gets the viewer’s current page that is displayed.|
| [dispose]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/methods/dispose%})|Stops sending keep alive requests to the server, if keep client alive was enabled. Disposes the viewer instance, cleaning up resources and event handlers. Should be called when the component is unmounted or no longer needed.|
| [getAccessibilityKeyMap]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/methods/getaccessibilitykeymap%})|Gets the shortcut keys used when the report viewer is in accessible mode (enableAccessibility=true).|
| [getPageMode]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/methods/getpagemode%})|Gets the current page mode of the viewer.|
| [getReportParameters]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/methods/getreportparameters%})|Returns an immutable array of name-value objects representing the current evaluated report parameters.|
| [getReportSource]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/methods/getreportsource%})|Gets the current ReportSource - report and parameters.|
| [getScale]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/methods/getscale%})|Gets the viewer’s scale factor and scale mode.|
| [getViewMode]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/methods/getviewmode%})|Gets the current view mode.|
| [pageCount]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/methods/pagecount%})|Gets the total page count of viewer’s currently displayed report.|
| [refreshReport]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/methods/refreshreport%})|Reloads/refreshes the current report.|
| [setAccessibilityKeyMap]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/methods/setaccessibilitykeymap%})|Sets the shortcut keys used when the report viewer is in accessible mode. It is recommended to set the new key map when the report rendering is complete, because the accessibility routines require the report viewer template to be loaded.|
| [setAuthenticationToken]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/methods/setauthenticationtoken%})|Sets the authentication token.|
| [setPageMode]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/methods/setpagemode%})|Sets the page mode of the viewer.|
| [setReportSource]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/methods/setreportsource%})|Sets the report source - report and parameters. Automatically reloads the report (if any) into the view.|
| [setScale]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/methods/setscale%})|Sets the scale factor and scale mode.|
| [setViewMode]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/methods/setviewmode%})|Sets the view mode and automatically reloads the current report (if any) into the new view.|
| [unbind]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/methods/unbind%})|Unbinds an event handler from the specified event.|
| [unbindAll]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/methods/unbindall%})|Unbinds all event handlers from the specified event.|

## See Also

* [React Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/react-report-viewer-overview%})
