---
title: Drillthrough Report Action
page_title: Configuring the Drillthrough Report Action 
description: "Learn more about the drill-through interactivity report action when working with Telerik Reporting."
slug: telerikreporting/designing-reports/adding-interactivity-to-reports/actions/drillthrough-report-action
previous_url: /designing-reports/report-sources/how-to-set-reportsource-for-navigatetoreport-action, /designing-reports/adding-interactivity-to-reports/actions/how-to/how-to-add-a-drillthrough-navigate-to-report-action, /designing-reports-interactivity-drill-through-report-links
tags: drillthrough,report,action
published: True
position: 3
---

# Drillthrough/Navigate To Report Action

A drillthrough report is a report that a user opens by clicking a link within another report. Drillthrough reports commonly contain details about an item that is contained in an original summary report. For example, you might have a sales summary report with a list of orders and sales totals. When a user clicks an order number in the summary list, another report opens that contains details about the order.

A drillthrough report serves a different purpose than a subreport. A subreport is processed as part of the main report. For example, if a subreport that displays order detail information is added to a table cell in the detail row, the subreport is processed once per row of the table and rendered as part of the main report. A drillthrough report is only processed and rendered when the user clicks the drillthrough link in the summary main report.

A drillthrough report typically contains parameters that are passed to it by the summary report. When you set a drillthrough report link on a report item, set a value for the parameter of the target report as well. When the user clicks the link in the summary report, the target detail report opens and displays the information for that specific value.

To define a drill-through action add a [NavigateToReportAction](/api/Telerik.Reporting.NavigateToReportAction) on an item.

> The Target report of a drill-through action should always have a default constructor, so it can be instantiated.

## Adding a Drillthrough/Navigate To Report Action

A report can contain links to other reports. The report that opens when you click the link in the main report is known as a drillthrough report. Drillthrough reports must be published to the same report server as the main report, but they can be in different folders. You can add a drillthrough link to any item that has an `Action` property.

> We recommend the usage of `TypeReportSource` ('Type name' option) or `UriReportSource` ('Url or file' option) in the [Load Report Dialog]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/load-report-dialog%})) on configuring the target report. `InstanceReportSource` ('Object instance' option) is only supported for WinForms and WPF Report Viewers in Embedded mode.

### Adding a drillthrough action using the Report Designer

1. In the Design view, right-click a report item to which you want to add a link and then click __Properties__.
1. In the item's __Properties__ dialog box, click __Action__.
1. Select __Navigate to Report__. An additional section appears that allows you to select a __ReportSource__.
1. In the __Choose a Report Source__ dialog, select how you would navigate to the report, For this example we would use __Type Report Source__ , click that option and select the report that you would like to navigate to. If you have to specify parameters for the drillthrough report, follow the next step.
1. Click __Edit Parameters__ button - __Edit Parameters__ dialog appears. Click __New__. In the __Parameter Name__ column select the name of the report parameter in the drillthrough report. In the __Parameter Value__ , type or select the value to pass to the parameter in the drillthrough report.
1. To test the link, run the report and click the report item with the applied __Action__. For TextBoxes, it is helpful to change the color and effect of the text to indicate that the text is a link. For example, change the color to blue and the effect to underline by setting the corresponding __Font__ properties of the TextBox.

### Adding a drillthrough action programmatically

{{source=CodeSnippets\CS\API\Telerik\Reporting\ActionSnippets.cs region=AddNewNavigateToReportSnippet}}
{{source=CodeSnippets\VB\API\Telerik\Reporting\ActionSnippets.vb region=AddNewNavigateToReportSnippet}}

## Setting ReportSource for Drillthrough/Navigate To Report Action

This article includes details on how to specify a __target report__ for a [Navigate to Report (Drill-through) Action]({%slug telerikreporting/designing-reports/adding-interactivity-to-reports/actions/drillthrough-report-action%}). You will need a [ReportSource]({%slug telerikreporting/designing-reports/report-sources/overview%}) object.

> When you reference reports stored in the [Telerik Report Server](https://docs.telerik.com/report-server/introduction) ensure using the *[CategoryName]/[ReportName]* path for the URI as specified in the article [Working with Report Server Reports]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/working-with-report-server-reports%}).

### Setting the ReportSource through the Report Designer

1. In the Design view, right-click a report item to which you want to add a drill-through action and then click __Properties__.
1. In the item's __Properties__ dialog box, click __Action__.
1. Select __Navigate to Report__. An additional section appears that allows you to select a __ReportSource__.
1. In the __Choose a Report Source__ dialog, select how you would navigate to the report, For this example, we would use __Type Report Source__, click that option, and select the report that you would like to navigate to. If you have to specify parameters for the drillthrough report, follow the next step.
1. Click __Edit Parameters__ button - __Edit Parameters__ dialog appears. Click __New__. In the __Parameter Name__ column select the name of the report parameter in the drillthrough report. In the __Parameter Value__, type or select the value to pass to the parameter in the drillthrough report.

### Setting the Report Source Programmatically

{{source=CodeSnippets\CS\API\Telerik\Reporting\ActionSnippets.cs region=AddNewNavigateToReportSnippet}}
{{source=CodeSnippets\VB\API\Telerik\Reporting\ActionSnippets.vb region=AddNewNavigateToReportSnippet}}

The [Standalone Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/overview%}) includes only XmlReportSource and UriReportSource options due to the format of the produced reports. In [Visual Studio Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/visual-studio-report-designer/overview%}) you can use all available [Report Sources]({%slug telerikreporting/designing-reports/report-sources/overview%}).

>tip If the report will be displayed in an HTML5-based Report Viewer, the main report is rendered in HTML and it is loaded at the client. The rendered content contains a link rendered for the `NavigateToReportAction`, that will not be valid and working if the target report is specified via `InstanceReportSource` or `XmlReportSource`.

The [Standalone Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/overview%}) includes only XmlReportSource and UriReportSource options due to the format of the produced reports. In [Visual Studio Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/visual-studio-report-designer/overview%}) you can use all available [Report Sources]({%slug telerikreporting/designing-reports/report-sources/overview%}).

>tip If the report will be displayed in an HTML5-based Report Viewer or the Silverlight ReportViewer, the main report is rendered in HTML (or XAML respectively) and it is loaded at the client. The rendered content contains a link rendered for the `NavigateToReportAction`, that will not be valid and working if the target report is specified via `InstanceReportSource` or `XmlReportSource`.
