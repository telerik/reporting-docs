---
title: Methods
page_title: Methods of the HTML5 Report Viewer
description: Complete list of methods available in the HTML5 Report Viewer
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods
tags: methods
published: True
reportingArea: HTML5
position: 1
---

# Methods of the HTML5 Report Viewer

## accessibilityKeyMap

Gets or sets the accessibility key map for keyboard navigation. Allows customization of keyboard shortcuts for accessibility features.

### Parameters

| Parameter | Type | Optional | Description |
|-----------|------|----------|-------------|
| keyMap | `Object` | Yes | The key map object to set. If omitted, acts as a getter. |

### Example

````JavaScript
// Get the current accessibility key map
var viewer = $("#reportViewer1").data("telerik_ReportViewer");
var keyMap = viewer.accessibilityKeyMap();
````

````JavaScript
// Set a custom accessibility key map
var reportViewer = $("#reportViewer1").data("telerik_ReportViewer");
reportViewer.accessibilityKeyMap(
{
    CONFIRM_KEY: 32,
    CONTENT_AREA_KEY: 82, //R
    DOCUMENT_MAP_AREA_KEY: 77, //M
    MENU_AREA_KEY: 85, //U
    PARAMETERS_AREA_KEY: 80 //P
});
````


## authenticationToken

Sets the authentication token. Used for service requests.

### Parameters

| Parameter | Type | Optional | Description |
|-----------|------|----------|-------------|
| token | `string` | Yes | The authentication token to set. |

### Example

````JavaScript
// Set the authentication token for the viewer
var viewer = $("#reportViewer1").data("telerik_ReportViewer");
viewer.authenticationToken("YOUR_AUTH_TOKEN");
````


## bind

Binds event handlers to the specified event.

### Parameters

| Parameter | Type | Optional | Description |
|-----------|------|----------|-------------|
| eventName | `string` | No | The name of the event to bind to (see Events constants). |
| eventHandler | `function` | No | The handler function to invoke when the event occurs. |

### Example

````JavaScript
// Bind to the 'pageReady' event
var viewer = $("#reportViewer1").data("telerik_ReportViewer");
viewer.bind(telerikReportViewer.Events.PAGE_READY, function(e, args) {
  console.log("Page is ready!", args);
});
````

````JavaScript
// Bind to the 'error' event
var viewer = $("#reportViewer1").data("telerik_ReportViewer");
viewer.bind(telerikReportViewer.Events.ERROR, function(e, args) {
  alert("An error occurred: " + args);
});
````


## clearReportSource

Clears the current reportSource from the viewer's internal state and its persisted session in the browser. Called in order to force the viewer to respect the newly set reportSource on a server postback.

### Example

````JavaScript
// Clear the report source and force the viewer to respect a new reportSource on postback
var viewer = $("#reportViewer1").data("telerik_ReportViewer");
viewer.clearReportSource();
````


## currentPage

Gets the viewer’s current page that is displayed.

### Example

````JavaScript
// Get the current page number
var viewer = $("#reportViewer1").data("telerik_ReportViewer");
var page = viewer.currentPage();
````


## dispose

Disposes the viewer instance, cleaning up resources and event handlers. After calling this method, the viewer instance should not be used. Stops sending keep alive requests to the server, if keep client alive was enabled.

### Example

````JavaScript
// Dispose the viewer instance when it is no longer needed
var viewer = $("#reportViewer1").data("telerik_ReportViewer");
viewer.dispose();
````


## getReportParameters

Returns an object with properties, the names of which are the report parameters’ IDs, and values - the report parameters’ values. The values of multivalue parameters include their display and value members.

### Example

````JavaScript
// Get all report parameters and log them
var viewer = $("#reportViewer1").data("telerik_ReportViewer");
var parameters = viewer.getReportParameters();
console.log(parameters);
````


## isReportAutoRun

Returns whether auto-run is enabled for the report (i.e., whether the report runs automatically when parameters change).

### Example

````JavaScript
// Check if auto-run is enabled for the report
var viewer = $("#reportViewer1").data("telerik_ReportViewer");
var isReportAutoRun = viewer.isReportAutoRun();
````


## pageCount

Gets the total page count of the viewer’s currently displayed report.

### Example

````JavaScript
// Get the total number of pages in the current report
var viewer = $("#reportViewer1").data("telerik_ReportViewer");
var totalPages = viewer.pageCount();
````


## pageMode

Gets or sets the page mode (e.g., Single Page or Continuous Scroll).

### Parameters

| Parameter | Type | Optional | Description |
|-----------|------|----------|-------------|
| psm | [`PageModes`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/enumerations%}#pagemodes) | Yes | The page mode to set. If omitted, returns the current page mode. |

### Example

````JavaScript
// Get the current page mode
var viewer = $("#reportViewer1").data("telerik_ReportViewer");
var pageMode = viewer.pageMode();
````

````JavaScript
// Set the page mode to Single Page
var viewer = $("#reportViewer1").data("telerik_ReportViewer");
viewer.pageMode(telerikReportViewer.PageModes.SINGLE_PAGE);
````


## parametersAreaVisible

Shows or hides the parameters area in the viewer UI.

### Parameters

| Parameter | Type | Optional | Description |
|-----------|------|----------|-------------|
| visible | `boolean` | No | True to show, false to hide the parameters area. |

### Example

````JavaScript
// Show the parameters area
var viewer = $("#reportViewer1").data("telerik_ReportViewer");
viewer.parametersAreaVisible(true);
````

````JavaScript
// Hide the parameters area
var viewer = $("#reportViewer1").data("telerik_ReportViewer");
viewer.parametersAreaVisible(false);
````


## printMode

Gets or sets the print mode for the viewer.

### Parameters

| Parameter | Type | Optional | Description |
|-----------|------|----------|-------------|
| pm | [`PrintModes`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/enumerations%}#printmodes) | Yes | The print mode to set. If omitted, returns the current print mode. |

### Example

````JavaScript
// Get the current print mode
var viewer = $("#reportViewer1").data("telerik_ReportViewer");
var printMode = viewer.printMode();
````

````JavaScript
// Set the print mode to Force PDF File
var viewer = $("#reportViewer1").data("telerik_ReportViewer");
viewer.printMode(telerikReportViewer.PrintModes.FORCE_PDF_FILE);
````


## refreshReport

Refreshes the currently loaded report. Forces the viewer to reload the report from the server. Optionally ignores the cache.

### Parameters

| Parameter | Type | Optional | Description |
|-----------|------|----------|-------------|
| ignoreCache | `boolean` | Yes | If true, the report is reloaded from the server, bypassing any cached data. |

### Example

````JavaScript
// Refresh the report, ignoring cache (default)
var viewer = $("#reportViewer1").data("telerik_ReportViewer");
viewer.refreshReport();
````

````JavaScript
// Refresh the report, using cache if available
var viewer = $("#reportViewer1").data("telerik_ReportViewer");
viewer.refreshReport(false);
````


## reportSource

Gets or sets the report source for the viewer. When called with an argument, sets the report source When called without arguments, gets the current report source - report and parameters. The viewer's report source is updated dynamically as the users navigate between reports and change parameter values.

### Parameters

| Parameter | Type | Optional | Description |
|-----------|------|----------|-------------|
| rs | [`ReportSource`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/types%}#reportsource) | Yes | The report source object to set, or null to clear. If omitted, acts as a getter. |

### Example

````JavaScript
// Get the current report source
var viewer = $("#reportViewer1").data("telerik_ReportViewer");
var currentSource = viewer.reportSource();
````

````JavaScript
// Set a new report source
var viewer = $("#reportViewer1").data("telerik_ReportViewer");
viewer.reportSource({
  report: "MyReport",
  parameters: { StartDate: "2024-01-01", EndDate: "2024-12-31" }
});
````

````JavaScript
// Clear the report source
var viewer = $("#reportViewer1").data("telerik_ReportViewer");
viewer.reportSource(null);
````


## scale

Gets or sets the scale and scale mode for the viewer.

### Parameters

| Parameter | Type | Optional | Description |
|-----------|------|----------|-------------|
| args | `Object` | Yes | The scale settings to apply. Should contain 'scale' (number) and 'scaleMode' (string). |
| args.scale | `number` | Yes | The zoom scale (e.g., 1.0 for 100%). |
| args.scaleMode | [`ScaleModes`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/enumerations%}#scalemodes) | Yes | The scale mode (e.g., 'FIT_PAGE', 'FIT_PAGE_WIDTH', 'SPECIFIC'). |

### Example

````JavaScript
// Get the current scale and scale mode
var viewer = $("#reportViewer1").data("telerik_ReportViewer");
var scaleInfo = viewer.scale();
````

````JavaScript
// Set scale to 1.2 and scale mode to FIT_PAGE_WIDTH
var viewer = $("#reportViewer1").data("telerik_ReportViewer");
viewer.scale({ scale: 1.2, scaleMode: telerikReportViewer.ScaleModes.FIT_PAGE_WIDTH });
````


## unbind

Unbinds an event handler from a viewer event.

### Parameters

| Parameter | Type | Optional | Description |
|-----------|------|----------|-------------|
| eventName | `string` | No | The name of the event to unbind from. |
| eventHandler | `function` | Yes | The handler function to remove. If omitted, all handlers for the event are removed. |

### Example

````JavaScript
// Unbind all handlers from the 'error' event
var viewer = $("#reportViewer1").data("telerik_ReportViewer");
viewer.unbind(telerikReportViewer.Events.ERROR);
````


## viewMode

Gets or sets the view mode of the viewer (e.g., Interactive or Print Preview).

### Parameters

| Parameter | Type | Optional | Description |
|-----------|------|----------|-------------|
| vm | [`ViewModes`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/enumerations%}#viewmodes) | Yes | The view mode to set. If omitted, returns the current view mode. |

### Example

````JavaScript
// Get the current view mode
var viewer = $("#reportViewer1").data("telerik_ReportViewer");
var mode = viewer.viewMode();
````

````JavaScript
// Set the view mode to Print Preview
var viewer = $("#reportViewer1").data("telerik_ReportViewer");
viewer.viewMode(telerikReportViewer.ViewModes.PRINT_PREVIEW);
````

