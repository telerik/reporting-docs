---
title: Drillthrough Report Action
page_title: Drillthrough Report Action 
description: Drillthrough Report Action
slug: telerikreporting/designing-reports/adding-interactivity-to-reports/actions/drillthrough-report-action
tags: drillthrough,report,action
published: True
position: 3
---

# Drillthrough Report Action

A drillthrough report is a report that a user opens by clicking a link within another report. Drillthrough reports commonly contain details about an item that is contained in an original summary report. For example, you might have a sales summary report with a list of orders and sales totals. When a user clicks an order number in the summary list, another report opens that contains details about the order. 

A drillthrough report serves a different purpose than a subreport. A subreport is processed as part of the main report. For example, if a subreport that displays order detail information is added to a table cell in the detail row, the subreport is processed once per row of the table and rendered as part of the main report. A drillthrough report is only processed and rendered when the user clicks the drillthrough link in the summary main report. 

A drillthrough report typically contains parameters that are passed to it by the summary report. When you set a drillthrough report link on a report item, set a value for the parameter of the target report as well. When the user clicks the link in the summary report, the target detail report opens and displays the information for that specific value. 

To define a drill-through action add a [NavigateToReportAction](/reporting/api/Telerik.Reporting.NavigateToReportAction) on an item. 

>note The Target report of a drill-through action should always have a default constructor, so it can be instantiated. 


# How to Add a Drillthrough/Navigate To Report Action

A report can contain links to other reports. The report that opens when you click the link in the main report is known as a drillthrough report. Drillthrough reports must be published to the same report server as the main report, but they can be in different folders. You can add a drillthrough link to any item that has an Action property. 

> We recommend the usage of TypeReportSource ('Type name' option) or UriReportSource ('Url or file' option) in the [Load Report Dialog]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/load-report-dialog%})) on configuring the target report. InstanceReportSource ('Object instance' option) is only supported for WinForms and WPF Report Viewers in Embedded mode. 


## Adding a drillthrough action using the Report Designer

1. In Design view, right-click a report item to which you want to add a link and then click __Properties__. 

1. In the item's __Properties__ dialog box, click __Action__. 

1. Select __Navigate to Report__. Additional section appears which allows you to select a __ReportSource__. 

1. In the __Choose a Report Source__ dialog, select how you would navigate to the report, For this example we would use __Type Report Source__ , click that option and select the report that you would like to navigate to. If you have to specify parameters for the drillthrough report, follow the next step.

1. Click __Edit Parameters__ button - __Edit Parameters__ dialog appears. Click __New__. In the __Parameter Name__ column select the name of the report parameter in the drillthrough report. In the __Parameter Value__ , type or select the value to pass to the parameter in the drillthrough report. 

1. To test the link, run the report and click the report item with the applied __Action__. For TextBoxes, it is helpful to change the color and effect of the text to indicate that the text is a link. For example, change the color to blue and the effect to underline by setting the corresponding __Font__ properties of the TextBox. 

## Adding a drillthrough action programatically

{{source=CodeSnippets\CS\API\Telerik\Reporting\ActionSnippets.cs region=AddNewNavigateToReportSnippet}}
{{source=CodeSnippets\VB\API\Telerik\Reporting\ActionSnippets.vb region=AddNewNavigateToReportSnippet}}


# See Also

 * [Bookmark Action]({%slug telerikreporting/designing-reports/adding-interactivity-to-reports/actions/bookmark-action%})

 * [Hyperlink Action]({%slug telerikreporting/designing-reports/adding-interactivity-to-reports/actions/hyperlink-action%})
 
 * [Expressions Overview]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/overview%})
 
 * [Data Items Overview]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/overview%})
