---
title: Sorting Graphs
page_title: Sorting the Graph Report Item Explained
description: "Learn how the Graph item can be ordered dynamically in Telerik Reporting via the Sorting Interactive Action."
slug: telerikreporting/designing-reports/adding-interactivity-to-reports/actions/sorting-action/sorting-graph
tags: sorting,graph
published: True
position: 40
previous_url: /interactive-sorting-action-graph
reportingArea: General
---

# Ordering the Graph Report Item

Prerequisites:

* Reporting installation with the Examples feature
* MS SQL server with AdventureWorks

The examples are located in (Replace: Reporting X with your installation version)

* Standalone Report Designer - `%PROGRAMFILES(x86)%\Reporting X\Report Designer\Examples`
* Visual Studio Integrated Designer – `%PROGRAMFILES(x86)%\Reporting X\Examples\CSharp\`

Add an interactive sort button to a sibling or parent item to enable a user to click the item and sort the graph.

1. Open in report design view the Dashboard example report
1. In report design view, select a sibling or parent item to which you want to add an interactive sorting button. In this case we want to add the Sorting Action to a QUATERLY SALES DISTRIBUTION textbox located on the top of the `SalesPersonQuarterBar` graph item.
1. From __Properties window__ open the __Actions__ editor.
1. Select __Sorting__ option.
1. Click __Edit sort targets__ button to open Edit Sorting Action targets editor.
1. Click __New__ to add a new target.
1. __Select the target Graph group__ from the drop-down. For our example Select the graph SalesPersonGroup from the drop down. This way we will sort the sales persons if you want to sort the graph series you have to choose the series group OrderDate.QuarterGroup.
1. Click __OK__.
1. In Sort expressions drop-down you have to write a sort expression. In our case, the graph `barSeries1.Data.X` is set to `=Sum(Fields.LineTotal)` and we want to sort based on the aggregated LineTotal so use the same expression. Specifying a sort expression is required.
1. Click __OK__.

To verify the sorting action, preview the report, and then click the interactive sorting button.
