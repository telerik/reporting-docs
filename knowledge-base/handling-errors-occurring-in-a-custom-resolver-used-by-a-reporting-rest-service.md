---
title: Handling errors occurring in a Custom Resolver used by a Reporting REST Service
description: Handle errors occurring as a result of using a custom report resolver used with the reporting rest service by overriding the GetParameters request.
type: how-to
page_title: Catch errors thrown by the Reporting REST Service
slug: handling-errors-occurring-in-a-custom-resolver-used-by-a-reporting-rest-service
res_type: kb
---

## Environment
<table>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting</td>
	</tr>
	<tr>
		<td>Report Viewer</td>
		<td>HTML5-based Report Viewers</td>
	</tr>
</table>

## Description

Handling errors occurring in a Custom Resolver used by a Reporting REST Service. In this article, we will explain how to handle errors that fire due to errors with the report's processing and errors that cause the report processing to not start altogether. 

## Solution

In general, a **.CS** Type Report has an [Error event](../e-telerik-reporting-report-error) which fires due to problems with the report processing. Such errors can be handled in the report's Error event or/and in the HTML5 Viewer's [error event](../html5-report-viewer-jquery-fn-telerik-reportviewer#examples).  

 For example:  

````C#
//the report
public partial class ReportTest : Telerik.Reporting.Report
    {
        public ReportTest()
        {
            //
            // Required for telerik Reporting designer support
            //
            InitializeComponent();
            this.Error += new Telerik.Reporting.ErrorEventHandler(this.rptTest_Error);           
        }
        private void rptTest_Error(object sender, ErrorEventArgs eventArgs)
        {
            eventArgs.Cancel = true;
            throw new Exception("Manually cancelled.");
        }
    }
````
````VB
'the report
Public Partial Class ReportTest
    Inherits Telerik.Reporting.Report
    Public Sub New()
        '
        ' Required for telerik Reporting designer support
        '
        InitializeComponent()     
    End Sub
      Private Sub ReportCatalog_Error(sender As Object, eventArgs As Telerik.Reporting.ErrorEventArgs) Handles MyBase.Error
        eventArgs.Cancel = True
        Throw New Exception("Manually cancelled.")
    End Sub
End Class
````

  
 **The HTML5 Viewer:**  

```JS
//the client
$(document).ready(function () {
       $("#reportViewer1")
           .telerik_ReportViewer({
               serviceUrl: "api/reports/",
               templateUrl: 'ReportViewer/templates/telerikReportViewerTemplate.html',
               reportSource: {
                   report: "Telerik.Reporting.Examples.CSharp.ReportCatalog, CSharp.ReportLibrary",
                   parameters: { }
               },
               viewMode: telerikReportViewer.ViewModes.INTERACTIVE,
               scaleMode: telerikReportViewer.ScaleModes.SPECIFIC,
               scale: 1.0,
              error: function (e, args) {
                  //hide the yellow message box
                  $('.trv-error-pane').toggle();
                  //display the error message with via custom UI            
                  alert("Error!");
               }
           });
   });
```

  
 If you use a [custom resolver for your Reporting REST Service](../telerik-reporting-rest-service-report-resolver#custom-report-source-resolver-implementations), the report processing will not be started. Such errors can be caught and handled in the first request sent by the HTML5 Viewer to the Reporting REST service e.g. [ReportsControllerBase.GetParameters method](../m-telerik-reporting-services-webapi-reportscontrollerbase-getparameters) - the request for information about the report's parameter.

 For example:  

````C#
public override System.Net.Http.HttpResponseMessage GetParameters(string clientID, ClientReportSource reportSource)
{
    try {
        return base.GetParameters(clientID, reportSource);
    } catch (Exception ex) {
        throw new Exception("Report resolving error.");
    }
}
````
````VB
Public Overrides Function GetParameters(clientID As String, reportSource As ClientReportSource) As System.Net.Http.HttpResponseMessage
    Try
        Return MyBase.GetParameters(clientID, reportSource)
    Catch ex As Exception
        Throw New Exception("Report resolving error.")
    End Try
End Function
````

The above lines will override the default behavior of the **ReportsControllerBase.GetParameters method** (the Reporting REST service). 

The error will be returned to the HTML5 Viewer(client), where it can be handled further in the **viewer's error event**. Without additional handling, the error will appear in an yellow message box in the viewer's page area.  
  
>**Note**
> <br/>
> The HTML5 Viewer's error event can't be used for handling errors that are result of issues on connecting to the Reporting REST Service.

