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

A common requirement is to be able to switch the order of table columns, or to be able to hide/show them based on user choice.

In this article we will demonstate how you may achieve this functionality entirely inside the report definition.

## Solution

### Basic Approach with Report Parameters

Let's [introduce a new Report Parameter]({%slug telerikreporting/designing-reports/connecting-to-data/report-parameters/how-to-add-report-parameters%}) for each table column. Each parameter will hold the name of one of the table columns. The first parameter will hold the name of the first column, the second parameter - the name of the second column, etc. That said, the Report Parameters will set the order of the table columns. Let's name the parameters `Column1`, `Column2`, etc.

We will use a [CsvDataSource]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/csvdatasource-component/overview%}) to set the `AvailableValues` of the parameters. It will have a single column with table column names.

Let's also make the parameters `Nullable`. This will let us hide the corresponding column when the parameter that represents it is Null.

In the table, the first column header is the value of the first parameter `= Parameters.Column1.Value`, the second column header is the value of the second parameter `= Parameters.Column2.Value`and so on

Correspondingly, the value of the detail row in the first column is set with the [Expression]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/overview%}) `= Fields(Parameters.Column1.Value)`, for the second column of the detail row  `= Fields(Parameters.Column2.Value)`, etc. Note that the expressions utilize the [Report Functions]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/functions/report-functions%}) `Fields(name)` with an argument the corresponding parameter value. This is equivallent to `=Fields.[ColumnName]`.

To hide/show the table column, we may introduce a [Conditional Formatting]({%slug telerikreporting/designing-reports/styling-reports/conditional-formatting%}) or [Binding]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/using-expressions/bindings%}) for the `Visible` property of the columns. The corresponding Expression should check whether the corresponding parameter is Null, for example the Conditional Formatting Filtering Rule may have as _Expression_ `= Parameters.Column5.Value; _Operator_ `<>` and _Value_ `Null`.

The above setting will let the user switch/hide/show the table columns directly, with the Report Parameters by selecting a column name for the corresponding position.

### Enhancing the Report UI with Navigate to Report Actions

Lets try to improve the User Experienc by adding arrows in the columns that will let us move the column to the right or to the left.

We need to replace the TextBoxes in the table headers with [Panels]({%slug telerikreporting/designing-reports/report-structure/panel%}) that may host multiple report items. More specifically, we need a TextBox with the column name, and one or two arrows to move the column to the right/left.

We will use [Shapes]({%slug telerikreporting/designing-reports/report-structure/shape%}) for the arrows and will set their `Action` property to [Navigate to Report action]({%slug telerikreporting/designing-reports/adding-interactivity-to-reports/actions/drillthrough-report-action%}). The idea is to render the same report with reordered parameters, which will simulate switching table columns order. For that reason, we set the `URI` of the action's `ReportSource` to the same report file, and in the `Parameters` collection add the same parameter values, with two neighbour values switched, so that the report gets rendered with switched table columns.

For example, the third column right arrow should make the currently third column fourth, and vice versa, hence we need to set the `ReportSource.Parameters` as follows:

* (preserved) ReportSource parameter `Column1` to have the value `= Parameters.Column1.Value`
* (preserved) ReportSource parameter `Column2` to have the value `= Parameters.Column2.Value`
* (switched) ReportSource parameter `Column3` to have the value `= Parameters.Column4.Value`
* (switched) ReportSource parameter `Column4` to have the value `= Parameters.Column3.Value`
* (preserved) ReportSource parameter `Column5` to have the value `= Parameters.Column5.Value`

## Sample

You may find the example in our reporting-samples GitHub repository - [SwitchAndHideTableColumns.trdx](https://github.com/telerik/reporting-samples/blob/master/Sample%20Reports/SwitchAndHideTableColumns.trdx).

## See Also

* [How to add multiple tables dynamically based on the data source]({%slug how-to-add-multiple-tables-dynamically-based-on-data-source%})
* [How to Create a Dynamic Table, Crosstab, or List Item]({%slug how-to-create-a-dynamic-table-crosstab-list-item%})
* [Modify Table with Preset Styles and Width Dynamically]({%slug how-to-modify-table-with-preset-styles-and-width-dynamically%})
