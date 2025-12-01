---
title: Overview
page_title: Methods of the Native Blazor Report Viewer at a Glance
description: Learn more about the Methods of the Native Blazor Report Viewer and how you may use them to customize its appearance and functionality.
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/methods/overview
tags: overview
published: True
reportingArea: NativeBlazor
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

# Methods of the Native Blazor Report Viewer

| Method | Description |
| ------ | ------ |
| [String)()]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/methods/string)()%})|Executes a predefined command without passing any arguments. The available commands are: 'NavigateBackward' - Goes back to the previously rendered report from history. 'NavigateForward' - Goes forward to the previously rendered report from history. 'StopRendering' - Stop the rendering of the current report at the first possible moment. 'Refresh' - Refreshes the report viewer. 'Print' - Triggers the report viewer printing operation. 'SendMail' - Triggers the Email-sending functionality if implemented. 'Search' - Shows or hides the search dialog. 'AiPrompt' - Shows or hides the AI prompt dialog. 'FirstPage' - Goes to the first page of the report. 'LastPage' - Goes to the last page of the report. 'NextPage' - Goes to the next page of the report. 'PreviousPage' - Goes to the previous page of the report. 'ZoomIn' - Zoom in the report. 'ZoomOut' - Zoom out the report. 'TogglePrintPreview' - Toggles between Print Preview and Interactive view modes. 'ToggleScaleMode' - Changes the scale mode of the report. 'ToggleDocumentMap' - Shows or hides the document map. 'ToggleParametersArea' - Shows or hides the parameters area.|
| [String)(, )]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/methods/string)(,-)%})|Executes a predefined command with an additional value argument. The available commands are: 'SetAuthenticationToken' - Sets the token that will be used in the Authorization header of the requests made by the viewer. 'Export' - Exports the report, using the respective rendering extension name, such as 'PDF'.|
| [GetReportParameters()]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/methods/getreportparameters()%})|Retrieves the report parameters for the currently loaded report.|

## See Also

* [Native Blazor Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/overview%})
