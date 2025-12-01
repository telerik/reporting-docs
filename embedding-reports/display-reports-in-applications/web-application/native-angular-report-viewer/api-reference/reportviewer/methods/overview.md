---
title: Overview
page_title: Methods of the Native Angular Report Viewer at a Glance
description: Learn more about the Methods of the Native Angular Report Viewer and how you may use them to customize its appearance and functionality.
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/methods/overview
tags: overview
published: True
reportingArea: NativeAngular
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

# Methods of the Native Angular Report Viewer

| Method | Description |
| ------ | ------ |
| [executeCommand(commandName, commandValue)]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/methods/executecommand(commandname,-commandvalue)%})|Executes a command on the report viewer. This method allows you to programmatically trigger various viewer operations such as navigation, export, zoom, and more. Commands are executed with optional values that provide additional parameters for the operation. Available commands: - 'navigateBackward': Goes back to the previously rendered report from history. - 'navigateForward': Goes forward to the previously rendered report from history. - 'refreshReport': Refreshes the report. - 'navigateToFirstPage': Goes to the first page of the report. - 'navigateToPrevPage': Goes to the previous page of the report. - 'navigateToNextPage': Goes to the next page of the report. - 'navigateToLastPage': Goes to the last page of the report. - 'setViewMode': Toggles between Print Preview and Interactive view modes. - 'setScaleMode': Changes the viewer's scale mode. Accepts an object with 'scale' and 'scaleMode' properties which correspond to the viewer's 'scale' and 'scaleMode' settings. - 'setReportSource': Changes the report source and refreshes the viewer. Accepts a ReportSourceOptions object. - 'setAuthenticationToken': Sets a bearer token for authentication. Accepts a string value for the authentication token. - 'exportReport': Exports the report using the specified rendering extension. Accepts a string value for the rendering extension. - 'printReport': Triggers the report printing. - 'toggleDocumentMap': Shows or hides the document map. - 'toggleParametersSection': Shows or hides the parameters area. - 'toggleSearchWindow': Shows or hides the search dialog. - 'zoomIn': Zoom-in the report. - 'zoomOut': Zoom-out the report. - 'stopRendering': Stops the current rendering operation.|

## See Also

* [Native Angular Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/overview%})
