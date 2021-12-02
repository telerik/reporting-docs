---
title: How to Set ReportSource for SubReport
page_title: How to Set ReportSource for SubReport | for Telerik Reporting Documentation
description: How to Set ReportSource for SubReport
slug: telerikreporting/designing-reports/report-sources/how-to-set-reportsource-for-subreport
tags: how,to,set,reportsource,for,subreport
published: True
position: 2
---

# How to Set ReportSource for SubReport



This article includes details how to specify a __sub report__  for a [SubReport item]({%slug telerikreporting/designing-reports/report-structure/subreport%}).         You will need a [Report Source]({%slug telerikreporting/designing-reports/report-sources/overview%}) object.       

## Set the Report Source through the Report Designer

1. In Design view, right-click a SubReport item to which you want to set a report source and click __Properties__ .             

1. In the item's __Properties__ , click __ReportSource__ .             

1. A "Load a Report from" dialog appears which allows you to select a __ReportSource__ .             

1. Select the type of report source you would use to specify a report. For this example we would use __Instance Report Source__ ,               click that option and select the report that would serve as detail report.             If you have to specify parameters for the report, follow the next step.

1. Click __Edit Parameters__  button - __Edit Parameters__  dialog appears. Click __New__ .               In the __Parameter Name__  column select the name of a report parameter in the detail report.               In the __Parameter Value__ , type or select the value to pass to the parameter in the detail report.             

## Set the Report Source programatically

{{source=CodeSnippets\CS\API\Telerik\Reporting\ReportSourceSnippets.cs region=CreateInstanceReportSourceSnippet}}
````C#
	            var instanceReportSource = new Telerik.Reporting.InstanceReportSource();
	
	            // Assigning the Report object to the InstanceReportSource
	            instanceReportSource.ReportDocument = new Telerik.Reporting.Examples.CSharp.Invoice();
	
	            // Adding the initial parameter values
	            instanceReportSource.Parameters.Add(new Telerik.Reporting.Parameter("OrderNumber", "SO43659"));
````
{{source=CodeSnippets\VB\API\Telerik\Reporting\ReportSourceSnippets.vb region=CreateInstanceReportSourceSnippet}}
````VB
	        Dim instanceReportSource As New Telerik.Reporting.InstanceReportSource()
	
	        ' Assigning the Report object to the InstanceReportSource
	        instanceReportSource.ReportDocument = New Invoice()
	
	        ' Adding the initial parameter values
	        instanceReportSource.Parameters.Add(New Telerik.Reporting.Parameter("OrderNumber", "SO43659"))
````



## 

The [Standalone Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/overview%}) includes only XmlReportSource and UriReportSource options due to the format           of the produced reports.           In [Visual Studio Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/visual-studio-report-designer/overview%}) you can use all available [Report Sources]({%slug telerikreporting/designing-reports/report-sources/overview%}).         

>tip If the report will be displayed in an HTML5 Viewer or Silverlight ReportViewer, the main report is rendered in HTML (XAML respectively) and it is loaded at the client.             The sub report is considered as a content of the main report and its Report Source is resolved internally,             withouit additional calls to the Reporting REST service (Reporting WCF Service respectively).           


# See Also


 * [How to: Create a Master-Detail Report Using a SubReport Item]({%slug telerikreporting/designing-reports/report-structure/how-to/how-to-create-a-master-detail-report-using-a-subreport-item%})

 * [How to: Create a Master-Detail Report Using a Table]({%slug telerikreporting/designing-reports/report-structure/how-to/how-to-create-a-master-detail-report-using-a-table%})
