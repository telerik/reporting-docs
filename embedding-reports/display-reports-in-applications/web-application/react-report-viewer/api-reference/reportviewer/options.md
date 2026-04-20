---
title: Options
page_title: Options of the React Report Viewer
description: Complete list of options available in the React Report Viewer
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/options
tags: options
published: True
reportingArea: React
position: 2
---

# Options of the React Report Viewer

## authenticationToken

If provided, a Bearer token will be set in the Authorization header for every request to the REST service.

### Type

`string`

### Example

{% raw %}
```JavaScript
// Set a Bearer authentication token for REST service requests
<TelerikReportViewer
  serviceUrl="api/reports/"
  reportSource={{ report: "Dashboard.trdp" }}
  authenticationToken="YOUR_AUTH_TOKEN"
/>
```
{% endraw %}


## checkedButtonClass

A CSS class added to external command buttons (bound via data-attributes) when the command is in a checked state.

### Type

`string`

### Example

{% raw %}
```JavaScript
// Apply custom styling to checked/active command buttons
<TelerikReportViewer
  id="rv1"
  serviceUrl="api/reports/"
  reportSource={{ report: "Dashboard.trdp" }}
  selector="#rv1"
  checkedButtonClass="btn-active"
/>
```
{% endraw %}


## disabledButtonClass

A CSS class added to external command buttons (bound via data-attributes) when the command is in a disabled state.

### Type

`string`

### Example

{% raw %}
```JavaScript
// Apply custom styling to disabled command buttons
<TelerikReportViewer
  id="rv1"
  serviceUrl="api/reports/"
  reportSource={{ report: "Dashboard.trdp" }}
  selector="#rv1"
  disabledButtonClass="btn-disabled"
/>
```
{% endraw %}


## documentMapAreaPosition

Specifies where the Document Map should be displayed. Available values: "RIGHT", "LEFT". Default value is "LEFT".

### Type

`string`

### Example

{% raw %}
```JavaScript
// Place document map on the right
<TelerikReportViewer
  serviceUrl="api/reports/"
  reportSource={{ report: "Dashboard.trdp" }}
  documentMapAreaPosition="RIGHT"
/>
```
{% endraw %}


## documentMapVisible

Determines whether the viewer's document map is displayed if any bookmark is defined.

### Type

`boolean`

### Example

{% raw %}
```JavaScript
// Show document map
<TelerikReportViewer
  serviceUrl="api/reports/"
  reportSource={{ report: "Dashboard.trdp" }}
  documentMapVisible={true}
/>
```
{% endraw %}


## enableAccessibility

Determines whether the viewer should provide support for accessibility features. Default value is false.

### Type

`boolean`

### Example

{% raw %}
```JavaScript
// Enable accessibility features
<TelerikReportViewer
  serviceUrl="api/reports/"
  reportSource={{ report: "Dashboard.trdp" }}
  enableAccessibility={true}
/>
```
{% endraw %}


## id

Sets the unique identifier of the ReportViewer instance. If not specified, the id of the target HTML element will be used (if such is set). The id of the ReportViewer is used to identify the client session of the viewer when persistSession is enabled (true).

### Type

`string`

### Example

{% raw %}
```JavaScript
// Set a custom viewer ID
<TelerikReportViewer
  serviceUrl="api/reports/"
  reportSource={{ report: "Dashboard.trdp" }}
  id="myUniqueViewer"
/>
```
{% endraw %}


## initialPageAreaImageUrl

The image URL for the PageArea background image. Used only when the parameter values are missing or invalid. The image should be in PNG, GIF, or JPG file format.

### Type

`string`

### Example

{% raw %}
```JavaScript
// Set a background image for empty page area
<TelerikReportViewer
  serviceUrl="api/reports/"
  reportSource={{ report: "Dashboard.trdp" }}
  initialPageAreaImageUrl="/images/reportBackground.png"
/>
```
{% endraw %}


## keepClientAlive

Determines whether the viewer sends periodic keep-alive requests to the server to prevent the client session from expiring. Default value is true.

### Type

`boolean`

### Example

{% raw %}
```JavaScript
// Keep client alive
<TelerikReportViewer
  serviceUrl="api/reports/"
  reportSource={{ report: "Dashboard.trdp" }}
  keepClientAlive={true}
/>
```
{% endraw %}


## localizationResources

An object containing all or a subset of the viewer's localization resources in a chosen language.

### Type

`Object`

### Example

{% raw %}
```JavaScript
// Set localization resources
<TelerikReportViewer
  serviceUrl="api/reports/"
  reportSource={{ report: "Dashboard.trdp" }}
  localizationResources={{
     loadingFormats: "Loading...",
     loadingReport: "Loading report...",
     loadingParameters: "Loading parameters...",
  }}
/>
```
{% endraw %}


## pageMode

Sets if the report is displayed in Single page or Continuous scroll mode. Available values: "SINGLE_PAGE" (only one page loaded), "CONTINUOUS_SCROLL" (multiple pages loaded). Default value is "CONTINUOUS_SCROLL".

### Type

`string`

### Example

{% raw %}
```JavaScript
// Set page mode to single page
<TelerikReportViewer
  serviceUrl="api/reports/"
  reportSource={{ report: "Dashboard.trdp" }}
  pageMode="SINGLE_PAGE"
/>
```
{% endraw %}


## parameterEditors

Allows the user to define custom editors for the report parameters.

### Type

`Array.<ParameterEditor>`

### Example

{% raw %}
```JavaScript
// Register custom parameter editors
const customEditors = [{
  match: function(param) { return param.name === "MyParam"; },
  createEditor: function(placeholder, options) {
    return {
      beginEdit: function(param) {
        // Create and initialize the editor UI inside placeholder.
      },
      addAccessibility: function(accessibilityOptions) {
        // Apply ARIA attributes and accessibility strings.
      },
      setAccessibilityErrorState: function(hasError) {
        // Update accessibility error state on the editor.
      }
    };
  }
}];

<TelerikReportViewer
  serviceUrl="api/reports/"
  reportSource={{ report: "Dashboard.trdp" }}
  parameterEditors={customEditors}
/>
```
{% endraw %}


## parameters

Allows the user to define parameter options for the report parameters.

### Type

[`ParametersOptions`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/types%}#parametersoptions)

### Example

{% raw %}
```JavaScript
// Configure parameter editors
<TelerikReportViewer
  serviceUrl="api/reports/"
  reportSource={{ report: "Dashboard.trdp" }}
  parameters={{
    editors: {
      singleSelect: "COMBO_BOX",
      multiSelect: "LIST_VIEW"
    }
  }}
/>
```
{% endraw %}


## parametersAreaPosition

Specifies where the Parameters Area should be displayed. Available values: "RIGHT", "TOP", "LEFT", "BOTTOM". Default value is "RIGHT".

### Type

`string`

### Example

{% raw %}
```JavaScript
// Place parameters area on the left
<TelerikReportViewer
  serviceUrl="api/reports/"
  reportSource={{ report: "Dashboard.trdp" }}
  parametersAreaPosition="LEFT"
/>
```
{% endraw %}


## parametersAreaVisible

Determines whether the viewer's parameters area is displayed if any parameter editor exists.

### Type

`boolean`

### Example

{% raw %}
```JavaScript
// Hide parameters area
<TelerikReportViewer
  serviceUrl="api/reports/"
  reportSource={{ report: "Dashboard.trdp" }}
  parametersAreaVisible={false}
/>
```
{% endraw %}


## persistSession

Sets whether the viewer's client session is persisted between page refreshes (e.g., postback). The session is stored in the browser's sessionStorage and is available for the duration of the page session. Default value is false.

### Type

`boolean`

### Example

{% raw %}
```JavaScript
// Enable session persistence
<TelerikReportViewer
  serviceUrl="api/reports/"
  reportSource={{ report: "Dashboard.trdp" }}
  persistSession={true}
  id="myConstantId"
/>
```
{% endraw %}


## printMode

Specifies how the viewer should print reports. Available values: "AUTO_SELECT" (automatically decide based on browser), "FORCE_PDF_FILE" (download as PDF file), "FORCE_PDF_PLUGIN" (use PDF plug-in). Default value is "AUTO_SELECT".

### Type

`string`

### Example

{% raw %}
```JavaScript
// Force PDF file download for printing
<TelerikReportViewer
  serviceUrl="api/reports/"
  reportSource={{ report: "Dashboard.trdp" }}
  printMode="FORCE_PDF_FILE"
/>
```
{% endraw %}


## reportServer

Sets the configuration details for Telerik Report Server. Required if serviceUrl is not provided.

### Type

[`ReportServer`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/types%}#reportserver)

### Example

{% raw %}
```JavaScript
// Use Report Server authentication with Token (recommended for RS.NET)
<TelerikReportViewer
  reportServer={{
    url: "https://yourReportServerUrl:port",
    getPersonalAccessToken: function() {
      return Promise.resolve("<personal-access-token>");
    }
  }}
  reportSource={{ report: "Samples/Dashboard" }}
/>
```
{% endraw %}

{% raw %}
```JavaScript
// Use Report Server authentication with username/password (not recommended)
<TelerikReportViewer
  reportServer={{
    url: "https://myserver.com/",
    username: "reportuser",
    password: "password123"
  }}
  reportSource={{ report: "Finance/Dashboard" }}
/>
```
{% endraw %}


## reportSource

Sets the report and initial report parameter values for the viewer to be displayed.

### Type

[`ReportSource`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/types%}#reportsource)

### Example

{% raw %}
```JavaScript
// Basic report source
<TelerikReportViewer
  serviceUrl="api/reports/"
  reportSource={{ report: "Dashboard.trdp" }}
/>
```
{% endraw %}

{% raw %}
```JavaScript
// Report source with parameters
<TelerikReportViewer
  serviceUrl="api/reports/"
  reportSource={{
    report: "SalesReport.trdp",
    parameters: { StartDate: "2024-01-01", EndDate: "2024-12-31" }
  }}
/>
```
{% endraw %}

{% raw %}
```JavaScript
// Report Server format
<TelerikReportViewer
  reportServer={{ url: "https://myserver/" }}
  reportSource={{ report: "Finance/MonthlyReport" }}
/>
```
{% endraw %}


## scale

Sets the scale factor for the report pages. The scale takes effect when scaleMode is set to "SPECIFIC". Default value is 1.0 (100%).

### Type

`number`

### Example

{% raw %}
```JavaScript
// Set zoom to 150%
<TelerikReportViewer
  serviceUrl="api/reports/"
  reportSource={{ report: "Dashboard.trdp" }}
  scale={1.5}
  scaleMode="SPECIFIC"
/>
```
{% endraw %}


## scaleMode

Sets how the report pages are scaled. Available options: "FIT_PAGE_WIDTH" (pages scaled to fit entire width), "FIT_PAGE" (pages scaled to fit entire page), "SPECIFIC" (pages scaled with scale value). Default value is "FIT_PAGE".

### Type

`string`

### Example

{% raw %}
```JavaScript
// Fit page width
<TelerikReportViewer
  serviceUrl="api/reports/"
  reportSource={{ report: "Dashboard.trdp" }}
  scaleMode="FIT_PAGE_WIDTH"
/>
```
{% endraw %}


## searchMetadataOnDemand

Determines whether the search metadata will be delivered on demand (true) or by default (false). Default value is false.

### Type

`boolean`

### Example

{% raw %}
```JavaScript
// Enable search metadata on demand
<TelerikReportViewer
  serviceUrl="api/reports/"
  reportSource={{ report: "Dashboard.trdp" }}
  searchMetadataOnDemand={true}
/>
```
{% endraw %}


## selector

A CSS selector that identifies the viewer's container element. Required when using external command buttons via data-attributes. External buttons must set their `data-target-report-viewer` attribute to this same value so the viewer can resolve which instance to command and apply `disabledButtonClass` / `checkedButtonClass` toggling.

### Type

`string`

### Example

{% raw %}
```JavaScript
// The selector must match the viewer's own container id (same value used in data-target-report-viewer on external buttons)
<TelerikReportViewer
  id="rv1"
  serviceUrl="api/reports/"
  reportSource={{ report: "Dashboard.trdp" }}
  selector="#rv1"
  disabledButtonClass="btn-disabled"
  checkedButtonClass="btn-checked"
/>

// External buttons reference the same selector in data-target-report-viewer:
// <button data-command="telerik_ReportViewer_goToNextPage" data-target-report-viewer="#rv1">Next</button>
```
{% endraw %}


## sendEmail

Configuration for the Send Mail Message feature.

### Type

[`SendEmailOptions`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/types%}#sendemailoptions)

### Example

{% raw %}
```JavaScript
// Enable send email with default values
<TelerikReportViewer
  serviceUrl="api/reports/"
  reportSource={{ report: "Dashboard.trdp" }}
  sendEmail={{
    enabled: true,
    from: "reports@company.com",
    to: "recipient@domain.com",
    subject: "Monthly Report",
    format: "PDF"
  }}
/>
```
{% endraw %}


## serviceUrl

Sets the address of the Report REST Service. Required if reportServer is not provided.

### Type

`string`

### Example

{% raw %}
```JavaScript
// Set the service URL for the report viewer
<TelerikReportViewer
  serviceUrl="api/reports/"
  reportSource={{ report: "Dashboard.trdp" }}
/>
```
{% endraw %}


## templateUrl

Sets the address of the HTML page that contains the viewer templates. If omitted, the default template will be downloaded from the REST service.

### Type

`string`

### Example

{% raw %}
```JavaScript
// Use a custom template
<TelerikReportViewer
  serviceUrl="api/reports/"
  reportSource={{ report: "Dashboard.trdp" }}
  templateUrl="/templates/customViewer.html"
/>
```
{% endraw %}


## viewerContainerStyle

CSS styles to apply to the viewer container div.

### Type

`Object`

### Example

{% raw %}
```JavaScript
// Set container styles
<TelerikReportViewer
  serviceUrl="api/reports/"
  reportSource={{ report: "Dashboard.trdp" }}
  viewerContainerStyle={{
    width: '100%',
    height: '600px',
    border: '1px solid #ccc'
  }}
/>
```
{% endraw %}


## viewMode

Sets if the report is displayed in interactive mode or in print preview. Available values: "INTERACTIVE" (enables drill-down interactivity), "PRINT_PREVIEW" (paged according to page settings). Default value is "INTERACTIVE".

### Type

`string`

### Example

{% raw %}
```JavaScript
// Set view mode to print preview
<TelerikReportViewer
  serviceUrl="api/reports/"
  reportSource={{ report: "Dashboard.trdp" }}
  viewMode="PRINT_PREVIEW"
/>
```
{% endraw %}

