---
title: Using Report Item Events
page_title: Using Report Item Events | for Telerik Reporting Documentation
description: Using Report Item Events
slug: telerikreporting/using-reports-in-applications/program-the-report-definition/report-events/using-report-item-events
tags: using,report,item,events
published: True
position: 4
---

# Using Report Item Events



## 

Each [report item]({%slug telerikreporting/designing-reports/report-structure/overview%}) on a report exposes these events:         




| Event | Description |
| ------ | ------ |
| __ItemDataBinding__ |Fires just before the item is bound to data.|
| __ItemDataBound__ |Fires just after the item is bound to data|




>note The [SubReport]({%slug telerikreporting/designing-reports/report-structure/subreport%}) report item exposes one additional event:              __NeedDataSource__ . This event fires when the SubReport.ReportSource does not have data source bound to it.           


Let us demonstrate this with a simple example. Suppose that we have a TextBox containing the job position of an employee.           Assume that the TextBox's Value property equals "=Fields.Title", where Title is a column from the data source containing values like            "Team Leader", "Senior Developer", "Junior Developer", "Quality Assurance", etc. For the sake of our example, suppose that we would            like to color all developers in Blue.

First we need to attach to the TextBox's ItemDataBinding event. Double-click the event in the property grid           and an event handler method will be automatically generated for you.         

As explained in [Understanding Events]({%slug telerikreporting/using-reports-in-applications/program-the-report-definition/report-events/understanding-events%}) topic, the           __sender__  argument is in fact the __processing__  TextBox that           has already been data bound. The method will be called for each data row, i.e. for each employee we have in the           data source. So the only thing we have left to do is cast the sender, check the position, and do the coloring if           needed:         

{{source=CodeSnippets\CS\API\Telerik\Reporting\Processing\EventsSnippets.cs region=AddTextBoxItemDataBindingSnippet}}
````C#
	        private void textBox1_ItemDataBinding(object sender, EventArgs e)
	        {
	            Telerik.Reporting.Processing.TextBox txt = (Telerik.Reporting.Processing.TextBox)sender;
	            Telerik.Reporting.Processing.IDataObject dataObject = (Telerik.Reporting.Processing.IDataObject)txt.DataObject;
	            if ((string)dataObject["Title"] == "Developer")
	            {
	                txt.Style.BackgroundColor = System.Drawing.Color.Blue;
	            }
	        }
````
{{source=CodeSnippets\VB\API\Telerik\Reporting\Processing\EventsSnippets.vb region=AddTextBoxItemDataBindingSnippet}}
````VB
	    Private Sub textBox1_ItemDataBinding(sender As Object, e As EventArgs) Handles textBox1.ItemDataBinding
	        Dim txt As Telerik.Reporting.Processing.TextBox = DirectCast(sender, Telerik.Reporting.Processing.TextBox)
	        Dim dataObject As Telerik.Reporting.Processing.IDataObject = DirectCast(txt.DataObject, Telerik.Reporting.Processing.IDataObject)
	        If DirectCast(dataObject("Title"), String) = "Developer" Then
	            txt.Style.BackgroundColor = System.Drawing.Color.Blue
	        End If
	    End Sub
````



>note The provided example can be easily implemented using ConditionalFormatting, see              [Change row color based on a value in the row](https://docs.telerik.com/reporting/knowledge-base/change-row-color-based-on-value)              or Bindings, see [Bindings]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/using-expressions/bindings%}).           


# See Also


 * [Access Report Items Programmatically]({%slug telerikreporting/using-reports-in-applications/program-the-report-definition/access-report-items-programmatically%})
