---
title: Sorting Crosstab Total
page_title: Sorting the Total of the Crosstab Explained
description: "Learn how to order the Crosstab item's totals in Telerik Reporting via the Sorting Interactive Action."
slug: telerikreporting/designing-reports/adding-interactivity-to-reports/actions/sorting-action/sorting-crosstab-total
tags: sorting,crosstab,total
published: True
position: 20
previous_url: /interactive-sorting-action-crosstab-total
---

# Ordering the Crosstab Total

### Prerequisites:

- Reporting installation with the Examples feature
- MS SQL server with AdventureWorks

### Examples

The examples are located in (Replace: Reporting X with your installation version)

- Standalone Report Designer - `%PROGRAMFILES(x86)%\Reporting X\Report Designer\Examples`
- Visual Studio Integrated Designer – `%PROGRAMFILES(x86)%\Reporting X\Examples\CSharp\`

### How To

Add an interactive sorting button to crosstab total column header item (top-level static group) to enable interactive sort for column items that shows aggregated data (total) in the Crosstab.

1. Open in report design view the Dashboard example report.
1. In report design view, select the top crosstab, total column header textbox spLabelTotal to which we want to add an interactive sorting button.
1. From **Properties window** open the **Actions** editor.
1. Select **Sorting** option.
1. Click **Edit sort targets** button to open Edit Sorting Action targets editor.
1. Click **New** to add a new target.
1. Select for target from the drop down a dynamic row group over which data you want to apply sorting. In this case this is the SalesPersonFullName table group.
1. Click **OK**.
1. In the Sort expressions use the same aggregating expression as the one used in the items you want to sort. For this example, use the `=Sum(Fields.LineTotal)` expresion. Specifying a sort expression is required.
1. Click **OK**.

To verify the sorting action, preview the report, and then click the interactive sorting button.
