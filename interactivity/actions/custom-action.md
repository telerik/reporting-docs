---
title: Custom Action
page_title: Configuring the Custom Action 
description: "Learn more about setting up a Custom Report Action and how to utilize the Report Viewer interactive action event handlers to apply changes at runtime."
slug: telerikreporting/designing-reports/adding-interactivity-to-reports/actions/custom-action
tags: custom,action
published: True
position: 70
previous_url: /designing-reports/adding-interactivity-to-reports/actions/how-to/how-to-add-a-custom-action, /designing-reports-interactivity-custom-action, /designing-reports-interactivity-how-to-add-custom-action
reportingArea: General
---

# Custom Actions Overview

A custom action is an action that contains a collection of parameters, defined by the user, that will be evaluated during report processing. It does not affect the currently viewed report in any way - its purpose is to be used in a report viewer's interactive action event handlers: `InteractiveActionExecuting()`, `InteractiveActionEnter()`, and `InteractiveActionLeave()`. 

To define a [CustomAction](/api/Telerik.Reporting.CustomAction) use the [Edit Action Dialog]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/edit-action-dialog%}) or create it programmatically in the report class body. 

Here is an example of how to get the custom action's parameters in the [`InteractiveActionExecuting`](/api/telerik.reportviewer.winforms.reportviewerbase#Telerik_ReportViewer_WinForms_ReportViewerBase_InteractiveActionExecuting) event of the __WinForms Report Viewer__. 

{{source=CodeSnippets\CS\API\Telerik\ReportViewer\WinForms\Form1.cs region=WinFormsCustomInteractiveActionExecutingEventSnippet}}
{{source=CodeSnippets\VB\API\Telerik\ReportViewer\WinForms\Form1.vb region=WinFormsCustomInteractiveActionExecutingEventSnippet}}


# How to Add a Custom Action

## Adding a custom action using the Report Designer

1. In the Design view, right-click the report item to which you want to add a link and then click __Properties__. 
1. In The Properties dialog box for that report item, click __Action__. The [Edit Action dialog]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/edit-action-dialog%}) will open. 
1. Select __Custom__. An additional section appears in the dialog box, containing a button titled __Select parameters__. 
1. Clicking the button will open the __Edit Custom Action Parameters__ dialog box. Add one or more parameters, defining their *Name*  and *Value*  properties. 
1. Click __OK__ when ready. 
1. To test the action, preview the report and click the report item with the applied custom action. A message will appear, displaying information for the action's properties.             

## Adding a custom action programmatically

{{source=CodeSnippets\CS\API\Telerik\Reporting\ActionSnippets.cs region=AddNewCustomActionSnippet}}
{{source=CodeSnippets\VB\API\Telerik\Reporting\ActionSnippets.vb region=AddNewCustomActionSnippet}}


## See Also

 * [Actions Overview]({%slug telerikreporting/designing-reports/adding-interactivity-to-reports/actions/overview%}) 
 * [Interactive Action Events]({%slug telerikreporting/designing-reports/adding-interactivity-to-reports/actions/interactive-action-events%}) 
 * [Expressions]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/overview%})
 * [Data Items]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/overview%})
