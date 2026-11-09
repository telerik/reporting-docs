---
title: Report Parameter Values
page_title: Sending Parameter Values from outside the HTML5 WebForms ReportViewer
description: "Learn how to pass values to report parameters from a custom UI outside the HTML5 ASP.NET WebForms ReportViewer in Telerik Reporting."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-asp.net-web-forms-report-viewer/customizing/how-to-pass-values-to-report-parameters
tags: how,to,pass,values,to,report,parameters
published: True
reportingArea: WebFormsWrapper
components: [webformswrapper, general]
position: 5
previous_url: /html5-webforms-report-viewer-howto-custom-parameters
---

# Report Parameter Values

This topic explains how to use a custom parameters UI to update report parameters instead of using the HTML5 Web Forms ReportViewer's default parameters area.

The report and all its required parameters are stored in a `ReportSource` object. To update the report source, use the [ReportViewer.reportSource(rs)](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods#reportsource) method.

This example uses the Invoice report from the examples and updates its `OrderNumber` parameter from a custom parameters UI.

## Passing Values to Report Parameters

>note Adapt all path references in these steps to your project setup. For more information, see the Microsoft article [ASP.NET Web Project Paths](https://learn.microsoft.com/en-us/previous-versions/ms178116(v=vs.140)).

1. Create a new ASP.NET Web Forms Empty Project.

	Use one of the demo Visual Studio reports.

	For this purpose, add a new Telerik Report Library project to the solution from the Visual Studio item templates. Name it *CSharp|VB.ReportLibrary*, add the existing `Invoice.cs`/`Invoice.vb` report and its subreport `SalesOrderDetails.cs`/`SalesOrderDetails.vb` from the `C:\Program Files (x86)\Progress\Telerik Reporting {{site.suiteversion}}\Report Designer\Examples\CSharp|VB` folder, and build the *CSharp|VB.ReportLibrary* project.
	
	Add a reference to the `ReportLibrary` project in the Web Forms project.

1. Use the [HTML5 Web Forms Report Viewer Item Template](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-asp.net-web-forms-report-viewer/how-to-use-html5-asp.net-web-forms-report-viewer-with-rest-service) and name the web page with the viewer `InvoiceParameters.aspx`.

	On the **Configure report source** step, select **Existing report definition**, then select **Select type report definition created in Visual Studio**, and browse to the *Invoice* report class.
	
	Finish the wizard.

1. Add a `connectionStrings` entry with the name `Telerik.Reporting.Examples.CSharp.Properties.Settings.TelerikConnectionString` to the project's `web.config` file. For example:

	{{source=CodeSnippets\MvcCS\XmlConfiguration\ReportParameterValues.xml region=Prerequisites}}

	At this point, you have a running Web Forms application that displays a report in the HTML5 Web Forms ReportViewer at `[host]/InvoiceParameters.aspx` without any modifications.

1. Add code to update the `ReportSource.Parameters` collection in the code-behind:

	{{source=CodeSnippets\MvcCS\Views\WebForms\InvoiceParameters.aspx.cs region=PageLoadPassReportParameters}}
	{{source=CodeSnippets\MvcVB\Views\WebForms\Html5WebFormsViewer.aspx.vb region=PageLoadPassReportParameters}}

1. Add the required scripts and stylesheets:

	{{source=CodeSnippets\MvcCS\Views\WebForms\WebFormsViewerPassValuesToReportParameters.aspx region=WebFormsViewerPassValuesToReportParameters}}

1. Add the custom parameter UI - a dropdown selector with a few values:

	{{source=CodeSnippets\MvcCS\Views\WebForms\WebFormsViewerPassValuesToReportParameters.aspx region=WebFormsViewerPassValuesToReportParameters2}}

1. Initialize the report viewer with the minimal set of [available options](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/overview).

	{{source=CodeSnippets\MvcCS\Views\WebForms\WebFormsViewerPassValuesToReportParameters.aspx region=WebFormsViewerPassValuesToReportParameters3}}

1. Add code that updates the `ReportSource` parameters collection with the **Invoice Id** selected in the dropdown box:

	{{source=CodeSnippets\MvcCS\Views\WebForms\WebFormsViewerPassValuesToReportParameters.aspx region=WebFormsViewerPassValuesToReportParameters4}}

1. The completed HTML page should look like this:

	{{source=CodeSnippets\MvcCS\Views\WebForms\WebFormsViewerPassValuesToReportParameters_01.aspx region=WebFormsViewerPassValuesToReportParameters5}}

	{{source=CodeSnippets\MvcCS\Views\WebForms\WebFormsViewerPassValuesToReportParameters_02.aspx region=WebFormsViewerPassValuesToReportParameters6}}

1. Run the project and verify that the **Invoice Id** selection updates the report.

## See Also

* [Creating a Custom Parameter Editor](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-asp.net-web-forms-report-viewer/customizing/how-to-create-a-custom-parameter-editor)
