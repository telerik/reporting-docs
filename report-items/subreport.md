---
title: SubReport
page_title: SubReport 
description: SubReport
slug: telerikreporting/designing-reports/report-structure/subreport
previous_url: /designing-reports/report-sources/how-to-set-reportsource-for-subreport 
tags: telerik, reporting, report, items, subreport
published: True
position: 11
---

# SubReport

The SubReport report item lets you display one report within another report. It is a container item just like the report sections and grows depending on its children. The screenshot shows a SubReport report item at design-time. This allows you to compose complex reports from disparate report sources. The data for each SubReport can be completely different. For example you could combine a product listing, a sales summary and a list of sales people each in their own sub reports, with each sub report getting data from a different source. You can also pass parameters to SubReports using the Edit Parameters collection editor.

> [Data Items]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/overview%}) cannot be used in page sections, because the latter are processed after the report data has been processed. At this moment the report data source is not available anymore.
 

  ![](images/Subreport.png)

> Page sections are not related to the report itself, but are relative to the paper or screen. Thus page sections of nested/detail reports are ignored and only the page sections of the main report are visible.In order to have sections that repeat on every page similar to page sections, consider using an unbound group (no grouping criteria specified) and set the  [PrintOnEveryPage](/reporting/api/Telerik.Reporting.GroupSection#Telerik_Reporting_GroupSection_PrintOnEveryPage) property of its sections to True. Be aware that you cannot use __PageCount__ and __PageNumber__ global objects in group sections.

## Height Issues

To remove blank vertical space in the detail section of a __SubReport__, set the Height of the __SubReport.ReportSource__ __DetailSection__ to the height of the tallest item. Sections can grow to accommodate their children but cannot shrink to hide empty space. If you want the detail section to shrink only at runtime you can set the Height property of the DetailSection in the report constructor. Place the __Height__ property assignment code just after the _IntializeComponent()_ method call.

## Passing Parameters to a SubReport

1. Click the subreport item that you want to change. The selected subreport properties are listed in the __Property Browser__.

1. In the __ReportSource property__, click the __Edit Collection (…) button__. __Load a Report From__ window opens. 

1. Click __Edit Parameters__ button to add a parameter. __Edit Parameters__ window opens. 

1. Click the __New__ button to add a new parameter mapping.                     

1. Assuming you have assigned the __ReportSource__ property the __Parameter Name__ drop down list will contain the names of parameters defined in the subreport report. Select a __Parameter Name__ from the combobox to set the target for this parameter. from the combobox to set the target for this parameter. 

1. __Parameter Value__ combobox allows you to enter value directly, create an "```<Expression>```" or a "```<New Report Parameter>```". 

1. When you are done, click __OK__. 
  

  ![](images/DesignSubReport001.png)


How to Set ReportSource for SubReport

This article includes details how to specify a __sub report__ for a [SubReport item]({%slug telerikreporting/designing-reports/report-structure/subreport%}). You will need a [Report Source]({%slug telerikreporting/designing-reports/report-sources/overview%}) object.       

## Setting the Report Source through the Report Designer

1. In Design view, right-click a SubReport item to which you want to set a report source and click __Properties__.             

1. In the item's __Properties__ , click __ReportSource__.             

1. A "Load a Report from" dialog appears which allows you to select a __ReportSource__.             

1. Select the type of report source you would use to specify a report. For this example we would use __Instance Report Source__ , click that option and select the report that would serve as detail report.  
If you have to specify parameters for the report, follow the next step.

1. Click __Edit Parameters__ button - __Edit Parameters__ dialog appears. Click __New__. In the __Parameter Name__ column select the name of a report parameter in the detail report. In the __Parameter Value__ , type or select the value to pass to the parameter in the detail report.             

## Setting the Report Source Programmatically

{{source=CodeSnippets\CS\API\Telerik\Reporting\ReportSourceSnippets.cs region=CreateInstanceReportSourceSnippet}}
{{source=CodeSnippets\VB\API\Telerik\Reporting\ReportSourceSnippets.vb region=CreateInstanceReportSourceSnippet}}

The [Standalone Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/overview%}) includes only XmlReportSource and UriReportSource options due to the format of the produced reports. In [Visual Studio Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/visual-studio-report-designer/overview%}) you can use all available [Report Sources]({%slug telerikreporting/designing-reports/report-sources/overview%}).         

>tip If the report will be displayed in an HTML5 Viewer or Silverlight ReportViewer, the main report is rendered in HTML (XAML respectively) and it is loaded at the client. The sub report is considered as a content of the main report and its Report Source is resolved internally, withouit additional calls to the Reporting REST service (Reporting WCF Service respectively).           

## See Also

* [How to create a Master-Detail report using a SubReport]({%slug telerikreporting/designing-reports/report-structure/how-to/how-to-create-a-master-detail-report-using-a-subreport-item%})
* [How to bind a SubReport to the parent report's data]({%slug how-to-bind-sub-report-to-main-report-s-data%})
* [SubReport](/reporting/api/Telerik.Reporting.SubReport) 
* [ReportSource](/reporting/api/Telerik.Reporting.SubReport#Telerik_Reporting_SubReport_ReportSource)

