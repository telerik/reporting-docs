---
title: GetReportParameters()
page_title: The GetReportParameters() method of the ASP.NET Web Forms Report Viewer explained
description: "Learn more about the GetReportParameters() method of the ASP.NET Web Forms Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/methods/getreportparameters()
tags: getreportparameters
published: True
reportingArea: WebFormsWrapper
position: 1
---

# The `GetReportParameters()` method of the ASP.NET Web Forms Report Viewer

Gets the processed report parameters as a dictionary of parameter names and string values. <remarks>Provides access to the current parameter values that have been processed and applied to the report in the HTML5 viewer.</remarks>

Returns: A dictionary containing parameter names as keys and their processed string values.

````JavaScript
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


## See Also

* [ASP.NET Web Forms Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/overview%})

