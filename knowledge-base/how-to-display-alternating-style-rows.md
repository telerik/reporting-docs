---
title: Display Reports with alternating style rows
description: How to display Reports with alternating style rows
type: how-to
page_title: Display Reports with alternating style rows
slug: how-to-display-alternating-style-rows
position:
tags: Styling, Table, Crosstab
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

Many production level reports use an alternating row style as an aid to readability. This technique is used in the ProductCatalog sample report.

## Solution

This look can be achieved with [conditional formatting]({% slug telerikreporting/designing-reports/styling-reports/conditional-formatting %}) by setting up a rule that fires on every other line.

1. Select the detail section of your report.

2. Select the **ConditionalFormatting** property in the [Context Menu]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/context-menu%}) or the Property Grid.

3. Click the **New Rule** button.

4. Enter the expression "= RowNumber()%2"

5. Select the equal "=" operator from the drop down list.

6. Enter the value as "=1".

7. Click the **Style** button.

8. Click the **Background** style item.

9. Enter the color as "#F0F0F0".

10. Click **OK** to close each of the open dialogs.

The same styling can be achieved with a [Table/Crosstab/List]({% slug telerikreporting/designing-reports/report-structure/table-crosstab-list/overview %}). For the purpose **at step 1** select all items in a row of the Table/Crosstab/List item, and proceed with the next steps.

## Notes

The expression used **at step 4** is a [Data function]({% slug telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/functions/data-functions %}) working in a specific [data scope]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/expression-scope %}), which depends on the report's layout. To assure the proper evaluation of the expression you can use the name of the report or a group as an argument for the RowNumber function (scope).

## See Also

- [Data Functions]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/functions/data-functions %})
- [Expression Scope]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/expression-scope %})
- [Conditional Formatting]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/using-expressions/conditional-formatting %})
