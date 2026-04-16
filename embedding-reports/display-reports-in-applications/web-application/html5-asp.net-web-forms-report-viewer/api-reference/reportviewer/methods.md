---
title: Methods
page_title: Methods of the HTML5 ASP.NET WebForms Report Viewer
description: Complete list of methods available in the HTML5 ASP.NET WebForms Report Viewer
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/methods
tags: methods
published: True
reportingArea: WebForms
position: 1
---

# Methods of the HTML5 ASP.NET WebForms Report Viewer

## GetReportParameters

Gets the processed report parameters as a dictionary of parameter names and string values.

### Example

````C#
namespace CSharp.NetFramework.WebFormsIntegrationDemo
{
    using System;
    using System.Collections.Generic;
    using Telerik.Reporting.Examples.CSharp;
    using Telerik.ReportViewer.Html5.WebForms;

    public partial class Default : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            // Assume 'reportViewer1' is the ID of your ReportViewer in the .aspx page
            IDictionary<string, string> parameters = reportViewer1.GetReportParameters();

            // Minimal usage: iterate parameters (for demonstration purposes only)
            foreach (KeyValuePair<string, string> param in parameters)
            {
                // Use param.Key and param.Value as needed
            }
        }
    }
}
````


## RenderDesignTimeHtml

Renders the HTML5 ReportViewer control for design-time display in Visual Studio designer.

### Parameters

| Parameter | Type | Optional | Description |
|-----------|------|----------|-------------|
| writer | `System.Web.UI.HtmlTextWriter` | No | The HtmlTextWriter object that receives the design-time HTML output. |


## ToString

Converts the HTML5 ReportViewer control to its HTML string representation with all configuration options and client-side initialization.

