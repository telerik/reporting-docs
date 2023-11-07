---
title: How to Create a "Summary Per Page" When a Group is Printed on Multiple Pages
description: Learn how to display a running page aggregate at the beginning and at the end of each page a group is printed on.
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
For clarity, I will explain the requirement in a particular context, as requested by a user.  

When generating a report that displays the list of movements for a list of accounts, it's possible (and quite frequent) for a single account to require multiple pages for printing. In order to help the users understand what they are seeing and potentially quickly find errors in their external documents (for instance, bank statements), it is convenient to print on the bottom of each page the total credit, and debit amount up to this point in the printout. The above should only be displayed when a group is printed on multiple pages and the current one is not the last page.

Here is how this can be done with Telerik Reporting.

## Solution 

Next, you may find two [custom user aggregate functions]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/extending-expressions/user-aggregate-functions%}) that can be used to accomplish the requirement. 

The fields in the classes need to be static because for each page we create a new instance of the aggregate and we need to preserve the data from all pages. On the other hand, the fields are marked with _[ThreadStatic]_ so that if two report renderings occur simultaneously (like in a web application) they do not interfere.

The first aggregate is for the Page Footer: 

````C#
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
````

The aggregate _PageFooterSumUntilNow_ accumulates the corresponding value (the first argument) inside the group (grouped by the second argument) up to the current point, which is the end of the group or the end of the current page when the group finishes on the current page. 

The second custom aggregate is for the [Page Header]({%slug telerikreporting/designing-reports/report-structure/how-to/how-to-add-remove-page-header---footer-sections%}): 

````C#
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
        // The aggregate function expects one parameter
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
````

The aggregate _PageHeaderSumFromPrevPage_ accumulates the corresponding value (the first argument) inside the group (grouped by the second argument) up to the end of the previous page. The current page is provided as the third argument. 
The idea derives from the page footer aggregate, but we take into account that the accumulation of the current page's data needs to be postponed after the current page hence we need the page number to be passed as well.  

The Page Header aggregate may be used only in a page section as it requires the PageNumber that is available only there. For example, in the following [Expression]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/using-expressions/overview%}) inside the Page Header section: 

````
= IIf(
PageExec("detailSection1", Fields.account) <> IsNull(PageExec("groupHeaderSection", Fields.account), "N/A"),
Format("Account {0} continues from previous page. Value up until this page {1}", PageExec("detailSection1", Fields.account), 
PageExec("detailSection1", PageHeaderSumFromPrevPage(Fields.value, Fields.account, PageNumber))),
"")
````

The Expression checks whether the first 'account' value in the detail section scope is different from the first one in the group header scope on the same page, and if so, types the message that the account continues from the previous page and the corresponding accumulated sum. Note that the message will be displayed also when there is no group header for the page, i.e. when the same account continues from the previous and also on the next page.

Here is also the Expression for the Page Footer: 

````
= IIf(
PageExec("detailSection1", Last(Fields.account)) <> IsNull(PageExec("groupFooterSection", Last(Fields.account)), "N/A"),     
Format("Account {0} continues on next page. Value transitioning to next page: {1}", PageExec("detailSection1", Last(Fields.account)), 
PageExec("detailSection1", PageFooterSumUntilNow(Fields.value, Fields.account))),
"")
````

This expression compares the last 'account' values for the detail and the group footer scopes on the same page and types the message that the account continues on the next page and the accumulated sum when they differ, or there is no group footer on the page.  
A sample report definition and a ClassLibrary project with the custom aggregate functions demonstrating the approach may be found in our reporting samples GitHub repo - [Summary per page](https://github.com/telerik/reporting-samples/tree/master/Summary%20per%20page).

## Important Notes 

The fact that the main variables that accumulate the result and the transitional values are thread static imposes the following limitations: 

1. The Custom Aggregates should be used only once in the same Report. If they are used more than once, the values will be aggregated from one call to another and the final outcomes will be incorrect. If you need to use twice or more any of the functions, you need to copy their content under a different name and use the function with a different name in the report. 

2. The fact that the variables are static for the thread may not suffice in some scenarios utilizing the Reporting REST Service. For example, when the report is refreshed from the Html5 Viewer, it may be rendered in the same thread as before. In this case, the aggregated values are carried over from the first to the second report. That said, the values from the previous rendering are carried over to the next rendering. To overcome this, you need to modify the logic of the functions. For example, when the report is a new one, you may reset the static values.  
The particular workaround we suggest is to pass the __ReportDefinition__ [Global Object]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/global-objects%}) that is unique for each report generation as another argument of the functions and use it as an indicator that we are in a new report rendering. Here is a sample code with the changes suggested for the _PageHeaderSumFromPrevPage_ function: 

	````C#
//...
	private static void Reset()
	{
	    result = 0;
	    currentPage = -1;
	    if (currentPageValues != null)
	    {
			currentPageValues.Clear();
	    }
	}
	//...
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
````

	The usage in the expression would be the same, with the _ReportDefinition_ added as a last argument. 	
	
3. If you use the [Page Function]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/functions/page-functions%}) __PageCount__ in the report along with our custom page footer function, the totals may be wrong. The reason for this is the additional pass through the report pages that our algorithm makes when it is necessary to display the total pages per report. That said, the overall total gets accumulated during the additional pass, and in the final report, this becomes the starting value for accumulation.

	The workaround for this is through passing the _PageNumber_. We need to store it in another static field. When the incoming page numbers become lower than the stored static page number in the function, we need to reset the result as this indicates that we start with the second pass after the page count has been estimated.

	Here is the updated code of the function:

	````C#
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
````

	The problem in this approach would be when there is only one (1) page in the report, for example in the Interactive view. In this case, the condition (currentPage > page) won't be met, hence we need to define a separate result for this case. The result for a single page though can be taken with the built-in function PageExec. Here is a new sample Expression: 

	````
= IIF(PageCount = 1, PageExec("detailSection1", Sum(CDbl(Fields.value))), 
		IIF(
		PageExec("detailSection1", Last(Fields.account)) <> IsNull(PageExec("groupFooterSection", Last(Fields.account)), "N/A"),     
		Format("Account {0} continues on next page. Value transitioning to next page: {1}", PageExec("detailSection1", Last(Fields.account)), 
		PageExec("detailSection1", PageFooterSumUntilNow(Fields.value, Fields.account, ReportDefinition, PageNumber))),
		"")
	)
````

	The same problem may occur also with the function _PageHeaderSumFromPrevPage_, for example, when the report has only one group. The reason for this would be that the _result_ is reset only when the group changes. To overcome this, we may apply the same approach. Here is the needed modification in the Accumulate method of the implementation: 

	````C#
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
````


## See Also
* [Sample Report](https://github.com/telerik/reporting-samples/tree/master/Summary%20per%20page)
