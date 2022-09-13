---
title: SubReport
page_title: SubReport Report Item Overview
description: "Learn more about the Telerik Reporting SubReport report item, how to define its parameters and set its report source."
slug: telerikreporting/designing-reports/report-structure/subreport
previous_url: /designing-reports/report-sources/how-to-set-reportsource-for-subreport, /report-items-sub-report
tags: telerik, reporting, report, items, subreport
published: True
position: 12
---

# SubReport Item Overview

The SubReport item enables you to display reports within reports, and serves as a container, similar to the report sections, growing in size depending on its children. 

The following screenshot shows a SubReport item at design-time, allowing you to compose complex reports from various report sources. The data for each SubReport can be completely different, for example, you can combine a product listing, a sales summary, and a list of sales people each in their own sub-report with each sub-report drawing its data from a different source. You can also pass parameters to the SubReport by using the **Edit Parameters** collection editor.

![](images/Subreport.png)

## Defining the Parameters

To set up the SubReport:

1. Click the report item you want to change. The selected SubReport properties are listed in the __Property Browser__.
1. In the __ReportSource__ property, click the __Edit Collection (…)__ button. As a result, the __Load a Report From__ window opens. 
1. Click the __Edit Parameters__ button to add a parameter. As a result, the __Edit Parameters__ window opens. 
1. Click the __New__ button to add a new parameter mapping. 
1. Assuming you have assigned the __ReportSource__ property, the __Parameter Name__ drop-down list will contain the names of parameters defined in the sub-report. Select a __Parameter Name__ from the combo-box to set the target for this parameter. 
1. The __Parameter Value__ combo-box allows you to directly enter the value, create an `<Expression>` or a `<New Report Parameter>`. 
1. When you are done, click __OK__. 
  
The following image shows the end result. 

![A SubReport with set parameters](images/DesignSubReport001.png)


## Setting the Report Source

To specify a sub-report for a [SubReport item]({%slug telerikreporting/designing-reports/report-structure/subreport%}), you need a [report source]({%slug telerikreporting/designing-reports/report-sources/overview%}) object.

The SubReport enables you to set up the report source either by using a Telerik Report Designer tool or programmatically. 

### Using a Report Designer

To set the report source of the SubReport item by using a Telerik Report Designer: 

1. In the **Design** view, right-click a SubReport item to which you want to set a report source and click __Properties__. 
1. In the __Properties__ of the item, click __ReportSource__. As a result, a **Load a Report from** dialog appears. Select a __ReportSource__. 
1. Select the type of the report source you will use to specify a report. For the purposes of this example, click the __Instance Report Source__ option and select the report that will serve as the detail report. 
1. To specify the parameters for the report , click the __Edit Parameters__ button. As a result, the __Edit Parameters__ dialog appears. Click __New__. 
1. In the __Parameter Name__ column, select the name of a report parameter in the detail report. In the __Parameter Value__, type or select the value to pass to the parameter in the detail report.             

### Defining Programmatically

The following snippet demonstrates how to set the report source of the SubReport programmatically. 

{{source=CodeSnippets\CS\API\Telerik\Reporting\ReportSourceSnippets.cs region=CreateInstanceReportSourceSnippet}}
{{source=CodeSnippets\VB\API\Telerik\Reporting\ReportSourceSnippets.vb region=CreateInstanceReportSourceSnippet}}

Due to the format of the produced reports, the [Standalone Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/overview%}) includes only `XmlReportSource` and `UriReportSource` options. 

The [Visual Studio Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/visual-studio-report-designer/overview%}) provides the [report sources]({%slug telerikreporting/designing-reports/report-sources/overview%}) options.

If you are using the HTML5 or the Silverlight Report Viewer to preview the report, the main report will be rendered in HTML or XAML respectively and loaded on the client. The sub-report is considered as part of the main report content and its report source will be internally resolved without additional calls to the Reporting REST service (Reporting WCF Service respectively).  

## Considerations and Known Limitations

When working with the SubReport item, note the following considerations: 

* Page sections are not related to the report itself, but are relative to the paper or screen. Therefore, page sections of nested or detail reports are ignored and only the page sections of the main report are visible. 
* To render page sections that appear on each page, similar to page sections, consider using an unbound group (no grouping criteria specified) and set the [`PrintOnEveryPage`](/reporting/api/Telerik.Reporting.GroupSection#Telerik_Reporting_GroupSection_PrintOnEveryPage) property of its sections to `True`. Note that you cannot use the __PageCount__ and __PageNumber__ global objects in group sections.
* To remove blank vertical space in the detail section of a SubReport, set the `Height` of the `SubReport.ReportSource` __DetailSection__ to the height of the highest item. 
* Sections can grow to accommodate their children but cannot shrink to hide empty space. To make the dtail section shrink only at runtime, set the `Height` property of the __DetailSection__ in the report constructor. Place the `Height` property assignment code right after the `IntializeComponent()` method call.

## Next Steps 

* [(Demo) Invoice Report with a SubReport](https://demos.telerik.com/reporting/invoice) 
* [Demo Page for Telerik Reporting](https://demos.telerik.com/reporting) 
* [Product Page for Telerik Reporting](https://www.telerik.com/products/reporting)

## See Also

* [Creating Master-Detail Reports with the SubReport]({%slug telerikreporting/designing-reports/report-structure/how-to/how-to-create-a-master-detail-report-using-a-subreport-item%})
* [Binding the SubReport to Parent Report Data]({%slug how-to-bind-sub-report-to-main-report-s-data%})
* [(API) SubReport](/reporting/api/Telerik.Reporting.SubReport)
* [(API) ReportSource](/reporting/api/Telerik.Reporting.SubReport#Telerik_Reporting_SubReport_ReportSource)
