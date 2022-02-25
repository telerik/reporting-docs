---
title: Drilldown Report Action
page_title: Drilldown Report Action 
description: Drilldown Report Action
slug: telerikreporting/designing-reports/adding-interactivity-to-reports/actions/drilldown-report-action
tags: drilldown,report,action
published: True
position: 2
---

# Drilldown Report Action

You can control whether a report item initially displays or is hidden when a user views a report. By providing a toggle      	on a text box, you can enable users to hide and display items interactively. For a Table or CrossTab, you can show or hide      	dynamic (associated with groups), static and detail row and column groups. The main reason for hiding items is usually for clarity -      	a report that initially shows summary but enables users to drilldown into detail data.

For example, you can initially hide(Visible=false) all the row groups except the outer parent group for a table. For each inner      	group (including the details group), add a drilldown action to the grouping cell of the containing group. When the report is rendered,      	the user can click the text box to expand and collapse the detail data.

To define a drilldown action add a  [ToggleVisibilityAction](/reporting/api/Telerik.Reporting.ToggleVisibilityAction)  on an item.      	To define if the item exposing the action will be rendered initially with expanded or with collapsed mark, use the  [DisplayExpandedMark](/reporting/api/Telerik.Reporting.ToggleVisibilityAction#Telerik_Reporting_ToggleVisibilityAction_DisplayExpandedMark)      	property. 

>note The report item that you use for the  __toggle visibility__  action must be in a containing scope that controls the item that you want to show or hide.  	Example: to hide a row group, the report item must be in a row group associated with the parent group or higher in the containment hierarchy.

# See Also

 * [How to Add a Drilldown/Toggle Visibility Action]({%slug telerikreporting/designing-reports/adding-interactivity-to-reports/actions/how-to/how-to-add-a-drilldown-toggle-visibility-action%})
 
 * [Drillthrough Report Action]({%slug telerikreporting/designing-reports/adding-interactivity-to-reports/actions/drillthrough-report-action%})
  
 * [How to Add a Drillthrough/Navigate To Report Action]({%slug telerikreporting/designing-reports/adding-interactivity-to-reports/actions/how-to/how-to-add-a-drillthrough-navigate-to-report-action%})