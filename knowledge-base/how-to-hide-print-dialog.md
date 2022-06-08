---
title: Hide the print progress dialog when printing a report programmatically
description: This article elaborates on how to hide the print progress dialog when printing a report programmatically
type: how-to
page_title: Hide the print progress dialog when printing a report programmatically
slug: how-to-hide-print-dialog
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
</table>

## Important Note
This approach is only applicable for desktop applications (WPF, Windows Forms and etc.). If this code sample is used in server-client environment the print operation will be executed on the server side.

## Solution

To prevent the print UI from appearing, you should specify valid printer settings and a standard print controller to this method. This example illustrates how to prevent the print UI from appearing in a batch print operation or when printing from a service.

C#
```C#
var reportName = "Telerik.Reporting.Examples.CSharp.Dashboard, CSharp.ReportLibrary";

// Obtain the settings of the default printer
System.Drawing.Printing.PrinterSettings printerSettings
    = new System.Drawing.Printing.PrinterSettings();

// The standard print controller comes with no UI
System.Drawing.Printing.PrintController standardPrintController =
    new System.Drawing.Printing.StandardPrintController();

// Print the report using the custom print controller
Telerik.Reporting.Processing.ReportProcessor reportProcessor
    = new Telerik.Reporting.Processing.ReportProcessor();

reportProcessor.PrintController = standardPrintController;

Telerik.Reporting.TypeReportSource typeReportSource =
    new Telerik.Reporting.TypeReportSource();

// reportName is the Assembly Qualified Name of the report
typeReportSource.TypeName = reportName;

reportProcessor.PrintReport(typeReportSource, printerSettings);
```

VB
```VB
Dim reportName = "ReportCatalog, VB.ReportLibrary"

' Obtain the settings of the default printer
Dim printerSettings As New System.Drawing.Printing.PrinterSettings

' The standard print controller comes with no UI
Dim standardPrintController As New System.Drawing.Printing.StandardPrintController

' Create a report source to pass the report to the report processor
Dim typeReportSource As New Telerik.Reporting.TypeReportSource()

' reportName is the Assembly Qualified Name of the report
typeReportSource.TypeName = reportName

' Print the report using the custom print controller
Dim reportProcessor As New Telerik.Reporting.Processing.ReportProcessor
reportProcessor.PrintController = standardPrintController
reportProcessor.PrintReport(typeReportSource, printerSettings)
```

## See Also
  [ReportProcessor.PrintController](https://docs.telerik.com/reporting/p-telerik-reporting-processing-reportprocessor-printcontroller)

  [ReportProcessor.PrintReport](https://docs.telerik.com/reporting/overload-telerik-reporting-processing-reportprocessor-printreport)

  [System.Drawing.Printing.PrintController](http://msdn2.microsoft.com/en-us/library/bffaf7th)

  [System.Drawing.Printing.StandardPrintController](http://msdn2.microsoft.com/en-us/library/xsy01e55)


  