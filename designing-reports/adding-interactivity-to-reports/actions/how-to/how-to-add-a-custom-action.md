---
title: How to Add a Custom Action
page_title: How to Add a Custom Action | for Telerik Reporting Documentation
description: How to Add a Custom Action
slug: telerikreporting/designing-reports/adding-interactivity-to-reports/actions/how-to/how-to-add-a-custom-action
tags: how,to,add,a,custom,action
published: True
position: 4
---

# How to Add a Custom Action

## Adding a custom action using the Report Designer

1. In Design view, right-click the report item to which you want to add a link and then click __Properties__.             

1. In The Properties dialog box for that report item, click __Action__. The [Edit Action dialog]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/edit-action-dialog%}) will open.             

1. Select __Custom__. An additional section appears in the dialog box, containing a button titled __Select parameters__.             

1. Clicking the button will open the __Edit Custom Action Parameters__ dialog box. Add one or more parameters, defining their *Name*  and *Value*  properties.             

1. Click __OK__ when ready.             

1. To test the action, preview the report and click the report item with the applied custom action.                A message will appear, displaying information for the action's properties.             

## Adding a custom action programatically

{{source=CodeSnippets\CS\API\Telerik\Reporting\ActionSnippets.cs region=AddNewCustomActionSnippet}}
````C#
	Telerik.Reporting.CustomAction customAction = new Telerik.Reporting.CustomAction();
	customAction.Parameters.Add("param1", "=Fields.Name");
	customAction.Parameters.Add("param2", "=Now()");
	textBox1.Action = customAction;
````
{{source=CodeSnippets\VB\API\Telerik\Reporting\ActionSnippets.vb region=AddNewCustomActionSnippet}}
````VB
	Dim customAction As New Telerik.Reporting.CustomAction()
	customAction.Parameters.Add("param1", "=Fields.Name")
	customAction.Parameters.Add("param2", "=Now()")
	textBox1.Action = customAction
````

# See Also

 * [Custom Action]({%slug telerikreporting/designing-reports/adding-interactivity-to-reports/actions/custom-action%})

 * [Overview]({%slug telerikreporting/designing-reports/adding-interactivity-to-reports/actions/overview%})

 * [Expressions]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/overview%})

 * [Data Items]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/overview%})