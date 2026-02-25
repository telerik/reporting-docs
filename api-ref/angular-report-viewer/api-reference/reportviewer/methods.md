---
title: Methods
page_title: Methods of the Angular Report Viewer
description: Complete list of methods available in the Angular Report Viewer
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/methods
tags: methods
published: True
reportingArea: AngularWrapper
position: 1
---

# Methods of the Angular Report Viewer

## bind

Binds an event handler to a report viewer event.

### Parameters

| Parameter | Type | Optional | Description |
|-----------|------|----------|-------------|
| eventName | `string` | No | The name of the event to bind to |
| eventHandler | `Function` | No | The function to execute when the event occurs |

### Example

````typescript
viewer.bind('ready', () => {
  console.log('Report viewer is ready');
});
````


## clearReportSource

Clears the current report source from the viewer's internal state and from its persisted session in the browser. Forces the viewer to respect newly set report source on next postback. The current ReportViewer object

### Example

````typescript
viewer.clearReportSource();
````


## currentPage

Gets the viewer's current page that is displayed. The current page number

### Example

````typescript
const currentPageNum = viewer.currentPage();
console.log(`Current page: ${currentPageNum}`);
````


## dispose

Stops sending keep alive requests to the server and performs cleanup. Called automatically when the component is destroyed.

### Example

````typescript
viewer.dispose();
````


## getAccessibilityKeyMap

Gets the shortcut keys used when the report viewer is in accessible mode.
The keys in the key map are:

- CONFIRM_KEY: Key used to trigger actions (default: 13, Enter)
- MENU_AREA_KEY: Key to focus the menu area, if visible (default: 77, 'm')
- CONTENT_AREA_KEY: Key to focus the content area, if visible (default: 67, 'c')
- PARAMETERS_AREA_KEY: Key to focus the parameters area, if visible (default: 80, 'p')
- DOCUMENT_MAP_AREA_KEY: Key to focus the map area, if visible (default: 68, 'd')
JSON object containing accessibility key mappings

### Example

````typescript
const keyMap = viewer.getAccessibilityKeyMap();
console.log(keyMap.CONFIRM_KEY); // Default: 13 (Enter)
console.log(keyMap.MENU_AREA_KEY); // Default: 77 ('m')
````


## getPageMode

Gets the viewer's current page mode. The current page mode string ("SINGLE_PAGE" or "CONTINUOUS_SCROLL")

### Example

````typescript
viewer.getPageMode();
````


## getReportParameters

Returns an immutable array of name-value objects representing the current evaluated report parameters. Array containing the name and value of each report parameter

### Example

````typescript
const params = viewer.getReportParameters();
params.forEach(param => {
  console.log(`${param.name}: ${param.value}`);
});
````


## getReportSource

Gets the current report source (report and parameters). Object containing report and parameters properties

### Example

````typescript
const source = viewer.getReportSource();
console.log(source.report); // Report identifier
console.log(source.parameters); // Report parameters
````


## getScale

Gets the viewer's scale factor and scale mode. Object with scale and scaleMode properties

### Example

````typescript
const scaleInfo = viewer.getScale();
console.log(scaleInfo.scale); // e.g., 1.0
console.log(scaleInfo.scaleMode); // e.g., "SPECIFIC"
````


## getViewMode

Gets the current view mode. The current view mode string ("INTERACTIVE" or "PRINT_PREVIEW")

### Example

````typescript
console.log(viewer.getViewMode());
````


## pageCount

Gets the total page count of the currently displayed report. The total number of pages

### Example

````typescript
const totalPages = viewer.pageCount();
console.log(`Total pages: ${totalPages}`);
````


## refreshReport

Reloads/refreshes the current report. The current ReportViewer object

### Example

````typescript
viewer.refreshReport();
````


## setAccessibilityKeyMap

Sets the shortcut keys used when the report viewer is in accessible mode.
Recommended to set when report rendering is complete.
The keys in the key map are:

- CONFIRM_KEY: Key used to trigger actions (default: 13, Enter)
- MENU_AREA_KEY: Key to focus the menu area, if visible (default: 77, 'm')
- CONTENT_AREA_KEY: Key to focus the content area, if visible (default: 67, 'c')
- PARAMETERS_AREA_KEY: Key to focus the parameters area, if visible (default: 80, 'p')
- DOCUMENT_MAP_AREA_KEY: Key to focus the map area, if visible (default: 68, 'd')

### Parameters

| Parameter | Type | Optional | Description |
|-----------|------|----------|-------------|
| keyMap | `any` | No | JSON object with key mappings |

### Example

````typescript
viewer.setAccessibilityKeyMap({
  CONFIRM_KEY: 13,
  MENU_AREA_KEY: 77,
  CONTENT_AREA_KEY: 67
});
````


## setAuthenticationToken

Sets the authentication token for REST service requests. The current ReportViewer object

### Parameters

| Parameter | Type | Optional | Description |
|-----------|------|----------|-------------|
| token | `string` | No | The authentication token string |

### Example

````typescript
viewer.setAuthenticationToken("your-authentication-token");
````


## setPageMode

Sets the page mode and automatically reloads the current report. The current ReportViewer object

### Parameters

| Parameter | Type | Optional | Description |
|-----------|------|----------|-------------|
| psm | `string` | No | Page mode string ("SINGLE_PAGE" or "CONTINUOUS_SCROLL") |

### Example

````typescript
viewer.setPageMode("SINGLE_PAGE");
````


## setReportSource

Sets the report source (report and parameters). Automatically reloads the report into the view. The current ReportViewer object

### Parameters

| Parameter | Type | Optional | Description |
|-----------|------|----------|-------------|
| rs | `any` | No | Object with report and parameters properties |

### Example

````typescript
viewer.setReportSource({
  report: 'NewReport.trdp',
  parameters: { param1: 'value1' }
});
````


## setScale

Sets the scale factor and scale mode. The current ReportViewer object

### Parameters

| Parameter | Type | Optional | Description |
|-----------|------|----------|-------------|
| scale | `any` | No | Object with scale and scaleMode properties |

### Example

````typescript
viewer.setScale({
  scale: 1.5,
  scaleMode: 'SPECIFIC'
});
````


## setViewMode

Sets the view mode and automatically reloads the current report. The current ReportViewer object

### Parameters

| Parameter | Type | Optional | Description |
|-----------|------|----------|-------------|
| vm | `string` | No | View mode string ("INTERACTIVE" or "PRINT_PREVIEW") |

### Example

````typescript
viewer.setViewMode('PRINT_PREVIEW');
````


## unbind

Unbinds a specific event handler from a report viewer event.

### Parameters

| Parameter | Type | Optional | Description |
|-----------|------|----------|-------------|
| eventName | `string` | No | The name of the event to unbind from |
| eventHandler | `Function` | No | The specific function to remove |

### Example

````typescript
viewer.unbind('ready', this.readyHandler);
````


## unbindAll

Unbinds all event handlers from a specific report viewer event.

### Parameters

| Parameter | Type | Optional | Description |
|-----------|------|----------|-------------|
| eventName | `string` | No | The name of the event to unbind all handlers from |

### Example

````typescript
viewer.unbindAll('ready');
````

