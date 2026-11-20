---
title: Sorting Table Details
page_title: Configure a Sorting Action for the Table Details
description: "Learn how to configure an interactive sorting action for table details in Telerik Reporting using the Standalone or Visual Studio Report Designer."
slug: telerikreporting/designing-reports/adding-interactivity-to-reports/actions/sorting-action/sorting-table-details
tags: sorting,table,details
published: True
position: 10
previous_url: /interactive-sorting-action-table-details
reportingArea: General
components: [general]
---

# Sorting Table Details

Learn how to configure an interactive sorting action for table details in the Standalone Report Designer or Visual Studio Report Designer.

## Prerequisites

To complete this procedure, you need the following:

* A Telerik Reporting installation with the [Examples feature](slug:telerikreporting/installation) enabled.
* Microsoft SQL Server with the `AdventureWorks` database.

## Configuring Interactive Sorting

The following steps show how to add an interactive sorting button to a column header in the **Detail Section** of a report. The button sorts the table rows by the value displayed in that column.

1. Locate the `Product Catalog` sample report. Open it in the **Standalone Report Designer** or **Visual Studio Report Designer**, and find it in one of these folders:

   * Examples for the Standalone Report Designer: `%PROGRAMFILES(x86)%\Progress\Telerik Reporting <Version>\Report Designer\Examples`
   * Examples for the Visual Studio Report Designer: `%PROGRAMFILES(x86)%\Progress\Telerik Reporting <Version>\Examples\CSharp\`

   > note Replace `<Version>` in the Examples path with your Telerik Reporting version.

1. In the Report Designer, select **Design View**.
1. Select the **List Price** text box, the column header where you want to add an interactive sorting button.
1. In the **Properties** window, open the **Action** editor.
1. Select the **Sorting** action.
1. Click **Select sort targets**. The **Edit Sorting Action targets** dialog box appears.
1. Click **New** to add a new target.
1. Select **table1 (Table)** in the dropdown and click **OK**.
1. In the **Sort expressions** dropdown, select the field for the column. For this example, use the `=Fields.ListPrice` expression and click **OK**.

   > note Specifying a sort expression is required.

To verify the sorting action:

1. Preview the report
1. Navigate to **Bikes** in the document map.
1. Click the interactive sorting button in the **List Price** column.
1. Confirm that the table rows sort in ascending order by list price. Click the button again to sort the rows in descending order.

## See Also

* [Learn how to configure sorting actions in Telerik Reporting](slug:telerikreporting/designing-reports/adding-interactivity-to-reports/actions/sorting-action/overview)
