---
title: Accessing Data from Rendered Report in WinForms Viewer
description: Learn how to access values from a rendered TRDP or TRDX report in the WinForms Report Viewer by using report parameters or report events.
type: how-to
page_title: Extract Values from WinForms Report Viewer Processed Report
meta_title: Extract Values from WinForms Report Viewer Processed Report
slug: accessing-values-winforms-report-viewer
tags: reporting, winforms, report viewer, parameters, report items
res_type: kb
ticketid: 1693205
---

## Environment
<table>
<tbody>
<tr>
<td>Product</td>
<td>Reporting</td>
</tr>
<tr>
<td>Version</td>
<td>19.1.25.521</td>
</tr>
</tbody>
</table>

## Description

I need to display a TRDP or TRDX report in the WinForms Report Viewer, click a button, and extract specific values (e.g., client email) from the rendered report. Directly casting a `UriReportSource` to an `InstanceReportSource` results in an invalid cast error. Additionally, I need access to the processed report or the report's data source fields.

This knowledge base article also answers the following questions:
- How to get data from a rendered report in WinForms Report Viewer?
- How to use report parameters to retrieve values from a report?
- How to use report events to access processed report values?

## Solution

### Using Report Parameters

Use report parameters to retrieve values from the report. Connect the report parameter to the desired field in the report data source.

1. Set up a report parameter in the report designer and bind its value to the required field:
   ```
   = Fields.MyField
   ```

2. Access the report parameter value in your application code:
   ```vb
   Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
       Dim reportParameterValue = Me.TKReportViewer.ReportSource.Parameters("MyParameter").Value
   End Sub
   ```

This approach is simple and clean for retrieving individual values from the report.

### Using Report Events

For scenarios requiring multiple values from the processed report, use report events:

1. Unpackage the TRDP file and assign custom event handlers to the report:
   ```vb
   Dim uri As String = "C:\Path\To\Report.trdp"
   Dim reportPackager As New ReportPackager()
   Dim instanceReportSource As New InstanceReportSource()

   Using sourceStream As FileStream = File.OpenRead(uri)
       Dim report As Report = CType(reportPackager.UnpackageDocument(sourceStream), Report)
       Dim table As Table = CType(report.Items.Find("table1", True)(0), Table)
       Dim detailSection As DetailSection = CType(report.Items.Find("detailSection1", True)(0), DetailSection)

       AddHandler report.ItemDataBound, AddressOf Report_ItemDataBound
       AddHandler table.ItemDataBound, AddressOf Table_ItemDataBound

       instanceReportSource.ReportDocument = report
   End Using
   ```

2. Define the event handler to process and retrieve data:
   ```vb
   Private Sub Table_ItemDataBound(sender As Object, e As EventArgs)
       Dim processingTable As Telerik.Reporting.Processing.Table = CType(sender, Telerik.Reporting.Processing.Table)
       For Each row As Telerik.Reporting.Processing.TableRow In processingTable.Rows
           Dim firstCell As Telerik.Reporting.Processing.TableCell = row.GetCell(0)
           Dim textBoxItem As Telerik.Reporting.Processing.TextBox = CType(firstCell.Item, Telerik.Reporting.Processing.TextBox)
           Trace.WriteLine(String.Format("Row: {0}, Cell: {1}, Text: {2}", row.Index, firstCell.RowIndex, textBoxItem.Value))
       Next
   End Sub
   ```

3. Use the event handlers to extract values from the report detail section or table.

This approach is suitable for retrieving multiple records or detailed data from the processed report.

## See Also

- [UriReportSource Documentation](https://docs.telerik.com/reporting/api/telerik.reporting.urireportsource)
- [InstanceReportSource Documentation](https://docs.telerik.com/reporting/api/telerik.reporting.instancereportsource)
- [Report Parameters Overview](https://docs.telerik.com/reporting/designing-reports/connecting-to-data/report-parameters/overview)
- [Unpackaging Report Definitions](https://docs.telerik.com/reporting/embedding-reports/program-the-report-definition/package-report-definition#unpackaging)
- [Report Events Overview](https://docs.telerik.com/reporting/embedding-reports/program-the-report-definition/report-events/overview)
