---
title: How to Add a Drillthrough/Navigate To Report Action
page_title: How to Add a Drillthrough/Navigate To Report Action | for Telerik Reporting Documentation
description: How to Add a Drillthrough/Navigate To Report Action
slug: telerikreporting/designing-reports/adding-interactivity-to-reports/actions/how-to/how-to-add-a-drillthrough-navigate-to-report-action
tags: how,to,add,a,drillthrough/navigate,to,report,action
published: True
position: 0
---

# How to Add a Drillthrough/Navigate To Report Action

A report can contain links to other reports. The report that opens when you click the link in the main report         is known as a drillthrough report. Drillthrough reports must be published to the same report server as the main         report, but they can be in different folders. You can add a drillthrough link to any item that has an Action property.       

>tip We recommend the usage of TypeReportSource ('Type name' option) or UriReportSource ('Url or file' option) in the [Load Report Dialog](../../../report-designer-tools/desktop-designers/tools/load-report-dialog) on configuring the target report. InstanceReportSource ('Object instance' option) is only supported for WinForms and WPF Report Viewers in Embedded mode.         


## Adding a drillthrough action using the Report Designer

1. In Design view, right-click a report item to which you want to add a link and then click __Properties__.             

1. In the item's __Properties__ dialog box, click __Action__.             

1. Select __Navigate to Report__. Additional section appears which allows you to select a __ReportSource__.             

1. In the __Choose a Report Source__ dialog, select how you would navigate to the report, For               this example we would use __Type Report Source__ , click that option and select the report that you would like to navigate to. If you have to specify parameters for the drillthrough report, follow the next step.

1. Click __Edit Parameters__ button - __Edit Parameters__ dialog appears. Click __New__. In the __Parameter Name__ column select the name of the report parameter in the drillthrough report. In the __Parameter Value__ , type or select the value to pass to the parameter in the drillthrough report.             

1. To test the link, run the report and click the report item with the applied __Action__. For TextBoxes, it is helpful to change the color and effect of the text to indicate that the text is a link. For example, change the color to blue and the effect to underline by setting the corresponding __Font__ properties of the TextBox.             

## Adding a drillthrough action programatically

{{source=CodeSnippets\CS\API\Telerik\Reporting\ActionSnippets.cs region=AddNewNavigateToReportSnippet}}
````C#
	Telerik.Reporting.TypeReportSource reportSource = new Telerik.Reporting.TypeReportSource();
	reportSource.TypeName = "ReportLibrary1.Report1, ReportLibrary1, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null";
	reportSource.Parameters.Add(new Telerik.Reporting.Parameter("OrderNumber", "SO43659"));
	
	Telerik.Reporting.NavigateToReportAction reportAction1 = new Telerik.Reporting.NavigateToReportAction();
	reportAction1.ReportSource = reportSource;
	textBox1.Action = reportAction1;
````
{{source=CodeSnippets\VB\API\Telerik\Reporting\ActionSnippets.vb region=AddNewNavigateToReportSnippet}}
````VB
	Dim reportSource As New Telerik.Reporting.TypeReportSource()
	reportSource.TypeName = "ReportLibrary1.Report1, ReportLibrary1, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null"
	reportSource.Parameters.Add(New Telerik.Reporting.Parameter("OrderNumber", "SO43659"))
	
	Dim reportAction1 As New Telerik.Reporting.NavigateToReportAction()
	reportAction1.ReportSource = reportSource
	textBox1.Action = reportAction1
````

# See Also

 * [How to: Add a Bookmark Action]({%slug telerikreporting/designing-reports/adding-interactivity-to-reports/actions/how-to/how-to-add-a-bookmark-action%})

 * [How to: Add a Hyperlink Action]({%slug telerikreporting/designing-reports/adding-interactivity-to-reports/actions/how-to/how-to-add-a-hyperlink-action%})
 
 * [Expressions Overview]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/overview%})
 
 * [Data Items Overview]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/overview%})

