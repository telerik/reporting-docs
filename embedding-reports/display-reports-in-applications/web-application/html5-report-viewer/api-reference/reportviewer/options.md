---
title: Options
page_title: Options of the HTML5 Report Viewer
description: Complete list of options available in the HTML5 Report Viewer
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/options
tags: options
published: True
reportingArea: HTML5
position: 2
---

# Options of the HTML5 Report Viewer

## authenticationToken

If provided, a Bearer token will be set in the Authorization header for requests to the REST service.

### Type

`string`

### Example

````JavaScript
// Set authentication token
$("#reportViewer1").telerik_ReportViewer({
  serviceUrl: "api/reports/",
  reportSource: { report: "Dashboard.trdp" },
  // Bearer token for REST service requests
  authenticationToken: "YOUR_AUTH_TOKEN"
});
````


## checkedButtonClass

A class used for checked state buttons.

### Type

`string`

### Example

````JavaScript
// Use a custom class for checked buttons
$("#reportViewer1").telerik_ReportViewer({
  serviceUrl: "api/reports/",
  reportSource: { report: "Dashboard.trdp" },
  // Custom class for checked state buttons
  checkedButtonClass: "my-checked"
});
````


## disabledButtonClass

A class used for disabled state buttons.

### Type

`string`

### Example

````JavaScript
// Use a custom class for disabled buttons
$("#reportViewer1").telerik_ReportViewer({
  serviceUrl: "api/reports/",
  reportSource: { report: "Dashboard.trdp" },
  disabledButtonClass: "my-disabled"
});
````


## documentMapAreaPosition

The position of the document map area. See [DocumentMapAreaPositions]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/enumerations%}#documentmapareapositions).

### Type

[`DocumentMapAreaPositions`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/enumerations%}#documentmapareapositions)

### Example

````JavaScript
// Place document map on the right using the enum value
$("#reportViewer1").telerik_ReportViewer({
  serviceUrl: "api/reports/",
  reportSource: { report: "Dashboard.trdp" },
  // The position of the document map area
  documentMapAreaPosition: telerikReportViewer.DocumentMapAreaPositions.RIGHT
});
````


## documentMapVisible

Determines whether the viewer's document map is displayed if any bookmark is defined.

### Type

`boolean`

### Example

````JavaScript
// Show document map
$("#reportViewer1").telerik_ReportViewer({
  serviceUrl: "api/reports/",
  reportSource: { report: "Dashboard.trdp" },
  documentMapVisible: true
});
````


## enableAccessibility

Enables accessibility features.

### Type

`boolean`

### Example

````JavaScript
// Enable accessibility
$("#reportViewer1").telerik_ReportViewer({
  serviceUrl: "api/reports/",
  reportSource: { report: "Dashboard.trdp" },
  enableAccessibility: true
});
````


## id

Sets the unique identifier of the ReportViewer instance. If not specified, the id of the target HTML element will be used.

### Type

`string`

### Example

````JavaScript
// Set a custom viewer ID
$("#reportViewer1").telerik_ReportViewer({
 serviceUrl: "api/reports/",
 reportSource: { report: "Dashboard.trdp" },
 id: "myViewer1"
});
````


## initialPageAreaImageUrl

The image URL for the PageArea background image.

### Type

`string`

### Example

````JavaScript
// Set a background image
$("#reportViewer1").telerik_ReportViewer({
  serviceUrl: "api/reports/",
  reportSource: { report: "Dashboard.trdp" },
  initialPageAreaImageUrl: "/images/bg.png"
});
````


## keepClientAlive

Determines whether the client will be kept alive.

### Type

`boolean`

### Example

````JavaScript
// Keep client alive
$("#reportViewer1").telerik_ReportViewer({
  serviceUrl: "api/reports/",
  reportSource: { report: "Dashboard.trdp" },
  keepClientAlive: true
});
````


## pageMode

The page mode. See [PageModes]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/enumerations%}#pagemodes).

### Type

[`PageModes`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/enumerations%}#pagemodes)

### Example

````JavaScript
// Set page mode to single page using the enum value
$("#reportViewer1").telerik_ReportViewer({
  serviceUrl: "api/reports/",
  reportSource: { report: "Dashboard.trdp" },
  // The page mode
  pageMode: telerikReportViewer.PageModes.SINGLE_PAGE
});
````


## parameterEditors

Allows the user to define array of custom editors for the report parameters.

### Type

[`ParameterEditor`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/types%}#parametereditor)

### Example

````JavaScript
// Register a custom parameter editor for a specific parameter
$("#reportViewer1").telerik_ReportViewer({
  serviceUrl: "api/reports/",
  reportSource: { report: "Dashboard.trdp" },
  // Custom parameter editors array
  parameterEditors: [
    {
      match: function(param) { return param.name === "MyParam"; },
      editor: MyCustomEditor
    }
  ]
});
````


## parameters

Allows the user to define parameter options for the report parameters. Properties: editors (object).

### Type

[`ParametersOptions`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/types%}#parametersoptions)

### Example

````JavaScript
// Custom parameter editors
$("#reportViewer1").telerik_ReportViewer({
  serviceUrl: "api/reports/",
  reportSource: { report: "Dashboard.trdp" },
  // Custom editors for report parameters
  parameters: { editors: { MyParam: MyCustomEditor } }
});
````


## parametersAreaPosition

The position of the parameters area. See [ParametersAreaPositions]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/enumerations%}#parametersareapositions).

### Type

[`ParametersAreaPositions`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/enumerations%}#parametersareapositions)

### Example

````JavaScript
// Place parameters area on the left using the enum value
$("#reportViewer1").telerik_ReportViewer({
  serviceUrl: "api/reports/",
  reportSource: { report: "Dashboard.trdp" },
  // The position of the parameters area
  parametersAreaPosition: telerikReportViewer.ParametersAreaPositions.LEFT
});
````


## parametersAreaVisible

Determines whether the viewer's parameters area is displayed if any parameter editor exists.

### Type

`boolean`

### Example

````JavaScript
// Hide parameters area
$("#reportViewer1").telerik_ReportViewer({
  serviceUrl: "api/reports/",
  reportSource: { report: "Dashboard.trdp" },
  parametersAreaVisible: false
});
````


## persistSession

Sets whether the viewer’s client session is persisted between page refreshes.

### Type

`boolean`

### Example

````JavaScript
$("#reportViewer1").telerik_ReportViewer({
  serviceUrl: "api/reports/",
  reportSource: { report: "Dashboard.trdp" },
  persistSession: true
});
````


## printMode

The print mode. See [PrintModes]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/enumerations%}#printmodes).

### Type

[`PrintModes`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/enumerations%}#printmodes)

### Example

````JavaScript
// Set print mode to force PDF file using the enum value
$("#reportViewer1").telerik_ReportViewer({
  serviceUrl: "api/reports/",
  reportSource: { report: "Dashboard.trdp" },
  // The print mode
  printMode: telerikReportViewer.PrintModes.FORCE_PDF_FILE
});
````


## reportServer

Configuration for Telerik Report Server. Report Server for .NET supports Token (getPersonalAccessToken) or username/password authentication. Report Server for .NET Framework 4.6.2 supports username/password or Guest account (url only, if enabled on server). Properties: url (string, required), getPersonalAccessToken (function, optional, Report Server for .NET only), username (string, optional), password (string, optional).

### Type

[`ReportServer`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/types%}#reportserver)

### Example

````JavaScript
// Use Report Server for .NET with Token authentication.
$("#reportViewer1").telerik_ReportViewer({
  // Configuration for Telerik Report Server for .NET with Token
  reportServer: {
    url: "https://myserver/",
    getPersonalAccessToken: function() {
      return Promise.resolve("<personal-access-token>");
    }
  }
});
````

````JavaScript
// Use Report Server for .NET with username/password.
$("#reportViewer1").telerik_ReportViewer({
  // Configuration for Telerik Report Server for .NET with username/password
  reportServer: {
    url: "https://myserver/",
    username: "user",
    password: "pass"
  }
});
````

````JavaScript
// Use Report Server for .NET Framework 4.6.2 with username/password.
$("#reportViewer1").telerik_ReportViewer({
  // Configuration for Telerik Report Server for .NET Framework 4.6.2
  reportServer: {
    url: "https://myserver/",
    username: "user",
    password: "pass"
  }
});
````

````JavaScript
// Use Report Server for .NET Framework 4.6.2 with Guest account.
$("#reportViewer1").telerik_ReportViewer({
  // Configuration for Telerik Report Server for .NET Framework 4.6.2 (Guest must be enabled on server)
  reportServer: {
    url: "https://myserver/"
  }
});
````


## reportSource

The report source configuration.

### Type

[`ReportSource`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/types%}#reportsource)

### Example

````JavaScript
// Set a report source
// Set a report source
$("#reportViewer1").telerik_ReportViewer({
  serviceUrl: "api/reports/",
  // The report source configuration
  reportSource: { report: "MyReport" }
});
````


## scale

The zoom scale (1.0 = 100%).

### Type

`number`

### Example

````JavaScript
// Set zoom to 150%
$("#reportViewer1").telerik_ReportViewer({
  serviceUrl: "api/reports/",
  reportSource: { report: "Dashboard.trdp" },
  // The zoom scale (1.0 = 100%)
  scale: 1.5
});
````


## scaleMode

The scale mode. See [ScaleModes]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/enumerations%}#scalemodes).

### Type

[`ScaleModes`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/enumerations%}#scalemodes)

### Example

````JavaScript
// Fit page width using the enum value
$("#reportViewer1").telerik_ReportViewer({
  serviceUrl: "api/reports/",
  reportSource: { report: "Dashboard.trdp" },
  // The scale mode
  scaleMode: telerikReportViewer.ScaleModes.FIT_PAGE_WIDTH
});
````


## searchMetadataOnDemand

Determines whether the search metadata will be delivered on demand (true) or by default (false).

### Type

`boolean`

### Example

````JavaScript
// Enable search metadata on demand
$("#reportViewer1").telerik_ReportViewer({
  serviceUrl: "api/reports/",
  reportSource: { report: "Dashboard.trdp" },
  searchMetadataOnDemand: true
});
````


## selector

A selector used in conjunction with the data- attributes.

### Type

`string`

### Example

````JavaScript
// Set a custom selector
$("#reportViewer1").telerik_ReportViewer({
  serviceUrl: "api/reports/",
  reportSource: { report: "Dashboard.trdp" },
  selector: "#myViewer"
});
````


## sendEmail

Email sending options. Properties: enabled (bool), from (string), to (string), cc (string), subject (string), body (string), format (string).

### Type

[`SendEmail`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/types%}#sendemail)

### Example

````JavaScript
// Enable send email with default values
$("#reportViewer1").telerik_ReportViewer({
  serviceUrl: "api/reports/",
  reportSource: { report: "Dashboard.trdp" },
  // Email sending options
  sendEmail: { enabled: true, from: "me@company.com", to: "you@company.com" }
});
````


## serviceUrl

The URL of the REST service serving reports. Required if reportServer is not provided.

### Type

`string`

### Example

````JavaScript
// Set the service URL
// Set the service URL for the report viewer
$("#reportViewer1").telerik_ReportViewer({
  // The URL of the REST service serving reports
  serviceUrl: "api/reports/",
  // The report source to display
  reportSource: { report: "Dashboard.trdp" }
});
````


## templateUrl

URL for a custom viewer template.

### Type

`string`

### Example

````JavaScript
// Use a custom template
$("#reportViewer1").telerik_ReportViewer({
  serviceUrl: "api/reports/",
  reportSource: { report: "Dashboard.trdp" },
  // URL for a custom viewer template
  templateUrl: "/templates/customViewer.html"
});
````


## viewMode

The view mode. See [ViewModes]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/enumerations%}#viewmodes).

### Type

[`ViewModes`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/enumerations%}#viewmodes)

### Example

````JavaScript
// Set view mode to print preview using the enum value
$("#reportViewer1").telerik_ReportViewer({
  serviceUrl: "api/reports/",
  reportSource: { report: "Dashboard.trdp" },
  // The view mode
  viewMode: telerikReportViewer.ViewModes.PRINT_PREVIEW
});
````

