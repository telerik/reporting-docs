---
title: Sum Distinct Values
description: "Learn how to create and use a custom aggregate function that sums the values for each distinct group."
type: how-to
page_title: Sum Group Totals For Each Unique Group
slug: sum-disctinct-group-values
tags: Expressions, Sum, Aggregate
ticketid: 1623368
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

I have data where certain groups are, unfortunately, duplicated, resulting in an incorrect total when summing all of the data. For example, the following CSV:

```
group,total
group1,10
group2,20
group2,20
group3,30
```

When I use the normal `=Sum(Fields.total)` [aggregate function]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/functions/aggregate-functions%}), the total sum ends up being 80 because it does not take into account that the second `group2` is a duplicate, and adds its total to the absolute total. How can I avoid this and get the correct total sum?

## Solution

In order to ignore any repeated group values, we need to implement a [custom aggregate function]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/extending-expressions/user-aggregate-functions%}) that keeps a list of all groups that we have already passed through so that any duplicate values are ignored. For example:

````CSharp
[AggregateFunction(Description = "Disctinct Sum Aggregate", Name = "DisctinctSumAggregate")]
class CustomSumAggregate : IAggregateFunction
{
	readonly List<string> coveredGroups = new List<string>();
	float sum;

	public void Accumulate(object[] values)
	{
		// The aggregate function expects two parameters
		object groupObj = values[0];
		object totalObj = values[1];

		// null values are not aggregated
		if (null == groupObj || null == totalObj)
		{
			return;
		}

		if(coveredGroups.IndexOf(groupObj.ToString()) == -1)
		{
			coveredGroups.Add(groupObj.ToString());

			float.TryParse(totalObj.ToString(), out float total);

			// The actual accumulation
			this.sum += total;
		}
	}

	public object GetValue()
	{
		return string.Format("{0:C}", this.sum.ToString());
	}

	public void Init() {}

	public void Merge(IAggregateFunction aggregateFunction)
	{
		CustomSumAggregate aggregate = (CustomSumAggregate)aggregateFunction;

		if (aggregate.sum > 0)
		{
			this.sum += aggregate.sum;
		}
	}
}
````

Then, in the report definition, the function may be called with the following expression: `= DisctinctSumAggregate(Fields.group, Fields.total)`.

## See Also

* [Custom User Aggregate Functions]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/extending-expressions/user-aggregate-functions%})
* [Extending Report Designer to Recognize Custom Assemblies]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/configuration/extending-report-designer%})
* [Accumulate an Expression Value from Group Total in an Overall Total]({%slug accumulate-expression-from-group-total-in-overall-total%})
