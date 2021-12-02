---
title: How to Pass Values to Report Parameters
page_title: How to Pass Values to Report Parameters | for Telerik Reporting Documentation
description: How to Pass Values to Report Parameters
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-asp.net-web-forms-report-viewer/customizing/how-to-pass-values-to-report-parameters
tags: how,to,pass,values,to,report,parameters
published: True
position: 5
---

# How to Pass Values to Report Parameters



This topic explains how to use custom parameters UI to update the report parameters instead of using the HTML5 Web Forms report viewer's default         implementation of the parameters area. The report and all required parameters for it are packed in a ReportSource object.         To update the report source the [ReportViewer.reportSource(rs)]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/reportsource(rs)%}) method is used.       

To give an example we will use the Invoice report from our examples and will update its __OrderNumber__  parameter         from a custom parameter UI.       

## Pass values to report parameters

>tip All path references in the described steps should be adapted according             to your project setup. For more information please refer to the MSDN article              [ASP.NET Web Project Paths](http://msdn.microsoft.com/en-us/library/ms178116.aspx) 


1. Create a new ASP.NET Web Forms Empty Project.                   We are going to use one of our demo Visual Studio reports. For this purpose add a new Telrik Report Library project to the solution from the VS item templates, name it *Charp|VB.ReportLibrary* , add the existing __Invoice.cs__  report and its subreport __SalesOrderDetails.cs__  from *[TelerikReporting_InstallDir]\Examples\CSharp|VB\ReportLibrary\Invoice*  folder and built the *Charp|VB.ReportLibrary*  project. Add reference to the ReportLibrary project in the Web Forms project.                 

1. Then use the                    [HTML5 Web Forms Report Viewer Item Template]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-asp.net-web-forms-report-viewer/how-to-use-html5-asp.net-web-forms-report-viewer-with-rest-service%})    Name the web page with the viewer                   __InvoiceParameters.aspx__ . On __'Configure report source'__  step                    select __'Existing report definition'__ , then select                    __'Select type report definition created in Visual Studio'__  and browse                    *Invoice*  report class.                     Finish the wizard.

1. Add a connectiongStrings entry with name __Telerik.Reporting.Examples.CSharp.Properties.Settings.TelerikConnectionString__                    in the project's web.config file. For example:                 

	
    ````xml
<connectionStrings>
	 <add name="Telerik.Reporting.Examples.CSharp.Properties.Settings.TelerikConnectionString"
	            connectionString="Data Source=(local);Initial Catalog=AdventureWorks;Integrated Security=SSPI"
	            providerName="System.Data.SqlClient" />
</connectionStrings>
````

    At this point you have a running Web Forms application that displays a report in the HTML5 Web Forms Viewer at __[host]/InvoiceParameters.aspx__                    without any modifications.                 

1. Add code for updating ReportSource Parameters collection in the code behind:                 

	
    ````C#
protected void Page_Load(object sender, EventArgs e)
{
    if (!IsPostBack)
    {
        this.reportViewer1.ReportSource.Parameters.Add("OrderNumber", this.invoiceId.Value);
    }
}
````
````vb.net
Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
    If Not Page.IsPostBack Then
        Me.reportViewer1.ReportSource.Parameters.Add("OrderNumber", Me.invoiceId.Value)
    End If
End Sub
````



1. Add the report viewer stylesheet:

	
    ````html
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Telerik HTML5 Web Forms Report Viewer Form</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <style>
        #reportViewer1 {
            position: absolute;
            left: 5px;
            right: 5px;
            top: 40px;
            bottom: 5px;
            overflow: hidden;
            font-family: Verdana, Arial;
        }
    </style>
</head>
````



1. Add the custom parameter UI - a dropdown selector with a few values:

	
    ````html
    <div id="invoiceIdSelector" runat="server">
            <label for="invoiceId">Invoices</label>
            <select id="invoiceId" title="Select the Invoice ID" runat="server">
                <option value="SO51081">SO51081</option>
                <option value="SO51082" selected="selected">SO51082</option>
                <option value="SO51083">SO51083</option>
            </select>
        </div>
````



1. Now initialize the report viewer. We will use the minimal set of all                   [possible options]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/report-viewer-initialization%}).                 

	
    ````js
        <telerik:ReportViewer
            ID="reportViewer1"
            Width="1300px"
            Height="900px"
            EnableAccessibility="false"
            runat="server">
            <ReportSource IdentifierType="TypeReportSource" Identifier="Telerik.Reporting.Examples.CSharp.Invoice, Charp.ReportLibrary, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null">
            </ReportSource>
        </telerik:ReportViewer>
````



1. Add code that updates the ReportSource parameters collection with the selected __Invoice Id__  from                   the dropdown box:                 

	
    ````js
            $('#invoiceId').change(function () {
                var viewer = $("#reportViewer1").data("telerik_ReportViewer");
                viewer.reportSource({
                    report: viewer.reportSource().report,
                    parameters: { OrderNumber: $(this).val() } 
                });
                //setting the HTML5 Viewer's reportSource, causes a refresh automatically
                //if you need to force a refresh for other case, use:
                //viewer.refreshReport();
            });
````



1. The HTML page that we have just created should looks like this:

	
    ````html
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InvoiceParameters.aspx.cs" Inherits="WebFormsDocumentation.InvoiceParameters" %>
//for VB <%@ Page Language="vb" AutoEventWireup="false" CodeBehind="InvoiceParameters.aspx.vb" Inherits="WebFormsDocVB._InvoiceParameters" %>
<%@ Register TagPrefix="telerik" Assembly="Telerik.ReportViewer.Html5.WebForms" Namespace="Telerik.ReportViewer.Html5.WebForms" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Telerik HTML5 Web Forms Report Viewer Form</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <style>
        #reportViewer1 {
            position: absolute;
            left: 5px;
            right: 5px;
            top: 40px;
            bottom: 5px;
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
                var viewer = $("#reportViewer1").data("telerik_ReportViewer");
                viewer.reportSource({
                    report: viewer.reportSource().report,
                    parameters: { OrderNumber: $(this).val() } 
                });
                //setting the HTML5 Viewer's reportSource, causes a refresh automatically
                //if you need to force a refresh for other case, use:
                //viewer.refreshReport();
            });
    </script>
</body>
</html>
````



1. Run the project and verify that the __Invoice Id__  selection really updates the report.                 
