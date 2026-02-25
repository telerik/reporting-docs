---
title: Read-Only Properties
page_title: Read-Only Properties of the Native Angular Report Viewer
description: Complete list of read-only properties available in the Native Angular Report Viewer
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/read-only-properties
tags: read-only,properties
published: True
reportingArea: NativeAngular
position: 3
---

# Read-Only Properties of the Native Angular Report Viewer

## autoRunEnabled

Gets whether the report's AutoRun setting is enabled. true if the AutoRun setting is enabled, false otherwise.

### Type

`boolean`

### Example

````typescript
if (this.viewer.autoRunEnabled) {
 console.log("This report's AutoRun setting is enabled.");
}
````


## displayDocumentMap

Gets whether the document map is displayed. true if the document map is displayed, false otherwise.

### Type

`boolean`

### Example

````typescript
if (this.viewer.displayDocumentMap) {
 console.log("This report's document map is displayed.");
}
````


## displayParameterArea

Gets whether the parameter area is displayed. true if the parameter area is displayed, false otherwise.

### Type

`boolean`

### Example

````typescript
if (this.viewer.displayParameterArea) {
 console.log("This report's parameter area is displayed.");
}
````


## getDocumentMapNodes

Gets the current report's document map nodes if any. an array of DocumentMapNode objects if any.

### Type

`any`

### Example

````typescript
console.log("Document map nodes:", JSON.stringify(this.viewer.getDocumentMapNodes));
````


## getRenderingExtensions

Gets the current report's rendering extensions. an array of RenderingExtension objects if any.

### Type

`Array<any>`

### Example

````typescript
console.log("Rendering extensions:", JSON.stringify(this.viewer.getRenderingExtensions));
````


## hasLazyParameters

Gets whether the current report has parameters that have AutoRefresh disabled. true if at least one parameter has AutoRefresh disabled, false otherwise.

### Type

`boolean`

### Example

````typescript
if (this.viewer.hasLazyParameters) {
 console.log("This report has lazy parameters.");
}
````


## isAiPromptWindowOpen

Gets whether the AI prompt window is currently open. true if the AI assistant dialog is visible, false otherwise.

### Type

`boolean`

### Example

````typescript
if (this.viewer.isAiPromptWindowOpen) {
 console.log("The AI prompt window is currently open.");
}
````


## isDocumentMapAvailable

Gets whether the document map is available for the current report. True if the report has a document map, false otherwise.

### Type

`boolean`

### Example

````typescript
if (this.viewer.isDocumentMapAvailable) {
 console.log("This report has a document map.");
}
````


## isInPrintViewMode

Gets whether the viewer is in print preview mode. true if the viewer is in print preview mode, false otherwise.

### Type

`boolean`

### Example

````typescript
if (this.viewer.isInPrintViewMode) {
 console.log("The viewer is currently in print preview mode.");
}
````


## isParametersSectionAvailable

Gets whether the current report has visible parameters. true if the report has visible parameters, false otherwise.

### Type

`boolean`

### Example

````typescript
if (this.viewer.isParametersSectionAvailable) {
 console.log("This report has visible parameters.");
}
````


## isRenderingInProgress

Gets whether the current report is still being rendered. true if the report rendering process is ongoing, false otherwise.

### Type

`boolean`

### Example

````typescript
if (this.viewer.isRenderingInProgress) {
 console.log("This report is still being rendered.");
}
````


## isSearchWindowOpen

Gets whether the search window is currently open. True if the search dialog is visible, false otherwise.

### Type

`boolean`

### Example

````typescript
if (this.viewer.isSearchWindowOpen) {
 console.log("The search window is currently open.");
}
````


## totalPages

Gets the total number of pages in the current report. The total page count of the rendered report.

### Type

`number`

### Example

````typescript
console.log("The total number of pages in the current report are.", this.viewer.totalPages);
````

