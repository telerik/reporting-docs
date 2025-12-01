---
title: DocumentMapVisibleChanged
page_title: DocumentMapVisibleChanged property
description: "Gets or sets a value for the callback that will be called when the value of DocumentMapVisible changes."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/settable-properties/documentmapvisiblechanged
published: True
reportingArea: NativeBlazor
---

# DocumentMapVisibleChanged

Gets or sets a value for the callback that will be called when the value of DocumentMapVisible changes.

## Type

`Microsoft.AspNetCore.Components.EventCallback{System.Boolean}`

## Examples

````JavaScript
<ReportViewer 
    DocumentMapVisibleChanged="@OnDocumentMapVisibleChanged">
</ReportViewer>

@code {
    private void OnDocumentMapVisibleChanged(bool visible)
    {
    }
}
````

## See Also

* [Native Blazor Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/overview%})
