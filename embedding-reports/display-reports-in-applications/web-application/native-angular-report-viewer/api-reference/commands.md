---
title: Commands
page_title: Native Angular Report Viewer Command 
description: "Learn about what are the commands exposed by the Native Angular Report Viewer and how you may use them to perform certain operations in code."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/commands
tags: commands
published: True
reportingArea: NativeAngular
position: 1
---

<style>
table th:first-of-type {
	width: 20%;
}
table th:nth-of-type(2) {
	width: 30%;
}
table th:nth-of-type(3) {
	width: 50%;
}
</style>

# Commands Overview

The Native Angular Report Viewer exposes the ability to trigger various commands via the `executeCommand` method which accepts the name of the command as the first parameter and the command value(optional).

## Commands Usage Example

The following example illustrates a list of all the available commands in the viewer, and how they may be invoked:

{{source=CodeSnippets\Blazor\Docs\ReportViewers\NativeAngularViewerCommands.html region=NativeAngularViewerCommandButtons}}
{{source=CodeSnippets\Blazor\Docs\TypeScript\NativeAngularViewerCommands.ts region=NativeAngularViewerCommands}}

## Commands List

| Command name | Command value | Description |
| ------ | ------ | ------ |
|navigateBackward|none|Goes back to the previously rendered report from history.|
|navigateForward|none|Goes forward to the previously rendered report from history.|
|refreshReport|none|Refreshes the report.|
|stopRendering|none|Stops the current report rendering.|
|navigateToFirstPage|none|Goes to the first page of the report.|
|navigateToPrevPage|none|Goes to the previous page of the report.|
|navigateToNextPage|none|Goes to the next page of the report.|
|navigateToLastPage|none|Goes to the last page of the report.|
|setViewMode|none|Toggles between Print Preview and Interactive view modes.|
|setScaleMode| An object with `scaleMode`(and `scale` for'specific' scale mode is used)|Changes the viewer's scaleMode|
|setReportSource| An object with `report` and `parameters` properties| Changes the report source and refreshes the viewer.|
|setAuthenticationToken | authentication token| A bearer token to be added in the Authorization token of each request|
|exportReport|rendering extension name|Exports the report, using the respective rendering extension name.|
|printReport|none|Triggers the report printing.|
|toggleDocumentMap|none|Shows or hides the document map.|
|toggleParametersSection|none|Shows or hides the parameters area.|
|toggleSearchWindow|none|Shows or hides the search dialog.|
|toggleAiPromptWindow|none|Shows or hides the AI prompt dialog.|
|zoomIn|none|Zoom-in the report.|
|zoomOut|none|Zoom-out the report.|
