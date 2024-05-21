---
title: Drilldown Report Action
page_title: Configuring the Drilldown Report Action 
description: "Learn how to allow end-users to dynamically hide or show report content through the Drilldown Interactive Report Action."
slug: telerikreporting/designing-reports/adding-interactivity-to-reports/actions/drilldown-report-action
tags: drilldown,report,action
published: True
position: 2
previous_url: /designing-reports/adding-interactivity-to-reports/actions/how-to/how-to-add-a-drilldown-toggle-visibility-action, /designing-reports-interactivity-drill-down, /designing-reports-interactivity-how-to-add-drilldown-action 
---

# Drilldown Report Action Overview

You can control whether a report item initially displays or is hidden when a user views a report. By providing a toggle on a text box, you can enable users to hide and display items interactively. For a `Table` or `CrossTab`, you can show or hide dynamic (associated with groups), static and detail row and column groups. The main reason for hiding items is usually for clarity - a report that initially shows summary but enables users to drilldown into detail data. 

For example, you can initially hide(`Visible=false`) all the row groups except the outer parent group for a table. For each inner group (including the details group), add a drilldown action to the grouping cell of the containing group. When the report is rendered, the user can click the text box to expand and collapse the detail data. 

To define a drilldown action add a [ToggleVisibilityAction](/api/Telerik.Reporting.ToggleVisibilityAction) on an item. To define if the item exposing the action will be rendered initially with expanded or with collapsed mark, use the [DisplayExpandedMark](/api/Telerik.Reporting.ToggleVisibilityAction#Telerik_Reporting_ToggleVisibilityAction_DisplayExpandedMark) property. 

>note The report item that you use for the __toggle visibility__ action must be in a containing scope that controls the item that you want to show or hide. Example: to hide a row group, the report item must be in a row group associated with the parent group or higher in the containment hierarchy. 

# How to Add a Drilldown/Toggle Visibility Action

A report item can initially display or be hidden when a user views a report. The toggle action applied on the report item that allows you to hide and display items interactively is known as drilldown action.

## Adding a drilldown action to a report item using the Report Designer

1. In Design view, right-click a report item to which you want to add a toggle visibility action and then click __Properties__.

1. In the item's __Properties__  dialog box, click __Action__.

1. Select __Toggle Visibility__. Additional sections appear in the dialog box for this option.

1. Click __Edit toggle targets__  button, which opens __Edit toggle Visibility targets__  dialog.

1. Click __New__  button to add a new toggle action. Select a report item from the combobox to set it as toggle target, which visibility will be toggled when the action is triggered.

1. To add more toggle targets, repeat steps 4 and 5.

1. The __Toggle mark initially expanded__  checkbox determines if the item exposing the action will be rendered initially with expanded or with collapsed mark.

1. To test the toggle, run the report and click the text box with the toggle mark. The report display refreshes to show report items with their toggled visibility.

>note The report item must be in the same container hierarchy or higher (up to the report itself).


## Adding a drilldown action to a Table, CrossTab or ListBox group using the Report Designer

1. In Design view, click the Table, CrossTab or ListBox to select it. The [Group Explorer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/group-explorer%}).

1. Locate the __Display Mode__  combo in the title bar of the Group Explorer and select Extended Mode. This toggles to show the underlying display structure for rows and columns.

1. Right-click the name of the row group or column group for which you want to hide the associated rows or columns and select __Group Properties__.

1. Alter the __Visible__  property to indicate whether the group is displayed initially expanded or collapsed (default is expanded). Click __OK__.

1. In Design view, right-click the report item representing the row group or column group to which you want to add a toggle visibility action and then click __Properties__.

1. In the item's __Properties__  dialog box, click __Action__.

1. Select __Toggle Visibility__. Additional sections appear in the dialog box for this option.

1. Click __Edit toggle targets__  button, which opens __Edit toggle Visibility targets__  dialog.

1. Click __New__  button to add a new toggle action. Select a row group or column group from the combobox to set it as toggle target, which visibility will be toggled when the action is triggered.

1. To add more toggle targets, repeat steps 8 and 9.

1. The __Toggle mark initially expanded__  checkbox determines if the item exposing the action will be rendered initially with expanded or with collapsed mark.

1. To test the toggle, run the report and click the text box with the toggle mark. The report display refreshes to show report items with their toggled visibility.

>note The report item must either be in the same group as the item that is being hidden or in an ancestor group.


## Adding a drilldown action programatically

{{source=CodeSnippets\CS\API\Telerik\Reporting\ActionSnippets.cs region=AddNewToggleVisibilitySnippet}}
{{source=CodeSnippets\VB\API\Telerik\Reporting\ActionSnippets.vb region=AddNewToggleVisibilitySnippet}}


## See Also

 * [ToggleVisibilityAction](/api/Telerik.Reporting.ToggleVisibilityAction)
 
 * [Drilldown Report Action]({%slug telerikreporting/designing-reports/adding-interactivity-to-reports/actions/drilldown-report-action%})

 * [Drillthrough Report Action]({%slug telerikreporting/designing-reports/adding-interactivity-to-reports/actions/drillthrough-report-action%})
