---
title: Overview
page_title: Methods of the HTML5 Report Viewer at a Glance
description: "Learn more about the Methods of the HTML5 Report Viewer and how you may use them to customize its appearance and functionality."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/overview
tags: overview
published: True
position: 0
previous_url: /html5-report-viewer-reportviewer-methods, /embedding-reports/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/
---

<style>
table th:first-of-type {
	width: 35%;
}
table th:nth-of-type(3) {
	width: 50%;
}
</style>

# Methods of the HTML5 Report Viewer

| Method | Description |
| ------ | ------ |
| [accessibilityKeyMap()]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/accessibilitykeymap()%})|Gets the shortcut keys used when the report viewer is in accessible mode (has its enableAccessibility set to __true__. The keys in the map are listed below:<br/><table><thead><tr><th>Key</th><th>Default Value</th><th>Description</th></tr></thead><tbody><tr><td>CONFIRM_KEY</td><td>13 *('enter')* </td><td>Key for triggering the actions in the report content and previewing the report from the __Preview__ button in parameters area, if available.</td></tr><tr><td>MENU_AREA_KEY</td><td>77 *('m')* </td><td>Key for moving the focus to the menu area, if visible.</td></tr><tr><td>CONTENT_AREA_KEY</td><td>67 *('c')* </td><td>Key for moving the focus to the report content area, if visible.</td></tr><tr><td>PARAMETERS_AREA_KEY</td><td>80 *('p')* </td><td>Key for moving the focus to the parameters area, if visible.</td></tr><tr><td>DOCUMENT_MAP_AREA_KEY</td><td>68 *('d')* </td><td>Key for moving the focus to the document map area, if visible.</td></tr></tbody></table>|
| [accessibilityKeyMap(keyMap)]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/accessibilitykeymap(keymap)%})|Sets the shortcut keys used when the report viewer is in accessible mode. It is recommended to set the new key map when the report rendering is complete, because the accessibility routines require the report viewer template to be loaded.|
| [authenticationToken(token)]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/authenticationtoken(token)%})|Sets the viewer’s authentication token.|
| [bind(eventName, eventHandler)]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/bind(eventname,-eventhandler)%})|Binds event handlers to the specified event.|
| [clearReportSource()]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/clearreportsource()%})|Clears the current reportSource from the viewer internal state and from its persisted session in the browser. Called in order to force the viewer to respect the newly set reportSource on the next postback.|
| [currentPage()]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/currentpage()%})|Gets the viewer’s current page that is displayed.|
| [getReportParameters()]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/getreportparameters()%})|Gets an immutable array of name-value objects representing the current evaluated report parameters.|
| [pageCount()]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/pagecount()%})|Gets the total page count of viewer’s currently displayed report.|
| [refreshReport()]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/refreshreport()%})|Reloads/refreshes the current report.|
| [reportSource()]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/reportsource()%})|Gets the current ReportSource - report and parameters.|
| [reportSource(rs)]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/reportsource(rs)%})|Sets the report source - report and parameters. Automatically reloads the report (if any) into the view.|
| [scale()]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/scale()%})|Gets the viewer’s scale factor and scale mode. For more information please see jQuery.fn.telerik_ReportViewer’s scale and scaleMode options in [Report Viewer Initialization]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/report-viewer-initialization%}#options).|
| [scale(scale)]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/scale(scale)%})|Sets the scale factor and scale mode. For more information please see jQuery.fn.telerik_ReportViewer’s scale and scaleMode options in [Report Viewer Initialization]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/report-viewer-initialization%}#options).|
| [unbind(eventName)]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/unbind(eventname)%})|Unbinds all event handlers from the specified event.|
| [unbind(eventName, eventHandler)]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/unbind(eventname,-eventhandler)%})|Unbinds event handlers from the specified event.|
| [viewMode()]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/viewmode()%})|Gets the current view mode. For more information please see jQuery.fn.telerik_ReportViewer’s viewMode option in [Report Viewer Initialization]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/report-viewer-initialization%}#options).|
| [viewMode(vm)]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/viewmode(vm)%})|Sets the view mode and automatically reloads the current report (if any) into the new view;|
| [pageMode()]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/pagemode()%})|Gets the current page mode. For more information please see jQuery.fn.telerik_ReportViewer’s pageMode option in [Report Viewer Initialization]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/report-viewer-initialization%}#options).|
| [pageMode(psm)]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/pagemode(psm)%})|Sets the page mode and automatically reloads the current report (if any) into the new view.|

## See Also

* [HTML5 Report Viewer Overview]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%})
