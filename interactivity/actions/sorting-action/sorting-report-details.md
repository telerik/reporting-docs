---
title: Sorting Report Details
page_title: Configure a Sorting Rule for the Report Details
description: "Learn how to interactively order the Report details in Telerik Reporting via the Sorting Interactive Action."
slug: telerikreporting/designing-reports/adding-interactivity-to-reports/actions/sorting-action/sorting-report-details
tags: sorting,report,details
published: True
position: 50
previous_url: /interactive-sorting-action-report-details
---

# Ordering the Report Details

Prerequisites:

* Reporting installation with the Examples feature
* MS SQL server with AdventureWorks

The examples are located in (Replace: Reporting X with your installation version)

* Standalone Report Designer - `%PROGRAMFILES(x86)%\Reporting X\Report Designer\Examples`
* Visual Studio Integrated Designer – `%PROGRAMFILES(x86)%\Reporting X\Examples\CSharp\`

Add an interactive sorting button to a page, group or report header item to enable a user to click the item adorner and sort the report details by the selected expression.

1. Open in report design view the SalesOrderDetails report that is used as subreport for the Invoice example report.
1. In report design view, select the Quantity group header textbox, to which we want to add an interactive sorting button.
1. From __Properties window__ open the __Actions__ editor.
1. Select __Sorting__ option.
1. Click __Edit sort targets__ button to open Edit Sorting Action targets editor.
1. Click __New__ to add a new target.
1. Select the Report name (SalesOrderDetails) from the drop down.
1. Click __OK__.
1. In Sort expressions drop-down select the field or write expression for which you are defining a sorting action For our example, set the expression to `=Fields.OrderQty`. Specifying a sort expression is required.
1. Click __OK__.

To verify the sorting action, preview the report, and then click the interactive sorting button.
