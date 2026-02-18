---
title: Table Groups
page_title: Table Groups at a Glance
description: "Learn how to add, edit, filter and remove different types of table groups in Telerik Reporting with the report designers and programmatically."
slug: telerikreporting/designing-reports/connecting-to-data/data-items/grouping-data/how-to-add-groups-to-table-item-and-crosstab-item
tags: how,to,add,groups,to,table,item,and,crosstab,item
tag: updated
published: True
position: 3
previous_url: /data-items-how-to-add-groups-to-table-item-and-crosstab-item
reportingArea: General
---

# Adding Groups to Tables

Table, Crosstab, and List items are template variations of the same Table data item and use row and column groups to organize data hierarchically. Unlike Report groups, table groups expand both horizontally (column groups) and vertically (row groups) to create flexible data layouts.

Use the [Group Explorer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/group-explorer%}) to add and manage groups in table items. You can create parent, child, adjacent, or details groups, and configure filtering, sorting, and aggregation settings for each group.

>tip The instructions in this article apply to all three template variations: Table, Crosstab, and List items.

## Add a Row/Column Group Using the Report Designer

### Add a Parent or Child Group

To add a parent or child row/column group:

1. Select the Table, Crosstab, or List item on the design surface.
1. In the [Group Explorer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/group-explorer%}), right-click an existing group.
1. Click **Add Group**, and then click **Parent Group** or **Child Group** depending on where you want to add the group. The **Table Group** dialog box opens.
1. In the **Group by** section, click the **New** button.
1. Enter an expression for the grouping criteria (for example, `= Fields.Category`).
1. (Optional) Select **Add Header** to add a group header row or column.
1. (Optional) Select **Repeat On Every Page** to repeat the header on each page.
1. (Optional) Select **Add Footer** to add a group footer row or column.
1. (Optional) Select **Repeat On Every Page** to repeat the footer on each page.
1. Click **OK**.

The group is added to the [Group Explorer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/group-explorer%}) hierarchy, and the corresponding rows or columns are added to the data item on the design surface.

### Add an Adjacent Group

To add an adjacent row/column group:

1. Select the Table, Crosstab, or List item on the design surface.
1. In the [Group Explorer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/group-explorer%}), right-click an existing group.
1. Click **Add Group**, and then click **Adjacent Above** or **Adjacent Below** to specify where to add the group. The **Table Group** dialog box opens.
1. In the **Group by** section, click the **New** button.
1. Enter an expression for the grouping criteria (for example, `= Fields.Category`).
1. (Optional) Select **Add Header** to add a group header row or column.
1. (Optional) Select **Repeat On Every Page** to repeat the header on each page.
1. (Optional) Select **Add Footer** to add a group footer row or column.
1. (Optional) Select **Repeat On Every Page** to repeat the footer on each page.
1. Click **OK**.

The group is added to the [Group Explorer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/group-explorer%}) at the specified position, and the corresponding rows or columns are added to the data item on the design surface.

>caution Repeatable headers and footers are not compatible with the `PageBreak` property. If any group in the table has a `PageBreak` value other than `None`, repeatable headers and footers will not be processed and rendered, even if `PrintOnEveryPage` is enabled.

## Add a Details Group Using the Report Designer

A details group displays individual data records without grouping. For row groups, this creates a row for each record; for column groups, this creates a column for each record.

To add a details group:

1. Select the Table, Crosstab, or List item on the design surface.
1. In the [Group Explorer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/group-explorer%}), right-click the innermost child group.
1. Click **Add Group**, and then click **Child Group**. The **Table Group** dialog box opens.
1. Select **Show detail data**.
1. Click **OK**.

The details group is added to the [Group Explorer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/group-explorer%}) and displays the details group icon. A new row (for row groups) or column (for column groups) is added to the table to display the detail data.

## Edit an Existing Group

To edit an existing group's properties, including grouping expressions, sorting, filtering, and other settings:

1. Select the Table, Crosstab, or List item on the design surface.
1. In the [Group Explorer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/group-explorer%}), right-click the group, and then click **Group Properties**.
1. Configure the group properties:

	+ **GroupKeepTogether**&mdash;Specify the keep together options to control whether group content stays together across page breaks.
	+ **PageBreak**&mdash;Specify where page breaks occur relative to the group.
	+ **PrintOnEveryPage**&mdash;For internal use only. This property is automatically set for static groups created when groups have repeatable headers or footers.
	+ **Visible**&mdash;Control the visibility of the group.
	+ **Filters**&mdash;Click the ellipsis to configure filters. Click **New** to add a filter, then specify the **Expression**, **Operator**, and **Value**.
	+ **Groupings**&mdash;Click the ellipsis to add or modify grouping expressions. Click **New** to add additional expressions. All expressions are combined using a logical AND.
	+ **Sortings**&mdash;Click the ellipsis to configure sort order. Click **New** to add a sort expression, then choose **ASC** (ascending) or **DESC** (descending) from the **Direction** drop-down list.
	+ **BookmarkId**&mdash;Set a bookmark identifier for this group.
	+ **DocumentMapText**&mdash;Specify the text to display in the document map for this group.
	+ **TocText**&mdash;Specify the text to display in the table of contents for this group.
	+ **Name**&mdash;Enter the name of the group.

1. Click **OK**.

## Delete a Group Using the Report Designer

To delete a group:

1. Select the Table, Crosstab, or List item on the design surface.
1. In the [Group Explorer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/group-explorer%}), right-click the group, and then click **Delete Group**.
1. In the **Delete Group** dialog box, select one of the following options:

	+ **Delete group and related rows and columns**&mdash;Choose this option to delete the group definition and all related rows and columns that display group data. For the details group, if the same row or column belongs to both detail and group data, only the detail data rows and columns are deleted.
	+ **Delete group only**&mdash;Choose this option to keep the structure of the data item and delete only the group definition.

1. Click **OK**.

## Add a Group Programmatically

{{source=CodeSnippets\CS\API\Telerik\Reporting\TableSnippets.cs region=AddNewGroupSnippet}}
{{source=CodeSnippets\VB\API\Telerik\Reporting\TableSnippets.vb region=AddNewGroupSnippet}}

## See Also

* [Table Group Dialog (Desktop Designers)]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/table-group-dialog%})
* [Table Group Dialog (Web Report Designer)]({%slug telerikreporting/designing-reports/report-designer-tools/web-report-designer/tools/table-group-dialog%})
* [ColumnGroups](/api/Telerik.Reporting.Table#Telerik_Reporting_Table_ColumnGroups)
* [RowGroups](/api/Telerik.Reporting.Table#Telerik_Reporting_Table_RowGroups)
