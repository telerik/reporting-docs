---
title: Expand/Collapse All Toggle Visibility Actions Simultaneously
description: How to expand/collapse all items/groups controlled with a Toggle Visibility Action through a single Report Paramater
type: how-to
page_title: Expand/Collapse Entire Drilldown Report with a single click
slug: expand-or-collapse-entire-drill-down-report-with-a-report-parameter
position: 
tags: 
ticketid: 1450066
res_type: kb
---

## Environment
<table>
	<tbody>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
		</tr>
	</tbody>
</table>


## Description
This article explains how to control all Drilldown report items with a single boolean [Report Parameter](../designing-reports-parameters).

## Solution
You may use the [ItemDataBinding event](../using-report-item-events) of the [data item](../data-items) where you use the 
[Toggle Visibility Action](../designing-reports-interactivity-drill-down). For example, if you use ToggleVisibility to hide/show 
nested table groups in the Table _table1_ through the TextBoxes _textBox11_, and _textBox17_, you may use code like:

```CSharp
private void table1_ItemDataBinding(object sender, EventArgs e)
{
    var table = sender as Telerik.Reporting.Processing.Table;
    bool expand = (bool)table.Report.Parameters["Expand"].Value;

    ToggleVisibilityAction drillDownAction = (ToggleVisibilityAction)this.textBox11.Action;
    ExpandDrillDownAction(expand, drillDownAction);

    ToggleVisibilityAction drillDownAction17 = (ToggleVisibilityAction)this.textBox17.Action;
    ExpandDrillDownAction(expand, drillDownAction17);
}

private static void ExpandDrillDownAction(bool expand, ToggleVisibilityAction drillDownAction)
{
    drillDownAction.DisplayExpandedMark = expand;
    foreach (var t in drillDownAction.Targets.Cast<IToggleVisibilityTarget>())
    {
        if (t is ReportItemBase)
        {
            (t as ReportItemBase).Visible = expand;
        }

        if (t is TableGroup)
        {
            (t as TableGroup).Visible = expand;

        }
    }
}
```
At the moment when
this event is raised the parameter values are already processed and known, and the properties of the definition items inside 
the data item (_table1_) can still be modified and taken into account in the further processing.
The value of the Report Parameter that controls the visibility of the items is taken in the table event and it value 
is applied to the definition of the controlling items - _textBox11_ and _textBox17_ (see the [ExpanAll sample in our GitHub repository](https://github.com/telerik/reporting-samples/tree/master/ExpandAll)). 
The former controls the Action that toggles the visibility of the outer table group, and the latter - of the inner table group. 
You may do the same also for deeper nested Actions by modifying the action settings in the definition of the corresponding controlling 
report item.
