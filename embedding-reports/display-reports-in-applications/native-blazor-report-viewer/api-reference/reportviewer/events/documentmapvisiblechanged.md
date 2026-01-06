---
title: DocumentMapVisibleChanged
page_title: DocumentMapVisibleChanged event
description: "Gets or sets a value for the callback that will be called when the value of DocumentMapVisible changes."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/events/documentmapvisiblechanged
published: True
reportingArea: NativeBlazor
---

# The `DocumentMapVisibleChanged` event of the Native Blazor Report Viewer

Gets or sets a value for the callback that will be called when the value of DocumentMapVisible changes.

## Example

````C#
<ReportViewer 
    DocumentMapVisibleChanged="@OnDocumentMapVisibleChanged">
</ReportViewer>

@code {
    private void OnDocumentMapVisibleChanged(bool visible)
    {
    }
}
````



