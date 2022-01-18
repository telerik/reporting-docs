---
title: Drillthrough Report Action
page_title: Drillthrough Report Action | for Telerik Reporting Documentation
description: Drillthrough Report Action
slug: telerikreporting/designing-reports/adding-interactivity-to-reports/actions/drillthrough-report-action
tags: drillthrough,report,action
published: True
position: 3
---

# Drillthrough Report Action

A drillthrough report is a report that a user opens by clicking a link within another report. Drillthrough reports commonly contain details about an item that is contained in an original summary report.         For example, you might have a sales summary report with a list of orders and sales totals. When a user clicks an order number in the summary list, another report opens that contains details about the order.       

A drillthrough report serves a different purpose than a subreport. A subreport is processed as part of the main report. For example, if a subreport that displays order detail information is added to a table cell in the detail row, the subreport is processed once per row of the table and rendered as part of the main report. A drillthrough report is only processed and rendered when the user clicks the drillthrough link in the summary main report.         

A drillthrough report typically contains parameters that are passed to it by the summary report. When you set a drillthrough report link on a report item, set a value for the parameter of the target report as well. When the user clicks the link in the summary report, the target detail report opens and displays the information for that specific value.         

To define a drill-through action add a [NavigateToReportAction](/reporting/api/Telerik.Reporting.NavigateToReportAction) on an item.         

>note The Target report of a drill-through action should always have a default constructor, so it can be instantiated.


>tip We recommend the usage of TypeReportSource ('Type name' option) or UriReportSource ('Url or file' option) in the [Load Report Dialog](../../report-designer-tools/desktop-designers/tools/load-report-dialog) on configuring the target report. InstanceReportSource ('Object instance' option) is only supported for WinForms and WPF Report Viewers in Embedded mode.           


# See Also
  
 * [How to Add a Drillthrough/Navigate To Report Action]({%slug telerikreporting/designing-reports/adding-interactivity-to-reports/actions/how-to/how-to-add-a-drillthrough-navigate-to-report-action%})