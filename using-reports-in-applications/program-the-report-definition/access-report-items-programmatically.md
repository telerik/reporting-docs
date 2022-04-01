---
title: Access Report Items Programmatically
page_title: Access Report Items Programmatically 
description: Access Report Items Programmatically
slug: telerikreporting/using-reports-in-applications/program-the-report-definition/access-report-items-programmatically
tags: access,report,items,programmatically
published: True
position: 5
---

# Access Report Items Programmatically

In the examples below we show how to access a report item from within the report and from the invoking application. In the first example let's access a TextBox item from the detail section ItemDataBinding eventhandler.

## Access Report Items from within events

1. Select the detail section in the designer, and in the Properties Window, Events tab, find the ItemDataBinding entry and double-click.

1. The event handler passes in "sender" which is a Telerik.Reporting.Processing.DetailSection that represents the section during processing. Thus you can derive:

   + A DataObject that represents the underlying data for a record being processed.

   + All processing report items.

1. Use the ElementTreeHelper.__GetChildByName()__ method to locate an item on the report. In the code example below __GetChildByName__ is used to retrieve "textBox1" TextBox.

> In the code example below we are referring to a `Processing.TextBox`, not `Report1.TextBox`. 
> The `Processing.TextBox` represents the TextBox during processing and has a different set of properties than the `Report1.TextBox` used when defining the report.

{{source=CodeSnippets\CS\API\Telerik\Reporting\Processing\EventsSnippets.cs region=AddSectionDataBindingSnippet}}
````C#
private void detail_ItemDataBinding(object sender, EventArgs e)
{
    Telerik.Reporting.Processing.DetailSection section = (sender as Telerik.Reporting.Processing.DetailSection);
    Telerik.Reporting.Processing.TextBox txt = (Telerik.Reporting.Processing.TextBox)Telerik.Reporting.Processing.ElementTreeHelper.GetChildByName(section, "textBox1");
    object title = section.DataObject["Title"];
    if ((string)title == "Developer")
    {
        txt.Style.BackgroundColor = System.Drawing.Color.Blue;
    }
}
````
{{source=CodeSnippets\VB\API\Telerik\Reporting\Processing\EventsSnippets.vb region=AddSectionDataBindingSnippet}}
````VB
Private Sub detail_ItemDataBinding(sender As Object, e As EventArgs)
    Dim section As Telerik.Reporting.Processing.DetailSection = TryCast(sender, Telerik.Reporting.Processing.DetailSection)
    Dim txt As Telerik.Reporting.Processing.TextBox = DirectCast(Telerik.Reporting.Processing.ElementTreeHelper.GetChildByName(section, "textBox1"), Telerik.Reporting.Processing.TextBox)
    Dim title As Object = section.DataObject("Title")
    If DirectCast(title, String) = "Developer" Then
        txt.Style.BackgroundColor = System.Drawing.Color.Blue
    End If
End Sub
````

##  Access items from calling application

If we are in the context of a WinForm or WPF Window and we need to access an item from the Report that is shown in a ReportViewer control with embedded Reporting engine, we can proceed directly following the report hierarchy. We use a report source object of the same type as the report source assigned to the ReportViewer control. Consider the following code:
    
````C#
protected void Button1_Click(object sender, EventArgs e)
{
    Telerik.Reporting.InstanceReportSource instanceReportSource = (Telerik.Reporting.InstanceReportSource)this.reportViewer1.ReportSource;
    Telerik.Reporting.Report report = (Telerik.Reporting.Report)instanceReportSource.ReportDocument;
    Telerik.Reporting.TextBox txt = report.Items.Find("productNameDataTextBox", true)[0] as Telerik.Reporting.TextBox;
}
````
````VB.NET
Protected Sub Button1_Click(sender As Object, e As EventArgs)
    Dim instanceReportSource As Telerik.Reporting.InstanceReportSource = DirectCast(Me.reportViewer1.ReportSource, Telerik.Reporting.InstanceReportSource)
    Dim report As Telerik.Reporting.Report = DirectCast(instanceReportSource.ReportDocument, Telerik.Reporting.Report)
    Dim txt As Telerik.Reporting.TextBox = TryCast(report.Items.Find("productNameDataTextBox", True)(0), Telerik.Reporting.TextBox)
End Sub
````

##  Access report fields from a Table item

You can reference the report fields from a table item easily using the Report API hierarchy. Consider the following code:
    
````C#
private void tableTextBox_ItemDataBinding(object sender, EventArgs eventArgs)
{
    //get the textbox from the sender object
    Telerik.Reporting.Processing.TextBox textBox = (Telerik.Reporting.Processing.TextBox)sender;
    //get the table object
    Telerik.Reporting.Processing.Table table = (Telerik.Reporting.Processing.Table)textBox.Parent;
    //get the detail section
    Telerik.Reporting.Processing.DetailSection detail = (Telerik.Reporting.Processing.DetailSection)table.Parent;
    //get the raw value from the Report datasource directly
    textBox.Value = detail.DataObject["Data"];
}
````
````VB.NET
Private Sub tableTextBox_ItemDataBinding(sender As Object, eventArgs As EventArgs)
    'get the textbox from the sender object
    Dim textBox As Telerik.Reporting.Processing.TextBox = DirectCast(sender, Telerik.Reporting.Processing.TextBox)
    'get the table object
    Dim table As Telerik.Reporting.Processing.Table = DirectCast(textBox.Parent, Telerik.Reporting.Processing.Table)
    'get the detail section
    Dim detail As Telerik.Reporting.Processing.DetailSection = DirectCast(table.Parent, Telerik.Reporting.Processing.DetailSection)
    'get the raw value from the Report datasource directly
    textBox.Value = detail.DataObject("Data")
End Sub
````

