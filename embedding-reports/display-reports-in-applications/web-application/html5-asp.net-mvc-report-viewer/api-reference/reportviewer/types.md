---
title: Types
page_title: Types of the HTML5 ASP.NET MVC Report Viewer
description: Object types and interfaces used by the HTML5 ASP.NET MVC Report Viewer
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/types
tags: types
published: True
reportingArea: MVCWrapper
position: 6
---

# Types of the HTML5 ASP.NET MVC Report Viewer

## AccessibilityKeyMap

Provides a class for the key mapping used when report viewer accessibility is enabled.

### Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| CONFIRM_KEY | `System.Byte` | Key code for executing report actions and applying report parameters |
| CONTENT_AREA_KEY | `System.Byte` | Key code for navigating to report contents area, when pressed together with CTRL + ALT |
| DOCUMENT_MAP_AREA_KEY | `System.Byte` | Key code for navigating to document map area, when pressed together with CTRL + ALT |
| Default | [`Telerik.ReportViewer.Html5.Common.Options.AccessibilityKeyMap`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/types%}#accessibilitykeymap) | Returns an instance, initialized with the default key mapping |
| Equals(System.Object) | `System.Boolean` | Internal use only |
| Equals(Telerik.ReportViewer.Html5.Common.Options.AccessibilityKeyMap) | `System.Boolean` | Internal use only |
| GetHashCode | `System.Int32` | Internal use only |
| MENU_AREA_KEY | `System.Byte` | Key code for navigating to menu area, when pressed together with CTRL + ALT |
| PARAMETERS_AREA_KEY | `System.Byte` | Key code for navigating to parameters area, when pressed together with CTRL + ALT |

### Example

````C#
@using Telerik.ReportViewer.Html5.Common.Options


@(Html.TelerikReporting().ReportViewer()
    .Id("reportViewer1")
    .ServiceUrl(Url.Content("~/api/reports/"))
    // Example of creating an AccessibilityKeyMap
    .AccessibilityKeyMap(new AccessibilityKeyMap())
)
````


## CustomParameterEditor

Represents a custom parameter editor configuration for the MVC Report Viewer, enabling custom UI components for report parameter input. Both functions are executed in the client-side JavaScript context of the MVC Report Viewer.

### Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| CreateEditorFunction | `System.String` | Gets or sets the name of the JavaScript function that creates the custom parameter editor UI element. |
| MatchFunction | `System.String` | Gets or sets the name of the JavaScript match function that determines whether to use this custom editor for a specific parameter. |

### Example

````C#
@using Telerik.ReportViewer.Mvc

@{
    // Example of instantiating and configuring a CustomParameterEditor
    var customEditor = new CustomParameterEditor
    {
        // JavaScript function string that creates the custom editor UI
        CreateEditorFunction = "function (parameter, options) { /* custom editor implementation */ }",
        // JavaScript function string that matches this editor to parameters
        MatchFunction = "function (parameter) { return parameter.name === 'MyParameter'; }"
    };
}
````


## DeferredScripts

Represents a container for deferred JavaScript initialization statements for MVC Report Viewer components. Used to collect and render JavaScript initialization code at a specific location in the HTML document for optimal performance and loading behavior. Implements IHtmlString to enable direct rendering in MVC views and provides control over script tag generation for flexible script placement.

### Constructors

| Constructor | Description |
| ------ | ------ |
| DeferredScripts(System.Collections.Generic.IDictionary<string,string>,bool) | Initializes a new instance of the DeferredScripts class with the specified script collection and rendering options.<br>Enables deferred initialization by collecting scripts during page construction and rendering them at a controlled location in the HTML document. |

### Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| ToHtmlString | `System.String` | Converts the deferred scripts collection into an HTML string containing the JavaScript initialization statements.<br>Called automatically when the DeferredScripts object is rendered in an MVC view, providing the final JavaScript output for report viewer initialization. |

### Example

````C#
@using Telerik.ReportViewer.Mvc

<!-- Example: Rendering all deferred scripts for the Telerik MVC Report Viewer in a Razor view -->
@section scripts
{
    @(Html.TelerikReporting().DeferredScripts())
}
````


## Editors

Provides configuration options for parameter editor types used in the MVC Report Viewer. Used to specify which input control types should be used for single-select and multi-select parameter scenarios. Controls the visual appearance and interaction behavior of parameter input controls based on parameter configuration.

### Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| MultiSelect | [`Telerik.ReportViewer.Mvc.EditorTypes`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/enumerations%}#editortypes) | Gets or sets the editor type used for parameters that have available values and allow multiple selections.<br>Determines whether multi-select parameters with predefined values use ListView or ComboBox input controls. |
| SingleSelect | [`Telerik.ReportViewer.Mvc.EditorTypes`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/enumerations%}#editortypes) | Gets or sets the editor type used for parameters that have available values and allow only single selection.<br>Determines whether single-select parameters with predefined values use ListView or ComboBox input controls. |

### Example

````C#
@using Telerik.ReportViewer.Mvc

@{
    // Create an Editors instance to configure parameter input controls
    var editors = new Editors();

    // Set the control type used for single-select parameters (e.g., ComboBox)
    editors.SingleSelect = EditorTypes.ComboBox;
    // (Only valid values for MultiSelect are those defined in EditorTypes; 
    // some versions may not expose ListBox. Review EditorTypes for allowed values.)
}

@(Html.TelerikReporting().ReportViewer()
    .Id("reportViewer1")
    .ServiceUrl(Url.Content("~/api/reports/"))
    // Set the Editors configuration for parameters
    .Parameters(new Parameters { Editors = editors })
)
````


## HtmlHelpers

A class that contains a collection of all Telerik Reporting widgets

### Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| TelerikReporting(System.Web.Mvc.HtmlHelper) | `Telerik.ReportViewer.Mvc.ITelerikReportingFactory` | A factory used to generate the javascript representation of Telerik Reporting widgets |

### Example

````C#
@using Telerik.ReportViewer.Mvc

@{
    // Example demonstrating usage of the HtmlHelpers class by accessing TelerikReporting extension
    // This provides access to the Telerik Reporting widgets for embedding in your view.
    var telerikReportingHelper = HtmlHelpers.TelerikReporting(Html);
}
````


## InstanceReportSource

This report source is used when you have a reference to an already instantiated report  (`Telerik.Reporting.Report` instance). For better performance and compatibility use [`Telerik.Reporting.TypeReportSource`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/types%}#typereportsource).  Represents a report source that contains a reference to an instance of  `Telerik.Reporting.IReportDocument`.

### Constructors

| Constructor | Description |
| ------ | ------ |
| InstanceReportSource() | Initializes a new instance of the [`Telerik.Reporting.InstanceReportSource`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/types%}#instancereportsource) class. |

### Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| Equals(System.Object) | `System.Boolean` | Determines whether this instance and a specified object have the same value. |
| GetHashCode | `System.Int32` | Returns the hash code for this InstanceReportSource. |
| ReportDocument | `Telerik.Reporting.IReportDocument` | Gets or sets the `Telerik.Reporting.IReportDocument` instance for the report source. |
| ToString | `System.String` | Returns a string that represents the current InstanceReportSource. |

### Example

````C#
@using Telerik.Reporting
@using Telerik.ReportViewer.Mvc
@{
    ViewBag.Title = "InstanceReportSource Example";
}

<!-- Example: Use InstanceReportSource for the ReportViewer's ReportSource -->

@(
    Html.TelerikReporting().ReportViewer()
        .Id("reportViewer1")
        .ServiceUrl(Url.Content("~/api/reports/"))
        // Using InstanceReportSource to pass an already instantiated report.
        .ReportSource(new InstanceReportSource { ReportDocument = new Report() })
)
````


## Parameters

Provides configuration options for report parameters display and behavior within the MVC Report Viewer. Used to customize how parameter input controls are rendered and how users interact with report parameters. Contains editor configuration settings that control the appearance and functionality of parameter input controls.

### Constructors

| Constructor | Description |
| ------ | ------ |
| Parameters() | Initializes a new instance of the Parameters class with default settings. |

### Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| Editors | [`Telerik.ReportViewer.Mvc.Editors`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/types%}#editors) | Gets or sets the parameter editors configuration that defines the types of input controls used for different parameter scenarios.<br>Configures whether parameters with available values use ListView or ComboBox editors for single and multi-select scenarios. |

### Example

````C#
@using Telerik.Reporting
@using Telerik.ReportViewer.Mvc

@{
    // Example demonstrating how to use the Telerik.ReportViewer.Mvc.Parameters class
}

@(Html.TelerikReporting().ReportViewer()
    .Id("reportViewer1")
    .ServiceUrl(Url.Content("~/api/reports/"))
    // Configures parameters using the Parameters class
    .Parameters(new Parameters())
)
````


## ReportServer

Provides configuration data for connecting to a Telerik Report Server instance from the MVC Report Viewer. Used to establish authenticated connections to Report Server for centralized report management and deployment scenarios. Connecting to Telerik Report Server for .NET is not supported. Contains connection details including server URL and authentication credentials for Report Server integration.

### Constructors

| Constructor | Description |
| ------ | ------ |
| ReportServer() | Initializes a new instance of the ReportServer class with default settings. |

### Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| Password | `System.String` | Gets or sets the password associated with the specified username for Report Server authentication.<br>Required when Username is specified for authenticated access to protected reports and resources. |
| Url | `System.String` | Gets or sets the URL of the Telerik Report Server instance.<br>Must be a complete URL including protocol (http/https) pointing to the Report Server installation. |
| Username | `System.String` | Gets or sets a valid username that exists in Report Server registered users, or null/empty to use the built-in Guest account.<br>When empty, uses the Guest account which requires appropriate server permissions for accessing reports. |

### Example

````C#
@using Telerik.ReportViewer.Mvc

@{
    // Example usage of the ReportServer class to configure the MVC Report Viewer for Telerik Report Server integration
    var reportServer = new ReportServer
    {
        Url = "http://report-server-host:83",
        Username = "admin",
        Password = "adminpass"
    };
}

@(Html.TelerikReporting().ReportViewer()
    .Id("reportViewer1") 
    // Use ReportServer connection configuration instead of REST service
    .ReportServer(reportServer)
    // For Report Server, set the report path (e.g., "[Category]/[ReportName]"). Example shown with placeholder value.
    .ReportSource("Samples/Dashboard")
)
````


## ReportSource

Provides the base class for a report source. This is an abstract class that contains only a collection of parameter values that are passed to the `Telerik.Reporting.IReportDocument` object when its instance is initialized.

### Constructors

| Constructor | Description |
| ------ | ------ |
| ReportSource() | Initializes a new instance of the ReportSource class. |

### Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| Equals(System.Object) | `System.Boolean` | Determines whether this instance and a specified object have the same value. |
| GetHashCode | `System.Int32` | Returns the hash code for this ReportSource. |
| Parameters | `Telerik.Reporting.ParameterCollection` | Gets the parameter values that are passed to the `Telerik.Reporting.IReportDocument` object when its instance is initialized.<br>The parameter name must match the name of the `Telerik.Reporting.ReportParameter` of the `Telerik.Reporting.IReportDocument`<br>in order the value to be passed correctly.<br>If a parameter (available in the report definition) is omitted in this collection, the report will be processed by evaluating the Value property of the Report Parameter in the report definition. |
| ToString | `System.String` | Returns a string that represents the current ReportSource. |

### Example

````C#
@* This example demonstrates how to assign an abstract Telerik.Reporting.ReportSource (via a derived type, e.g., UriReportSource) as the report source for the HTML5 Report Viewer. *@
@using Telerik.Reporting
@using Telerik.ReportViewer.Mvc

@(Html.TelerikReporting().ReportViewer()
    .Id("reportViewer1")
    .ServiceUrl(Url.Content("~/api/reports/"))
    // Using UriReportSource, which inherits from ReportSource (ReportSource is abstract)
    .ReportSource(new UriReportSource { Uri = "" })
)
````


## ReportSourceCollection

Represents a collection of  [`Telerik.Reporting.InstanceReportSource`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/types%}#reportsource) objects.

### Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| AddRange(System.Collections.Generic.IEnumerable{Telerik.Reporting.ReportSource}) | - | Adds an array of report source objects to the collection.<br><br>The <B>ReportSource</B> objects contained in the items array are <br>appended to the end of the collection. |

### Example

````C#
@using Telerik.Reporting

@* Example demonstrating creation and usage of Telerik.Reporting.ReportSourceCollection *@
@{
    // Create a new ReportSourceCollection instance
    var reportSources = new ReportSourceCollection();

    // Create a ReportSource (e.g. UriReportSource or TypeReportSource)
    var reportSource = new UriReportSource() { Uri = "SampleReport.trdp" };

    // Add the ReportSource to the collection
    reportSources.Add(reportSource);
}
````


## SendEmail

Provides a class for the send e-mail message options. Contains the enabled property, the preselected rendering Format, from and to e-mail addresses.

### Constructors

| Constructor | Description |
| ------ | ------ |
| SendEmail() | The default constructor. |

### Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| Body | `System.String` | A string used for the MailMessage Body value.<br>This field is optional.<br>The users can modify this value in the Send Mail Message dialog. <br>The SendMailMessage implementation should accept the specified e-mail body. |
| CC | `System.String` | A valid e-mail for the e-mail message CC address.<br>This field is optional.<br>The users can modify this value in the Send Mail Message dialog. <br>The SendMailMessage implementation should accept the specified CC e-mail addresses. |
| Enabled | `System.Boolean` | Indicates whether to show the send e-mail button |
| Format | `System.String` | The preselected rendering format. <br>The users can modify this value in the Send Mail Message dialog. |
| From | `System.String` | A valid e-mail for the e-mail message FROM address.<br>This field is required if empty the user should set it in the Send Mail Message dialog.<br>The users can modify this value in the Send Mail Message dialog. <br>The SendMailMessage implementation should accept the specified FROM e-mail address. |
| Subject | `System.String` | A string used for the MailMessage Subject value.<br>This field is optional.<br>The users can modify this value in the Send Mail Message dialog. <br>The SendMailMessage implementation should accept the specified e-mail subject. |
| To | `System.String` | A valid e-mail for the e-mail message TO address.<br>This field is required if empty the user should set it in the Send Mail Message dialog.<br>The users can modify this value in the Send Mail Message dialog. <br>The SendMailMessage implementation should accept the specified TO e-mail address. |

### Example

````C#
@using Telerik.Reporting
@using Telerik.ReportViewer.Mvc

@{
    ViewBag.Title = "Telerik HTML5 Report Viewer SendEmail Example";
}

<!-- Example demonstrating how to configure the SendEmail options of the report viewer -->

@(Html.TelerikReporting().ReportViewer()
    .Id("reportViewer1")
    .ServiceUrl(Url.Content("~/api/reports/"))
    .SendEmail(new SendEmail
    {
        Enabled = true, // Enables the Send Email button
        Subject = "Monthly Report", // Sets the default subject
        Body = "Please find the attached report.", // Sets the default email body
        To = "recipient@example.com", // Sets default recipient
        From = "sender@example.com", // Sets default sender
        CC = "cc@example.com", // Sets default CC recipient
        Format = "PDF" // Sets default format (e.g. PDF, XLSX)
    })
)
````


## TypeReportSource

Represents a report source that allows a report document to be instantiated from an `System.Type.AssemblyQualifiedName`.

### Constructors

| Constructor | Description |
| ------ | ------ |
| TypeReportSource() | Initializes a new instance of the [`Telerik.Reporting.TypeReportSource`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/types%}#typereportsource) class. |

### Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| Equals(System.Object) | `System.Boolean` | Determines whether this instance and a specified object have the same value. |
| GetHashCode | `System.Int32` | Returns the hash code for this TypeReportSource. |
| ToString | `System.String` | Returns a string that represents the current TypeReportSource. |
| TypeName | `System.String` | Gets or sets the assembly qualified type name of the report document.<br><br>Use this property to specify the type name of the report document.<br>Must be the assembly qualified name of the `System.Type` of the report.<br><br>The target type should implement the <br>`Telerik.Reporting.IReportDocument` interface <br>and should have a default (parameterless) constructor. <br>The default constructor is used from the reporting engine to create the report<br>instance.<br><br>This property can accept an expression when the report source is used in a `Telerik.Reporting.SubReport` item <br>or a `Telerik.Reporting.NavigateToReportAction` action. |

### Example

````C#
@using Telerik.Reporting
@using Telerik.ReportViewer.Mvc
@{
    ViewBag.Title = "TypeReportSource Example";
}

// Demonstrates how to configure the ReportViewer with a TypeReportSource
@(Html.TelerikReporting().ReportViewer()
      .Id("reportViewer1")
      .ServiceUrl(Url.Content("~/api/reports/"))
      .ReportSource(new TypeReportSource()
      {
          // Set the fully qualified type name of the report to instantiate
          TypeName = "Namespace.ReportClassName, AssemblyName"
      })
)
````


## UriReportSource

Represents a report source that loads a report document from a URI. The URI must point to a physical TRDX, TRDP or TRBP file.

### Constructors

| Constructor | Description |
| ------ | ------ |
| UriReportSource() | Initializes a new instance of the [`Telerik.Reporting.UriReportSource`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/types%}#urireportsource) class. |

### Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| Create(System.String,System.String) | [`Telerik.Reporting.UriReportSource`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/types%}#urireportsource) | Creates a UriReportSource by resolving the relative report path against the base path. |
| Equals(System.Object) | `System.Boolean` | Determines whether this instance and a specified object have the same value. |
| GetHashCode | `System.Int32` | Returns the hash code for this UriReportSource. |
| ToString | `System.String` | Returns a string that represents the current UriReportSource. |
| Uri | `System.String` | Gets or sets the URI to load the report document from.<br><br>A URI.<br><br>This property can accept an expression when the report source is used in a `Telerik.Reporting.SubReport` item <br>or a `Telerik.Reporting.NavigateToReportAction` action. |

### Example

````C#
@using Telerik.Reporting
@using Telerik.ReportViewer.Mvc

@* Example: Using UriReportSource to specify a report location *@
@(Html.TelerikReporting().ReportViewer()
    .Id("reportViewer1")
    .ServiceUrl(Url.Content("~/api/reports/"))
    .ReportSource(new UriReportSource { Uri = "/Reports/SampleReport.trdp" })
)
````


## XmlReportSource

Represents a report source that contains the XML markup of a report document.

### Constructors

| Constructor | Description |
| ------ | ------ |
| XmlReportSource() | Initializes a new instance of the [`Telerik.Reporting.XmlReportSource`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/types%}#xmlreportsource) class. |

### Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| Equals(System.Object) | `System.Boolean` | Determines whether this instance and a specified object have the same value. |
| GetHashCode | `System.Int32` | Returns the hash code for this XmlReportSource. |
| ToString | `System.String` | Returns a string that represents the current XmlReportSource. |
| Xml | `System.String` | Gets or sets the XML markup of a `Telerik.Reporting.IReportDocument`.<br><br>This property can accept an expression when the report source is used in a `Telerik.Reporting.SubReport` item <br>or a `Telerik.Reporting.NavigateToReportAction`. |

### Example

````C#
@using Telerik.Reporting
@using Telerik.ReportViewer.Mvc

@{
    ViewBag.Title = "XmlReportSource Example";
}

<!-- Example demonstrating the use of Telerik.Reporting.XmlReportSource as the Report Source for the Telerik MVC Report Viewer -->

@{
    // Create a new XmlReportSource instance and set its Xml property to your report XML string
    var xmlReportSource = new Telerik.Reporting.XmlReportSource
    {
        Xml = "<Report xmlns='http://schemas.telerik.com/reporting/2016/ReportDefinition'></Report>"
    };
}

@(Html.TelerikReporting().ReportViewer()
    .Id("reportViewer1")
    .ServiceUrl(Url.Content("~/api/reports/"))
    .ReportSource(xmlReportSource)
)
````

