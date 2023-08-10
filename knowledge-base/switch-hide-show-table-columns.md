---
title: Create a Report in which the User May Switch and Hide/Show Table Columns Dynamically
description: "Learn how to create a report where the user may switch, hide and show the table columns dynamically, based on report parameters."
type: how-to
page_title: Switch and Hide Table Columns Dynamically
slug: switch-hide-show-table-columns
tags: table,columns,switch,hide,show,navigate,report,action,parameter
ticketid: 1619430
res_type: kb
---

## Environment

<table>
	<tbody>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
		</tr>
	</tbody>
</table>


## Description


## Solution

I have attached a sample report that demonstrates one of the possible approaches. All the required functionality is inside the report definition. Let me explain the idea.

I introduced 5 parameters in the report, which correspond to the columns in the table. Each parameter takes the name of one of the columns. The first parameter holds the name of the first column, the second parameter - the name of the second column, etc.

In the table, the first column header is the value of the first parameter, and so on. The value of the detail row in the first column is set with the Expression:

`= Fields(Parameters.Column1.Value)`

Note that the above expression utilizes the Report Functions Fields with an argument the first parameter value.

You may switch/hide/show the table columns directly, with the Report Parameters by selecting a column name for the corresponding position.

You may also use arrows with Navigate to Report action to render the same report with reordered parameters. It simulates switching columns.

## Sample

You may find the example in our reporting-samples GitHub repository - [SwitchAndHideTableColumns.trdx](https://github.com/telerik/reporting-samples/blob/master/Sample%20Reports/SwitchAndHideTableColumns.trdx).

## See Also

* [How to add multiple tables dynamically based on the data source]({%slug how-to-add-multiple-tables-dynamically-based-on-data-source%})
* [How to Create a Dynamic Table, Crosstab, or List Item]({%slug how-to-create-a-dynamic-table-crosstab-list-item%})
* [Modify Table with Preset Styles and Width Dynamically]({%slug how-to-modify-table-with-preset-styles-and-width-dynamically%})
