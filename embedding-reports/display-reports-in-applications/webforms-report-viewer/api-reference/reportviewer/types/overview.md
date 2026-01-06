---
title: Overview
page_title: Types of the HTML5 ASP.NET WebForms Report Viewer
description: Object types and interfaces used by the HTML5 ASP.NET WebForms Report Viewer
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/types/overview
tags: overview,types
published: True
reportingArea: WebForms
position: 0
---

<style>
    table {
        display: grid;
        grid-template-columns: min-content 1fr;
    }

    thead, tbody, tr {
        display: contents;
    }

    th {
        white-space: nowrap;
    }

    td:not(:last-child) {
        white-space: nowrap;
    }
</style>

# Types of the HTML5 ASP.NET WebForms Report Viewer

| Type | Description |
| ------ | ------ |
| [AccessibilityKeyMap]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/types/accessibilitykeymap%})|Provides a class for the key mapping used when report viewer accessibility is enabled.|
| [ClientEvents]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/types/clientevents%})|Represents a configuration class that provides properties for initializing client-side event handlers of the HTML5 WebForms ReportViewer control.<br>Used to specify JavaScript function names that will be executed in response to various report viewer events during report rendering, printing, exporting, and user interaction.<br>All event handler properties should contain JavaScript function names (without parentheses) that will be called when the corresponding events occur in the HTML5 ReportViewer.|
| [CustomParameterEditor]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/types/customparametereditor%})|Represents a custom parameter editor configuration with JavaScript function references for parameter matching and editor creation in the HTML5 WebForms ReportViewer.<br>Used to define custom parameter editors that provide specialized input controls for specific parameter types or scenarios.<br>Enables extensibility of the parameter editing experience by allowing custom JavaScript functions to determine parameter applicability and create custom editor interfaces.|
| [DeferredScripts]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/types/deferredscripts%})|Represents a WebForms control that renders deferred JavaScript initialization scripts for HTML5 ReportViewer components.<br>Used to collect and output JavaScript initialization code at a specific location in the HTML document for optimal performance and loading behavior.<br>Provides a way to defer script execution until a controlled point in the page rendering process, improving page load performance by separating script registration from script execution.|
| [EditorsContainer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/types/editorscontainer%})|Provides configuration container for parameter editor types used in single-select and multi-select scenarios within the HTML5 WebForms ReportViewer.<br>Used to specify the visual presentation style for different parameter selection scenarios.<br>Controls the editor type selection for parameters with available values in the HTML5 viewer interface.|
| [Parameter]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/types/parameter%})|A parameter passed to the `Telerik.Reporting.IReportDocument` object when initialized<br>Contains automatic type conversion capabilities to ensure parameter values are properly formatted for report processing.|
| [ParameterCollection]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/types/parametercollection%})|Represents a collection of [`Telerik.ReportViewer.Html5.WebForms.Parameter`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/types/parameter%}) objects used for configuring report parameters in the HTML5 WebForms ReportViewer.<br>Used to manage parameter values that are passed to reports during initialization and processing.<br>The collection prevents duplicate parameter names by updating existing parameter values when adding parameters with matching names.|
| [ParameterEditors]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/types/parametereditors%})|Represents a configuration class that provides properties for initializing parameter editors of the HTML5 WebForms ReportViewer.<br>Used to specify JavaScript function names that will handle different types of report parameters and create appropriate input controls in the HTML5 viewer interface.<br>Enables customization of parameter editing experience by allowing assignment of specific JavaScript editors for different parameter types and scenarios.|
| [Parameters]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/types/parameters%})|Provides configuration options for parameter editors within the HTML5 WebForms ReportViewer.<br>Used to customize the display style and interaction behavior of parameter input controls in the HTML5 viewer interface.<br>Contains settings for parameter editor types that control how parameter inputs are rendered and presented to users.|
| [ReportServer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/types/reportserver%})|Provides a class for the report server data.<br>Contains the URL to the report server instance, a valid username and password.<br>Connecting to Telerik Report Server for .NET is not supported.|
| [ReportSource]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/types/reportsource%})|Provides a configuration class for the report source used in the HTML5 WebForms ReportViewer.<br>Contains the collection of parameter values, report identifier, and identifier type for configuring report loading and processing.<br>Used to specify which report to display and provide parameter values for report initialization in HTML5 viewer scenarios.|
| [ReportViewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/types/reportviewer%})|Represents the HTML5 WebForms ReportViewer control that provides comprehensive report viewing capabilities with modern HTML5-based rendering and interactive user interface.<br>Used to display Telerik Reporting reports within ASP.NET WebForms applications with full JavaScript-based client-side functionality for report interaction, navigation, and management.<br>Provides a complete HTML5-based report viewing solution with responsive design, client-side processing, and extensive customization options for modern web applications.|
| [SendEmail]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/types/sendemail%})|Provides configuration options for the send email functionality within the HTML5 WebForms ReportViewer.<br>Used to configure email settings including enabled state, preselected rendering format, and default email addresses for report sharing via email.<br>Contains email message configuration properties that enable users to send reports directly from the HTML5 viewer toolbar with customizable default values.|
