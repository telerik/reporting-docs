---
title: Overview
page_title: Methods of the Angular Report Viewer at a Glance
description: Learn more about the Methods of the Angular Report Viewer and how you may use them to customize its appearance and functionality.
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/methods/overview
tags: overview
published: True
reportingArea: AngularWrapper
position: 0
---

<style>
    table {
        display: grid;
        grid-template-columns: min-content 1fr;
    }

    thead, tbody, tr {
        display: contents;
    }

    th {
        white-space: nowrap;
    }

    td:not(:last-child) {
        white-space: nowrap;
    }
</style>

# Methods of the Angular Report Viewer

| Method | Description |
| ------ | ------ |
| [bind]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/methods/bind%})|Binds an event handler to a report viewer event.|
| [clearReportSource]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/methods/clearreportsource%})|Clears the current report source from the viewer's internal state and from its persisted session in the browser.<br>Forces the viewer to respect newly set report source on next postback.<br>The current ReportViewer object|
| [currentPage]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/methods/currentpage%})|Gets the viewer's current page that is displayed.<br>The current page number|
| [dispose]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/methods/dispose%})|Stops sending keep alive requests to the server and performs cleanup.<br>Called automatically when the component is destroyed.|
| [getAccessibilityKeyMap]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/methods/getaccessibilitykeymap%})|Gets the shortcut keys used when the report viewer is in accessible mode.<br>The keys in the key map are:<br>- CONFIRM_KEY: Key used to trigger actions (default: 13, Enter)<br>- MENU_AREA_KEY: Key to focus the menu area, if visible (default: 77, 'm')<br>- CONTENT_AREA_KEY: Key to focus the content area, if visible (default: 67, 'c')<br>- PARAMETERS_AREA_KEY: Key to focus the parameters area, if visible (default: 80, 'p')<br>- DOCUMENT_MAP_AREA_KEY: Key to focus the map area, if visible (default: 68, 'd')<br>JSON object containing accessibility key mappings|
| [getPageMode]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/methods/getpagemode%})|Gets the viewer's current page mode.<br>The current page mode string ("SINGLE_PAGE" or "CONTINUOUS_SCROLL")|
| [getReportParameters]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/methods/getreportparameters%})|Returns an immutable array of name-value objects representing<br>the current evaluated report parameters.<br>Array containing the name and value of each report parameter|
| [getReportSource]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/methods/getreportsource%})|Gets the current report source (report and parameters).<br>Object containing report and parameters properties|
| [getScale]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/methods/getscale%})|Gets the viewer's scale factor and scale mode.<br>Object with scale and scaleMode properties|
| [getViewMode]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/methods/getviewmode%})|Gets the current view mode.<br>The current view mode string ("INTERACTIVE" or "PRINT_PREVIEW")|
| [pageCount]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/methods/pagecount%})|Gets the total page count of the currently displayed report.<br>The total number of pages|
| [refreshReport]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/methods/refreshreport%})|Reloads/refreshes the current report.<br>The current ReportViewer object|
| [setAccessibilityKeyMap]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/methods/setaccessibilitykeymap%})|Sets the shortcut keys used when the report viewer is in accessible mode.<br>Recommended to set when report rendering is complete.<br>The keys in the key map are:<br>- CONFIRM_KEY: Key used to trigger actions (default: 13, Enter)<br>- MENU_AREA_KEY: Key to focus the menu area, if visible (default: 77, 'm')<br>- CONTENT_AREA_KEY: Key to focus the content area, if visible (default: 67, 'c')<br>- PARAMETERS_AREA_KEY: Key to focus the parameters area, if visible (default: 80, 'p')<br>- DOCUMENT_MAP_AREA_KEY: Key to focus the map area, if visible (default: 68, 'd')|
| [setAuthenticationToken]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/methods/setauthenticationtoken%})|Sets the authentication token for REST service requests.<br>The current ReportViewer object|
| [setPageMode]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/methods/setpagemode%})|Sets the page mode and automatically reloads the current report.<br>The current ReportViewer object|
| [setReportSource]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/methods/setreportsource%})|Sets the report source (report and parameters).<br>Automatically reloads the report into the view.<br>The current ReportViewer object|
| [setScale]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/methods/setscale%})|Sets the scale factor and scale mode.<br>The current ReportViewer object|
| [setViewMode]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/methods/setviewmode%})|Sets the view mode and automatically reloads the current report.<br>The current ReportViewer object|
| [unbind]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/methods/unbind%})|Unbinds a specific event handler from a report viewer event.|
| [unbindAll]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/methods/unbindall%})|Unbinds all event handlers from a specific report viewer event.|

