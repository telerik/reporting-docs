---
title: Passing Values to Report Parameters
page_title: Sending Values to Report Parameters from outside HTML5 ReportViewer
description: "Learn how to pass values to Report Parameters from Components located outside the HTML5 ReportViewer in Telerik Reporting."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/customizing/how-to-pass-values-to-report-parameters
tags: pass,values,report,parameters
published: True
position: 4
previous_url: /html5-report-viewer-howto-custom-parameters
---

# Passing Values to Report Parameters from Components Outside the HTML5 Report Viewer

This topic explains how to use the custom parameters UI to update the report parameters instead of using the report viewer's default implementation of the parameters area. The report and all required parameters for it are packed in a ReportSource object. To update the report source the [ReportViewer.reportSource(rs)]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/reportsource(rs)%}) method is used.

To give an example, we will use the Invoice report from our examples and will update its __OrderNumber__ parameter from a custom parameter UI.

## Pass values to report parameters

> All path references in the described steps should be adapted according to your project setup. For more information, please refer to the MSDN article [ASP.NET Web Project Paths](https://learn.microsoft.com/en-us/previous-versions/ms178116(v=vs.140))

1. Add a new html page `CustomParameters.html` to the _CSharp.Html5Demo_ or _VB.Html5Demo_ project.
1. Add the references to all required JavaScript libraries and stylesheets:

	{{source=CodeSnippets\BlazorAppSnippets\wwwroot\customize\AddRequiredSriptsAndStyles.html}}

1. Add the custom parameter UI - a dropdown selector with a few values:

	{{source=CodeSnippets\BlazorAppSnippets\wwwroot\customize\AddCustomDropDown.html}}

1. Add the ReportViewer placeholder

	{{source=CodeSnippets\BlazorAppSnippets\wwwroot\manual-setup\AddTrvPlaceHolder.html}}

1. Now, initialize the report viewer. We will use the minimal set of all [possible options]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/report-viewer-initialization%}). Please note how the value from the custom UI is used to set the __OrderNumber__ report parameter initially:

	{{source=CodeSnippets\BlazorAppSnippets\wwwroot\customize\TrvInitialize.js}}

1. Add code that updates the ReportSource parameters collection with the selected __Invoice Id__ from the dropdown box:

	{{source=CodeSnippets\BlazorAppSnippets\wwwroot\customize\UpdateReportSource.js}}

1. The HTML page that we have just created should look like this:

	{{source=CodeSnippets\BlazorAppSnippets\wwwroot\customize\CustomPage-01.html}}

1. Run the project and verify that the __Invoice Id__ selection really updates the report.

## See Also

* [HTML5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%})
* [Custom Parameter Editors]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/customizing/how-to-create-a-custom-parameter-editor%})
