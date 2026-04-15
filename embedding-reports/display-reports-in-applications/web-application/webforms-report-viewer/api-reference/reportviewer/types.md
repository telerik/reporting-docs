---
title: Types
page_title: Types of the HTML5 ASP.NET WebForms Report Viewer
description: Object types and interfaces used by the HTML5 ASP.NET WebForms Report Viewer
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/types
tags: types
published: True
reportingArea: WebForms
position: 6
---

# Types of the HTML5 ASP.NET WebForms Report Viewer

## AccessibilityKeyMap

Provides a class for the key mapping used when report viewer accessibility is enabled.

### Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| CONFIRM_KEY | `System.Byte` | Key code for executing report actions and applying report parameters |
| CONTENT_AREA_KEY | `System.Byte` | Key code for navigating to report contents area, when pressed together with CTRL + ALT |
| DOCUMENT_MAP_AREA_KEY | `System.Byte` | Key code for navigating to document map area, when pressed together with CTRL + ALT |
| Default | [`Telerik.ReportViewer.Html5.Common.Options.AccessibilityKeyMap`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/types%}#accessibilitykeymap) | Returns an instance, initialized with the default key mapping |
| Equals(System.Object) | `System.Boolean` | Internal use only |
| Equals(Telerik.ReportViewer.Html5.Common.Options.AccessibilityKeyMap) | `System.Boolean` | Internal use only |
| GetHashCode | `System.Int32` | Internal use only |
| MENU_AREA_KEY | `System.Byte` | Key code for navigating to menu area, when pressed together with CTRL + ALT |
| PARAMETERS_AREA_KEY | `System.Byte` | Key code for navigating to parameters area, when pressed together with CTRL + ALT |

### Example

````C#
<!--Example: Using AccessibilityKeyMap with the ReportViewer's EnableAccessibility property-->
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Telerik HTML5 Web Forms Report Viewer Demo - AccessibilityKeyMap Example</title>
</head>
<body>
    <form runat="server">
        <!-- use accessibility key map in ReportViewer -->
        <telerik:ReportViewer 
            ID="reportViewer1"
            ServiceUrl="/api/reports/"
            runat="server">
            <ReportSource IdentifierType="TypeReportSource" Identifier="Telerik.Reporting.Examples.CSharp.ReportCatalog, CSharp.ReportLibrary, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null" />
            <AccessibilityKeyMap/>
        </telerik:ReportViewer>
    </form>
</body>
</html>
````


## ClientEvents

Represents a configuration class that provides properties for initializing client-side event handlers of the HTML5 WebForms ReportViewer control. Used to specify JavaScript function names that will be executed in response to various report viewer events during report rendering, printing, exporting, and user interaction. All event handler properties should contain JavaScript function names (without parentheses) that will be called when the corresponding events occur in the HTML5 ReportViewer.

### Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| Error | `System.String` | Gets or sets the name of the JavaScript function that will be called when an error occurs.<br>The error event is triggered when any error occurs during report processing, rendering, or viewer operations in the HTML5 ReportViewer. |
| ExportBegin | `System.String` | Gets or sets the name of the JavaScript function that will be called prior to starting the report export command.<br>The export begin event is triggered before the HTML5 ReportViewer starts generating the export document. |
| ExportEnd | `System.String` | Gets or sets the name of the JavaScript function that will be called when the exported document is ready for download, but prior to the actual downloading.<br>The export end event is triggered when the export document is ready but before the download starts. |
| InteractiveActionEnter | `System.String` | Gets or sets the name of the JavaScript function that will be called when the mouse cursor enters the area of a report item's action.<br>The interactive action enter event is triggered when the mouse hovers over interactive report elements in the HTML5 viewer. |
| InteractiveActionExecuting | `System.String` | Gets or sets the name of the JavaScript function that will be called when an interactive action is being executed.<br>The interactive action executing event is triggered when user clicks on interactive elements like drill-through links or toggle buttons in the HTML5 viewer. |
| InteractiveActionLeave | `System.String` | Gets or sets the name of the JavaScript function that will be called when the mouse cursor leaves the area of a report item's action.<br>The interactive action leave event is triggered when the mouse cursor moves away from interactive report elements in the HTML5 viewer. |
| PageReady | `System.String` | Gets or sets the name of the JavaScript function that will be called every time a page from the report is rendered and ready for display.<br>The page ready event is triggered when each individual report page completes rendering and is ready for display in the HTML5 viewer. |
| PrintBegin | `System.String` | Gets or sets the name of the JavaScript function that will be called prior to starting the print report command.<br>The print begin event is triggered before the HTML5 ReportViewer starts generating the print document. |
| PrintEnd | `System.String` | Gets or sets the name of the JavaScript function that will be called when the print document (Adobe PDF) is ready for download, but prior to being sent to the printer.<br>The print end event is triggered when the PDF print document is ready but before actual printing occurs. |
| Ready | `System.String` | Gets or sets the name of the JavaScript function that will be called when the report viewer template is loaded.<br>The ready event is triggered when the HTML5 ReportViewer template and UI components are fully loaded and initialized. |
| RenderingBegin | `System.String` | Gets or sets the name of the JavaScript function that will be called when the rendering of the report begins.<br>The rendering begin event is triggered when the HTML5 ReportViewer starts processing and rendering the report content. |
| RenderingEnd | `System.String` | Gets or sets the name of the JavaScript function that will be called when the rendering of the report ends.<br>The rendering end event is triggered when the HTML5 ReportViewer completes processing and rendering the report content. |
| UpdateUi | `System.String` | Gets or sets the name of the JavaScript function that will be called every time the UI needs an update; can be used for changing the UI of the report viewer while interacting with reports.<br>The UI update event is triggered whenever the HTML5 ReportViewer interface needs to refresh during user interactions. |
| ViewerToolTipOpening | `System.String` | Gets or sets the name of the JavaScript function that will be called when a tooltip is being opened.<br>The tooltip opening event is triggered when tooltips are about to be displayed for report elements or viewer controls in the HTML5 viewer. |


## CustomParameterEditor

Represents a custom parameter editor configuration with JavaScript function references for parameter matching and editor creation in the HTML5 WebForms ReportViewer. Used to define custom parameter editors that provide specialized input controls for specific parameter types or scenarios. Enables extensibility of the parameter editing experience by allowing custom JavaScript functions to determine parameter applicability and create custom editor interfaces.

### Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| CreateEditorFunction | `System.String` | Gets or sets the name of the JavaScript function that creates the custom editor control for parameters that match the criteria.<br>The function name should be specified without parentheses and must reference a JavaScript function that returns a custom editor control for parameter input in the HTML5 viewer. |
| MatchFunction | `System.String` | Gets or sets the name of the JavaScript match function that determines whether this custom editor should be used for a specific parameter.<br>The function name should be specified without parentheses and must reference a JavaScript function that returns true if the editor should be used for the given parameter. |


## DeferredScripts

Represents a WebForms control that renders deferred JavaScript initialization scripts for HTML5 ReportViewer components. Used to collect and output JavaScript initialization code at a specific location in the HTML document for optimal performance and loading behavior. Provides a way to defer script execution until a controlled point in the page rendering process, improving page load performance by separating script registration from script execution.

### Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| Render(System.Web.UI.HtmlTextWriter) | - | Renders the control content by outputting the deferred JavaScript scripts to the specified HTML writer.<br>Overrides the base render method to provide custom script output without additional HTML wrapper elements. |
| RenderContents(System.Web.UI.HtmlTextWriter) | - | Renders the JavaScript content of the control by writing the deferred scripts to the specified HTML writer.<br>Retrieves and renders all deferred JavaScript scripts that have been collected during the page lifecycle for HTML5 ReportViewer components. |
| ToString | `System.String` | Converts the deferred scripts collection into an HTML string containing the JavaScript initialization statements.<br>Retrieves all scripts that were stashed during the page lifecycle and formats them as HTML script elements for execution in the browser. |


## EditorsContainer

Provides configuration container for parameter editor types used in single-select and multi-select scenarios within the HTML5 WebForms ReportViewer. Used to specify the visual presentation style for different parameter selection scenarios. Controls the editor type selection for parameters with available values in the HTML5 viewer interface.

### Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| MultiSelect | [`Telerik.ReportViewer.Html5.WebForms.EditorTypes`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/enumerations%}#editortypes) | Gets or sets the editor type used for multi-select parameter scenarios.<br>Determines the visual style for parameters that allow multiple value selection from available options. |
| SingleSelect | [`Telerik.ReportViewer.Html5.WebForms.EditorTypes`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/enumerations%}#editortypes) | Gets or sets the editor type used for single-select parameter scenarios.<br>Determines the visual style for parameters that allow only single value selection from available options. |


## Parameter

A parameter passed to the `Telerik.Reporting.IReportDocument` object when initialized Contains automatic type conversion capabilities to ensure parameter values are properly formatted for report processing.

### Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| Name | `System.String` | Gets or sets the name of the parameter that identifies it within the report's parameter collection.<br>Must match the parameter name defined in the report to ensure proper parameter binding during report processing. |
| Value | `System.Object` | Gets or sets the value of the parameter with automatic type conversion for proper report processing.<br>Supports automatic conversion of string values to appropriate data types including integers, decimals, DateTime, TimeSpan, and boolean values for HTML5 report processing. |


## ParameterCollection

Represents a collection of [`Telerik.ReportViewer.Html5.WebForms.Parameter`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/types%}#parameter) objects used for configuring report parameters in the HTML5 WebForms ReportViewer. Used to manage parameter values that are passed to reports during initialization and processing. The collection prevents duplicate parameter names by updating existing parameter values when adding parameters with matching names.

### Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| Add(System.String,System.Object) | - | Creates a [`Telerik.ReportViewer.Html5.WebForms.Parameter`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/types%}#parameter) with specific settings and<br>adds it to the <br>[`Telerik.ReportViewer.Html5.WebForms.ParameterCollection`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/types%}#parametercollection) or updates an existing one. |
| AddRange(System.Collections.Generic.IEnumerable{Telerik.ReportViewer.Html5.WebForms.Parameter}) | - | Adds/updates an enumerable of [`Telerik.ReportViewer.Html5.WebForms.Parameter`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/types%}#parameter) objects to/in the <br>[`Telerik.ReportViewer.Html5.WebForms.ParameterCollection`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/types%}#parametercollection).<br><br>The [`Telerik.ReportViewer.Html5.WebForms.Parameter`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/types%}#parameter) objects returned from the<br>enumerable are appended to the end of the <br>[`Telerik.ReportViewer.Html5.WebForms.ParameterCollection`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/types%}#parametercollection) or updated in place. |
| Contains(System.String) | `System.Boolean` | Determines whether the [`Telerik.ReportViewer.Html5.WebForms.ParameterCollection`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/types%}#parametercollection)<br>contains a parameter with a specific name. |
| Equals(System.Object) | `System.Boolean` | Determines whether the current ParameterCollection is equal to the specified object. |
| Equals(Telerik.ReportViewer.Html5.WebForms.ParameterCollection) | `System.Boolean` | Determines whether the current ParameterCollection is equal to another ParameterCollection by comparing all parameter values.<br>Performs deep comparison of all parameters including their names and values for collection equality determination. |
| GetHashCode | `System.Int32` | Serves as the default hash function for the ParameterCollection.<br>Calculates a hash code from all parameters in the collection to support proper hash table operations. |
| IndexOf(System.String) | `System.Int32` | Determines the index of a specific parameter in the<br>[`Telerik.ReportViewer.Html5.WebForms.ParameterCollection`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/types%}#parametercollection). |
| InsertItem(System.Int32,Telerik.ReportViewer.Html5.WebForms.Parameter) | - | Inserts a parameter at the specified index, or updates an existing parameter if one with the same name already exists.<br>If a parameter with the same name already exists, the existing parameter's value is updated instead of adding a duplicate. |
| Item(System.String) | [`Telerik.ReportViewer.Html5.WebForms.Parameter`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/types%}#parameter) | Gets a [`Telerik.ReportViewer.Html5.WebForms.Parameter`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/types%}#parameter) by name from the collection.<br>Provides indexed access to parameters by name for convenient parameter value retrieval and assignment. |
| SetItem(System.Int32,Telerik.ReportViewer.Html5.WebForms.Parameter) | - | Sets the parameter at the specified index, or updates an existing parameter if one with the same name already exists.<br>If a parameter with the same name already exists at a different index, the existing parameter's value is updated instead of setting at the specified index. |
| ToString | `System.String` | Returns a string representation of the ParameterCollection containing all parameter information.<br>Provides a compact string representation of all parameters for debugging and logging purposes. |


## ParameterEditors

Represents a configuration class that provides properties for initializing parameter editors of the HTML5 WebForms ReportViewer. Used to specify JavaScript function names that will handle different types of report parameters and create appropriate input controls in the HTML5 viewer interface. Enables customization of parameter editing experience by allowing assignment of specific JavaScript editors for different parameter types and scenarios.

### Constructors

| Constructor | Description |
| ------ | ------ |
| ParameterEditors() | Initializes a new instance of the ParameterEditors class with default settings and an empty custom editors collection. |

### Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| BooleanEditor | `System.String` | Gets or sets the name of the JavaScript function that will handle Boolean parameters in the HTML5 viewer.<br>Used for boolean parameter input controls such as checkboxes or toggle buttons for true/false values. |
| CustomEditors | `System.Collections.Generic.List{Telerik.ReportViewer.Html5.WebForms.CustomParameterEditor}` | Gets or sets a collection of custom parameter editors that can handle specialized parameter scenarios in the HTML5 viewer.<br>Custom editors are evaluated before all other editors in the specified order, allowing for complex parameter scenarios like MultiValue DateTime parameters. |
| DateTimeEditor | `System.String` | Gets or sets the name of the JavaScript function that will handle DateTime parameters in the HTML5 viewer.<br>Used for date and time parameter input controls with appropriate date picker functionality. |
| DefaultEditor | `System.String` | Gets or sets the name of the JavaScript function that will handle parameters that don't match any specific type or scenario.<br>Used as a fallback editor for parameters that don't have specific editors assigned in the HTML5 viewer. |
| MultiSelectEditor | `System.String` | Gets or sets the name of the JavaScript function that will handle parameters with available values and MultiValue set to true.<br>Used for parameters that allow multiple selections from a predefined list of available values in the HTML5 viewer. |
| MultiValueEditor | `System.String` | Gets or sets the name of the JavaScript function that will handle parameters with MultiValue set to true but without provided available values.<br>Used for parameters that allow multiple values but don't have a predefined list of available values in the HTML5 viewer. |
| NumberEditor | `System.String` | Gets or sets the name of the JavaScript function that will handle Numeric parameters in the HTML5 viewer.<br>Used for numeric parameter input controls including integers, decimals, and other numeric types. |
| SingleSelectEditor | `System.String` | Gets or sets the name of the JavaScript function that will handle parameters with available values and MultiValue set to false.<br>Used for parameters that allow single selection from a predefined list of available values in the HTML5 viewer. |
| StringEditor | `System.String` | Gets or sets the name of the JavaScript function that will handle String parameters in the HTML5 viewer.<br>Used for text-based parameter input controls for string value entry. |


## Parameters

Provides configuration options for parameter editors within the HTML5 WebForms ReportViewer. Used to customize the display style and interaction behavior of parameter input controls in the HTML5 viewer interface. Contains settings for parameter editor types that control how parameter inputs are rendered and presented to users.

### Constructors

| Constructor | Description |
| ------ | ------ |
| Parameters() | Initializes a new instance of the Parameters class with default settings. |

### Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| Editors | [`Telerik.ReportViewer.Html5.WebForms.EditorsContainer`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/types%}#editorscontainer) | Gets or sets the editors container that defines the parameter editor types for single and multi-select scenarios.<br>Configures the visual style of parameter editors for both single-select and multi-select parameter scenarios in the HTML5 viewer. |


## ReportServer

Provides a class for the report server data. Contains the URL to the report server instance, a valid username and password. Connecting to Telerik Report Server for .NET is not supported.

### Constructors

| Constructor | Description |
| ------ | ------ |
| ReportServer() | The default constructor. |

### Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| Password | `System.String` | The password associated with the username. Empty when Username is not set |
| Url | `System.String` | The URL of the Telerik Report Server instance |
| Username | `System.String` | A valid username that exists in Report Server registered users.<br>Empty in order to use the built-in Guest account.<br>Either usage requires configured server permissions for accessing the report. |


## ReportSource

Provides a configuration class for the report source used in the HTML5 WebForms ReportViewer. Contains the collection of parameter values, report identifier, and identifier type for configuring report loading and processing. Used to specify which report to display and provide parameter values for report initialization in HTML5 viewer scenarios.

### Constructors

| Constructor | Description |
| ------ | ------ |
| ReportSource() | Initializes a new instance of the ReportSource class with default settings. |

### Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| Identifier | `System.String` | Gets or sets the report identifier used to locate and load the report in the HTML5 viewer.<br>The format and interpretation of this identifier depends on the IdentifierType setting and determines how the report is resolved and loaded. |
| IdentifierType | [`Telerik.ReportViewer.Html5.WebForms.IdentifierType`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/enumerations%}#identifiertype) | Gets or sets the type of the report identifier that determines how the identifier is interpreted and resolved.<br>Specifies whether the identifier represents a type name, URI, or custom identifier format for report loading in the HTML5 viewer. |
| Parameters | [`Telerik.ReportViewer.Html5.WebForms.ParameterCollection`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/types%}#parametercollection) | Gets a collection of parameter values passed to the `Telerik.Reporting.IReportDocument` object when initialized in the HTML5 viewer.<br>Contains parameter name-value pairs that will be applied to the report during initialization and processing in the HTML5 WebForms ReportViewer. |

### Example

````C#
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CSharp.NetFramework.WebFormsIntegrationDemo.Default" %>

<%@ Register TagPrefix="telerik" Assembly="Telerik.ReportViewer.Html5.WebForms" Namespace="Telerik.ReportViewer.Html5.WebForms" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ReportSource Example</title>
</head>
<body>
    <form runat="server">
        <!-- Example: Using Telerik.ReportViewer.Html5.WebForms.ReportSource to configure reporting information -->
        <telerik:ReportViewer ID="reportViewer1" runat="server" ServiceUrl="/api/reports">
            <ReportSource 
                IdentifierType="TypeReportSource" 
                Identifier="Telerik.Reporting.Examples.CSharp.ReportCatalog, CSharp.ReportLibrary, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null">
            </ReportSource>
        </telerik:ReportViewer>
    </form>
</body>
</html>
````


## ReportViewer

Represents the HTML5 WebForms ReportViewer control that provides comprehensive report viewing capabilities with modern HTML5-based rendering and interactive user interface. Used to display Telerik Reporting reports within ASP.NET WebForms applications with full JavaScript-based client-side functionality for report interaction, navigation, and management. Provides a complete HTML5-based report viewing solution with responsive design, client-side processing, and extensive customization options for modern web applications.

### Constructors

| Constructor | Description |
| ------ | ------ |
| ReportViewer() | Initializes a new instance of the HTML5 WebForms ReportViewer class with default settings and dimensions. |

### Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| AccessibilityKeyMap | [`Telerik.ReportViewer.Html5.Common.Options.AccessibilityKeyMap`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/types%}#accessibilitykeymap) | Gets or sets the keyboard mappings used when accessibility mode is enabled in the HTML5 viewer.<br>Defines custom key combinations for accessibility navigation including content area, document map, menu, and parameters area access when accessibility features are enabled. |
| AuthenticationToken | `System.String` | Gets or sets the encoded authentication token used to secure and authenticate requests between the HTML5 viewer and the reporting service.<br>Provides security for report access and ensures that only authorized users can view reports through the HTML5 viewer interface. |
| CheckedButtonClass | `System.String` | Gets or sets the CSS class applied to toolbar buttons when they are in the checked or active state.<br>Enables custom styling of checked buttons in the HTML5 viewer toolbar for consistent visual design and user experience. |
| ClientEvents | [`Telerik.ReportViewer.Html5.WebForms.ClientEvents`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/types%}#clientevents) | Gets or sets the client-side event handlers configuration for the HTML5 report viewer.<br>Provides a comprehensive way to attach JavaScript functions to various HTML5 viewer events including rendering, printing, exporting, and user interactions. |
| Deferred | `System.Boolean` | Gets or sets a value indicating whether the HTML5 viewer's JavaScript initialization is deferred until a specific point in the page lifecycle.<br>When enabled, allows for more controlled initialization timing of the HTML5 viewer, which can be useful for complex page scenarios or custom loading sequences. |
| DisabledButtonClass | `System.String` | Gets or sets the CSS class applied to toolbar buttons when they are in the disabled state.<br>Enables custom styling of disabled buttons in the HTML5 viewer toolbar for consistent visual design and user experience. |
| DocumentMapAreaPosition | [`Telerik.ReportViewer.Html5.WebForms.DocumentMapAreaPosition`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/enumerations%}#documentmapareaposition) | Gets or sets the positioning of the document map area within the HTML5 viewer interface.<br>Controls the placement of the document map navigation panel relative to the report content area for optimal user experience and interface layout in HTML5 scenarios. |
| DocumentMapVisible | `System.Boolean` | Gets or sets a value indicating whether the document map navigation panel is initially visible in the HTML5 viewer.<br>Controls the initial visibility state of the document map that provides hierarchical navigation through report bookmarks and sections.<br>The document map is shown only if the report contains bookmarks.<br>The document map works both in the interactive and print preview view modes. |
| EnableAccessibility | `System.Boolean` | Gets or sets a value indicating whether accessibility features are enabled for the HTML5 report viewer and its contents.<br>When enabled, provides enhanced accessibility support including keyboard navigation, screen reader compatibility, and ARIA attributes for improved usability with assistive technologies. |
| GetReportParameters | `System.Collections.Generic.IDictionary{System.String,System.String}` | Gets the processed report parameters as a dictionary of parameter names and string values.<br>Provides access to the current parameter values that have been processed and applied to the report in the HTML5 viewer. |
| Height | `System.Web.UI.WebControls.Unit` | Gets or sets the height of the HTML5 ReportViewer control. |
| InitialPageAreaImageUrl | `System.String` | Gets or sets the background image URL displayed in the page area when parameter values are missing or invalid.<br>Provides visual feedback to users when the HTML5 viewer cannot display report content due to missing or invalid parameter values. |
| KeepClientAlive | `System.Boolean` | Gets or sets a value indicating whether the HTML5 viewer client session is kept alive through periodic server requests.<br>When enabled, prevents client session expiration by sending keep-alive requests to the server based on the ClientSessionTimeout configuration. When disabled, the client session may expire naturally. |
| LoadViewState(System.Object) | - | Loads the view state and updates the HTML5 viewer configuration from the saved state data.<br>Restores the viewer state and synchronizes client-side changes with server-side properties to maintain consistency across postbacks in the HTML5 viewer. |
| OnInit(System.EventArgs) | - | Initializes the HTML5 WebForms ReportViewer control during the Init phase of the page lifecycle.<br>Updates the viewer state and settings from client-side data before calling the base initialization to ensure proper HTML5 viewer setup and configuration. |
| OnPreRender(System.EventArgs) | - | Performs final processing and resource registration before the HTML5 ReportViewer control is rendered to the client.<br>Registers necessary JavaScript and CSS resources required for HTML5 viewer functionality including scripts, styles, and client-side initialization code. |
| PageMode | [`Telerik.ReportViewer.Html5.WebForms.PageMode`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/enumerations%}#pagemode) | Gets or sets the viewer's page mode.<br>SinglePage - Displays only one report page in PageArea container.<br>ContinuousScroll - Displays large amount of report pages by appending additional pages on demand.<br>ContinuousScroll mode enables seamless scrolling through multiple pages with on-demand loading, while SinglePage mode displays one page at a time for focused viewing. |
| PageNumber | `System.Int32` | Gets or sets the current page number of the report displayed in the HTML5 viewer.<br>Determines which page is initially displayed when the report loads in the HTML5 viewer interface. |
| ParameterEditors | [`Telerik.ReportViewer.Html5.WebForms.ParameterEditors`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/types%}#parametereditors) | Gets or sets the parameter editors configuration that defines JavaScript functions for handling different parameter types in the HTML5 viewer.<br>Enables customization of parameter input controls by specifying JavaScript editor functions for different parameter scenarios including single-select, multi-select, and type-specific editors. |
| Parameters | [`Telerik.ReportViewer.Html5.WebForms.Parameters`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/types%}#parameters) | Gets or sets the parameters display configuration that defines the visual appearance and behavior of parameter input controls.<br>Controls the parameter editor types and visual presentation styles for both single-select and multi-select parameter scenarios in the HTML5 viewer interface. |
| ParametersAreaPosition | [`Telerik.ReportViewer.Html5.WebForms.ParametersAreaPosition`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/enumerations%}#parametersareaposition) | Gets or sets the positioning of the parameters area within the HTML5 viewer interface.<br>Controls the placement of parameter input controls relative to the report content area for optimal user experience and interface layout in HTML5 scenarios. |
| ParametersAreaVisible | `System.Boolean` | Gets or sets a value indicating whether the parameters area is initially visible in the HTML5 viewer.<br>Controls the initial visibility state of the parameters input area for reports that contain parameters requiring user input. |
| PersistSession | `System.Boolean` | Gets or sets a value indicating whether the HTML5 viewer's client state is persisted between page refreshes and postbacks.<br>When enabled, the viewer state is stored in the browser's sessionStorage and maintained for the duration of the page session, preserving user settings and navigation state. |
| PrintMode | [`Telerik.ReportViewer.Html5.WebForms.PrintMode`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/enumerations%}#printmode) | Gets or sets the print mode of the viewer.<br>Three modes exist currently:<br>AutoSelect - Specifies that the viewer should automatically determine how to print: through the browser's PDF plug-in or through export to a PDF file.<br>ForcePDFPlugin - Specifies that the viewer should always use the PDF plugin regardless of the browser's version and settings.<br>ForcePDFFile - Specifies that the viewer should always export the report document to PDF format with the 'print' script enabled.<br>Controls the printing workflow to ensure optimal print experience across different browsers and PDF plugin configurations in HTML5 environments.<br>Available modes include AutoSelect for intelligent method selection, ForcePDFPlugin for direct plugin usage, and ForcePDFFile for download-based printing. |
| Render(System.Web.UI.HtmlTextWriter) | - | Renders the HTML5 ReportViewer control by outputting its contents to the specified HTML writer.<br>Delegates to RenderContents to output the HTML5 viewer markup without additional wrapper elements for clean HTML5 structure. |
| RenderContents(System.Web.UI.HtmlTextWriter) | - | Renders the HTML5 ReportViewer control contents by writing the viewer markup to the specified HTML writer.<br>Generates the complete HTML5 viewer markup including container elements, initialization scripts, and configuration options for client-side rendering. |
| RenderDesignTimeHtml(System.Web.UI.HtmlTextWriter) | - | Renders the HTML5 ReportViewer control for design-time display in Visual Studio designer.<br>Generates a simplified HTML representation of the HTML5 viewer for Visual Studio design surface display, showing the control dimensions and identification. |
| ReportServer | [`Telerik.ReportViewer.Html5.Common.ReportServer`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/types%}#reportserver) | Gets or sets the connection data of the report server that hosts the report.<br>The report server can have its Guest account enabled and with configured permissions for accessing the report without permisions.<br>Used when the viewer is connected to a Telerik Report Server instance (takes precedence over the ServiceUrl property)<br>The Report Server must have appropriate user accounts configured with necessary permissions for accessing and viewing reports in the HTML5 viewer environment.<br>Connecting to Telerik Report Server for .NET is not supported.<br>For more information see https://www.telerik.com/help/reporting/html5-report-viewer-howto-use-it-with-reportserver.html. |
| ReportSource | [`Telerik.ReportViewer.Html5.WebForms.ReportSource`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/types%}#reportsource) | Gets or sets the [`Telerik.ReportViewer.Html5.WebForms.ReportSource`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/types%}#reportsource) for the report displayed in the HTML5 viewer.<br>Specifies the report to be displayed including its identifier, parameters, and source type for proper report loading and processing in the HTML5 environment. |
| Scale | `System.Double` | Gets or sets the zoom level of the report where 1.0 equals 100% of the original report size.<br>Provides precise control over report magnification in the HTML5 viewer when using specific scaling mode or custom zoom requirements. |
| ScaleMode | [`Telerik.ReportViewer.Html5.WebForms.ScaleMode`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/enumerations%}#scalemode) | Gets or sets the scale mode of the viewer.<br>Three modes exist currently:<br>FitPage - The whole report will fit on the page (will zoom in or out), regardless of its width and height.<br>FitPageWidth - The report will be zoomed in or out so that the width of the screen and the width of the report match.<br>Specific - Uses the scale to zoom in and out the report.<br>Controls automatic report scaling behavior including FitPage for complete page visibility, FitPageWidth for width-based scaling, and Specific for custom scale values. |
| SearchMetadataOnDemand | `System.Boolean` | Gets or sets a value indicating whether search metadata is delivered on-demand or preloaded with the report in the HTML5 viewer.<br>When enabled, search metadata is loaded only when needed, reducing initial load time but potentially increasing search operation latency. When disabled, search metadata is preloaded for faster search operations. |
| SendEmail | [`Telerik.ReportViewer.Html5.WebForms.SendEmail`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/types%}#sendemail) | Gets or sets the email functionality configuration including enabled state, format selection, and default recipients.<br>Configures the send email feature within the HTML5 viewer toolbar, including preselected rendering formats and default email addresses for enhanced user experience. |
| ServiceUrl | `System.String` | Gets or sets the URL of the service which will provide the report viewer with reports.<br>The service must be properly configured so that the report viewer can successfully communicate with the server.<br>For more information on how to configure the service please check https://docs.telerik.com/reporting/embedding-reports/host-the-report-engine-remotely/telerik-reporting-rest-services/overview. |
| TemplateUrl | `System.String` | Gets or sets the URL for the report viewer template. The template can be edited -<br>new functionalities can be added and not needed ones can be removed.<br>For more information please check https://www.telerik.com/help/reporting/html5-report-viewer-templates.html.<br>Enables customization of the HTML5 viewer interface by specifying a custom template URL. If left empty, the default template is used for standard viewer functionality. |
| ToString | `System.String` | Converts the HTML5 ReportViewer control to its HTML string representation with all configuration options and client-side initialization.<br>Generates the final HTML output by populating viewer options and using ReportViewerWriter to create the complete HTML5 viewer structure with JavaScript initialization. |
| ViewMode | [`Telerik.ReportViewer.Html5.WebForms.ViewMode`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/enumerations%}#viewmode) | Gets or sets the viewer's view mode.<br>PrintPreview - Displays the paginated report as if it is printed on paper. Interactivity is not enabled.<br>Interactive - Displays the report in its original width and height with no paging. Additionally interactivity is enabled.<br>Interactive mode enables full report interactivity and navigation, while PrintPreview mode optimizes the display for print layout without interactive features. |
| Width | `System.Web.UI.WebControls.Unit` | Gets or sets the width of the HTML5 ReportViewer control. |

### Example

````C#
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CSharp.NetFramework.WebFormsIntegrationDemo.Default" %>

<%@ Register TagPrefix="telerik" Assembly="Telerik.ReportViewer.Html5.WebForms" Namespace="Telerik.ReportViewer.Html5.WebForms" %>

<!-- 
    Example: Using Telerik.ReportViewer.Html5.WebForms.ReportViewer
    This demonstrates the instantiation of the HTML5 WebForms ReportViewer control.
-->
 <telerik:ReportViewer
              ID="reportViewer1"
              runat="server"
              ServiceUrl="/api/reports">
            <ReportSource 
                IdentifierType="TypeReportSource"
                Identifier="Telerik.Reporting.Examples.CSharp.ReportCatalog, CSharp.ReportLibrary, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null">
            </ReportSource>
        </telerik:ReportViewer>
````


## SendEmail

Provides configuration options for the send email functionality within the HTML5 WebForms ReportViewer. Used to configure email settings including enabled state, preselected rendering format, and default email addresses for report sharing via email. Contains email message configuration properties that enable users to send reports directly from the HTML5 viewer toolbar with customizable default values.

### Constructors

| Constructor | Description |
| ------ | ------ |
| SendEmail() | Initializes a new instance of the SendEmail class with default settings. |

### Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| Body | `System.String` | A string used for the MailMessage Body value.<br>This field is optional.<br>The users can modify this value in the Send Mail Message dialog. <br>The SendMailMessage implementation should accept the specified e-mail body.<br>Provides an optional default message body that users can modify in the Send Mail Message dialog. The SendMailMessage implementation must accept the specified email body. |
| CC | `System.String` | A valid e-mail for the e-mail message CC address.<br>This field is optional.<br>The users can modify this value in the Send Mail Message dialog. <br>The SendMailMessage implementation should accept the specified CC e-mail addresses.<br>Provides an optional default CC address that users can modify in the Send Mail Message dialog. The SendMailMessage implementation must accept the specified CC email addresses. |
| Enabled | `System.Boolean` | Gets or sets a value indicating whether the send email button is visible and enabled in the HTML5 viewer toolbar.<br>When enabled, displays the send email button in the HTML5 viewer toolbar allowing users to email reports directly from the viewer interface. |
| Format | `System.String` | The preselected rendering format. <br>The users can modify this value in the Send Mail Message dialog.<br>Specifies the default document format for email attachments that users can modify in the Send Mail Message dialog before sending the report. |
| From | `System.String` | A valid e-mail for the e-mail message FROM address.<br>This field is required if empty the user should set it in the Send Mail Message dialog.<br>The users can modify this value in the Send Mail Message dialog. <br>The SendMailMessage implementation should accept the specified FROM e-mail address.<br>Provides a default sender address that users can modify in the Send Mail Message dialog. If empty, users must specify the FROM address before sending. The SendMailMessage implementation must accept the specified FROM email address. |
| Subject | `System.String` | A string used for the MailMessage Subject value.<br>This field is optional.<br>The users can modify this value in the Send Mail Message dialog. <br>The SendMailMessage implementation should accept the specified e-mail subject.<br>Provides an optional default subject that users can modify in the Send Mail Message dialog. The SendMailMessage implementation must accept the specified email subject. |
| To | `System.String` | A valid e-mail for the e-mail message TO address.<br>This field is required if empty the user should set it in the Send Mail Message dialog.<br>The users can modify this value in the Send Mail Message dialog. <br>The SendMailMessage implementation should accept the specified TO e-mail address.<br>Provides a default recipient address that users can modify in the Send Mail Message dialog. If empty, users must specify the TO address before sending. The SendMailMessage implementation must accept the specified TO email address. |

### Example

````C#
<!--
    Example: How to use the SendEmail class to enable the Send Mail toolbar button in <telerik:ReportViewer>.
-->
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Telerik HTML5 Web Forms Report Viewer Demo</title>
</head>
<body>
    <form runat="server">
    <telerik:ReportViewer
              ID="reportViewer1"
              runat="server"
              ServiceUrl="/api/reports">
            <ReportSource 
                IdentifierType="TypeReportSource"
                Identifier="Telerik.Reporting.Examples.CSharp.ReportCatalog, CSharp.ReportLibrary, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null">
            </ReportSource>
            <SendEmail Enabled="true"/>
        </telerik:ReportViewer>
    </form>
</body>
</html>
````

