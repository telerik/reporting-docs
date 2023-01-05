---
title: How to print report on client machine without showing the report
description: This article elaborates on how to print report on client machine without showing the report. This article is related only to the legacy ASP.NET Web Forms Report Viewer.
type: how-to
page_title: How to print report on client machine without showing the report
slug: how-to-print-report-on-client-machine-without-showing-the-report
position: 
tags: 
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
		<td>Viewer</td>
		<td>ASP.NET WebForms Report Viewer (legacy)</td>
	</tr>
</table>

## Important note
This article is related only to [the legacy ASP.NET Web Forms Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/asp.net-web-forms-report-viewer/overview%}). For other projects check the [Print a report directly at client-side without displaying it in a Viewer](https://www.telerik.com/support/kb/reporting/details/print-a-report-directly-at-client-side-without-displaying-it-in-a-viewer) KB article.


## Solution
By default the Adobe Plugin is used when printing (if available) and the user has the option to select the printer he would like to use when print is initiated. However there is no way to know the default or in fact any of the available client printers as this would be a major security vulnerability. That is why the print dialog would be always shown, so that the user can select the desired printer and then click the Print button.

On the client side you can invoke the print through the ReportViewer client object's PrintReport() method like in the code snipped below:

```C#
<asp:Button ID="PrintButton" runat="server" Text="Print Report" OnClientClick="MyPrint(); return false;" />
<telerik:ReportViewer ID="ReportViewer1" runat="server" style="display:none" />
<script type="text/javascript">
  ReportViewer.OnReportLoadedOld = ReportViewer.OnReportLoaded; 
  ReportViewer.prototype.OnReportLoaded = function()
  {
    this.OnReportLoadedOld();            
    var printButton = document.getElementById("PrintButton"); 
    printButton.disabled = false; 
  } 
  function MyPrint()
  {
    <%=ReportViewer1.ClientID %>.PrintReport();
  }
</script>
```

Note that we disable the print button until the report has not loaded in the viewer. Once it is loaded we can print it from our Print Report button.

In order to perform other actions on click of the print button (e.g. print using the browser printing capabilities), you'll have to override the default PrintReport() function:

```JavaScript
<script type="text/javascript">
  ReportViewer.prototype.PrintReport = function()
  { 
    this.PrintAs("Default");
  }
</script>
```
