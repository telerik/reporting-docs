---
title: Telerik.ReportViewer.Html5.WebForms.ReportSource
page_title: Telerik.ReportViewer.Html5.WebForms.ReportSource Type
description: "Provides a configuration class for the report source used in the HTML5 WebForms ReportViewer. Contains the collection of parameter values, report identifier, and identifier type for configuring report loading and processing. Used to specify which report to display and provide parameter values for report initialization in HTML5 viewer scenarios."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/types/reportsource
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
</style>

# The `ReportSource` type of the HTML5 ASP.NET WebForms Report Viewer

Provides a configuration class for the report source used in the HTML5 WebForms ReportViewer. Contains the collection of parameter values, report identifier, and identifier type for configuring report loading and processing. Used to specify which report to display and provide parameter values for report initialization in HTML5 viewer scenarios.

## Constructors

| Constructor | Description |
| ------ | ------ |
| ReportSource() | Initializes a new instance of the ReportSource class with default settings. |

## Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| Identifier | `System.String` | Gets or sets the report identifier used to locate and load the report in the HTML5 viewer.<br>The format and interpretation of this identifier depends on the IdentifierType setting and determines how the report is resolved and loaded. |
| IdentifierType | [`Telerik.ReportViewer.Html5.WebForms.IdentifierType`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/enumerations/identifiertype%}) | Gets or sets the type of the report identifier that determines how the identifier is interpreted and resolved.<br>Specifies whether the identifier represents a type name, URI, or custom identifier format for report loading in the HTML5 viewer. |
| Parameters | [`Telerik.ReportViewer.Html5.WebForms.ParameterCollection`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/types/parametercollection%}) | Gets a collection of parameter values passed to the `Telerik.Reporting.IReportDocument` object when initialized in the HTML5 viewer.<br>Contains parameter name-value pairs that will be applied to the report during initialization and processing in the HTML5 WebForms ReportViewer. |

## Example

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

