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
    table {
        display: grid;
        grid-template-columns: min-content 1fr;
    }

    thead, tbody, tr {
        display: contents;
    }

    th,
    td:not(:last-child) {
        white-space: nowrap;
    }
</style>

# Methods of the Native Blazor Report Viewer

| Method | Description |
| ------ | ------ |
| [ExecuteCommand]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/methods/executecommand%})|Executes a predefined command without passing any arguments.<br>The available commands are:<br>'NavigateBackward' - Goes back to the previously rendered report from history.<br>'NavigateForward' - Goes forward to the previously rendered report from history.<br>'StopRendering' - Stop the rendering of the current report at the first possible moment.<br>'Refresh' - Refreshes the report viewer.<br>'Print' - Triggers the report viewer printing operation.<br>'SendMail' - Triggers the Email-sending functionality if implemented.<br>'Search' - Shows or hides the search dialog.<br>'AiPrompt' - Shows or hides the AI prompt dialog.<br>'FirstPage' - Goes to the first page of the report.<br>'LastPage' - Goes to the last page of the report.<br>'NextPage' - Goes to the next page of the report.<br>'PreviousPage' - Goes to the previous page of the report.<br>'ZoomIn' - Zoom in the report.<br>'ZoomOut' - Zoom out the report.<br>'TogglePrintPreview' - Toggles between Print Preview and Interactive view modes.<br>'ToggleScaleMode' - Changes the scale mode of the report.<br>'ToggleDocumentMap' - Shows or hides the document map.<br>'ToggleParametersArea' - Shows or hides the parameters area.|
| [ExecuteCommand]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/methods/executecommand%})|Executes a predefined command with an additional value argument.<br>The available commands are:<br>'SetAuthenticationToken' - Sets the token that will be used in the Authorization header of the requests made by the viewer.<br>'Export' - Exports the report, using the respective rendering extension name, such as 'PDF'.|
| [GetReportParameters]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/methods/getreportparameters%})|Retrieves the report parameters for the currently loaded report.|

