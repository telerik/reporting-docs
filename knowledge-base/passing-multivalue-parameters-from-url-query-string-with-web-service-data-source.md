---
title: How to pass multivalue parameters from URL query string with web service data source
description: This article explains how to pass multivalue parameters from URL query string to the report
type: troubleshooting
page_title: How to pass multivalue parameters from URL query string with web service data source
slug: passing-multivalue-parameters-from-url-query-string-with-web-service-data-source
position: 
tags: Html5WebFormsReportViewer, ReportParameters, WebServiceDataSource
ticketid: 
res_type: kb
---

## Environment
<table>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting </td>
	</tr>
  <tr>
		<td>Project Type</td>
		<td>WebForms application</td>
	</tr>
</table>

## Description
Do you know how to pass multi-valued parameter from URL query string into the report? 

## Solution
Construct the web API to take the query parameter values with some delimiter (for example ingredients=1,2,3,4) which then can be split and joined with [Join() function](../expressions-text-functions).

[Here](https://www.telerik.com/docs/default-source/knowledgebasearticleattachments/reporting/getparametersfromurl.zip?sfvrsn=daccb1e8_2), you can download a sample WebForms application that demonstrates the approach. The steps are the following:

1. Create a report that retrieves sample data from a web service through [WebServiceDataSource component](../webservicedatasource-component). In the example project we have used users' sample data. 

2. While configuring the data source (use the [WebServiceDataSource Wizard](../webservicedatasource-wizard)), at the step 2 - *Configure request parameters*, create parameter with:

  ```
  Name: Id
  Type: Query
  Value: = Parameters.Id.Value //report parameter with the same name (multi-value with available values set)
  Desing-Time Value: 1 //optional
  ```
3. The client web application should contain a button that passes a multi-value query string parameter in following format - *?Id=1,5,7*. The implementation of the button will look like the following:

  ```CSharp
  <asp:Button runat="server" ID="myButton"
     OnClientClick="window.location.href='ReportViewerForm.aspx?Id=1,5,7'; return false;"
     Text="Id=1,5,7"></asp:Button>
  ```
4. Lastly, handle the values into the client ReportSource parameters collection:

  ``` CSharp
  public partial class ReportViewerForm : System.Web.UI.Page
  {
      protected void Page_Load(object sender, EventArgs e)
      {

          var clientReportSource = new Telerik.ReportViewer.Html5.WebForms.ReportSource();
          clientReportSource.IdentifierType = Telerik.ReportViewer.Html5.WebForms.IdentifierType.TypeReportSource;

          clientReportSource.Identifier = typeof(ReportLibrary1.Report1).AssemblyQualifiedName;

          //multivalue parameter ...?Id=1,5,7
          var multiValueParam = Request.QueryString["Id"].Split(new[] { ',' });
          clientReportSource.Parameters.Add("Id", multiValueParam);

          this.reportViewer1.ReportSource = clientReportSource;
      }
  }
  ```
  
## Notes 

In order to build it successfully, you would need to Restore the NuGet packages and run the [Upgrade Wizard]({% slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/visual-studio-report-designer/upgrade-wizard %}) to add the needed references.
