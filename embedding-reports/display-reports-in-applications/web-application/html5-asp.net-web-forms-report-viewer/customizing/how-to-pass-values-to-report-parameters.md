---
title: Report Parameter Values
page_title: Sending Parameter Values from outside the HTML5 WebForms ReportViewer
description: "Learn How to pass Values to Report Parameters from Components Located Outside the HTML5 ASP.NET WebForms ReportViewer in Telerik Reporting."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-asp.net-web-forms-report-viewer/customizing/how-to-pass-values-to-report-parameters
tags: how,to,pass,values,to,report,parameters
published: True
reporting_area: WebFormsWrapper
position: 5
previous_url: /html5-webforms-report-viewer-howto-custom-parameters
---

# Passing Values to Report Parameters from Components Outside the HTML5 WebForms Report Viewer

This topic explains how to use custom parameters UI to update the report parameters instead of using the HTML5 Web Forms report viewer's default implementation of the parameters area. The report and all required parameters for it are packed in a ReportSource object. To update the report source the [ReportViewer.reportSource(rs)]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/reportsource(rs)%}) method is used.

To give an example we will use the Invoice report from our examples and will update its **OrderNumber** parameter from a custom parameter UI.

## Pass values to report parameters

> All path references in the described steps should be adapted according to your project setup. For more information please refer to the Microsoft article [ASP.NET Web Project Paths](<https://learn.microsoft.com/en-us/previous-versions/ms178116(v=vs.140)>)

1.  Create a new ASP.NET Web Forms Empty Project. We are going to use one of our demo Visual Studio reports. For this purpose add a new Telrik Report Library project to the solution from the VS item templates, name it _Charp|VB.ReportLibrary_, add the existing **Invoice.cs**/**Invoice.vb** report and its subreport **SalesOrderDetails.cs**/**SalesOrderDetails.vb** from `C:\Program Files (x86)\Progress\Telerik Reporting {{site.suiteversion}}\Report Designer\Examples\CSharp|VB` folder and built the _Charp|VB.ReportLibrary_ project. Add reference to the `ReportLibrary` project in the Web Forms project.
1.  Then use the [HTML5 Web Forms Report Viewer Item Template]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-asp.net-web-forms-report-viewer/how-to-use-html5-asp.net-web-forms-report-viewer-with-rest-service%}) and name the web page with the viewer **InvoiceParameters.aspx**. On **'Configure report source'** step select **'Existing report definition'**, then select **'Select type report definition created in Visual Studio'** and browse _Invoice_ report class. Finish the wizard.
1.  Add a connectiongStrings entry with name **Telerik.Reporting.Examples.CSharp.Properties.Settings.TelerikConnectionString** in the project's `web.config` file. For example:

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
    ```VB
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
    	If Not Page.IsPostBack Then
    		Me.reportViewer1.ReportSource.Parameters.Add("OrderNumber", Me.invoiceId.Value)
    	End If
    End Sub
    ```

1.  Add the required scripts and stylesheets:

    ```HTML
    <!DOCTYPE html>
    <html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
    	<title>Telerik HTML5 Web Forms Report Viewer Form</title>
    	<link href="https://kendo.cdn.telerik.com/themes/{{site.kendothemeversion}}/default/default-ocean-blue.css" rel="stylesheet" />
    	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"> </script>

    	<style>
    		#reportViewer1 {
    			position: absolute;
    			inset: 5px;
    			overflow: hidden;
    			font-family: Verdana, Arial;
    		}
    	</style>
    </head>
    ```

1.  Add the custom parameter UI - a dropdown selector with a few values:

    ```HTML
    <div id="invoiceIdSelector" runat="server">
    		<label for="invoiceId">Invoices</label>
    		<select id="invoiceId" title="Select the Invoice ID" runat="server">
    			<option value="SO51081">SO51081</option>
    			<option value="SO51082" selected="selected">SO51082</option>
    			<option value="SO51083">SO51083</option>
    		</select>
    	</div>
    ```

1.  Now, initialize the report viewer. We will use the minimal set of all [possible options]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/report-viewer-initialization%}).

    ```HTML
    <telerik:ReportViewer ID="reportViewer1" Width="1300px" Height="900px" EnableAccessibility="false" runat="server">
    	<ReportSource IdentifierType="TypeReportSource" Identifier="Telerik.Reporting.Examples.CSharp.Invoice, Charp.ReportLibrary, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null">
    	</ReportSource>
    </telerik:ReportViewer>
    ```

1.  Add code that updates the ReportSource parameters collection with the selected **Invoice Id** from the dropdown box:

    ```JavaScript
    $('#invoiceId').change(function () {
    	var reportViewer = $("#reportViewer1").data("telerik_ReportViewer");
    		reportViewer.reportSource({
    			report: reportViewer.reportSource().report,
    			parameters: { OrderNumber: $(this).val() }
    		});
    });
    ```

1.  The HTML page that we have just created should looks like this:

    ```HTML
    <%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InvoiceParameters.aspx.cs" Inherits="WebFormsDocumentation.InvoiceParameters" %>
    //for VB <%@ Page Language="vb" AutoEventWireup="false" CodeBehind="InvoiceParameters.aspx.vb" Inherits="WebFormsDocVB._InvoiceParameters" %>
    <%@ Register TagPrefix="telerik" Assembly="Telerik.ReportViewer.Html5.WebForms" Namespace="Telerik.ReportViewer.Html5.WebForms" %>

    <!DOCTYPE html>
    <html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
    	<title>Telerik HTML5 Web Forms Report Viewer Form</title>
    	<link href="https://kendo.cdn.telerik.com/themes/{{site.kendothemeversion}}/default/default-ocean-blue.css" rel="stylesheet" />
    	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"> </script>

    	<style>
    		#reportViewer1 {
    			position: absolute;
    			inset: 5px;
    			overflow: hidden;
    			font-family: Verdana, Arial;
    		}
    	</style>
    </head>
    <body>
    	<form runat="server">
    		<div id="invoiceIdSelector" runat="server">
    			<label for="invoiceId">Invoices</label>
    			<select id="invoiceId" title="Select the Invoice ID" runat="server">
    				<option value="SO51081">SO51081</option>
    				<option value="SO51082" selected="selected">SO51082</option>
    				<option value="SO51083">SO51083</option>
    			</select>
    		</div>
    		<telerik:ReportViewer
    			ID="reportViewer1"
    			Width="1300px"
    			Height="900px"
    			EnableAccessibility="false"
    			runat="server">
    			<ReportSource IdentifierType="TypeReportSource" Identifier="Telerik.Reporting.Examples.CSharp.Invoice, Charp.ReportLibrary, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null">
    			</ReportSource>
    		</telerik:ReportViewer>
    	</form>
    	<script type="text/javascript">
    			$('#invoiceId').change(function () {
    				var reportViewer = $("#reportViewer1").data("telerik_ReportViewer");
    				reportViewer.reportSource({
    					report: reportViewer.reportSource().report,
    					parameters: { OrderNumber: $(this).val() }
    				});
    			});
    	</script>
    </body>
    </html>
    ```

1.  Run the project and verify that the **Invoice Id** selection really updates the report.

## See Also

- [Creating Custom Parameter Editor]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-asp.net-web-forms-report-viewer/customizing/how-to-create-a-custom-parameter-editor%})
