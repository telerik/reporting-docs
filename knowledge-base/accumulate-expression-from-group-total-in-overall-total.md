---
title: Accumulate an Expression Value from Group Total in an Overall Total
description: "Learn how to calculate the overall total of an expression that represents group total in Telerik Reporting."
type: how-to
page_title: Form an Overall Total from a Group Total Expression
slug: accumulate-expression-from-group-total-in-overall-total
tags: telerik, reporting, accumulate, expression, value, from, group, total, in, overall, total
ticketid: 1528624
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

Assume that you have to create a report for workers where you need to calculate the total hours per workweek for each. If this total is greater than 40 hrs/week, then its value becomes 40 hrs and the rest of the hours are passed as overtime hours. You can calculate both the total and the overtime hours for the particular group or scope with an [Expression]({% slug telerikreporting/designing-reports/connecting-to-data/expressions/overview %}).

However, you may encounter a problem if you need to sum the values of the overtime total hours in the Summary of the report. That said, to create a total of the total overtime hours for
all the groups.

The most straightforward solution is to sum up the values in the `TextBox` displaying the total for the group, that is, from all instances of this `TextBox`. Unfortunately, by design, the value in a particular report item cannot be accessed from another item. On the other hand, the overtime hours are not present in the data source and are calculated in an `Expression`. Hence, directly utilizing [Global Objects]({% slug telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/global-objects %}) is not an option.

## Solution

To solve the issue, create a [Custom Aggregate Function]({% slug telerikreporting/designing-reports/connecting-to-data/expressions/extending-expressions/user-aggregate-functions %}) that accumulates the overtime hours from the groups.

The following example demonstrates a sample implementation for the case when workers' reports are grouped by weeks:

```C#
using System.Collections.Generic;
using System;
using Telerik.Reporting.Expressions;

namespace CustomAggregates
{
    public class TotalOvertimeHours : IAggregateFunction
    {
        private Dictionary<long, TimeSpan> workTimeByWeek;

        public void Accumulate(object[] values)
        {
            var week = (long)values[0];
            var workTime = (TimeSpan)values[1];

            TimeSpan weekWorkTime;
            if (!this.workTimeByWeek.TryGetValue(week, out weekWorkTime))
            {
                this.workTimeByWeek.Add(week, workTime);
            }
            else
            {
                this.workTimeByWeek[week] = weekWorkTime + workTime;
            }
        }

        public object GetValue()
        {
            TimeSpan regularWorkHoursPerWeek = new TimeSpan(40, 0, 0);
            TimeSpan result = new TimeSpan();
            foreach (var value in this.workTimeByWeek.Values)
            {
                if (value > regularWorkHoursPerWeek)
                {
                    result += value - regularWorkHoursPerWeek;
                }
            }

            return result;
        }

        public void Init()
        {
            this.workTimeByWeek = new Dictionary<long, TimeSpan>();
        }

        public void Merge(IAggregateFunction aggregateFunction)
        {
            var otherAggregateFunction = (TotalOvertimeHours)aggregateFunction;
            foreach (var pair in otherAggregateFunction.workTimeByWeek)
            {
                TimeSpan weekWorkTime;
                if (!this.workTimeByWeek.TryGetValue(pair.Key, out weekWorkTime))
                {
                    this.workTimeByWeek.Add(pair.Key, pair.Value);
                }
                else
                {
                    this.workTimeByWeek[pair.Key] = weekWorkTime + pair.Value;
                }
            }
        }
    }
}
```

In the example above, the `Accumulate` method sums up the hours for each week in a dictionary. The `GetValue` method checks whether the accumulated values for the week exceed 40 hrs and if so, returns the extra hours, that is, the total overtime hours. The `Merge` method will be invoked when accumulating the group totals, that is, when aggregating the individual group aggregates.  

The following snippet, demonstrates how to call the custom aggregate in an `Expression`.

```
= TotalOvertimeHours(Fields.Week, Fields.WorkTime)
```

- The first argument is the grouping value. In the sample, the argument is the week number.
- The second argument is the field that we aggregate, in this case, the working hours field in the data record.

Note that you also need to include a reference to the assembly with the custom aggregate function in the configuration file of the application that hosts the Reporting engine. For example, for the Standalone designer, you need to include the reference in its `.config` file as explained in the
article on [extending the report designer]({% slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/configuration/extending-report-designer %}).

## See Also

* [Custom User Aggregate Functions]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/extending-expressions/user-aggregate-functions%})
* [Extending Report Designer to Recognize Custom Assemblies]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/configuration/extending-report-designer%})
* [Sum Distinct Values]({%slug sum-disctinct-group-values%})
