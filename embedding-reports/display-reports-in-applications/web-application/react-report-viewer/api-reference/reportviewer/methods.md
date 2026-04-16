---
title: Methods
page_title: Methods of the React Report Viewer
description: Complete list of methods available in the React Report Viewer
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/methods
tags: methods
published: True
reportingArea: React
position: 1
---

# Methods of the React Report Viewer

## bind

Binds an event handler to the specified event.

### Parameters

| Parameter | Type | Optional | Description |
|-----------|------|----------|-------------|
| eventName | `string` | No | The name of the event to bind to. |
| eventHandler | `function` | No | The handler function to invoke when the event occurs. |

### Example

````JavaScript
// Bind to pageReady event
reportViewerRef.current.bind("pageReady", (e, args) => {
  console.log("Page is ready!", args);
});
````

````JavaScript
// Bind to error event
reportViewerRef.current.bind("error", (e, args) => {
  console.error("Report viewer error:", args);
});
````


## clearReportSource

Clears the current reportSource from the viewer internal state and from its persisted session in the browser. Called in order to force the viewer to respect the newly set reportSource on the next postback.

### Example

````JavaScript
// Clear report source before setting a new one
reportViewerRef.current.clearReportSource();
reportViewerRef.current.setReportSource({ report: "NewReport" });
````


## currentPage

Gets the viewer’s current page that is displayed.

### Example

````JavaScript
// Get current page number
const currentPage = reportViewerRef.current.currentPage();
console.log("Current page:", currentPage);
````


## dispose

Stops sending keep alive requests to the server, if keep client alive was enabled. Disposes the viewer instance, cleaning up resources and event handlers. Should be called when the component is unmounted or no longer needed.

### Example

````JavaScript
// Manually dispose the viewer
reportViewerRef.current.dispose();
````


## getAccessibilityKeyMap

Gets the shortcut keys used when the report viewer is in accessible mode (enableAccessibility=true).

### Example

````JavaScript
// Get accessibility key map
const keyMap = reportViewerRef.current.getAccessibilityKeyMap();
if (keyMap) {
  console.log("Accessibility key map:", keyMap);
}
````


## getPageMode

Gets the current page mode of the viewer.

### Example

````JavaScript
// Get current page mode
const pageMode = reportViewerRef.current.getPageMode();
console.log("Current page mode:", pageMode);
````


## getReportParameters

Returns an immutable array of name-value objects representing the current evaluated report parameters.

### Example

````JavaScript
// Get current report parameters
const parameters = reportViewerRef.current.getReportParameters();
parameters.forEach(param => {
  console.log(`Parameter ${param.name}: ${param.value}`);
});
````


## getReportSource

Gets the current ReportSource - report and parameters.

### Example

````JavaScript
// Get current report source
const reportSource = reportViewerRef.current.getReportSource();
console.log("Current report:", reportSource.report);
console.log("Current parameters:", reportSource.parameters);
````


## getScale

Gets the viewer’s scale factor and scale mode.

### Example

````JavaScript
// Get current scale and scale mode
const scaleInfo = reportViewerRef.current.getScale();
console.log("Scale:", scaleInfo.scale, "Scale mode:", scaleInfo.scaleMode);
````


## getViewMode

Gets the current view mode.

### Example

````JavaScript
// Get current view mode
const viewMode = reportViewerRef.current.getViewMode();
console.log("Current view mode:", viewMode);
````


## pageCount

Gets the total page count of viewer’s currently displayed report.

### Example

````JavaScript
// Get total page count
const totalPages = reportViewerRef.current.pageCount();
console.log("Total pages:", totalPages);
````


## refreshReport

Reloads/refreshes the current report.

### Example

````JavaScript
// Using ref to call refreshReport
const reportViewerRef = useRef();
<TelerikReportViewer ref={reportViewerRef} serviceUrl="api/reports/" reportSource={{ report: "Dashboard.trdp" }} />
// ...
reportViewerRef.current.refreshReport();
````


## setAccessibilityKeyMap

Sets the shortcut keys used when the report viewer is in accessible mode. It is recommended to set the new key map when the report rendering is complete, because the accessibility routines require the report viewer template to be loaded.

### Parameters

| Parameter | Type | Optional | Description |
|-----------|------|----------|-------------|
| keyMap | `Object` | No | The key map object with keyboard shortcuts. |

### Example

````JavaScript
// Set custom accessibility key map
reportViewerRef.current.setAccessibilityKeyMap({
  CONFIRM_KEY: 13,
  MENU_AREA_KEY: 77,
  CONTENT_AREA_KEY: 67,
  PARAMETERS_AREA_KEY: 80,
  DOCUMENT_MAP_AREA_KEY: 68
});
````


## setAuthenticationToken

Sets the authentication token.

### Parameters

| Parameter | Type | Optional | Description |
|-----------|------|----------|-------------|
| token | `string` | No | The authentication token to set. |

### Example

````JavaScript
// Set authentication token
reportViewerRef.current.setAuthenticationToken("YOUR_AUTH_TOKEN");
````


## setPageMode

Sets the page mode of the viewer.

### Parameters

| Parameter | Type | Optional | Description |
|-----------|------|----------|-------------|
| psm | `string` | No | The page mode to set (use PageModes constants). |

### Example

````JavaScript
// Set page mode to single page
reportViewerRef.current.setPageMode("SINGLE_PAGE");
````


## setReportSource

Sets the report source - report and parameters. Automatically reloads the report (if any) into the view.

### Parameters

| Parameter | Type | Optional | Description |
|-----------|------|----------|-------------|
| rs | `Object` | No | The report source object to set. Object with properties: report (string) and parameters (JSON). |

### Example

````JavaScript
// Set a new report source
reportViewerRef.current.setReportSource({
  report: "SalesReport",
  parameters: { StartDate: "2024-01-01", EndDate: "2024-12-31" }
});
````


## setScale

Sets the scale factor and scale mode.

### Parameters

| Parameter | Type | Optional | Description |
|-----------|------|----------|-------------|
| scale | `Object` | No | The scale object to set. |

### Example

````JavaScript
// Set scale to 150% and mode to SPECIFIC
reportViewerRef.current.setScale({ scale: 1.5, scaleMode: "SPECIFIC" });
````


## setViewMode

Sets the view mode and automatically reloads the current report (if any) into the new view.

### Parameters

| Parameter | Type | Optional | Description |
|-----------|------|----------|-------------|
| vm | `string` | No | The view mode to set. |

### Example

````JavaScript
// Set view mode to print preview
reportViewerRef.current.setViewMode("PRINT_PREVIEW");
````


## unbind

Unbinds an event handler from the specified event.

### Parameters

| Parameter | Type | Optional | Description |
|-----------|------|----------|-------------|
| eventName | `string` | No | The name of the event to unbind from. |
| eventHandler | `function` | Yes | The handler function to remove. If omitted, all handlers are removed. |

### Example

````JavaScript
// Unbind specific handler
reportViewerRef.current.unbind("error", myErrorHandler);
````

````JavaScript
// Unbind all handlers for an event
reportViewerRef.current.unbind("pageReady");
````


## unbindAll

Unbinds all event handlers from the specified event.

### Parameters

| Parameter | Type | Optional | Description |
|-----------|------|----------|-------------|
| eventName | `string` | No | The name of the event to unbind all handlers from. |

### Example

````JavaScript
// Unbind all error handlers
reportViewerRef.current.unbindAll("error");
````

