---
title: Accumulate an Expression Value from Group Total in an Overall Total
description: How to calculate the overall total of an expression that represents group total
type: how-to
page_title: Form an Overall Total from a Group Total Expression
slug: accumulate-expression-from-group-total-in-overall-total
position: 
tags: 
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
Let's describe the problem with a simple scenario. Assume that you have to create a report for workers where you need to calculate the total hours per workweek for each. 
If this total is greater than 40 hrs/week, then its value becomes 40 hrs and the rest of the hours are passed as overtime hours. 
Both the total and the overtime hours for the particular group/scope can be easily calculated with an [Expression](../report-expressions).
The problem comes if you need to sum the values of the overtime total hours in the Summary of the report. That said, to create a total of the tolal overtime hours for 
all the groups.  

The most straight-forward idea would be to sum up the values in the _TextBox_ displaying the total for the group, i.e. from all instances of this _TextBox_. 
Unfortunately, by design, the value in a particular report item  cannot be accessed from another item. On the other hand, the overtime hours are not present 
in the data source and are rather calculated in an _Expression_, hence utilizing [Global Objects](../expressions-global-objects) directly is not an option. 

## Solution
You need to create a [Custom Aggregate Function](../expressions-user-aggregate-functions) that accumulates the overtime hours from the groups. 
Here is a sample implementation for the case when workers' reports are grouped by weeks:

```C#
using System;
using System.Collections.Generic;
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

Briefly, the _Accumulate_ method sums up the hours for each week in a dictionary. The _GetValue_ method checks whether the accumulated values for the week exceed 40 hrs 
and if so, returns the extra hours, i.e. the total overtime hours. The _Merge_ method would be invoked when accumulating the group totals, i.e. when aggregating 
the individual group aggregates.  
Here is how you need to call the custom aggregate in an _Expression_:
```
= TotalOvertimeHours(Fields.Week, Fields.WorkTime)
```

- The first argument is the grouping value, in the sample, this is the week number.
- The second argument is the field that we aggregate, in this case, the working hours field in the data record.

> Note that you need also to include a reference to the assembly with the custom aggregate function in the configuration file of the application 
hosting the Reporting engine. For example, for the Standalone designer you need to include the reference in its _.config_ file as explained in the
article [Extending Report Designer](https://docs.telerik.com/reporting/standalone-report-designer-extending-configuration).
