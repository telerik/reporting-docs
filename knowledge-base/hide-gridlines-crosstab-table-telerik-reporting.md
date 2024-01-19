---
title: Show Borders Only Around A Group in Crosstab
description: "Learn how to create a crosstab/table with borders only around the major group in Telerik Reporting."
type: how-to
page_title: Group Borders in Crosstab/Table | Telerik Reporting
slug: hide-gridlines-crosstab-table-telerik-reporting
tags: crosstab, table, gridlines, Telerik Reporting
ticketid: 1636931
res_type: kb
---

## Environment

| Property | Value |
|----------|-------|
| Product  | Telerik Reporting |

## Description

I want to create a crosstab/table in Telerik Reporting with no horizontal/vertical gridlines. However, I still want the horizontal line to be visible when the group changes.

## Solution

To achieve this, you can use the `Style` > `BorderStyle` property in Telerik Reporting. Follow these steps:

* Set all border styles for the Crosstab __cells__ to `None`. Keep the Crosstab item borders with the default `Solid` style to get the borders around the entire Crosstab.
* Add a [Binding]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/using-expressions/bindings%}) for the `Style` > `BorderStyle` > `Top` property and set it to `Solid` conditionally when the previous grouping value differs from the current one.

The next sections discuss the particular Binding Expression for the top border style based on the scenario.

### One Table Group

Let's start with the simplest case when there is only one group in the crosstab/table. Remember that each data item has also a 'detail' group that is instantiated for each data record. That said, in this case, we have two groups. Here is the expression that may be used in both group cells to set the border:

````Expression
= Previous(Fields.group) = Fields.group ?
	"None" : "Solid"
````

The field 'group' is the grouping field in the crosstab/table DataSource.

The case is demonstrated in the sample report [OneGroup.trdx](https://github.com/telerik/reporting-samples/blob/master/Sample%20Reports/TableGroupBorders/OneGroup.trdx)

### Two or More Table Groups

If there are more groups, you may use the above Expression for the two most significant (parent) groups. Replace the 'group' field with the field used for the highest-level grouping. In the context of the linked examples, these are:

* The field 'group1' in the sample report [TwoGroups.trdx](https://github.com/telerik/reporting-samples/blob/master/Sample%20Reports/TableGroupBorders/TwoGroups.trdx)
* The field 'group0' in the sample report [ThreeGroups.trdx](https://github.com/telerik/reporting-samples/blob/master/Sample%20Reports/TableGroupBorders/ThreeGroups.trdx)

The third group's expression should include conditions for the previous group as well. Here's an example from the sample report 'ThreeGroups.trdx':

````Expression
= (Previous(Fields.group0) = Fields.group0) Or
  (Previous('group1', Fields.group0) = Fields.group0) ?
	"None" : "Solid"
````

The least significant group is the 'detail', and its expression should include checks for the previous groups up to the second most significant one. Here's an example:

````Expression
= (Previous(Fields.group0) = Fields.group0) Or
  (Previous('group2', Fields.group0) = Fields.group0) Or
  (Previous('group1', Fields.group0) = Fields.group0) ?
	"None" : "Solid"
````

If there are more grouping levels, the expressions should evolve accordingly by adding a new check for the less significant (inner) groups.

### Multiple Page Table

When a table group wraps on the next page, there will be a break in the borders with the above solution.

The next steps let you keep each group on the same page when the table occupies more than one page:

* Set `GroupKeepTogether` to `True` for the major group. This will let the page break occur after the last group that may entirely fit on the page.
* Set all Table item borders `Border Style` to `None`. This will remove the extra border lines that extend to the end of the page. It will also remove the Table's top, left, and right borders that we need.
* Add the Top Border to the cells of the Table Header row to recover the Table's top border.
* Set the right-most cells' `Right Border Style` to `Solid` so that the Table has its right borders.
* Set the left-most cells' `Left Border Style` to `Solid` so that the Table has its left borders.
* The above steps let each group be rendered together on the same page and have proper borders, excluding the last one on the page. We need also to add a bottom border to the last group.

One easy approach is through the following steps that are implemented in the sample report [ThreeGroupsPageBreak.trdx](https://github.com/telerik/reporting-samples/blob/master/Sample%20Reports/TableGroupBorders/ThreeGroupsPageBreak.trdx):

* Right-click on the last table row and select 'Insert Row > Below'.
* Select the cells of the new row and set all outer borders to `Solid`, and all the others to `None`.
* Minimize the new row's height as it will be used only to display borders and won't show any data.
* The above will result in a small space below each group, as the table row has a minimal allowed height.

An alternative workaround for the bottom table border when wrapping the table on a new page would be to use the `Last` [aggregate function](slug telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/functions/aggregate-functions) in the Binding for setting the Border Style. If the current value is equal to the Last for the group, we may draw the bottom border. This will work only if there is a data field with unique values. Otherwise, the comparison with the Last value may return True for some of the inner records and draw an unwanted border in the middle of the group.

## Sample Reports

* [OneGroup.trdx](https://github.com/telerik/reporting-samples/blob/master/Sample%20Reports/TableGroupBorders/OneGroup.trdx)
* [TwoGroups.trdx](https://github.com/telerik/reporting-samples/blob/master/Sample%20Reports/TableGroupBorders/TwoGroups.trdx)
* [ThreeGroups.trdx](https://github.com/telerik/reporting-samples/blob/master/Sample%20Reports/TableGroupBorders/ThreeGroups.trdx)
* [ThreeGroupsPageBreak.trdx](https://github.com/telerik/reporting-samples/blob/master/Sample%20Reports/TableGroupBorders/ThreeGroupsPageBreak.trdx)

## See Also

* [Data Functions]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/functions/data-functions%})
* [Styling Report Items]({%slug telerikreporting/designing-reports/styling-reports/styling-report-items%})
