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
>tip The **Repeat On Every Page** functionality for group headers and footers was introduced in version `20.0.26.211`.
1. Click **OK**.

The group is added to the [Group Explorer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/group-explorer%}) hierarchy, and the corresponding rows or columns are added to the data item on the design surface.

>tip When using **Repeat On Every Page**, you can display different content for repeated instances of the header or footer. Use the [`ReportItem.IsRepeated`]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/global-objects%}#reportitem) property in expressions to conditionally modify the displayed content, for example, appending "(continued)" text. For more details, see [Display Continued Text for Repeated Table Group Headers]({%slug display-different-content-for-repeated-table-group-headers%}).

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
>tip The **Repeat On Every Page** functionality for group headers and footers was introduced in version `20.0.26.211`.
1. Click **OK**.

The group is added to the [Group Explorer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/group-explorer%}) at the specified position, and the corresponding rows or columns are added to the data item on the design surface.

>tip When using **Repeat On Every Page**, you can display different content for repeated instances of the header or footer. Use the [`ReportItem.IsRepeated`]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/global-objects%}#reportitem) property in expressions to conditionally modify the displayed content, for example, appending "(continued)" text. For more details, see [Display Continued Text for Repeated Table Group Headers]({%slug display-different-content-for-repeated-table-group-headers%}).

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
	+ **PrintOnEveryPage**&mdash;Controls whether the corresponding header or footer row/column repeats on every page. This property is respected only on static groups. See [Edit the Repeat On Every Page Behavior](#edit-the-repeat-on-every-page-behavior) for details.
	+ **Visible**&mdash;Control the visibility of the group.
	+ **Filters**&mdash;Click the ellipsis to configure filters. Click **New** to add a filter, then specify the **Expression**, **Operator**, and **Value**.
	+ **Groupings**&mdash;Click the ellipsis to add or modify grouping expressions. Click **New** to add additional expressions. All expressions are combined using a logical AND.
	+ **Sortings**&mdash;Click the ellipsis to configure sort order. Click **New** to add a sort expression, then choose **ASC** (ascending) or **DESC** (descending) from the **Direction** drop-down list.
	+ **BookmarkId**&mdash;Set a bookmark identifier for this group.
	+ **DocumentMapText**&mdash;Specify the text to display in the document map for this group.
	+ **TocText**&mdash;Specify the text to display in the table of contents for this group.
	+ **Name**&mdash;Enter the name of the group.

1. Click **OK**.

### Edit the Repeat On Every Page Behavior

When you enable **Repeat On Every Page** for a header and/or footer while creating a [dynamic group]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/grouping-data/overview%}) in the [Table Group Dialog]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/table-group-dialog%}), the designer sets the `PrintOnEveryPage` property to `True` on the corresponding [static group]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/grouping-data/overview%}). Static groups have no grouping expressions&mdash;they represent fixed structural rows or columns that serve as group headers and footers.

To change the repeat behavior after group creation:

1. Select the Table, Crosstab, or List item on the design surface.
1. In the [Group Explorer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/group-explorer%}), switch to **Extended Mode**. Static groups are hidden in the default Standard Mode.

	![A screenshot of the Group Explorer of the Standalone Report Designer, highlighting the Extended Mode option.](images/extended-mode-group-explorer.png)

1. Locate the leaf static group that represents the header or footer you want to modify. Static groups appear with a distinct icon and gray text.

	Each dynamic group owns its header as the **first child** static group and its footer as the **last child** static group. However, when groups are nested, outer dynamic groups produce a chain of static groups rather than a single one: there is a non-leaf static group at the outer level wrapping a leaf at the inner level. `PrintOnEveryPage` is only respected on the **leaf** at the end of that chain.

	To find the correct leaf: start from the dynamic group whose header or footer you want to change → select its first child (header) or last child (footer) static group → keep following the child chain until you reach one with no children. That is the leaf to edit.

	For example, the sample report [`RepeatableTableGroupHeadersFootersDemo.trdx`](https://github.com/telerik/reporting-samples/blob/master/RepeatableTableGroupHeadersFootersDemo/RepeatableTableGroupHeadersFootersDemo.trdx) has a *productCategory* group containing a nested *productSubCategory* group. The resulting row group hierarchy in Extended Mode is:

	```
	productCategory (dynamic)
	├── group1 (static, non-leaf)          ← Category header chain start
	│   └── group2 (static, leaf) ✔        ← set PrintOnEveryPage here for Category header
	├── productSubCategory (dynamic)
	│   ├── group (static, leaf) ✔          ← set PrintOnEveryPage here for Subcategory header
	│   ├── detail
	│   └── group3 (static, leaf) ✔         ← set PrintOnEveryPage here for Subcategory footer
	└── group4 (static, non-leaf)          ← Category footer chain start
	    └── group5 (static, leaf) ✔         ← set PrintOnEveryPage here for Category footer
	```

	The outer *productCategory* header and footer each have a two-level static chain (`group1→group2` and `group4→group5`), while the inner *productSubCategory* header and footer are direct leaf children.

	The screenshot below shows this hierarchy in the Group Explorer alongside the corresponding table rows on the design surface:

	![A screenshot of the Group Explorer of the Standalone Report Designer in Extended Mode, and a table selected in the design view.](images/extended-mode-group-explorer-table.png)

1. Double-click the leaf static group to open the **Group Properties** editor.
1. Set `PrintOnEveryPage` to `True` to repeat the header/footer on every page, or `False` to disable repeating.
1. Click **OK**.

>tip To control the content displayed in repeated headers or footers, use the [`ReportItem.IsRepeated`]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/global-objects%}#reportitem) property in expressions. For example, you can append "(continued)" text to repeated headers. See [Display Continued Text for Repeated Table Group Headers]({%slug display-different-content-for-repeated-table-group-headers%}).

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
* [Grouping Data Overview]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/grouping-data/overview%})
* [Display Continued Text for Repeated Table Group Headers]({%slug display-different-content-for-repeated-table-group-headers%})
* [ColumnGroups](/api/Telerik.Reporting.Table#Telerik_Reporting_Table_ColumnGroups)
* [RowGroups](/api/Telerik.Reporting.Table#Telerik_Reporting_Table_RowGroups)
