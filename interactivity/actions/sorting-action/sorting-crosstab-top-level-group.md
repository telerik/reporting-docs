---
title: Sorting Crosstab Top-Level Group
page_title: Sorting the Top-Level Group of the Crosstab Explained
description: "Learn how to order the Crosstab's Top-Level group in Telerik Reporting through the Sorting Action."
slug: telerikreporting/designing-reports/adding-interactivity-to-reports/actions/sorting-action/sorting-crosstab-top-level-group
tags: sorting,crosstab,top-level,group
published: True
position: 30
previous_url: /interactive-sorting-action-crosstab-top-level
---

# Ordering the Crosstab Top-Level Group

### Prerequisites:

- Reporting installation with the Examples feature
- MS SQL server with AdventureWorks

### Examples

The examples are located in (Replace: Reporting X with your installation version)

- Standalone Report Designer - `%PROGRAMFILES(x86)%\Reporting X\Report Designer\Examples`
- Visual Studio Integrated Designer – `%PROGRAMFILES(x86)%\Reporting X\Examples\CSharp\`

### How To

Add an interactive sorting button to crosstab header (top-level static group or corner item) to enable interactive sort for top level group in a crosstab. The order of the child groups remains unchanged.

1. Open in report design view the Product Sales example report.
1. In report design view, select the crosstab corner with (USD IN THOUSANDS) text.
1. From **Properties window** open the **Actions** editor.
1. Select **Sorting** option.
1. Click **Edit sort targets** button to open Edit Sorting Action targets editor.
1. Click **New** to add a new target.
1. Select the target dynamic group (ProductCategory) from the drop down.
1. Click **OK**.
1. In the Sort expressions drop-down select the field that corresponds to the column for which you are defining a sorting action. In this example, that would be `=Fields.ProductCategory`. Specifying a sort expression is required.
1. Click **OK**.

To verify the sorting action, preview the report, and then click the interactive sorting button.
