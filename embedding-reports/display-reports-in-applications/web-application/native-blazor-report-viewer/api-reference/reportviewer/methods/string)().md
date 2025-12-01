---
title: String)()
page_title: The String)() method of the Native Blazor Report Viewer explained
description: "Learn more about the String)() method of the Native Blazor Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/methods/string)()
tags: string)
published: True
reportingArea: NativeBlazor
position: 1
---

# The `String)()` method of the Native Blazor Report Viewer

Executes a predefined command without passing any arguments. The available commands are: 'NavigateBackward' - Goes back to the previously rendered report from history. 'NavigateForward' - Goes forward to the previously rendered report from history. 'StopRendering' - Stop the rendering of the current report at the first possible moment. 'Refresh' - Refreshes the report viewer. 'Print' - Triggers the report viewer printing operation. 'SendMail' - Triggers the Email-sending functionality if implemented. 'Search' - Shows or hides the search dialog. 'AiPrompt' - Shows or hides the AI prompt dialog. 'FirstPage' - Goes to the first page of the report. 'LastPage' - Goes to the last page of the report. 'NextPage' - Goes to the next page of the report. 'PreviousPage' - Goes to the previous page of the report. 'ZoomIn' - Zoom in the report. 'ZoomOut' - Zoom out the report. 'TogglePrintPreview' - Toggles between Print Preview and Interactive view modes. 'ToggleScaleMode' - Changes the scale mode of the report. 'ToggleDocumentMap' - Shows or hides the document map. 'ToggleParametersArea' - Shows or hides the parameters area.

````JavaScript
<ReportViewer
    @ref="reportViewer">
</ReportViewer>
<button @onclick="ExecuteZoomOut">Execute Command</button>

@code {
    private ReportViewer reportViewer;
    private void ExecuteZoomOut()
    {
        reportViewer.ExecuteCommand("ZoomOut");
    }
}
````


## See Also

* [Native Blazor Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/overview%})

