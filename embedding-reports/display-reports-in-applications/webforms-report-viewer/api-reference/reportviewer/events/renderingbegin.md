---
title: RenderingBegin
page_title: RenderingBegin event
description: "Gets or sets the name of the JavaScript function that will be called when the rendering of the report begins. The rendering begin event is triggered when the HTML5 ReportViewer starts processing and rendering the report content."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/events/renderingbegin
published: True
reportingArea: WebForms
---

# The `RenderingBegin` event of the HTML5 ASP.NET WebForms Report Viewer

Gets or sets the name of the JavaScript function that will be called when the rendering of the report begins. The rendering begin event is triggered when the HTML5 ReportViewer starts processing and rendering the report content.

## Example

    ````XML
// Example demonstrating the usage of Telerik.ReportViewer.Html5.WebForms.ClientEvents.RenderingBegin property
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CSharp.NetFramework.WebFormsIntegrationDemo.Default" %>

<%@ Register TagPrefix="telerik" Assembly="Telerik.ReportViewer.Html5.WebForms" Namespace="Telerik.ReportViewer.Html5.WebForms" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>RenderingBegin Event Demo</title>
    <script type="text/javascript">
        // JavaScript function to be called when report rendering begins
        function onRenderingBegin(e) {
            console.log("Rendering of the report has begun.");
        }
    </script>
</head>
<body>
    <form runat="server">
        <!-- Minimal ReportViewer with ClientEvents.RenderingBegin set -->
        <telerik:ReportViewer
            ID="reportViewer1"
            runat="server"
            ServiceUrl="/api/reports">
            <ReportSource IdentifierType="TypeReportSource" Identifier="Telerik.Reporting.Examples.CSharp.ReportCatalog, CSharp.ReportLibrary, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null" />
            <ClientEvents RenderingBegin="onRenderingBegin" />
        </telerik:ReportViewer>
    </form>
</body>
</html>
````


