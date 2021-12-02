---
title: Using Section Events
page_title: Using Section Events | for Telerik Reporting Documentation
description: Using Section Events
slug: telerikreporting/using-reports-in-applications/program-the-report-definition/report-events/using-section-events
tags: using,section,events
published: True
position: 3
---

# Using Section Events



## 

The various report __Section__  objects expose these events:         




| Event | Description |
| ------ | ------ |
| __ItemDataBinding__ |Fires just before the section is bound to data.|
| __ItemDataBound__ |Fires just after the section is bound to data|






In ItemDataBinding and ItemDataBound events use the "sender" argument of the event handler to get a           reference to the section object. From the section object you can reference any of the items the section contains,           i.e. TextBoxes, PictureBoxes, etc. You can also use the section DataObject property to access the data fields           for the section.         

>tip Be aware that the "sender" section object is of type              __Telerik.Reporting.Processing.ReportItemBase__ , not the             definition item  __Telerik.Reporting.ReportItemBase__ .           


The example below demonstrates getting a reference to the detail section of the report and finding a specific           TextBox within the section. The example also shows retrieving data source column values for the section and           using it to alter the TextBox. 

The second example demonstrates getting a reference to the detail section of the report, finding all its children and setting a BackgroundColor to them:

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
{{source=CodeSnippets\CS\API\Telerik\Reporting\Processing\Access_Processing_Instances_Children_Snippets.cs region=Using_ILayoutElementContainer_Children_Snippet}}
````C#
			void DetailSection_ItemDataBinding_Using_ILayoutElementContainer_Children(object sender, EventArgs e)
			{
				Processing.DetailSection processingInstance = (Processing.DetailSection)sender;
				Processing.ILayoutElementContainer processingContainer = processingInstance as Processing.ILayoutElementContainer;
				if (null != processingContainer)
				{
					foreach (Processing.LayoutElement processingChild in processingContainer.Children)
					{
						Processing.VisualElement visualChild = processingChild as Processing.VisualElement;
						if (null != visualChild)
						{
							visualChild.Style.BackgroundColor = System.Drawing.Color.Blue;
						}
					}
				}
			}
````
{{source=CodeSnippets\VB\API\Telerik\Reporting\Processing\Access_Processing_Instances_Children_Snippets.vb region=Using_ILayoutElementContainer_Children_Snippet}}
````VB
	    Private Sub DetailSection_ItemDataBinding_Using_ILayoutElementContainer_Children(sender As Object, e As EventArgs)
	        Dim processingInstance As Processing.DetailSection = DirectCast(sender, Processing.DetailSection)
	        Dim processingContainer As Processing.ILayoutElementContainer = TryCast(processingInstance, Processing.ILayoutElementContainer)
	        If processingContainer IsNot Nothing Then
	            For Each processingChild As Processing.LayoutElement In processingContainer.Children
	                Dim visualChild As Processing.VisualElement = TryCast(processingChild, Processing.VisualElement)
	                If visualChild IsNot Nothing Then
	                    visualChild.Style.BackgroundColor = System.Drawing.Color.Blue
	                End If
	            Next
	        End If
	    End Sub
````

