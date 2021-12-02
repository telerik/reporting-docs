---
title: How to Set ReportSource for NavigateToReport action
page_title: How to Set ReportSource for NavigateToReport action | for Telerik Reporting Documentation
description: How to Set ReportSource for NavigateToReport action
slug: telerikreporting/designing-reports/report-sources/how-to-set-reportsource-for-navigatetoreport-action
tags: how,to,set,reportsource,for,navigatetoreport,action
published: True
position: 1
---

# How to Set ReportSource for NavigateToReport action



This article includes details how to specify a __target report__  for a         [Navigate to Report (Drill-through) Action]({%slug telerikreporting/designing-reports/adding-interactivity-to-reports/actions/drillthrough-report-action%}).          You will need a [Report Source]({%slug telerikreporting/designing-reports/report-sources/overview%}) object.       

## Set the Report Source through the Report Designer

1. In Design view, right-click a report item to which you want to add a drill-through action and then click __Properties__ .             

1. In the item's __Properties__  dialog box, click __Action__ .             

1. Select __Navigate to Report__ . Additional section appears which allows you to select a __ReportSource__ .             

1. In the __Choose a Report Source__  dialog, select how you would navigate to the report, For               this example we would use __Type Report Source__ , click that option and select the report that you would like to navigate to.             If you have to specify parameters for the drillthrough report, follow the next step.

1. Click __Edit Parameters__  button - __Edit Parameters__  dialog appears. Click __New__ .               In the __Parameter Name__  column select the name of the report parameter in the drillthrough report.               In the __Parameter Value__ , type or select the value to pass to the parameter in the drillthrough report.             

## Set the Report Source programatically

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



## 

The [Standalone Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/overview%}) includes only XmlReportSource and UriReportSource options due to the format           of the produced reports.           In [Visual Studio Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/visual-studio-report-designer/overview%}) you can use all available [Report Sources]({%slug telerikreporting/designing-reports/report-sources/overview%}).         

>tip If the report will be displayed in an HTML5 Viewer or Silverlight ReportViewer, the main report is rendered in HTML (XAML respectively) and it is loaded at the client.             The rendered content contains a link rendered for the NavigateToReportAction, that will not be valid and working if the target report is specified via InstanceReportSource or XmlReportSource.           


# See Also

