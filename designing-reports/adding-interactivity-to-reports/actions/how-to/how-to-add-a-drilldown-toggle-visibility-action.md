---
title: How to Add a Drilldown/Toggle Visibility Action
page_title: How to Add a Drilldown/Toggle Visibility Action | for Telerik Reporting Documentation
description: How to Add a Drilldown/Toggle Visibility Action
slug: telerikreporting/designing-reports/adding-interactivity-to-reports/actions/how-to/how-to-add-a-drilldown-toggle-visibility-action
tags: how,to,add,a,drilldown/toggle,visibility,action
published: True
position: 3
---

# How to Add a Drilldown/Toggle Visibility Action

A report item can initially display or be hidden when a user views a report. The toggle action applied on the report item     	that allows you to hide and display items interactively is known as drilldown action.

## Adding a drilldown action to a report item using the Report Designer

1. In Design view, right-click a report item to which you want to add a toggle visibility action and then click __Properties__.

1. In the item's __Properties__  dialog box, click __Action__.

1. Select __Toggle Visibility__. Additional sections appear in the dialog box for this option.

1. Click __Edit toggle targets__  button, which opens __Edit toggle Visibility targets__  dialog.

1. Click __New__  button to add a new toggle action. Select a report item from the combobox to set it as toggle target, 
        	which visibility will be toggled when the action is triggered.

1. To add more toggle targets, repeat steps 4 and 5.

1. The __Toggle mark initially expanded__  checkbox determines if the item exposing the action will be rendered initially 
  	with expanded or with collapsed mark.

1. To test the toggle, run the report and click the text box with the toggle mark. The report display refreshes to show 
        	report items with their toggled visibility.

>note The report item must be in the same container hierarchy or higher (up to the report itself).


## Adding a drilldown action to a Table, CrossTab or ListBox group using the Report Designer

1. In Design view, click the Table, CrossTab or ListBox to select it. The [Group Explorer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/group-explorer%}).

1. Locate the __Display Mode__  combo in the title bar of the Group Explorer and select Extended Mode. This 
	toggles to show the underlying display structure for rows and columns.

1. Right-click the name of the row group or column group for which you want to hide the associated rows or columns and 
		select __Group Properties__.

1. Alter the __Visible__  property to indicate whether the group is displayed initially 
	expanded or collapsed (default is expanded). Click __OK__.

1. In Design view, right-click the report item representing the row group or column group to which you want to add a toggle 
		visibility action and then click __Properties__.

1. In the item's __Properties__  dialog box, click __Action__.

1. Select __Toggle Visibility__. Additional sections appear in the dialog box for this option.

1. Click __Edit toggle targets__  button, which opens __Edit toggle Visibility targets__  dialog.

1. Click __New__  button to add a new toggle action. Select a row group or column group from the combobox to set it as toggle target, 
        	which visibility will be toggled when the action is triggered.

1. To add more toggle targets, repeat steps 8 and 9.

1. The __Toggle mark initially expanded__  checkbox determines if the item exposing the action will be rendered initially 
  	with expanded or with collapsed mark.

1. To test the toggle, run the report and click the text box with the toggle mark. The report display refreshes to show 
	report items with their toggled visibility.

>note The report item must either be in the same group as the item that is being hidden or in an ancestor group.


## Adding a drilldown action programatically

{{source=CodeSnippets\CS\API\Telerik\Reporting\ActionSnippets.cs region=AddNewToggleVisibilitySnippet}}
````C#
	Telerik.Reporting.ToggleVisibilityAction toggleVisibilityAction1 = new Telerik.Reporting.ToggleVisibilityAction();
	textBox1.Action = toggleVisibilityAction1;
	toggleVisibilityAction1.DisplayExpandedMark = false;
	toggleVisibilityAction1.Targets.AddRange(new Telerik.Reporting.IToggleVisibilityTarget[] { textBox2 });
````
{{source=CodeSnippets\VB\API\Telerik\Reporting\ActionSnippets.vb region=AddNewToggleVisibilitySnippet}}
````VB
	Dim toggleVisibilityAction1 As New Telerik.Reporting.ToggleVisibilityAction()
	textBox1.Action = toggleVisibilityAction1
	toggleVisibilityAction1.DisplayExpandedMark = False
	toggleVisibilityAction1.Targets.AddRange(New Telerik.Reporting.IToggleVisibilityTarget() {textBox2})
````

# See Also

 * [ToggleVisibilityAction](/reporting/api/Telerik.Reporting.ToggleVisibilityAction)
 
 * [Drilldown Report Action]({%slug telerikreporting/designing-reports/adding-interactivity-to-reports/actions/drilldown-report-action%})

 * [Drillthrough Report Action]({%slug telerikreporting/designing-reports/adding-interactivity-to-reports/actions/drillthrough-report-action%})

 * [How to: Add a Drillthrough Report Action]({%slug telerikreporting/designing-reports/adding-interactivity-to-reports/actions/how-to/how-to-add-a-drillthrough-navigate-to-report-action%})