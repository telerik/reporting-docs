---
title: Display Continued Text for Repeated Table Group Headers
description: Learn how to add a group with repeatable headers and display different content when the header repeats on subsequent pages.
type: how-to
page_title: Add Continued Text for Repeating Table Group Headers
slug: display-different-content-for-repeated-table-group-headers
res_type: kb
---

## Environment

<table>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting</td>
	</tr>
	<tr>
		<td>Report Items</td>
		<td>Table, Crosstab, List</td>
	</tr>
</table>

## Description

When a table group spans multiple pages, you may want to indicate on subsequent pages that the group is continued from a previous page. For example, displaying "Category Name........." instead of just "Category Name" helps readers understand they are viewing the continuation of a group.

This article demonstrates how to create a table group with a repeatable header and conditionally display different content based on whether the header appears for the first time or as a repeated instance.

## Solution

>important Repeatable headers and footers are not compatible with the `PageBreak` property. If any group in the table has a `PageBreak` value other than `None`, repeatable headers and footers will not be processed and rendered, even if `PrintOnEveryPage` is enabled.

### Step 1: Add a Group with Repeatable Header

1. Select the Table, Crosstab, or List item on the design surface.
1. In the [Group Explorer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/group-explorer%}), right-click an existing group.
1. Click **Add Group**, and then click **Parent Group** or **Child Group** depending on your needs. The **Table Group** dialog box opens.
1. In the **Group by** section, click **New**.
1. Enter an expression for the grouping criteria (for example, `= Fields.Category`).
1. Select the **Add Header** checkbox.
1. Select the **Repeat On Every Page** checkbox to repeat the header on each page.
1. Click **OK**.

The group is added with a header that will repeat on every page where the group data appears.

### Step 2: Configure the Group Header Content

1. Locate a TextBox in the newly created group header row.
1. Set the TextBox `Value` to display the group field (for example, `= Fields.Category`).

At this point, the header will repeat on every page, but it will show the same content each time.

### Step 3: Display Different Content for Repeated Headers

To add visual indication when the header is repeated:

1. Select the TextBox in the group header.
1. Modify the `Value` expression to:

	```
	=Fields.Category + IIf(ReportItem.IsRepeated, ".........", "")
	```

Now, the first occurrence of the header displays "Category Name", while subsequent pages display "Category Name.........".

### Alternative Approaches

Instead of dots, you can display "(continued)" text:

```
=Fields.Category + IIf(ReportItem.IsRepeated, " (continued)", "")
```

Or hide certain elements on repeated instances by setting the `Visible` property:

```
=Not ReportItem.IsRepeated
```

This hides the item when the header is repeated.

## Example Report

For a complete working example that demonstrates this functionality, download the [RepeatableTableGroupHeadersDemo.trdx](https://github.com/telerik/reporting-samples/blob/master/RepeatableTableGroupHeadersDemo/RepeatableTableGroupHeadersDemo.trdx) sample report.

## See Also

* [Adding Groups to Tables]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/grouping-data/how-to-add-groups-to-table-item-and-crosstab-item%})
* [Global Objects - ReportItem]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/global-objects%}#reportitem)
* [Table Group Dialog]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/table-group-dialog%})
