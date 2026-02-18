---
title: Display "No Data" message for Reports and Subreports
description: Show a specific text in case of no data source or an empty one
type: how-to
page_title: How to display 'No Data' message for Reports and Subreports
slug: how-to-display-no-data-message-for-reports-and-subreports
position:
tags: ReportLayout
ticketid: 1386234
res_type: kb
---

## Environment

<table>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting</td>
	</tr>
</table>

## Description

This KB article gives a brief description of how to show "No Data" message when a report or a subreport has no data source or when the data source is empty.

## Solution

**For Report:**

1. Insert a textbox in the `Report Header` section with value: "No data".
2. Set the textbox property of `Visible` to `False`.
3. Add a new Conditional Formatting Rule. In the Filters section set the fields as follows:

   ```TEXT
   Expression: =Count(1)
   Operator: =
   Value: =0
   ```

4. Go to `Style` of the formatting rule -> uncheck the `Visible` box -> click `OK` -> select again the Style of the rule -> check `Visible` -> `OK` (This step is required because the designer needs to determine that a change has been introduced so that it re-serializes the report, otherwise the message will not change its visibility).

**For Subreport:**

You can display a 'No Data' message in a sub report by using the same approach as for a Report.
If you want to hide the SubReport item and its content, then you can add a binding in the textbox item's `Bindings` collection like:

```TEXT
Property path: Parent.Parent.Parent.Visible
Expression: = Count(1)>0
```

The Property path has to be typed manually, where the `Parent` keyword can be used as many times as needed to get the item in the Main Report, which you want to hide.

## See Also

- [How to: Set a No Data Message]({%slug telerikreporting/designing-reports/connecting-to-data/how-to-set-a-no-data-message%})
