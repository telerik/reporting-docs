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
  (Previous('group1', Fields.group0) = Fields.group0)
	? "None" : "Solid"
````

If there are more grouping levels, the expressions should evolve accordingly by adding a new check for the less significant (inner) groups.

## Sample Reports

* [OneGroup.trdx](https://github.com/telerik/reporting-samples/blob/master/Sample%20Reports/TableGroupBorders/OneGroup.trdx)
* [TwoGroups.trdx](https://github.com/telerik/reporting-samples/blob/master/Sample%20Reports/TableGroupBorders/TwoGroups.trdx)
* [ThreeGroups.trdx](https://github.com/telerik/reporting-samples/blob/master/Sample%20Reports/TableGroupBorders/ThreeGroups.trdx)

## See Also

* [Data Functions]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/functions/data-functions%})
* [Styling Report Items]({%slug telerikreporting/designing-reports/styling-reports/styling-report-items%})
