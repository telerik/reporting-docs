---
title: Telerik.ReportViewer.Html5.WebForms.ReportViewer
page_title: Telerik.ReportViewer.Html5.WebForms.ReportViewer Type
description: "Represents the HTML5 WebForms ReportViewer control that provides comprehensive report viewing capabilities with modern HTML5-based rendering and interactive user interface. Used to display Telerik Reporting reports within ASP.NET WebForms applications with full JavaScript-based client-side functionality for report interaction, navigation, and management. Provides a complete HTML5-based report viewing solution with responsive design, client-side processing, and extensive customization options for modern web applications."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/types/reportviewer
published: True
reportingArea: WebForms
---

<style>
    table {
        display: grid;
        grid-template-columns: min-content min-content 1fr;
    }

    thead, tbody, tr {
        display: contents;
    }

    th,
    td:not(:last-child) {
        white-space: nowrap;
    }
</style>

# The `ReportViewer` type of the HTML5 ASP.NET WebForms Report Viewer

Represents the HTML5 WebForms ReportViewer control that provides comprehensive report viewing capabilities with modern HTML5-based rendering and interactive user interface. Used to display Telerik Reporting reports within ASP.NET WebForms applications with full JavaScript-based client-side functionality for report interaction, navigation, and management. Provides a complete HTML5-based report viewing solution with responsive design, client-side processing, and extensive customization options for modern web applications.

## Constructors

| Constructor | Description |
| ------ | ------ |
| ReportViewer() | Initializes a new instance of the HTML5 WebForms ReportViewer class with default settings and dimensions. |

## Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| AccessibilityKeyMap | [`Telerik.ReportViewer.Html5.Common.Options.AccessibilityKeyMap`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/types/accessibilitykeymap%}) | Gets or sets the keyboard mappings used when accessibility mode is enabled in the HTML5 viewer.<br>Defines custom key combinations for accessibility navigation including content area, document map, menu, and parameters area access when accessibility features are enabled. |
| AuthenticationToken | `System.String` | Gets or sets the encoded authentication token used to secure and authenticate requests between the HTML5 viewer and the reporting service.<br>Provides security for report access and ensures that only authorized users can view reports through the HTML5 viewer interface. |
| CheckedButtonClass | `System.String` | Gets or sets the CSS class applied to toolbar buttons when they are in the checked or active state.<br>Enables custom styling of checked buttons in the HTML5 viewer toolbar for consistent visual design and user experience. |
| ClientEvents | [`Telerik.ReportViewer.Html5.WebForms.ClientEvents`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/types/clientevents%}) | Gets or sets the client-side event handlers configuration for the HTML5 report viewer.<br>Provides a comprehensive way to attach JavaScript functions to various HTML5 viewer events including rendering, printing, exporting, and user interactions. |
| Deferred | `System.Boolean` | Gets or sets a value indicating whether the HTML5 viewer's JavaScript initialization is deferred until a specific point in the page lifecycle.<br>When enabled, allows for more controlled initialization timing of the HTML5 viewer, which can be useful for complex page scenarios or custom loading sequences. |
| DisabledButtonClass | `System.String` | Gets or sets the CSS class applied to toolbar buttons when they are in the disabled state.<br>Enables custom styling of disabled buttons in the HTML5 viewer toolbar for consistent visual design and user experience. |
| DocumentMapAreaPosition | [`Telerik.ReportViewer.Html5.WebForms.DocumentMapAreaPosition`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/enumerations/documentmapareaposition%}) | Gets or sets the positioning of the document map area within the HTML5 viewer interface.<br>Controls the placement of the document map navigation panel relative to the report content area for optimal user experience and interface layout in HTML5 scenarios. |
| DocumentMapVisible | `System.Boolean` | Gets or sets a value indicating whether the document map navigation panel is initially visible in the HTML5 viewer.<br>Controls the initial visibility state of the document map that provides hierarchical navigation through report bookmarks and sections.<br>The document map is shown only if the report contains bookmarks.<br>The document map works both in the interactive and print preview view modes. |
| EnableAccessibility | `System.Boolean` | Gets or sets a value indicating whether accessibility features are enabled for the HTML5 report viewer and its contents.<br>When enabled, provides enhanced accessibility support including keyboard navigation, screen reader compatibility, and ARIA attributes for improved usability with assistive technologies. |
| GetReportParameters | `System.Collections.Generic.IDictionary{System.String,System.String}` | Gets the processed report parameters as a dictionary of parameter names and string values.<br>Provides access to the current parameter values that have been processed and applied to the report in the HTML5 viewer. |
| Height | `System.Web.UI.WebControls.Unit` | Gets or sets the height of the HTML5 ReportViewer control. |
| InitialPageAreaImageUrl | `System.String` | Gets or sets the background image URL displayed in the page area when parameter values are missing or invalid.<br>Provides visual feedback to users when the HTML5 viewer cannot display report content due to missing or invalid parameter values. |
| KeepClientAlive | `System.Boolean` | Gets or sets a value indicating whether the HTML5 viewer client session is kept alive through periodic server requests.<br>When enabled, prevents client session expiration by sending keep-alive requests to the server based on the ClientSessionTimeout configuration. When disabled, the client session may expire naturally. |
| LoadViewState(System.Object) | - | Loads the view state and updates the HTML5 viewer configuration from the saved state data.<br>Restores the viewer state and synchronizes client-side changes with server-side properties to maintain consistency across postbacks in the HTML5 viewer. |
| OnInit(System.EventArgs) | - | Initializes the HTML5 WebForms ReportViewer control during the Init phase of the page lifecycle.<br>Updates the viewer state and settings from client-side data before calling the base initialization to ensure proper HTML5 viewer setup and configuration. |
| OnPreRender(System.EventArgs) | - | Performs final processing and resource registration before the HTML5 ReportViewer control is rendered to the client.<br>Registers necessary JavaScript and CSS resources required for HTML5 viewer functionality including scripts, styles, and client-side initialization code. |
| PageMode | [`Telerik.ReportViewer.Html5.WebForms.PageMode`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/enumerations/pagemode%}) | Gets or sets the viewer's page mode.<br>SinglePage - Displays only one report page in PageArea container.<br>ContinuousScroll - Displays large amount of report pages by appending additional pages on demand.<br>ContinuousScroll mode enables seamless scrolling through multiple pages with on-demand loading, while SinglePage mode displays one page at a time for focused viewing. |
| PageNumber | `System.Int32` | Gets or sets the current page number of the report displayed in the HTML5 viewer.<br>Determines which page is initially displayed when the report loads in the HTML5 viewer interface. |
| ParameterEditors | [`Telerik.ReportViewer.Html5.WebForms.ParameterEditors`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/types/parametereditors%}) | Gets or sets the parameter editors configuration that defines JavaScript functions for handling different parameter types in the HTML5 viewer.<br>Enables customization of parameter input controls by specifying JavaScript editor functions for different parameter scenarios including single-select, multi-select, and type-specific editors. |
| Parameters | [`Telerik.ReportViewer.Html5.WebForms.Parameters`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/types/parameters%}) | Gets or sets the parameters display configuration that defines the visual appearance and behavior of parameter input controls.<br>Controls the parameter editor types and visual presentation styles for both single-select and multi-select parameter scenarios in the HTML5 viewer interface. |
| ParametersAreaPosition | [`Telerik.ReportViewer.Html5.WebForms.ParametersAreaPosition`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/enumerations/parametersareaposition%}) | Gets or sets the positioning of the parameters area within the HTML5 viewer interface.<br>Controls the placement of parameter input controls relative to the report content area for optimal user experience and interface layout in HTML5 scenarios. |
| ParametersAreaVisible | `System.Boolean` | Gets or sets a value indicating whether the parameters area is initially visible in the HTML5 viewer.<br>Controls the initial visibility state of the parameters input area for reports that contain parameters requiring user input. |
| PersistSession | `System.Boolean` | Gets or sets a value indicating whether the HTML5 viewer's client state is persisted between page refreshes and postbacks.<br>When enabled, the viewer state is stored in the browser's sessionStorage and maintained for the duration of the page session, preserving user settings and navigation state. |
| PrintMode | [`Telerik.ReportViewer.Html5.WebForms.PrintMode`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/enumerations/printmode%}) | Gets or sets the print mode of the viewer.<br>Three modes exist currently:<br>AutoSelect - Specifies that the viewer should automatically determine how to print: through the browser's PDF plug-in or through export to a PDF file.<br>ForcePDFPlugin - Specifies that the viewer should always use the PDF plugin regardless of the browser's version and settings.<br>ForcePDFFile - Specifies that the viewer should always export the report document to PDF format with the 'print' script enabled.<br>Controls the printing workflow to ensure optimal print experience across different browsers and PDF plugin configurations in HTML5 environments.<br>Available modes include AutoSelect for intelligent method selection, ForcePDFPlugin for direct plugin usage, and ForcePDFFile for download-based printing. |
| Render(System.Web.UI.HtmlTextWriter) | - | Renders the HTML5 ReportViewer control by outputting its contents to the specified HTML writer.<br>Delegates to RenderContents to output the HTML5 viewer markup without additional wrapper elements for clean HTML5 structure. |
| RenderContents(System.Web.UI.HtmlTextWriter) | - | Renders the HTML5 ReportViewer control contents by writing the viewer markup to the specified HTML writer.<br>Generates the complete HTML5 viewer markup including container elements, initialization scripts, and configuration options for client-side rendering. |
| RenderDesignTimeHtml(System.Web.UI.HtmlTextWriter) | - | Renders the HTML5 ReportViewer control for design-time display in Visual Studio designer.<br>Generates a simplified HTML representation of the HTML5 viewer for Visual Studio design surface display, showing the control dimensions and identification. |
| ReportServer | [`Telerik.ReportViewer.Html5.Common.ReportServer`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/types/reportserver%}) | Gets or sets the connection data of the report server that hosts the report.<br>The report server can have its Guest account enabled and with configured permissions for accessing the report without permisions.<br>Used when the viewer is connected to a Telerik Report Server instance (takes precedence over the ServiceUrl property)<br>The Report Server must have appropriate user accounts configured with necessary permissions for accessing and viewing reports in the HTML5 viewer environment.<br>Connecting to Telerik Report Server for .NET is not supported.<br>For more information see https://www.telerik.com/help/reporting/html5-report-viewer-howto-use-it-with-reportserver.html. |
| ReportSource | [`Telerik.ReportViewer.Html5.WebForms.ReportSource`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/types/reportsource%}) | Gets or sets the [`Telerik.ReportViewer.Html5.WebForms.ReportSource`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/types/reportsource%}) for the report displayed in the HTML5 viewer.<br>Specifies the report to be displayed including its identifier, parameters, and source type for proper report loading and processing in the HTML5 environment. |
| Scale | `System.Double` | Gets or sets the zoom level of the report where 1.0 equals 100% of the original report size.<br>Provides precise control over report magnification in the HTML5 viewer when using specific scaling mode or custom zoom requirements. |
| ScaleMode | [`Telerik.ReportViewer.Html5.WebForms.ScaleMode`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/enumerations/scalemode%}) | Gets or sets the scale mode of the viewer.<br>Three modes exist currently:<br>FitPage - The whole report will fit on the page (will zoom in or out), regardless of its width and height.<br>FitPageWidth - The report will be zoomed in or out so that the width of the screen and the width of the report match.<br>Specific - Uses the scale to zoom in and out the report.<br>Controls automatic report scaling behavior including FitPage for complete page visibility, FitPageWidth for width-based scaling, and Specific for custom scale values. |
| SearchMetadataOnDemand | `System.Boolean` | Gets or sets a value indicating whether search metadata is delivered on-demand or preloaded with the report in the HTML5 viewer.<br>When enabled, search metadata is loaded only when needed, reducing initial load time but potentially increasing search operation latency. When disabled, search metadata is preloaded for faster search operations. |
| SendEmail | [`Telerik.ReportViewer.Html5.WebForms.SendEmail`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/types/sendemail%}) | Gets or sets the email functionality configuration including enabled state, format selection, and default recipients.<br>Configures the send email feature within the HTML5 viewer toolbar, including preselected rendering formats and default email addresses for enhanced user experience. |
| ServiceUrl | `System.String` | Gets or sets the URL of the service which will provide the report viewer with reports.<br>The service must be properly configured so that the report viewer can successfully communicate with the server.<br>For more information on how to configure the service please check https://docs.telerik.com/reporting/embedding-reports/host-the-report-engine-remotely/telerik-reporting-rest-services/overview. |
| TemplateUrl | `System.String` | Gets or sets the URL for the report viewer template. The template can be edited -<br>new functionalities can be added and not needed ones can be removed.<br>For more information please check https://www.telerik.com/help/reporting/html5-report-viewer-templates.html.<br>Enables customization of the HTML5 viewer interface by specifying a custom template URL. If left empty, the default template is used for standard viewer functionality. |
| ToString | `System.String` | Converts the HTML5 ReportViewer control to its HTML string representation with all configuration options and client-side initialization.<br>Generates the final HTML output by populating viewer options and using ReportViewerWriter to create the complete HTML5 viewer structure with JavaScript initialization. |
| ViewMode | [`Telerik.ReportViewer.Html5.WebForms.ViewMode`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/enumerations/viewmode%}) | Gets or sets the viewer's view mode.<br>PrintPreview - Displays the paginated report as if it is printed on paper. Interactivity is not enabled.<br>Interactive - Displays the report in its original width and height with no paging. Additionally interactivity is enabled.<br>Interactive mode enables full report interactivity and navigation, while PrintPreview mode optimizes the display for print layout without interactive features. |
| Width | `System.Web.UI.WebControls.Unit` | Gets or sets the width of the HTML5 ReportViewer control. |

## Example

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

