---
title: Methods Overview
page_title: Overview | for Telerik Reporting Documentation
description: Overview
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/overview
tags: overview
published: True
position: 0
---

# Methods Overview



| Method | Description |
| ------ | ------ |
| [accessibilityKeyMap()]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/accessibilitykeymap()%})|Gets the shortcut keys used when the report viewer is in accessible mode (has its enableAccessibility set to __true__. The keys in the map are listed below:|

 Key | Default Value | Description |
| ------ | ------ | ------ |
|CONFIRM_KEY|13 *('enter')* |Key for triggering the actions in the report content and previewing the report from the __Preview__ button in parameters area, if available.|
|MENU_AREA_KEY|77 *('m')* |Key for moving the focus to the menu area, if visible.|
|CONTENT_AREA_KEY|67 *('c')* |Key for moving the focus to the report content area, if visible.|
|PARAMETERS_AREA_KEY|80 *('p')* |Key for moving the focus to the parameters area, if visible.|
|DOCUMENT_MAP_AREA_KEY|68 *('d')* |Key for moving the focus to the document map area, if visible.

|   |   |
| ------ | ------ |
|
| [accessibilityKeyMap(keyMap)]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/accessibilitykeymap(keymap)%})|Sets the shortcut keys used when the report viewer is in accessible mode. It is recommended to set the new key map when the report rendering is complete, because the accessibility routines require the report viewer template to be loaded.|
| [authenticationToken(token)]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/authenticationtoken(token)%})|Sets the viewer’s authentication token.|
| [bind(eventName, eventHandler)]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/bind(eventname,-eventhandler)%})|Binds event handlers to the specified event. For more information please see jQuery.fn.telerik_ReportViewer’s scale and scaleMode options in [](c578f366-93da-4dd1-8972-6efbc5a1790b#Options).|
| [clearReportSource()]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/clearreportsource()%})|Clears the current reportSource from the viewer internal state and from its persisted session in the browser. Called in order to force the viewer to respect the newly set reportSource on the next postback.|
| [currentPage()]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/currentpage()%})|Gets the viewer’s current page that is displayed.|
| [pageCount()]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/pagecount()%})|Gets the total page count of viewer’s currently displayed report.|
| [refreshReport()]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/refreshreport()%})|Reloads/refreshes the current report.|
| [reportSource()]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/reportsource()%})|Gets the current ReportSource - report and parameters.|
| [reportSource(rs)]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/reportsource(rs)%})|Sets the report source - report and parameters. Automatically reloads the report (if any) into the view.|
| [scale()]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/scale()%})|Gets the viewer’s scale factor and scale mode. For more information please see jQuery.fn.telerik_ReportViewer’s scale and scaleMode options in [](c578f366-93da-4dd1-8972-6efbc5a1790b#Options).|
| [scale(scale)]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/scale(scale)%})|Sets the scale factor and scale mode. For more information please see jQuery.fn.telerik_ReportViewer’s scale and scaleMode options in [](c578f366-93da-4dd1-8972-6efbc5a1790b#Options).|
| [unbind(eventName)]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/unbind(eventname)%})|Unbinds all event handlers from the specified event. For more information please see jQuery.fn.telerik_ReportViewer’s scale and scaleMode options in [](c578f366-93da-4dd1-8972-6efbc5a1790b#Options).|
| [unbind(eventName, eventHandler)]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/unbind(eventname,-eventhandler)%})|Unbinds event handlers from the specified event. For more information please see jQuery.fn.telerik_ReportViewer’s scale and scaleMode options in [](c578f366-93da-4dd1-8972-6efbc5a1790b#Options).|
| [viewMode()]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/viewmode()%})|Gets the current view mode. For more information please see jQuery.fn.telerik_ReportViewer’s viewMode option in [](c578f366-93da-4dd1-8972-6efbc5a1790b#Options).|
| [viewMode(vm)]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/viewmode(vm)%})|Sets the view mode and automatically reloads the current report (if any) into the new view;|
| [pageMode()]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/pagemode()%})|Gets the current page mode. For more information please see jQuery.fn.telerik_ReportViewer’s pageMode option in [](c578f366-93da-4dd1-8972-6efbc5a1790b#Options).|
| [pageMode(psm)]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/pagemode(psm)%})|Sets the page mode and automatically reloads the current report (if any) into the new view.|

