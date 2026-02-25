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

````JavaScript
// Set authentication token
const token = "YOUR_AUTH_TOKEN";
// Use with component: authenticationToken={token}
````


## checkedButtonClass

A class used in conjunction with the data- attributes. Whenever a command is in the checked state this class will be added to the respective button.

### Type

`string`

### Example

````JavaScript
// Custom checked button styling
// Use with component: checkedButtonClass="btn-active"
````


## disabledButtonClass

A class used in conjunction with the data- attributes. Whenever a command is in the disabled state this class will be added to the respective button.

### Type

`string`

### Example

````JavaScript
// Custom disabled button styling
// Use with component: disabledButtonClass="btn-disabled"
````


## documentMapAreaPosition

Specifies where the Document Map should be displayed. Available values: "RIGHT", "LEFT". Default value is "LEFT".

### Type

`string`

### Example

````JavaScript
// Place document map on the right
<TelerikReportViewer
  serviceUrl="api/reports/"
  reportSource={{ report: "Dashboard.trdp" }}
  documentMapAreaPosition="RIGHT"
/>
````


## documentMapVisible

Determines whether the viewer's document map is displayed if any bookmark is defined.

### Type

`boolean`

### Example

````JavaScript
// Show document map
<TelerikReportViewer
  serviceUrl="api/reports/"
  reportSource={{ report: "Dashboard.trdp" }}
  documentMapVisible={true}
/>
````


## enableAccessibility

Determines whether the viewer should provide support for accessibility features. Default value is false.

### Type

`boolean`

### Example

````JavaScript
// Enable accessibility features
// Use with component: enableAccessibility={true}
<TelerikReportViewer
  serviceUrl="api/reports/"
  reportSource={{ report: "Dashboard.trdp" }}
  enableAccessibility={true}
/>
````


## id

Sets the unique identifier of the ReportViewer instance. If not specified, the id of the target HTML element will be used (if such is set). The id of the ReportViewer is used to identify the client session of the viewer when persistSession is enabled (true).

### Type

`string`

### Example

````JavaScript
// Set a custom viewer ID
<TelerikReportViewer
  serviceUrl="api/reports/"
  reportSource={{ report: "Dashboard.trdp" }}
  id="myUniqueViewer"
/>
````


## initialPageAreaImageUrl

The image URL for the PageArea background image. Used only when the parameter values are missing or invalid. The image should be in PNG, GIF, or JPG file format.

### Type

`string`

### Example

````JavaScript
// Set a background image for empty page area
<TelerikReportViewer
  serviceUrl="api/reports/"
  reportSource={{ report: "Dashboard.trdp" }}
  initialPageAreaImageUrl="/images/reportBackground.png"
/>
````


## keepClientAlive

Determines whether the client will be kept alive. Default value is true.

### Type

`boolean`

### Example

````JavaScript
// Keep client alive
<TelerikReportViewer
  serviceUrl="api/reports/"
  reportSource={{ report: "Dashboard.trdp" }}
  keepClientAlive={true}
/>
````


## pageMode

Sets if the report is displayed in Single page or Continuous scroll mode. Available values: "SINGLE_PAGE" (only one page loaded), "CONTINUOUS_SCROLL" (multiple pages loaded). Default value is "CONTINUOUS_SCROLL".

### Type

`string`

### Example

````JavaScript
// Set page mode to single page
<TelerikReportViewer
  serviceUrl="api/reports/"
  reportSource={{ report: "Dashboard.trdp" }}
  pageMode="SINGLE_PAGE"
/>
````


## parameterEditors

Allows the user to define custom editors for the report parameters.

### Type

[`ParameterEditor`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/types%}#parametereditor)

### Example

````JavaScript
// Register custom parameter editors
const customEditors = [{
  match: function(param) { return param.name === "MyParam"; },
  createEditor: function(placeholder, options) { return {}; }
}];
// Use with component: parameterEditors={customEditors}
````


## parameters

Allows the user to define parameter options for the report parameters.

### Type

[`ParametersOptions`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/types%}#parametersoptions)

### Example

````JavaScript
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
````


## parametersAreaPosition

Specifies where the Parameters Area should be displayed. Available values: "RIGHT", "TOP", "LEFT", "BOTTOM". Default value is "RIGHT".

### Type

`string`

### Example

````JavaScript
// Place parameters area on the left
<TelerikReportViewer
  serviceUrl="api/reports/"
  reportSource={{ report: "Dashboard.trdp" }}
  parametersAreaPosition="LEFT"
/>
````


## parametersAreaVisible

Determines whether the viewer's parameters area is displayed if any parameter editor exists.

### Type

`boolean`

### Example

````JavaScript
// Hide parameters area
<TelerikReportViewer
  serviceUrl="api/reports/"
  reportSource={{ report: "Dashboard.trdp" }}
  parametersAreaVisible={false}
/>
````


## persistSession

Sets whether the viewer's client session is persisted between page refreshes (e.g., postback). The session is stored in the browser's sessionStorage and is available for the duration of the page session. Default value is false.

### Type

`boolean`

### Example

````JavaScript
// Enable session persistence
<TelerikReportViewer
  serviceUrl="api/reports/"
  reportSource={{ report: "Dashboard.trdp" }}
  persistSession={true}
  id="myConstantId"
/>
````


## printMode

Specifies how the viewer should print reports. Available values: "AUTO_SELECT" (automatically decide based on browser), "FORCE_PDF_FILE" (download as PDF file), "FORCE_PDF_PLUGIN" (use PDF plug-in). Default value is "AUTO_SELECT".

### Type

`string`

### Example

````JavaScript
// Force PDF file for printing
// Use with component: printMode="FORCE_PDF_FILE"
````


## reportServer

Sets the configuration details for Telerik Report Server. Required if serviceUrl is not provided.

### Type

[`ReportServer`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/types%}#reportserver)

### Example

````JavaScript
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
````

````JavaScript
// Use Report Server authentication with username/password (not recommended)
<TelerikReportViewer
  reportServer={{
    url: "https://myserver.com/",
    username: "reportuser",
    password: "password123"
  }}
  reportSource={{ report: "Finance/Dashboard" }}
/>
````


## reportSource

Sets the report and initial report parameter values for the viewer to be displayed.

### Type

[`ReportSource`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/types%}#reportsource)

### Example

````JavaScript
// Basic report source
<TelerikReportViewer
  serviceUrl="api/reports/"
  reportSource={{ report: "Dashboard.trdp" }}
/>
````

````JavaScript
// Report source with parameters
<TelerikReportViewer
  serviceUrl="api/reports/"
  reportSource={{
    report: "SalesReport.trdp",
    parameters: { StartDate: "2024-01-01", EndDate: "2024-12-31" }
  }}
/>
````

````JavaScript
// Report Server format
<TelerikReportViewer
  reportServer={{ url: "https://myserver/" }}
  reportSource={{ report: "Finance/MonthlyReport" }}
/>
````


## scale

Sets the scale factor for the report pages. The scale takes effect when scaleMode is set to "SPECIFIC". Default value is 1.0 (100%).

### Type

`number`

### Example

````JavaScript
// Set zoom to 150%
<TelerikReportViewer
  serviceUrl="api/reports/"
  reportSource={{ report: "Dashboard.trdp" }}
  scale={1.5}
  scaleMode="SPECIFIC"
/>
````


## scaleMode

Sets how the report pages are scaled. Available options: "FIT_PAGE_WIDTH" (pages scaled to fit entire width), "FIT_PAGE" (pages scaled to fit entire page), "SPECIFIC" (pages scaled with scale value). Default value is "FIT_PAGE".

### Type

`string`

### Example

````JavaScript
// Fit page width
<TelerikReportViewer
  serviceUrl="api/reports/"
  reportSource={{ report: "Dashboard.trdp" }}
  scaleMode="FIT_PAGE_WIDTH"
/>
````


## searchMetadataOnDemand

Determines whether the search metadata will be delivered on demand (true) or by default (false). Default value is false.

### Type

`boolean`

### Example

````JavaScript
// Enable search metadata on demand
<TelerikReportViewer
  serviceUrl="api/reports/"
  reportSource={{ report: "Dashboard.trdp" }}
  searchMetadataOnDemand={true}
/>
````


## selector

A selector used in conjunction with the data- attributes. Whenever a command is attached to an element outside of the report viewer via the data-attributes this selector must be provided.

### Type

`string`

### Example

````JavaScript
// Set a custom selector for external commands
// Use with component: selector="#customToolbar"
````


## sendEmail

Configuration for the Send Mail Message feature.

### Type

[`SendEmailOptions`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/types%}#sendemailoptions)

### Example

````JavaScript
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
````


## serviceUrl

Sets the address of the Report REST Service. Required if reportServer is not provided.

### Type

`string`

### Example

````JavaScript
// Set the service URL for the report viewer
<TelerikReportViewer
  serviceUrl="api/reports/"
  reportSource={{ report: "Dashboard.trdp" }}
/>
````


## templateUrl

Sets the address of the html page that contains the viewer templates. If omitted, the default template will be downloaded from the REST service. Note: Internally mapped to trvTemplateUrl property.

### Type

`string`

### Example

````JavaScript
// Use a custom template
<TelerikReportViewer
  serviceUrl="api/reports/"
  reportSource={{ report: "Dashboard.trdp" }}
  templateUrl="/templates/customViewer.html"
/>
````


## viewerContainerStyle

CSS styles to apply to the viewer container div.

### Type

`Object`

### Example

````JavaScript
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
````


## viewMode

Sets if the report is displayed in interactive mode or in print preview. Available values: "INTERACTIVE" (enables drill-down interactivity), "PRINT_PREVIEW" (paged according to page settings). Default value is "INTERACTIVE".

### Type

`string`

### Example

````JavaScript
// Set view mode to print preview
<TelerikReportViewer
  serviceUrl="api/reports/"
  reportSource={{ report: "Dashboard.trdp" }}
  viewMode="PRINT_PREVIEW"
/>
````

