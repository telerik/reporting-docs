---
title: Sorting Multiple Items/Groups
page_title: Configuring Sorting for Multiple Items/Groups
description: "Learn how multiple report items and/or groups can be ordered at the same via the Sorting Interactive Action."
slug: telerikreporting/designing-reports/adding-interactivity-to-reports/actions/sorting-action/sorting-multiple-items-groups
tags: sorting,multiple,items/groups,action,interactivity
published: True
position: 60
previous_url: /interactive-sorting-action-multiple-items
---

# Ordering Multiple Items/Groups

### Prerequisites:

- Reporting installation with the Examples feature
- MS SQL server with AdventureWorks

### Examples

The examples are located in (Replace: Reporting X with your installation version)

- Standalone Report Designer - `%PROGRAMFILES(x86)%\Reporting X\Report Designer\Examples`
- Visual Studio Integrated Designer – `%PROGRAMFILES(x86)%\Reporting X\Examples\CSharp\`

### How To

Add an interactive sorting button to a parent for all targets item to enable a user to click the item adorner and sort the target data items/groups by the selected expression.

1. Open in report design view the Dashboard example report.
1. Select item to which you want to add an interactive sorting button. The selected item should be parent to the target groups/data items. For this how to use the report header section text box with Quaterly Sales text.
1. From **Properties window** open the **Actions** editor.
1. Select **Sorting** option.
1. Click **Edit sort targets** button to open Edit Sorting Action targets editor.
1. Click **New** to add a new target.
1. Select the target group/data item name from the drop down. For this report use SalesPersonFullName (TableGroup).
1. Click **OK**.
1. Click **New** to add a new target.
1. Select the StoreName (TableGroup).
1. Click **OK**.
1. In Sort expressions drop-down select the field or write expression for which you are defining a sorting action. In this case, you have to use the `=Sum(Fields.LineTotal)` expression. Specifying a sort expression is required.
1. Click **OK**.

To verify the sorting action, preview the report, and then click the interactive sorting button.
