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
		<tr>
			<td>Report Viewer</td>
			<td>Blazor Report Viewer</td>
		</tr>
	</tbody>
</table>


## Description
The Telerik Report Viewer makes it easy to let your user select and filter the data of a report to get only the information they need. Out of the box, we implement the report parameter controls in the report viewer which allow you to do this, however, there are times where one may wish to use controls outside of the report viewer widget since it supports only a limited type of report parameter controls out of the box.

For this example, we will use the `Invoice` report that we ship with installation of the Telerik Reporting product. That report, and the other example reports, can be found in the installation directory. For example: `{install_dir}/Report Designer/Examples`.

Also, instead of setting up a new project with the Blazor Report Viewer, we can use the demo Blazor projects that we also ship with the product installation. 
For example: `{install_dir}/Examples/(CSharp/VB)`.

The Blazor projects are available in the .NET Core project folders. The next steps can be done in the `Index.razor` file of any of our Blazor demo projects.

## Solution 

Add the following code inside the `Index.razor` file:

```Razor
<div id="invoiceIdSelector">
    <label for="invoiceId">Invoices</label>
    <select name="invoiceId" title="Select the Invoice ID"  @onchange="(args) => changeId(args)">
        <option value="SO51081" selected="selected">SO51081</option>
        <option value="SO51082">SO51082</option>
        <option value="SO51083">SO51083</option>
    </select>
</div>
```

This is a simple select control because the idea is to demonstrate how to update the report from outside the report viewer and the core of this approach is inside the `changeId` method. The method should work with virtually any control out there. The `changeId` method itself is the following:

```Csharp
 async void changeId(ChangeEventArgs e)
    {
        ReportSourceOptions rso = await reportViewer1.GetReportSourceAsync();
        rso.Parameters["OrderNumber"] = e.Value;
        await reportViewer1.SetReportSourceAsync(rso);
    }
```

In the `changeId` method we retrieve the viewer's `ReportSourceOptions` object and then we set the `OrderNumber` parameter the value currently present in the event argument. Finally we update the ReportSourceOptions through the viewer's `SetReportSourceAsync(ReportSourceOptions opt)` method.

### See Also
[Dynamically Selecting and Filtering Reports with Blazor and the Telerik ReportViewer Control](https://www.telerik.com/blogs/dynamically-selecting-filtering-reports-blazor-telerik-reportviewer)

## Demo Application
The demo can be found in our [GitHub repository](https://github.com/telerik/reporting-samples/tree/master/DynamicParametersBlazor)
