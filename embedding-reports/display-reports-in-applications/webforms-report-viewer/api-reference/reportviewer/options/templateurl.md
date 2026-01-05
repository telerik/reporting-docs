---
title: TemplateUrl
page_title: TemplateUrl property
description: "Gets or sets the URL for the report viewer template. The template can be edited - new functionalities can be added and not needed ones can be removed. For more information please check https://www.telerik.com/help/reporting/html5-report-viewer-templates.html. Enables customization of the HTML5 viewer interface by specifying a custom template URL. If left empty, the default template is used for standard viewer functionality."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/options/templateurl
published: True
reportingArea: WebForms
---

# The `TemplateUrl` option of the HTML5 ASP.NET WebForms Report Viewer

Gets or sets the URL for the report viewer template. The template can be edited - new functionalities can be added and not needed ones can be removed. For more information please check https://www.telerik.com/help/reporting/html5-report-viewer-templates.html. Enables customization of the HTML5 viewer interface by specifying a custom template URL. If left empty, the default template is used for standard viewer functionality.

## Type

`System.String`

## Examples

````XML
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CSharp.NetFramework.WebFormsIntegrationDemo.Default" %>

<%@ Register TagPrefix="telerik" Assembly="Telerik.ReportViewer.Html5.WebForms" Namespace="Telerik.ReportViewer.Html5.WebForms" %>

<!-- Example: Set the TemplateUrl property to specify a custom template for the ReportViewer -->
<form runat="server">
    <telerik:ReportViewer
        ID="reportViewer1"
        runat="server"
        ServiceUrl="/api/reports/"
        TemplateUrl="/CustomTemplates/CustomReportViewerTemplate.html">
    </telerik:ReportViewer>
</form>
````

