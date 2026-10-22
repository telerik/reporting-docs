---
title: Calculate an Average of Group Averages
description: "Learn how to calculate an equally weighted average of child-group averages in a parent group footer in Telerik Reporting."
type: how-to
page_title: Average Child-Group Averages in a Parent Group Footer
slug: average-of-group-averages
tags: averages, groups, aggregates
res_type: kb
---

## Environment

| Version | Product | Author | 
| ---- | ---- | ---- | 

| 20.2.26.1007 | Telerik Reporting |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description

For a report hierarchy of `G1`, `G2`, `G3`, and detail records, a `G3` footer can display `= Avg(Fields.Grade)`. To display the average of those `G3` averages in the `G2` footer, each `G3` average must contribute once, regardless of the number of detail records in that `G3` group.

## Solution

For example, one `G3` group contains a single grade of 0, and another contains three grades of 100. Their group averages are 0 and 100, so the average of the two group averages is 50. Applying `Avg(Fields.Grade)` directly in the `G2` footer instead averages the four detail grades and returns 75. That calculation weights each `G3` group by its number of non-null grades.

The built-in [aggregate functions](slug:telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/functions/aggregate-functions) define `Avg(Expression)`, not an overload that accepts a group name as a second argument. Directly nesting aggregate functions is not supported.

The [Exec data scope function](slug:telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/functions/data-functions#data-scope-related-functions) can evaluate an expression in an enclosing scope. It cannot collect descendant `G3` footer values from a `G2` footer. Wrapping `Exec` in `Avg` with another `Avg` inside the `Exec` expression does not bypass the restriction on nested aggregates.

To implement an average of child-group averages, adapt the keyed custom aggregate pattern in [Accumulate an Expression Value from Group Total in an Overall Total](slug:accumulate-expression-from-group-total-in-overall-total):

1. Evaluate the custom aggregate in the `G2` footer using the `G3` grouping key and the detail grade as inputs. Use all grouping fields needed to identify each `G3` group within `G2`.
2. In `Accumulate`, maintain a sum and a count of non-null grades for each `G3` key.
3. In `Merge`, combine the sums and counts for matching keys. Do not average partial averages, as that can give unequal weights to subsets of the same group.
4. In `GetValue`, calculate each contributing `G3` group's mean from its sum and count, then average those means with equal weight. Keep the calculation scoped to the current `G2` group.

Define how `G3` groups with no non-null grades contribute to the result before implementing this adaptation. The linked overtime implementation is not a grade-averaging helper. Validate the adapted aggregate with unequal group sizes and with separate `G2` groups before using it in a report.

## See Also

* [Custom User Aggregate Functions](slug:telerikreporting/designing-reports/connecting-to-data/expressions/extending-expressions/user-aggregate-functions)
* [Expression Scope](slug:telerikreporting/designing-reports/connecting-to-data/expressions/expression-scope)