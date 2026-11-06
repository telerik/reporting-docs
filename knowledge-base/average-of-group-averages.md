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

For example, one `G3` group contains a single grade of 0, and another contains three grades of 100. Their group averages are 0 and 100, so the average of the two group averages is 50. Applying `Avg(Fields.Grade)` directly in the `G2` footer instead averages the four detail grades and returns 75. That calculation weights each `G3` group by its number of non-null grades.

The built-in [aggregate functions](slug:telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/functions/aggregate-functions) define `Avg(Expression)`, not an overload that accepts a group name as a second argument. Directly nesting aggregate functions is not supported.

The [Exec data scope function](slug:telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/functions/data-functions#data-scope-related-functions) can evaluate an expression in an enclosing scope. It cannot collect descendant `G3` footer values from a `G2` footer. Wrapping `Exec` in `Avg` with another `Avg` inside the `Exec` expression does not bypass the restriction on nested aggregates.

## Solution

To implement an average of child-group averages, adapt the keyed custom aggregate pattern in [Accumulate an Expression Value from Group Total in an Overall Total](slug:accumulate-expression-from-group-total-in-overall-total):

**Sample Aggregate Function for Averages:**

```C#
using System;
using System.Collections;
using System.Collections.Generic;
using System.Globalization;
using Telerik.Reporting.Expressions;

namespace CustomAggregates
{
    [AggregateFunction(
        Name = "AverageOfGroupAverages",
        Description = "Equally weighted average of group averages. Arguments: grouping key field(s), numeric value.")]
    public class AverageOfGroupAverages : IAggregateFunction
    {
        private Dictionary<object[], GroupStatistics> valuesByGroup;

        public void Accumulate(object[] values)
        {
            if (values == null || values.Length < 2)
            {
                throw new ArgumentException("Provide at least one grouping key and a numeric value.", nameof(values));
            }

            var value = values[values.Length - 1];
            if (value == null || value == DBNull.Value)
            {
                return;
            }

            var numericValue = Convert.ToDecimal(value, CultureInfo.InvariantCulture);
            var groupKey = new object[values.Length - 1];
            for (var index = 0; index < groupKey.Length; index++)
            {
                groupKey[index] = values[index] == DBNull.Value ? null : values[index];
            }

            this.AddGroupValues(groupKey, numericValue, 1);
        }

        public object GetValue()
        {
            if (this.valuesByGroup.Count == 0)
            {
                return null;
            }

            decimal sumOfAverages = 0;
            foreach (var group in this.valuesByGroup.Values)
            {
                sumOfAverages += group.Sum / group.Count;
            }

            return sumOfAverages / this.valuesByGroup.Count;
        }

        public void Init()
        {
            this.valuesByGroup = new Dictionary<object[], GroupStatistics>(new GroupKeyComparer());
        }

        public void Merge(IAggregateFunction aggregateFunction)
        {
            var otherAggregateFunction = (AverageOfGroupAverages)aggregateFunction;
            foreach (var pair in otherAggregateFunction.valuesByGroup)
            {
                this.AddGroupValues(pair.Key, pair.Value.Sum, pair.Value.Count);
            }
        }

        private void AddGroupValues(object[] groupKey, decimal sum, long count)
        {
            GroupStatistics group;
            if (!this.valuesByGroup.TryGetValue(groupKey, out group))
            {
                group = new GroupStatistics();
                this.valuesByGroup.Add(groupKey, group);
            }

            group.Sum += sum;
            group.Count += count;
        }

        private sealed class GroupStatistics
        {
            public decimal Sum { get; set; }

            public long Count { get; set; }
        }

        private sealed class GroupKeyComparer : IEqualityComparer<object[]>
        {
            public bool Equals(object[] first, object[] second)
            {
                return StructuralComparisons.StructuralEqualityComparer.Equals(first, second);
            }

            public int GetHashCode(object[] groupKey)
            {
                return StructuralComparisons.StructuralEqualityComparer.GetHashCode(groupKey);
            }
        }
    }
}
```

For a report hierarchy of G1, G2, G3, and detail records, use this expression in the **G2 group footer** to average its child G3 averages with equal weight:

```text
= AverageOfGroupAverages(Fields.G3Key, Fields.Grade)
```

Replace `G3Key` with the field that identifies each G3 group within G2. If G3 is grouped by multiple fields, pass all of them before the detail value:

```text
= AverageOfGroupAverages(Fields.Subject, Fields.Class, Fields.Grade)
```

The last argument is always the detail numeric value, not `Avg(Fields.Grade)` or the value of a group-footer TextBox. The footer's data scope determines which parent group's records contribute; keep the expression scoped to G2.

`Accumulate` tracks each key's sum and count. `Merge` combines these statistics for matching keys, rather than averaging partial averages. `GetValue` averages the resulting group means, counting each contributing group once. 

For example, a group containing `0` and another containing `100, 100, 100` produce `50`, not the detail-row average of `75`. Numeric values are converted to `decimal`, and the result is a `decimal`. Groups with no non-null values are excluded, and an empty or all-null scope returns `null`. Null and `DBNull` grouping keys are treated as the same key.

## See Also

* [Custom User Aggregate Functions](slug:telerikreporting/designing-reports/connecting-to-data/expressions/extending-expressions/user-aggregate-functions)
* [Expression Scope](slug:telerikreporting/designing-reports/connecting-to-data/expressions/expression-scope)
