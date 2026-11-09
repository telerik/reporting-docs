---
title: Sorting Table Details
page_title: Configure a Sorting Action for the Table Details
description: "Learn how to configure interactive sorting for table details in Telerik Reporting with the Standalone or Visual Studio Report Designer."
slug: telerikreporting/designing-reports/adding-interactivity-to-reports/actions/sorting-action/sorting-table-details
tags: sorting,table,details
published: True
position: 10
previous_url: /interactive-sorting-action-table-details
reportingArea: General
components: [general]
---

# Sorting Table Details

This document demonstrates how to enable interactive sorting with the `Standalone Report Designer` or with the `Visual Studio Report Designer`.

## Prerequisites

To follow the steps in this guide, you need the following:

* A Telerik Reporting installation with an enabled [Examples feature]({%slug telerikreporting/installation%})
* Microsoft SQL Server with AdventureWorks

## Procedure

The following steps describe how to add an interactive **sort** button to a column header in the **Detail Section** of a report. This enables you to sort the table rows by the value displayed in that column:

1. Locate the `Product Catalog` sample report and open it with the **Standalone Report Designer** or the **Visual Studio Report Designer**. Depending on the Report Designer you choose, locate the sample report in one of the following folders:

   * Examples for the Standalone Report Designer: `%PROGRAMFILES(x86)%\Progress\Telerik Reporting {Version}\Report Designer\Examples`.
   * Examples for the Visual Studio Report Designer: `%PROGRAMFILES(x86)%\Progress\Telerik Reporting {Version}\Examples\CSharp\`.

   >note Replace **{Version}** in the Examples path with your Telerik Reporting version.

1. In the Report Designer, use **Design View**.
1. Select the **List Price** text box, which is the column header where you want to add an interactive sorting button.
1. In the **Properties** window, open the **Action** editor.
1. Select the **Sorting** action.
1. Click the **Select sort targets** button. The **Edit Sorting Action targets** window appears.
1. Click the **New** button to add a target.
1. Select **table1 (Table)** in the drop-down list and click **OK**.
1. In the **Sort expressions** drop-down menu, select the field that corresponds to the column for the sorting action. In this case, use the `=Fields.ListPrice` expression and click **OK**.

   >note Specifying a sort expression is required.

To verify the sorting action:

1. Preview the report
1. Navigate to **Bikes** in the document map.
1. Click the **List Price** column interactive sorting button.
