---
title: GetReportParameters
page_title: The GetReportParameters method of the HTML5 ASP.NET WebForms Report Viewer explained
description: "Learn more about the GetReportParameters method of the HTML5 ASP.NET WebForms Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/methods/getreportparameters
tags: getreportparameters
published: True
reportingArea: WebForms
position: 1
---

<style>
    table {
        display: grid;
        grid-template-columns: min-content min-content min-content 1fr;
    }

    thead, tbody, tr {
        display: contents;
    }

    th {
        white-space: nowrap;
    }
</style>

# The `GetReportParameters` method of the HTML5 ASP.NET WebForms Report Viewer

Gets the processed report parameters as a dictionary of parameter names and string values. Provides access to the current parameter values that have been processed and applied to the report in the HTML5 viewer.

## Example

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
