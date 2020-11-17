---
title: Dynamically Selecting and Filtering Reports in Blazor Projects
description:  Learn how to Dynamically Select and Filter data in your Blazor projects
type: how-to
page_title: Dynamically Selecting and Filtering Reports in Blazor Projects
slug: how-to-dynamically-select-and-filter-data-in-blazor
position: 
tags: Blazor
ticketid: 1494927
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
The Telerik Report Viewer makes it easy to let your user select the report they want to see and filter the data in that report to get the information they need. Here’s how to make that happen in a Blazor app.

## Solution

We will be doing the following steps in the **Index.razor** file of the **BlazorHtml5Demo** project.

1. Add the following code inside the **body** tag:

```Razor
<div id="invoiceIdSelector">
    <label for="invoiceId">Invoices</label>
    <select name="invoiceId" title="Select the Invoice ID"  @onchange="(args) => changeId(args)">
        <option value="SO51081" selected="selected">SO51081</option>
        <option value="SO51082">SO51082</option>
        <option value="SO51083">SO51083</option>
    </select>

    <input type="text" @onchange="(args) => changeId(args)" />
</div>
```
This is all the setup that we need for our **changeId** function that will be doing the actual work.

2. Now add this code inside the **@code** block:
```Csharp
 async void changeId(ChangeEventArgs e)
    {
        ReportSourceOptions rso = await reportViewer1.GetReportSourceAsync();
        rso.Parameters["OrderNumber"] = e.Value;
        await reportViewer1.SetReportSourceAsync(rso);
    }
```
In the **changeId** function we retrieve the viewer's **ReportSourceOptions** and then we set the **OrderNumber** parameter the value of in the event argument.
Finally we update the ReportSourceOptions. Because we are retrieving a value from an asynchronous method, we have to use the **await** keyword our method calls and flag the method with the **async** keyword.


## See Also
[Dynamically Selecting and Filtering Reports with Blazor and the Telerik ReportViewer Control](https://www.telerik.com/blogs/dynamically-selecting-filtering-reports-blazor-telerik-reportviewer)

## Demo Application
The demo can be found in our [GitHub repository](https://github.com/telerik/reporting-samples/tree/master/DynamicParametersBlazor)
