---
title: Options
page_title: Options of the HTML5 ASP.NET MVC Report Viewer
description: Complete list of options available in the HTML5 ASP.NET MVC Report Viewer
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/options
tags: options
published: True
reportingArea: MVCWrapper
position: 2
---

# Options of the HTML5 ASP.NET MVC Report Viewer

## AccessibilityKeyMap

Sets the key mappings used in accessibility mode for keyboard navigation. Customizes keyboard shortcuts for accessibility navigation to meet specific application or user requirements.

### Type

[`Telerik.ReportViewer.Html5.Common.Options.AccessibilityKeyMap`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/types%}#accessibilitykeymap)

### Example

````C#
@using Telerik.ReportViewer.Html5.Common.Options

<!-- Example demonstrating how to set the AccessibilityKeyMap for keyboard navigation accessibility -->
@(Html.TelerikReporting().ReportViewer()
    .Id("reportViewer1")
    .ServiceUrl(Url.Content("~/api/reports/"))
    .AccessibilityKeyMap(new AccessibilityKeyMap {
        // Example: Set key mappings by property name as defined in the AccessibilityKeyMap model
        // For demonstration, custom key mapping properties are set using the default constructor and object initializer
    })
)
````


## AuthenticationToken

Sets the encoded authentication token used to authenticate requests to the reporting service. Used for secured reporting services that require authentication tokens for request authorization.

### Type

`System.String`

### Example

````C#
@using Telerik.ReportViewer.Mvc

@* Example of setting the AuthenticationToken for the Report Viewer *@
@(Html.TelerikReporting().ReportViewer()
    .Id("reportViewer1")
    .ServiceUrl(Url.Content("~/api/reports/"))
    .AuthenticationToken("encoded-auth-token-value")
)
````


## CheckedButtonClass

Sets the CSS class to be applied to buttons when they are in checked state. Allows customization of checked button appearance to match application styling requirements.

### Type

`System.String`

### Example

````C#
@using Telerik.Reporting
@using Telerik.ReportViewer.Mvc

<!-- Example demonstrating the use of CheckedButtonClass(string) -->
@(Html.TelerikReporting().ReportViewer()
    .Id("reportViewer1")
    .ServiceUrl(Url.Content("~/api/reports/"))
    // Sets the CSS class to be applied to buttons when they are in checked state.
    .CheckedButtonClass("my-custom-checked-btn")
)
````


## ClientEvents

Provides a fluent way to configure the client-side event handlers of the report viewer. Enables attachment of JavaScript functions to handle various viewer events such as rendering, printing, and user interactions.

### Type

`System.Action{Telerik.ReportViewer.Mvc.IClientEventsBuilder}`

### Example

````C#
@using Telerik.Reporting
@using Telerik.ReportViewer.Mvc

@{
    ViewBag.Title = "Report Viewer ClientEvents Configuration Example";
}

<!-- Demonstrates configuring client-side events via ClientEvents method -->
@(Html.TelerikReporting().ReportViewer()
    .Id("reportViewer1")
    .ServiceUrl(Url.Content("~/api/reports/"))
    .ClientEvents(events => {
        // You would chain event configuration methods here, for example:
        // events.OnReportLoaded("onReportLoaded");
    })
)
````


## Deferred

Defers the JavaScript initialization statement for the report viewer. Allows manual control over when the viewer initialization script is executed for custom loading scenarios.

### Example

````C#
@using Telerik.ReportViewer.Mvc

@* Example demonstrating the use of Deferred() to defer the script initialization statement of the report viewer *@
@(Html.TelerikReporting().ReportViewer()
    .Id("reportViewer1")
    .ServiceUrl(Url.Content("~/api/reports/"))
    .Deferred()
)

@section scripts
{
    @Html.TelerikReporting().DeferredScripts()
}
````


## DisabledButtonClass

Sets the CSS class to be applied to buttons when they are in disabled state. Allows customization of disabled button appearance to match application styling requirements.

### Type

`System.String`

### Example

````C#
@using Telerik.ReportViewer.Mvc

@* Example: Set a CSS class for disabled buttons in the report viewer *@
@(Html.TelerikReporting().ReportViewer()
    .Id("reportViewer1")
    .ServiceUrl(Url.Content("~/api/reports/"))
    .DisabledButtonClass("my-disabled-button-class")
)
````


## DocumentMapAreaPosition

Specifies where the Document Map Area should be displayed.

- Right - Displays Document Map Area on the right of the page view.
- Left - Displays Document Map Area on the left of the page view.
- Controls the placement of the document map navigation panel for report bookmark and section navigation.

### Type

[`Telerik.ReportViewer.Mvc.DocumentMapAreaPosition`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/enumerations%}#documentmapareaposition)

### Example

````C#
@using Telerik.Reporting
@using Telerik.ReportViewer.Mvc

<!--
    Example: Set the Document Map Area to be displayed on the right side of the viewer.
-->

@(Html.TelerikReporting().ReportViewer()
    .Id("reportViewer1")
    .ServiceUrl(Url.Content("~/api/reports/"))
    .DocumentMapAreaPosition(DocumentMapAreaPosition.Right)
)
````


## DocumentMapVisible

Sets the initial visibility state of the viewer's document map. Controls whether the document map navigation panel is visible when the viewer first loads. The document map is shown only if the report contains bookmarks. The document map works both in the interactive and print preview view modes.

### Type

`System.Boolean`

### Example

````C#
@using Telerik.ReportViewer.Mvc

@* Example: Set the document map to be initially visible in the report viewer *@
@(Html.TelerikReporting().ReportViewer()
    .Id("reportViewer1")
    .ServiceUrl(Url.Content("~/api/reports/"))
    .DocumentMapVisible(true)
)
````


## EnableAccessibility

Enables or disables the accessibility features of the report viewer and its contents. Accessibility features include ARIA attributes, keyboard navigation support, and screen reader compatibility.

### Type

`System.Boolean`

### Example

````C#
@using Telerik.Reporting
@using Telerik.ReportViewer.Mvc
@{
    ViewBag.Title = "Enable Accessibility Example";
}
@(Html.TelerikReporting().ReportViewer()
    // Set the ID of the viewer
    .Id("reportViewer1")
    // Set the service URL for the REST Service
    .ServiceUrl(Url.Content("~/api/reports/"))
    // Enable the accessibility features in the viewer
    .EnableAccessibility(true)
)
````


## Id

Sets the unique identifier for the MVC Report Viewer HTML element that will be used by the initialization script to locate and initialize the viewer. This identifier is required for proper viewer initialization and must be unique within the page HTML structure.

### Type

`System.String`

### Example

````C#
@using Telerik.ReportViewer.Mvc

@* Example: Sets the unique id of the Report Viewer HTML element *@

@(Html.TelerikReporting().ReportViewer()
    .Id("reportViewer1")
    .ServiceUrl(Url.Content("~/api/reports/"))
)
````


## InitialPageAreaImageUrl

Sets the background image URL for the PageArea when parameter values are missing or invalid. Provides visual feedback to users when the report cannot be displayed due to missing or invalid parameters.

### Type

`System.String`

### Example

````C#
@using Telerik.Reporting
@using Telerik.ReportViewer.Mvc

<!-- Example: Setting the InitialPageAreaImageUrl for the Report Viewer -->
@(Html.TelerikReporting().ReportViewer()
    .Id("reportViewer1")
    .ServiceUrl(Url.Content("~/api/reports/"))
    // Sets the background image URL for the PageArea when parameter values are missing or invalid.
    .InitialPageAreaImageUrl(Url.Content("~/Content/images/empty-parameters.png"))
)
````


## KeepClientAlive

Sets whether the client session will be kept alive by sending periodic requests to prevent session timeout. Prevents client session expiration during extended report viewing sessions by maintaining server communication.

### Type

`System.Boolean`

### Example

````C#
@using Telerik.ReportViewer.Mvc

@{
    // This example demonstrates how to use KeepClientAlive to enable client session keep-alive for the report viewer.
}

@(Html.TelerikReporting().ReportViewer()
    .Id("reportViewer1")
    .ServiceUrl(Url.Content("~/api/reports/"))
    .KeepClientAlive(true) // Enables sending periodic keep-alive requests
)
````


## PageMode

Specifies whether the viewer is in Continuous scroll or Single page mode.

- SinglePage - Displays only one report page in PageArea container
- ContinuousScroll - Displays large amount of report pages by appending additional pages on demand.
- SinglePage shows only one report page at a time, while ContinuousScroll enables scrolling through multiple pages with progressive loading.

### Type

[`Telerik.ReportViewer.Mvc.PageMode`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/enumerations%}#pagemode)

### Example

````C#
@using Telerik.ReportViewer.Mvc

@* Example: Set the viewer to ContinuousScroll PageMode *@
@(Html.TelerikReporting().ReportViewer()
    .Id("reportViewer1")
    .ServiceUrl(Url.Content("~/api/reports/"))
    .PageMode(PageMode.ContinuousScroll)
)
````


## ParameterEditors

Provides a fluent way to configure custom parameter editors for the report viewer. Enables replacement of default parameter input controls with custom JavaScript-based editors for enhanced user experience.

### Type

`System.Action{Telerik.ReportViewer.Mvc.IParameterEditorsBuilder}`

### Example

````C#
@using Telerik.Reporting
@using Telerik.ReportViewer.Mvc

@{ 
    ViewBag.Title = "Report Viewer with Custom Parameter Editors"; 
}

@(Html.TelerikReporting().ReportViewer()
    // Minimal required parameters
    .Id("reportViewer1")
    .ServiceUrl(Url.Content("~/api/reports/"))
    // Example usage of ParameterEditors method, supplying a configuration lambda
    .ParameterEditors(editors => {
        // editors is of type IParameterEditorsBuilder
        // Custom editors can be configured here
        // Example: editors.Add<Telerik.Reporting.ParameterTypes.DateTime>("MyDateParameter", "kendo-datepicker");
        // For demonstration, we'll just show the call is possible
    })
)
````


## Parameters

Configures the report parameters display and interaction options. Controls how report parameters are displayed and managed within the viewer interface.

### Type

[`Telerik.ReportViewer.Mvc.Parameters`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/types%}#parameters)

### Example

````C#
@using Telerik.ReportViewer.Mvc

@{
    ViewBag.Title = "ReportViewer Parameters Example";
}

@(Html.TelerikReporting().ReportViewer()
    // Minimum config: id and service url -- these are required for any viewer.
    .Id("reportViewer1")
    .ServiceUrl(Url.Content("~/api/reports/"))
    // Example: Configure parameter editors, such as using ComboBox for single select parameter editors
    .Parameters(new Parameters { Editors = new Editors { SingleSelect = EditorTypes.ComboBox } })
)
````


## ParametersAreaPosition

Specifies where the Parameters Area should be displayed.

- Right - Displays Parameters Area on the right of the page view.
- Left - Displays Parameters Area on the left of the page view.
- Top - Displays Parameters Area on the top of the page view.
- Bottom - Displays Parameters Area on the bottom of the page view.
- Controls the placement of the parameters panel for optimal user experience and interface layout.

### Type

[`Telerik.ReportViewer.Mvc.ParametersAreaPosition`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/enumerations%}#parametersareaposition)

### Example

````C#
@using Telerik.ReportViewer.Mvc

<!-- Example showing how to set the Parameters Area position to the right of the page view -->
@(Html.TelerikReporting().ReportViewer()
    .Id("reportViewer1")
    .ServiceUrl(Url.Content("~/api/reports/"))
    .ParametersAreaPosition(ParametersAreaPosition.Right)
)
````


## ParametersAreaVisible

Sets the initial visibility state of the viewer's parameters area. Controls whether the parameters panel is visible when the viewer first loads, regardless of parameter presence.

### Type

`System.Boolean`

### Example

````C#
@using Telerik.ReportViewer.Mvc

<!-- Example showing how to set the parameters area visibility in the HTML5 Report Viewer for MVC -->
@(Html.TelerikReporting().ReportViewer()
    .Id("reportViewer1")
    .ServiceUrl(Url.Content("~/api/reports/"))
    // Makes the parameters area initially visible
    .ParametersAreaVisible(true)
)
````


## PersistSession

Sets whether the viewer's client session should be persisted between page refreshes using browser sessionStorage. Session persistence maintains viewer state during postbacks and page refreshes for improved user experience.

### Type

`System.Boolean`

### Example

````C#
@using Telerik.ReportViewer.Mvc

<!-- Example: Set PersistSession to true to persist session between page refreshes -->
@(Html.TelerikReporting().ReportViewer()
    .Id("reportViewer1")
    .ServiceUrl(Url.Content("~/api/reports/"))
    .PersistSession(true)
)
````


## PrintMode

Sets the print mode of the viewer.

- Three modes exist currently:
- AutoSelect - Specifies that the viewer should automatically determine how to print: through the browser's PDF plug-in or through export to a PDF file.
- ForcePDFPlugin - Specifies that the viewer should always use the PDF plugin regardless of the browser's version and settings.
- ForcePDFFile - Specifies that the viewer should always export the report document to PDF format with the 'print' script enabled.
- Controls the printing mechanism based on browser capabilities and user requirements for optimal print experience.

### Type

[`Telerik.ReportViewer.Mvc.PrintMode`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/enumerations%}#printmode)

### Example

````C#
@using Telerik.Reporting
@using Telerik.ReportViewer.Mvc

<!--
Example: Set the print mode of the Telerik Reporting HTML5 MVC Report Viewer to ForcePDFPlugin.
-->

@(Html.TelerikReporting().ReportViewer()
    .Id("reportViewer1")
    .ServiceUrl(Url.Content("~/api/reports/"))
    .PrintMode(PrintMode.ForcePDFPlugin)
)
````


## ReportServer

Sets the connection data for the Telerik Report Server that hosts the reports. Used when the viewer is connected to a Telerik Report Server instance (takes precedence over the ServiceUrl property) Connecting to Telerik Report Server for .NET is not supported.

### Type

[`Telerik.ReportViewer.Mvc.ReportServer`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/types%}#reportserver)

### Example

````C#
@using Telerik.ReportViewer.Mvc

@* Example demonstrating how to set the connection data for the Telerik Report Server using the ReportServer method *@
@(Html.TelerikReporting().ReportViewer()
    .Id("reportViewer1")
    .ReportServer(new ReportServer
    {
        Url = "http://report-server-host:83",
        Username = "admin",
        Password = "adminpass"
    })
)
````


## ReportSource

The `ReportSource` option has multiple overloads to support different configuration scenarios.

### ReportSource(string)

Sets the report source as a string identifier for the report displayed in the viewer. Simplified method for specifying reports using string-based identification without additional configuration.

#### Example

````C#
@using Telerik.ReportViewer.Mvc
@{
    ViewBag.Title = "Telerik HTML5 Report Viewer MVC Demo - ReportSource(string)";
}

<!--
    Example: Using the ReportSource(string) method to set the report displayed in the viewer by specifying its string identifier.
-->
@(Html.TelerikReporting().ReportViewer()
    .Id("reportViewer1")
    .ServiceUrl(Url.Content("~/api/reports/"))
    .ReportSource("MyReports/SampleReport") // Sets the report source by string
)
````

### ReportSource(TypeReportSource)

Sets the report source as a [`Telerik.Reporting.TypeReportSource`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/types%}#typereportsource) for the report displayed in the viewer. Used for reports that are implemented as .NET classes and referenced by their type information.

#### Example

````C#
@using Telerik.Reporting
@using Telerik.ReportViewer.Mvc

@{
    // Example demonstrating setting the report source using TypeReportSource
    var typeReportSource = new TypeReportSource
    {
        // Set the TypeName of the report class
        TypeName = "MyNamespace.MyReport, MyAssembly"
    };
}

@(Html.TelerikReporting().ReportViewer()
    .Id("reportViewer1")
    .ServiceUrl(Url.Content("~/api/reports/"))
    // Set the report source as a TypeReportSource
    .ReportSource(typeReportSource)
)
````

### ReportSource(UriReportSource)

Sets the report source as a [`Telerik.Reporting.UriReportSource`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/types%}#urireportsource) for the report displayed in the viewer. Used for reports stored as files that are referenced by their file system or web URI location.

#### Example

````C#
@using Telerik.Reporting
@using Telerik.ReportViewer.Mvc

<!-- Example: Set the report source using a UriReportSource for the Report Viewer -->
@(Html.TelerikReporting().ReportViewer()
    .Id("reportViewer1")
    .ServiceUrl(Url.Content("~/api/reports/"))
    // Set the report source as a UriReportSource
    .ReportSource(new UriReportSource { Uri = "Reports/MyReport.trdx" })
)
````

### ReportSource(string,System.Collections.Generic.IDictionary<string,object>)

Sets the report source as a string identifier and provides parameter values for the report displayed in the viewer. Combines report identification with parameter initialization for streamlined report setup with predefined values.

#### Example

````C#
@using Telerik.ReportViewer.Mvc
@{
    ViewBag.Title = "Telerik HTML5 Report Viewer MVC Demo";
}

@(Html.TelerikReporting().ReportViewer()
    // Minimal setup with id and service URL
    .Id("reportViewer1")
    .ServiceUrl(Url.Content("~/api/reports/"))
    // Set the report source using the report identifier and parameters
    .ReportSource("SampleReport", new Dictionary<string, object> { { "Parameter1", "Value1" } })
)
````


## Scale

Sets the zoom scale factor for the report display when using Specific scale mode. Only effective when ScaleMode is set to Specific, allowing precise control over report magnification.

### Type

`System.Double`

### Example

````C#
@using Telerik.ReportViewer.Mvc

<!--
Example demonstrating how to set the zoom scale factor for the report display using .Scale(double).
-->
@(Html.TelerikReporting().ReportViewer()
    .Id("reportViewer1")
    .ServiceUrl(Url.Content("~/api/reports/"))
    .Scale(1.0) // Sets the zoom scale to 100%
)
````


## ScaleMode

Sets the scale mode of the viewer.

- Three modes exist currently:
- FitPage - The whole report will fit on the page (will zoom in or out), regardless of its width and height.
- FitPageWidth - The report will be zoomed in or out so that the width of the screen and the width of the report match.
- Specific - Uses the scale to zoom in and out the report.
- Determines how the report is sized within the viewer area to optimize readability and user experience.

### Type

[`Telerik.ReportViewer.Mvc.ScaleMode`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/enumerations%}#scalemode)

### Example

````C#
@using Telerik.ReportViewer.Mvc

@* Example: Set the scale mode of the viewer to FitPage *@
@(Html.TelerikReporting().ReportViewer()
    .Id("reportViewer1")
    .ServiceUrl(Url.Content("~/api/reports/"))
    .ScaleMode(ScaleMode.FitPage)
)
````


## SearchMetadataOnDemand

Determines whether the search metadata will be delivered on demand or generated by default during report rendering. Enabling search will notify the report engine to produce search metadata while rendering the report.  This metadata is used by the report viewer in search dialog and in the report viewer area for highlighting the found and selected items. Default value: false

### Type

`System.Boolean`

### Example

````C#
@using Telerik.Reporting
@using Telerik.ReportViewer.Mvc

<!-- Example demonstrating the use of SearchMetadataOnDemand(bool) on the report viewer -->
@(Html.TelerikReporting().ReportViewer()
    .Id("reportViewer1")
    .ServiceUrl(Url.Content("~/api/reports/"))
    // Enables search metadata to be delivered on demand
    .SearchMetadataOnDemand(true)
)
````


## SendEmail

Configures the send email functionality options for the report viewer. Enables users to email reports directly from the viewer interface with customizable email settings.

### Type

[`Telerik.ReportViewer.Mvc.SendEmail`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/types%}#sendemail)

### Example

````C#
@using Telerik.ReportViewer.Mvc

@* Example demonstrating how to use the SendEmail method to enable the send email functionality on the report viewer *@
@(Html.TelerikReporting().ReportViewer()
    .Id("reportViewer1")
    .ServiceUrl(Url.Content("~/api/reports/"))
    .SendEmail(new SendEmail { Enabled = true })
)
````


## ServiceUrl

Sets the URL of the Telerik Reporting REST service that will provide the report viewer with reports and handle processing operations. The service must be properly configured for successful communication between the viewer and server.

### Type

`System.String`

### Example

````C#
@using Telerik.ReportViewer.Mvc

@{
    // Example of setting the ServiceUrl property for the report viewer.
}

@(Html.TelerikReporting().ReportViewer()
    .Id("reportViewer1")
    .ServiceUrl("/api/reports/")
)
````


## TemplateUrl

Sets the URL for the custom report viewer template that defines the viewer's UI structure and appearance. Allows customization of the viewer interface by providing a custom template with modified functionality or styling.

### Type

`System.String`

### Example

````C#
@using Telerik.Reporting
@using Telerik.ReportViewer.Mvc

@* Example demonstrating setting a custom template URL for the HTML5 Report Viewer *@
@(Html.TelerikReporting().ReportViewer()
    .Id("reportViewer1")
    .ServiceUrl("/api/reports/")
    .TemplateUrl("/ReportViewer/templates/customTemplate.html")
)
````


## ViewMode

Specifies whether the viewer is in interactive or print preview mode.

- PrintPreview - Displays the paginated report as if it is printed on paper. Interactivity is not enabled.
- Interactive - Displays the report in its original width and height with no paging. Additionally interactivity is enabled.
- PrintPreview displays paginated reports as they would appear when printed, while Interactive enables full report interactivity.

### Type

[`Telerik.ReportViewer.Mvc.ViewMode`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/enumerations%}#viewmode)

### Example

````C#
@using Telerik.Reporting
@using Telerik.ReportViewer.Mvc

<!--
This example demonstrates how to set the ViewMode of the Telerik Report Viewer to Interactive using the ViewMode method.
-->

@(Html.TelerikReporting().ReportViewer()
    .Id("reportViewer1")
    .ServiceUrl(Url.Content("~/api/reports/"))
    .ViewMode(ViewMode.Interactive)
)
````

