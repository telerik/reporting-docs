---
title: Show Borderrs Only Around Group in Crosstab
description: "Learn how to create a crosstab/table with borders only around the major group in Telerik Reporting.
type: how-to
page_title: Group Borders in Crosstab/Table | Telerik Reporting
slug: hide-gridlines-crosstab-table-telerik-reporting
tags: crosstab, table, gridlines, Telerik Reporting
res_type: kb
---

## Environment

| Property | Value |
|----------|-------|
| Product  | Telerik Reporting |

## Description

I want to create a crosstab/table in Telerik Reporting with no horizontal/vertical gridlines. However, I still want the horizontal line to be visible when the group changes.

## Solution

To achieve this, you can use the Style > BorderStyle property in Telerik Reporting. Follow these steps:

1. Set all border styles for the Crosstab to None initially.
2. Add a binding for the Style > BorderStyle > Top property and set it to 'Solid' conditionally when the previous grouping value differs from the current one.

Here are the expressions for the most significant two groups:

For the most significant group:

````Expression
= Previous(Fields.group0) = Fields.group0 ? "None" : "Solid"
````

If there is only one group and one 'detail', the above expression should be sufficient.

If there are more groups, the third group's expression should include conditions for the previous group as well. Here's an example:

````Expression
= (Previous(Fields.group0) = Fields.group0) Or (Previous('group1', Fields.group0) = Fields.group0) ? "None" : "Solid"
````

The least significant group is the 'detail', and its expression should include checks for the previous groups up to the second most significant one. Here's an example:

````Expression
= (Previous(Fields.group0) = Fields.group0) Or (Previous('group2', Fields.group0) = Fields.group0) Or (Previous('group1', Fields.group0) = Fields.group0) ? "None" : "Solid"
````

If there are more grouping levels, the expressions should evolve accordingly by adding a new check for the least significant (inner) groups.

Please let us know if you have any further questions.
