---
title: Report Parameter Values
page_title: Sending Parameter Values from outside the HTML5 WebForms ReportViewer
description: "Learn How to pass Values to Report Parameters from Components Located Outside the HTML5 ASP.NET WebForms ReportViewer in Telerik Reporting."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-asp.net-web-forms-report-viewer/customizing/how-to-pass-values-to-report-parameters
tags: how,to,pass,values,to,report,parameters
published: True
reportingArea: WebFormsWrapper
position: 5
previous_url: /html5-webforms-report-viewer-howto-custom-parameters
---

# Passing Values to Report Parameters from Components Outside the HTML5 WebForms Report Viewer

This topic explains how to use the custom parameters UI to update the report parameters instead of using the HTML5 Web Forms report viewer's default implementation of the parameters area. 

The report and all required parameters for it are packed in a ReportSource object. To update the report source the [ReportViewer.reportSource(rs)](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/reportsource(rs)) method is used.

To give an example, we will use the Invoice report from our examples and will update its __OrderNumber__ parameter from a custom parameter UI.

## Pass values to report parameters

> All path references in the described steps should be adapted according to your project setup. For more information, please refer to the Microsoft article [ASP.NET Web Project Paths](https://learn.microsoft.com/en-us/previous-versions/ms178116(v=vs.140))

1. Create a new ASP.NET Web Forms Empty Project. 

	We are going to use one of our demo Visual Studio reports. 
	
	For this purpose, add a new Telrik Report Library project to the solution from the VS item templates, name it *CSharp|VB.ReportLibrary*, add the existing __Invoice.cs__/__Invoice.vb__ report and its subreport __SalesOrderDetails.cs__/__SalesOrderDetails.vb__ from `C:\Program Files (x86)\Progress\Telerik Reporting {{site.suiteversion}}\Report Designer\Examples\CSharp|VB` folder and built the *CSharp|VB.ReportLibrary* project. 
	
	Add a reference to the `ReportLibrary` project in the Web Forms project.

1. Then, use the [HTML5 Web Forms Report Viewer Item Template](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-asp.net-web-forms-report-viewer/how-to-use-html5-asp.net-web-forms-report-viewer-with-rest-service) and name the web page with the viewer __InvoiceParameters.aspx__. 

	On __'Configure report source'__ step select __'Existing report definition'__, then select __'Select type report definition created in Visual Studio'__ and browse *Invoice* report class. 
	
	Finish the wizard.

1. Add a connectionStrings entry with name __Telerik.Reporting.Examples.CSharp.Properties.Settings.TelerikConnectionString__ in the project's `web.config` file. For example:

    ```XML
    <connectionStrings>
    	<add name="Telerik.Reporting.Examples.CSharp.Properties.Settings.TelerikConnectionString"
    		connectionString="Data Source=(local);Initial Catalog=AdventureWorks;Integrated Security=SSPI"
    		providerName="System.Data.SqlClient" />
    </connectionStrings>
    ```

    At this point you have a running Web Forms application that displays a report in the HTML5 Web Forms Report Viewer at **[host]/InvoiceParameters.aspx** without any modifications.

1.  Add code for updating the `ReportSource.Parameters` collection in the code behind:

    ```C#
    protected void Page_Load(object sender, EventArgs e)
    {
    	if (!IsPostBack)
    	{
    		this.reportViewer1.ReportSource.Parameters.Add("OrderNumber", this.invoiceId.Value);
    	}
    }
    ```
    {{source=CodeSnippets\MvcVB\Views\WebForms\Html5WebFormsViewer.aspx.vb region=PageLoadPassReportParameters}}

1.  Add the required scripts and stylesheets:

{{source=CodeSnippets\MvcCS\Views\WebForms\WebFormsViewerPassValuesToReportParameters.aspx region=WebFormsViewerPassValuesToReportParameters}}

1.  Add the custom parameter UI - a dropdown selector with a few values:

{{source=CodeSnippets\MvcCS\Views\WebForms\WebFormsViewerPassValuesToReportParameters.aspx region=WebFormsViewerPassValuesToReportParameters2}}

1.  Now, initialize the report viewer. We will use the minimal set of all [possible options](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/report-viewer-initialization).

{{source=CodeSnippets\MvcCS\Views\WebForms\WebFormsViewerPassValuesToReportParameters.aspx region=WebFormsViewerPassValuesToReportParameters3}}

1.  Add code that updates the ReportSource parameters collection with the selected **Invoice Id** from the dropdown box:

{{source=CodeSnippets\MvcCS\Views\WebForms\WebFormsViewerPassValuesToReportParameters.aspx region=WebFormsViewerPassValuesToReportParameters4}}

1.  The HTML page that we have just created should looks like this:

{{source=CodeSnippets\MvcCS\Views\WebForms\WebFormsViewerPassValuesToReportParameters_01.aspx region=WebFormsViewerPassValuesToReportParameters5}}

1. The HTML page that we have just created should look like this:

{{source=CodeSnippets\MvcCS\Views\WebForms\WebFormsViewerPassValuesToReportParameters_02.aspx region=WebFormsViewerPassValuesToReportParameters6}}


1. Run the project and verify that the __Invoice Id__ selection really updates the report.

## See Also

- [Creating Custom Parameter Editor](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-asp.net-web-forms-report-viewer/customizing/how-to-create-a-custom-parameter-editor)
