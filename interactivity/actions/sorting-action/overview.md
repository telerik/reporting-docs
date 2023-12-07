---
title: Sorting Action 
page_title: Configuring the Sorting Action
description: "Learn more about how the Sorting action base functionality works as well as more complex scenarios such as when multiple sortings are used."
slug: telerikreporting/designing-reports/adding-interactivity-to-reports/actions/sorting-action/overview
tags: overview
published: True
position: 0
previous_url: /conditional_visibility_and_other_interactive_features, /interactive-sorting-action, /interactivity/actions/sorting-action/
---

# Sorting Action Overview


You can add interactive sort buttons to enable a user to toggle between, raw, ascending and descending order for rows in a Table, for rows and columns in a `Crosstab`, for report details or groups and for `Graph` groups. The most common use of the interactive sorting action is to add a _sort button_ to every column header textbox/item. The user can then choose which column to sort by.       

With that being said, you can add an interactive sorting button to any report item, not just column header textboxes. For example, for a `TextBox` in a row outside a row group, for child group rows or columns, or for the detail rows or columns. You can also combine fields into a single expression, and then sort by multiple fields.       

## Add Interactive Sorting Action

When you create an interactive sorting action, in the [Edit Action dialog]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/edit-action-dialog%}) you must specify what to sort (target data item/group) and what to sort by (data field or expression).         

When you view the report, items that trigger interactive sorting action have arrow icons that change to indicate the sort order. The first time you click an interactive sort button, items are sorted in ascending order. The second time you click an interactive sort button, items are sorted in descending order. The third time you click an interactive sort button, we use the raw data source/item order. Subsequent clicks toggle the sort order between ascending, descending and raw (default sort order) order.         

## Priority

When triggered the interactive sorting action applies the sorting expression to the specified target. The sorting expression is applied with higher priority then the static sorting expressions defined for the target.       		

## Adorner alignment

The sorting adorner by design is aligned horizontally on the left and vertically in the middle. If you want to change its location, you can nest the target item in a `Panel` item and use another `Panel` item for the `Sorting` action. This way, you can align the last panel holding the sorting adorner according to your requirements.           	

## Multiple actions

The items can hold only one action. If you need to add multiple actions, for example, `Sorting` Action and `Toggle Visibility` Action, our recommendation is to nest the target item to a `Panel` item. Then, add one action to the panel and another action to the target item.           	

## See Also


 * [How to sort the data rows in a column]({%slug telerikreporting/designing-reports/adding-interactivity-to-reports/actions/sorting-action/sorting-table-details%})

 * [How to sort the data rows in a Crosstab column]({%slug telerikreporting/designing-reports/adding-interactivity-to-reports/actions/sorting-action/sorting-crosstab-total%})

 * [How to sort the items in a graph]({%slug telerikreporting/designing-reports/adding-interactivity-to-reports/actions/sorting-action/sorting-graph%})
