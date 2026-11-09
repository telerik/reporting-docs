---
title: How to Create a "Summary Per Page" When a Group is Printed on Multiple Pages
description: Learn how to display running group totals in Telerik Reporting page headers and footers when a group spans multiple report pages.
type: how-to
page_title: Creating a "Summary Per Page" When a Group is Printed on More Than One Page
slug: summary-per-page-when-group-is-on-multiple-pages
position:
tags:
ticketid: 1513116
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

When a report lists account movements, one account can span multiple printed pages. You can display the running credit and debit totals in the page header and footer to help readers follow the account across pages.

The totals appear only when the account continues from the previous page or onto the next page.

## Solution

The following two [custom user aggregate functions](slug:telerikreporting/designing-reports/connecting-to-data/expressions/extending-expressions/user-aggregate-functions) implement this behavior.

The aggregate instances use static fields to preserve data across pages. The fields use `ThreadStatic` so simultaneous report renderings, such as those in a web application, do not share state across threads.

The examples assume that `Fields.account` is a string and `Fields.value` is a decimal. Replace the section names and fields with the names used in your report.

The first aggregate is for the page footer:

```C#
[AggregateFunction(Description = "Special sum aggregate. Output: (value1, value2, ...)", Name = "PageFooterSumUntilNow")]
class PageFooterSumUntilNow : IAggregateFunction
{
    [ThreadStatic]
    static decimal result;

    [ThreadStatic]
    static string currentGroupByValue;

    public void Accumulate(object[] values)
    {
        // The aggregate function expects two parameters
        object value = values[0];

        // null values are not aggregated
        if (null == value)
        {
            return;
        }

        var groupByValue = (string)values[1];

        if (groupByValue != currentGroupByValue)
        {
            currentGroupByValue = groupByValue;
            result = 0M;
        }

        result += (decimal)value;
    }

    public object GetValue()
    {
        return result;
    }

    public void Init()
    {
    }

    public void Merge(IAggregateFunction aggregateFunction)
    {
    }
}
```

The `PageFooterSumUntilNow` aggregate accumulates the first argument within the group identified by the second argument. It includes data through the end of the group or the current page when the group continues to another page.

The second custom aggregate is for the [page header](slug:telerikreporting/designing-reports/report-structure/how-to/how-to-add-remove-page-header---footer-sections):

```C#
[AggregateFunction(Description = "Special sum aggregate. Output: (value1, value2, ...)", Name = "PageHeaderSumFromPrevPage")]
class PageHeaderSumFromPrevPage : IAggregateFunction
{
    [ThreadStatic]
    static decimal result;

    [ThreadStatic]
    static string currentGroupByValue;

    [ThreadStatic]
    static int currentPage = -1;

    [ThreadStatic]
    static List<object[]> currentPageValues;


    public void Accumulate(object[] values)
    {
        var page = (int)values[2];
        if (page != currentPage)
        {
            currentPage = page;

            for (int index = 0; index < currentPageValues.Count; index++)
            {
                this.AccumulateCore(currentPageValues[index]);
            }
            currentPageValues.Clear();
        }

        currentPageValues.Add(values);
    }

    void AccumulateCore(object[] values)
    {
        // The aggregate function expects two parameters
        object value = values[0];

        // null values are not aggregated
        if (null == value)
        {
            return;
        }

        var groupByValue = (string)values[1];

        if (groupByValue != currentGroupByValue)
        {
            currentGroupByValue = groupByValue;
            result = 0M;
        }

        result += (decimal)value;
    }

    public object GetValue()
    {
        if (currentPage == 1)
        {
            return 0;
        }

        return result;
    }

    public void Init()
    {
        if (currentPageValues == null)
        {
            currentPageValues = new List<object[]>();
        }
    }

    public void Merge(IAggregateFunction aggregateFunction)
    {
    }
}
```

The `PageHeaderSumFromPrevPage` aggregate accumulates the first argument within the group identified by the second argument through the end of the previous page. The third argument provides the current page number.

This aggregate postpones accumulation of the current page's data, so it also requires the page number.

Use the page header aggregate only in a page section because `PageNumber` is available only there.

Use the following [expression](slug:telerikreporting/designing-reports/connecting-to-data/expressions/using-expressions/overview) in the page header:

```TEXT
= IIf(
PageExec("detailSection1", Fields.account) <> IsNull(PageExec("groupHeaderSection", Fields.account), "N/A"),
Format("Account {0} continues from previous page. Value up until this page {1}", PageExec("detailSection1", Fields.account),
PageExec("detailSection1", PageHeaderSumFromPrevPage(Fields.value, Fields.account, PageNumber))),
"")
```

The expression compares the first `account` value in the detail-section scope with the first value in the group-header scope on the same page. When the values differ, it displays a message that the account continues from the previous page and shows the accumulated sum.

>note The message also appears when the page has no group header, that is, when the same account continues from the previous page and onto the next page.

Use the following expression in the page footer:

```TEXT
= IIf(
PageExec("detailSection1", Last(Fields.account)) <> IsNull(PageExec("groupFooterSection", Last(Fields.account)), "N/A"),
Format("Account {0} continues on next page. Value transitioning to next page: {1}", PageExec("detailSection1", Last(Fields.account)),
PageExec("detailSection1", PageFooterSumUntilNow(Fields.value, Fields.account))),
"")
```

This expression compares the last `account` values in the detail and group-footer scopes on the same page. When they differ, or when the page has no group footer, it displays a message that the account continues on the next page and shows the accumulated sum.

A sample report definition and a `ClassLibrary` project with the custom aggregate functions are available in the reporting samples GitHub repository: [Summary per page](https://github.com/telerik/reporting-samples/tree/master/Summary%20per%20page).

## Important Notes

The static fields that store the totals and transitional values impose the following limitations:

1. Use each custom aggregate only once in a report. If you use an aggregate more than once, values from separate calls are combined and the results are incorrect. To use an aggregate more than once, copy its implementation under a different name and use the new name in the report.

1. Thread-static fields may not be sufficient in some scenarios that use the Reporting REST Service.

	For example, the HTML5 Viewer can refresh a report on the same thread as an earlier rendering.

	In this case, the aggregate values carry over to the next report. Modify the functions to reset the static values when a new report starts.

	The following workaround passes the [`ReportDefinition` global object](slug:telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/global-objects) as another function argument and uses it to detect a new report rendering. The sample shows the changes for the `PageHeaderSumFromPrevPage` function:

	```C#
	//...
	private static void Reset()
	{
		result = 0;
		currentPage = -1;
		currentGroupByValue = null;
		if (currentPageValues != null)
		{
		currentPageValues.Clear();
		}
	}
	//...
	[ThreadStatic]
	static object processingOperationId;

	public void Accumulate(object[] values)
	{
		var reportDefinition = values[3];
		if (!object.ReferenceEquals(processingOperationId, reportDefinition))
		{
		processingOperationId = reportDefinition;
		Reset();
		}

		var page = (int)values[2];

		if (page != currentPage)
		{
		currentPage = page;

		for (int index = 0; index < currentPageValues.Count; index++)
		{
			this.AccumulateCore(currentPageValues[index]);
		}
		currentPageValues.Clear();
		}

		currentPageValues.Add(values);
	}
	```

	Use the same expression pattern, and add `ReportDefinition` as the last argument. Declare `processingOperationId` as a thread-static field in the class, alongside the other state fields.

1. If you use the [page functions](slug:telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/functions/page-functions) `PageCount` in the report with the custom page footer function, the totals may be wrong.

	The report makes an additional pass through the pages when it needs to display the total page count.

	The additional pass accumulates the overall total. The final report then uses that value as the starting point for accumulation.

	Pass `PageNumber` to the function and store it in another static field. When an incoming page number is lower than the stored page number, reset the result because the page-count pass has started again.

	Use the following updated function:

	```C#
	[AggregateFunction(Description = "Special sum aggregate. Output: (value1, value2, ...)", Name = "PageFooterSumUntilNow")]
	class PageFooterSumUntilNow : IAggregateFunction
	{
		[ThreadStatic]
		static decimal result;

		[ThreadStatic]
		static int currentPage;

		[ThreadStatic]
		static string currentGroupByValue;

		[ThreadStatic]
		static object processingOperationId;

		public void Accumulate(object[] values)
		{
			// The aggregate function expects four parameters
			object value = values[0];
			var reportDefinition = values[2];
			int page = (int)values[3];
			if (!object.ReferenceEquals(processingOperationId, reportDefinition))
			{
				processingOperationId = reportDefinition;
				result = 0;
				currentPage = -1;
			}

			// Skip the second pass through the report
			if (currentPage > page)
			{
				result = 0;
				currentPage = page;
			}

			if (currentPage < page)
			{
				currentPage = page;
			}

			// null values are not aggregated
			if (null == value)
			{
				return;
			}

			var groupByValue = (string)values[1];

			if (groupByValue != currentGroupByValue)
			{
				currentGroupByValue = groupByValue;
				result = 0M;
			}

			result += (decimal)value;
		}

		public object GetValue()
		{
			return result;
		}

		public void Init()
		{
		}

		public void Merge(IAggregateFunction aggregateFunction)
		{
		}
	}
	```

	This approach has a problem when the report has only one page, such as in the interactive view. The `currentPage > page` condition is not met, so define a separate result for this case.

	Use the built-in `PageExec` function to get the result for a single page:

	```TEXT
	= IIF(PageCount = 1, PageExec("detailSection1", Sum(CDbl(Fields.value))),
			IIF(
			PageExec("detailSection1", Last(Fields.account)) <> IsNull(PageExec("groupFooterSection", Last(Fields.account)), "N/A"),
			Format("Account {0} continues on next page. Value transitioning to next page: {1}", PageExec("detailSection1", Last(Fields.account)),
			PageExec("detailSection1", PageFooterSumUntilNow(Fields.value, Fields.account, ReportDefinition, PageNumber))),
			"")
		)
	```

	The same problem can occur with the `PageHeaderSumFromPrevPage` function, such as when the report has only one group.

	The `result` field resets only when the group changes. Apply the same approach to reset it when the page-count pass starts.

	Apply the following modification to the `Accumulate` method:

	```C#
	//...
		var page = (int)values[2];

		// Skip the second pass through the report
		if (currentPage > page)
		{
			result = 0;
			currentPage = -1;
			currentPageValues.Clear();
		}

		if (page > currentPage)
		{
			currentPage = page;
			//...
	```

## See Also

- [Summary per page sample report](https://github.com/telerik/reporting-samples/tree/master/Summary%20per%20page)
