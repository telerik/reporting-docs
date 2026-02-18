---
title: Change row color based on a value in the row
description: How to change row color based on a value in the row
type: how-to
page_title: Change row color based on a value in the row
slug: change-row-color-based-on-value
position:
tags: Expressions
ticketid:
res_type: kb
---

## Environment

<table>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting </td>
	</tr>
</table>

## Description

How we can change row color, or any other styling characteristic, using [conditional formatting]({% slug telerikreporting/designing-reports/styling-reports/conditional-formatting %})?

## Solution

Note that this solution is applicable when column headers are placed in Group Header Section and detailed row is placed in detailed section as TextBox items.

1. Select the detail section of your report.
2. Select the **ConditionalFormatting** property of the detail section.
3. Click the **New Rule** button.
4. Enter a condition that should be true for the row to change color. For example:

   ```TEXT
   Expression: "=Fields.Flag"
   Operator: equal "="
   Value: "True"
   ```

5. Click the **Style** button.
6. Click the **Background** style item.
7. Choose a background color from the drop down list or ellipses color selector. Change any other style characteristics you choose.
8. Click **OK** to close each of the open dialogs.
