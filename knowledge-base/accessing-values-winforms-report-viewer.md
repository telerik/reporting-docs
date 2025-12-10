---
title: Accessing Data from Rendered Report in WinForms Viewer
description: "Learn how to access values from a rendered TRDP or TRDX report in the WinForms Report Viewer by using report parameters or report events."
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
   </tbody>
</table>

## Description

I need to display a TRDP or TRDX report in the **WinForms Report Viewer**, click a button, and extract specific values (e.g., client email) from the rendered report. Essentially, I need access to the processed report or the report's data source fields from outside the report.

This knowledge base article also answers the following questions:
- How to get data from a rendered report in WinForms Report Viewer?
- How to use report parameters to retrieve values from a report?
- How to use report events to access processed report values?

## Solution

### Using Report Parameters

Use [report parameters]({%slug telerikreporting/designing-reports/connecting-to-data/report-parameters/overview%}) to retrieve values from the report. Connect the report parameter to the desired field of the [data source component]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/overview%}) whose data you need to access.

1. [Create a report parameter]({%slug telerikreporting/designing-reports/connecting-to-data/report-parameters/how-to-add-report-parameters%}) in the report designer, connect it to the needed [data source component]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/overview%}), and bind its [Value](/api/telerik.reporting.reportparameter#Telerik_Reporting_ReportParameter_Value) and [ValueMember](/api/telerik.reporting.reportparameteravailablevalues#Telerik_Reporting_ReportParameterAvailableValues_ValueMember) properties to the required field. You may use the same expression for both properties - `= Fields.MyField`.
1. Access the report parameter value in the application code through the viewer's [ReportSource](/api/telerik.reportviewer.winforms.reportviewerbase#Telerik_ReportViewer_WinForms_ReportViewerBase_ReportSource) property:


````VB
   Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
       Dim reportParameterValue = Me.ReportViewer1.ReportSource.Parameters("MyParameter").Value
   End Sub
````
````C#
private void Button1_Click(object sender, EventArgs e)
{
    var reportParameterValue = this.ReportViewer1.ReportSource.Parameters["MyParameter"].Value;
}
````


### Using Report Events

For scenarios requiring multiple values from the processed report, use [report events]({%slug telerikreporting/using-reports-in-applications/program-the-report-definition/report-events/overview%}). For TRDP/TRDX files, they must be unpackaged/deserialized in order to assign custom event handlers to the reports.

````C#
        private void MainForm_Load(object sender, System.EventArgs e)
        {
            var uri = "C:\Path\To\Report.trdp";
            var reportPackager = new ReportPackager();
            var instanceReportSource = new InstanceReportSource();  

            using (var sourceStream = System.IO.File.OpenRead(uri))
            {
                var report = (Telerik.Reporting.Report)reportPackager.UnpackageDocument(sourceStream);

                // reading values from the detail section
                var table = report.Items.Find("table1", true)[0] as Telerik.Reporting.Table;
                table.ItemDataBound += Table_ItemDataBound;

                // reading values from a table
                var detailSection = report.Items.Find("detailSection1", true)[0] as Telerik.Reporting.DetailSection;
                report.ItemDataBound += Report_ItemDataBound;

                instanceReportSource.ReportDocument = report;
            }

            this.reportViewer1.ReportSource = instanceReportSource;
            this.reportViewer1.RefreshReport();
        }
````
````VB
Private Sub MainForm_Load(sender As Object, e As EventArgs) Handles MyBase.Load
       Dim uri As String = "C:\Path\To\Report.trdp"
       Dim reportPackager As New ReportPackager()
       Dim instanceReportSource As New InstanceReportSource()

       Using sourceStream As FileStream = File.OpenRead(uri)
           Dim report As Report = CType(reportPackager.UnpackageDocument(sourceStream), Report)

           ' reading values from the detail section
           Dim table As Table = CType(report.Items.Find("table1", True)(0), Table)
           AddHandler table.ItemDataBound, AddressOf Table_ItemDataBound

           ' reading values from a table
           Dim detailSection As DetailSection = CType(report.Items.Find("detailSection1", True)(0), DetailSection)
           AddHandler report.ItemDataBound, AddressOf Report_ItemDataBound

           instanceReportSource.ReportDocument = report
       End Using

    Me.reportViewer1.ReportSource = instanceReportSource
    Me.reportViewer1.RefreshReport()
End Sub
````


- Accessing data from a table

````C#
        private void Table_ItemDataBound(object sender, System.EventArgs e)
        {
            var processsingTable = sender as Telerik.Reporting.Processing.Table;
            foreach (var row in processsingTable.Rows)
            {
                var firstCell = row.GetCell(0);
                var textBoxItem = (Telerik.Reporting.Processing.TextBox)firstCell.Item;
                Trace.WriteLine($"Row: {row.Index}, Cell: {firstCell.RowIndex}, Text: {textBoxItem.Value}");
            }
        }
````  
````VB
   Private Sub Table_ItemDataBound(sender As Object, e As EventArgs)
       Dim processingTable As Telerik.Reporting.Processing.Table = CType(sender, Telerik.Reporting.Processing.Table)
       For Each row As Telerik.Reporting.Processing.TableRow In processingTable.Rows
           Dim firstCell As Telerik.Reporting.Processing.TableCell = row.GetCell(0)
           Dim textBoxItem As Telerik.Reporting.Processing.TextBox = CType(firstCell.Item, Telerik.Reporting.Processing.TextBox)
           Trace.WriteLine(String.Format("Row: {0}, Cell: {1}, Text: {2}", row.Index, firstCell.RowIndex, textBoxItem.Value))
       Next
   End Sub
````


- Accessing data from a `textBox` item in the **detail** section of the report

````C#
        private void Report_ItemDataBound(object sender, System.EventArgs e)
        {
            var processingReport = sender as Telerik.Reporting.Processing.Report;
            var group = ElementTreeHelper.GetChildByIndex(processingReport, 0);

            var detailSections = ElementTreeHelper.FindChildByName(group, "detailSection1", false);
            foreach (var section in detailSections)
            {
                var textBoxJobTitle = (Telerik.Reporting.Processing.TextBox)ElementTreeHelper.GetChildByName(section, "textBox2");
                Trace.WriteLine($"Detail Section: {((Telerik.Reporting.Processing.DetailSection)section).Name}, Job Title: {textBoxJobTitle.Value}");
            }
        }
````
````VB
Private Sub Report_ItemDataBound(sender As Object, e As System.EventArgs)
    Dim processingReport As Report = CType(sender, Report)
    Dim group As Object = ElementTreeHelper.GetChildByIndex(processingReport, 0)

    Dim detailSections As IEnumerable(Of Object) = ElementTreeHelper.FindChildByName(group, "detailSection1", False)
    For Each section As Object In detailSections
        Dim textBoxJobTitle As TextBox = CType(ElementTreeHelper.GetChildByName(section, "textBox2"), TextBox)
        Trace.WriteLine(String.Format("Detail Section: {0}, Job Title: {1}", CType(section, DetailSection).Name, textBoxJobTitle.Value))
    Next
End Sub
````


## See Also

* [Report Parameters Overview]({%slug telerikreporting/designing-reports/connecting-to-data/report-parameters/overview%})
* [Report Events Overview]({%slug telerikreporting/using-reports-in-applications/program-the-report-definition/report-events/overview%})
