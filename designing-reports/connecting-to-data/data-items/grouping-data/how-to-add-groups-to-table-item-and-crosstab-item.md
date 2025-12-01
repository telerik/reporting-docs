---
title: Table and Crosstab Groups
page_title: Table and Crosstab Groups at a Glance
description: "Learn how to Add, Edit, Filter and Remove different types of Table Groups in Telerik Reporting with the Report Designers and programmatically."
slug: telerikreporting/designing-reports/connecting-to-data/data-items/grouping-data/how-to-add-groups-to-table-item-and-crosstab-item
tags: how,to,add,groups,to,table,item,and,crosstab,item
published: True
position: 3
previous_url: /data-items-how-to-add-groups-to-table-item-and-crosstab-item
reportingArea: General
---

# Adding Groups to Table and Crosstab Items

Add groups to a data item when you want to display your data in a visual hierarchy, align multiple data items to show different views of the same data, or to calculate totals.

You can create both nested groups and adjacent groups. Within a data item, you can create multiple row groups and column groups.

Typically, you define groups automatically as you work with data regions. However, you can add your own groups. The process of adding groups varies based on the type of data region. In a Table, Crosstab or List items, drag data source fields to the Row/Column Fields area. Right-click an existing group to add parent, child or adjacent groups. By definition, the details group is the innermost group and can only be added as a child group. Right-click an existing group to delete it. Rows and columns on which to display group values are automatically added for you. For more information, see [Working with Table]({%slug telerikreporting/designing-reports/report-structure/table-crosstab-list/overview%}) article.

## Add a parent or child row/column group to a Table data item using Report Designer

1. Drag a data source field from the [Data Explorer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/data-explorer%})
1. Drop the field above or below the group hierarchy using the guide bar to place the group as a parent group or a child group to an existing group.

The group is added with a default name, group expression, and sort expression that is based on the field name.

## Add an adjacent row/column group to a Table data item

1. In the [Group Explorer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/group-explorer%}) group pane, right-click a group that is a peer to the group that you want to add. Click Add Group, and then click __Adjacent Before__ or __Adjacent After__ to specify where to add the group. The __Table Group__ dialog box opens.
1. Click __New__ button.
1. In the group expression, type an expression, select a data source field or create a new expression. The group is added with a default name __RowGroup__ or __ColumnGroup__ respectively.
1. Click __OK__.
1. Right-click the group, and then click __Group Properties__.
1. In __Name__, type the name of the group.
1. In __Grouping property__, type or select a simple expression, or click the `<Expression>` option to create a new group expression.
1. Click __New__ to create additional expressions. All expressions you specify are combined using a logical AND to specify data for this group.
1. To apply sorting to the group, follow these steps:

	+ Click the Sorting ellipsis.
	+ Click New.
	+ Type or select an expression by which to sort the data.
	+ From the Direction column drop-down list, choose the sort direction for each expression. ASC sorts the expression in ascending order. DESC sorts the expression in descending order.

1. To apply filtering to the group, follow these steps:

	+ Click the Filters ellipsis.
	+ Click New.
	+ In __Expression__, type or select the expression for the field to filter. To open the __Edit Expression__ Dialog, select the `<Expression>` option.
	+ In the __Operator__ box, select the operator that you want the filter to use to compare the values in the Expression box and the Value box.
	+ In the __Value__ box, type the expression or value against which you want the filter to evaluate the value in Expression.

1. Click __GroupKeepTogether__ to specify the keep together options.
1. Click __BookMarkID__ to set a BookMark for this group.
1. Click __OK__.

A new group is added to the grouping pane in the [Group Explorer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/group-explorer%}) and a row or column on which to display group values is added to the Table data item on the design surface.

## Add a details group to a Table data item using Report Designer

1. In the [Group Explorer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/group-explorer%}) group pane, right-click a group that is the innermost child group. Click Add Group, and then click Child Group. The __Table Group__ dialog box opens.
1. Leave the expression blank - a details group has no expression.
1. Select __Show detail data__.
1. Click __OK__.
1. Right-click the group, and then click __Group Properties__.
1. In __Name__, type the name of the group.
1. In __Grouping property__, type or select a simple expression, or click the `<Expression>` option to create a new group expression.
1. Click __New__ to create additional expressions. All expressions you specify are combined using a logical AND to specify data for this group.
1. To apply sorting to the group, follow these steps:

	+ Click the Sorting ellipsis.
	+ Click New.
	+ Type or select an expression by which to sort the data.
	+ From the Direction column drop-down list, choose the sort direction for each expression. ASC sorts the expression in ascending order. DESC sorts the expression in descending order.

1. To apply filtering to the group, follow these steps:

	+ Click the Filters ellipsis.
	+ Click New.
	+ In __Expression__, type or select the expression for the field to filter. To open the __Edit Expression__ Dialog, select the `<Expression>` option.
	+ In the __Operator__ box, select the operator that you want the filter to use to compare the values in the Expression box and the Value box.
	+ In the __Value__ box, type the expression or value against which you want the filter to evaluate the value in Expression.

1. Click __GroupKeepTogether__ to specify the keep together options.
1. Click __BookMarkID__ to set a BookMark for this group.
1. Click __OK__.

A new details group is added as a child group in the Grouping pane in the [Group Explorer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/group-explorer%}), and the new group displays the details group icon.

## Edit a row or column group in a Table data item using Report Designer

1. In the __Report Designer__, select the Table data item. The Grouping pane in the [Group Explorer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/group-explorer%}) displays the row and column groups.
1. Right-click the group, and then click __Group Properties__.
1. In __Name__, type the name of the group.
1. In __Grouping property__, type or select a simple expression, or click the `<Expression>` option to create a new group expression.
1. Click __New__ to create additional expressions. All expressions you specify are combined using a logical AND to specify data for this group.
1. To apply sorting to the group, follow these steps:

	+ Click the Sorting ellipsis.
	+ Click New.
	+ Type or select an expression by which to sort the data.
	+ From the Direction column drop-down list, choose the sort direction for each expression. ASC sorts the expression in ascending order. DESC sorts the expression in descending order.

1. To apply filtering to the group, follow these steps:

	+ Click the Filters ellipsis.
	+ Click New.
	+ In __Expression__, type or select the expression for the field to filter. To open the __Edit Expression__ Dialog, select the `<Expression>` option.
	+ In the __Operator__ box, select the operator that you want the filter to use to compare the values in the Expression box and the Value box.
	+ In the __Value__ box, type the expression or value against which you want the filter to evaluate the value in Expression.

1. Click __GroupKeepTogether__ to specify the keep together options.
1. Click __BookMarkID__ to set a BookMark for this group.
1. Click __OK__.

## Delete a group from a Table data item using Report Designer

1. In the [Group Explorer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/group-explorer%}) group pane, right-click the group, and then click __Delete Group__.
1. In the __Delete Group__ dialog box, select one of the following options:

	+ __Delete group and related rows and columns__ Choose this option to delete the group definition and all related rows that display group data. For the details group, if the same row belongs to both detail and group data, only the detail data rows are deleted.
	+ __Delete group only__ Choose this option to keep the structure of the Table data item the same and delete only the group definition.

1. Click __OK__.

## Adding a group to Table data item programatically

{{source=CodeSnippets\CS\API\Telerik\Reporting\TableSnippets.cs region=AddNewGroupSnippet}}
{{source=CodeSnippets\VB\API\Telerik\Reporting\TableSnippets.vb region=AddNewGroupSnippet}}

## See Also

* [Table](/api/Telerik.Reporting.Table) 
* [ColumnGroups](/api/Telerik.Reporting.Table#Telerik_Reporting_Table_ColumnGroups)
* [RowGroups](/api/Telerik.Reporting.Table#Telerik_Reporting_Table_RowGroups)
