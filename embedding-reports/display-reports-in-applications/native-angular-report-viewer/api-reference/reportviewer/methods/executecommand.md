---
title: executeCommand
page_title: The executeCommand method of the Native Angular Report Viewer explained
description: "Learn more about the executeCommand method of the Native Angular Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/methods/executecommand
tags: executecommand
published: True
reportingArea: NativeAngular
position: 1
---

<style>
    table {
        display: grid;
        grid-template-columns: min-content min-content min-content 1fr;
    }

    thead, tbody, tr {
        display: contents;
    }

    th {
        white-space: nowrap;
    }
</style>

# The `executeCommand` method of the Native Angular Report Viewer

Executes a command on the report viewer.
This method allows you to programmatically trigger various viewer operations such as navigation, export, zoom, and more. Commands are executed with optional values that provide additional parameters for the operation.
Available commands:

- 'navigateBackward': Goes back to the previously rendered report from history.
- 'navigateForward': Goes forward to the previously rendered report from history.
- 'refreshReport': Refreshes the report.
- 'navigateToFirstPage': Goes to the first page of the report.
- 'navigateToPrevPage': Goes to the previous page of the report.
- 'navigateToNextPage': Goes to the next page of the report.
- 'navigateToLastPage': Goes to the last page of the report.
- 'setViewMode': Toggles between Print Preview and Interactive view modes.
- 'setScaleMode': Changes the viewer's scale mode. Accepts an object with 'scale' and 'scaleMode' properties which correspond to the viewer's 'scale' and 'scaleMode' settings.
- 'setReportSource': Changes the report source and refreshes the viewer. Accepts a ReportSourceOptions object.
- 'setAuthenticationToken': Sets a bearer token for authentication. Accepts a string value for the authentication token.
- 'exportReport': Exports the report using the specified rendering extension. Accepts a string value for the rendering extension.
- 'printReport': Triggers the report printing.
- 'toggleDocumentMap': Shows or hides the document map.
- 'toggleParametersSection': Shows or hides the parameters area.
- 'toggleSearchWindow': Shows or hides the search dialog.
- 'zoomIn': Zoom-in the report.
- 'zoomOut': Zoom-out the report.
- 'stopRendering': Stops the current rendering operation.

## Parameters

| Parameter | Type | Optional | Description |
|-----------|------|----------|-------------|
| commandName | `string` | No | The name of the command to execute |
| commandValue | `any` | No | Optional value/parameters for the command |

## Example

    ````typescript
this.viewer.executeCommand('exportReport', 'pdf'); // Export the report as PDF
````
