---
title: Refreshing Telerik Native Blazor Report Viewer with New Parameters
description: Learn how to refresh the Telerik Native Blazor Report Viewer with new parameter values programmatically by creating a new ReportSourceOptions object.
type: how-to
page_title: How to Update Telerik Native Blazor Report Viewer with Changed Parameters
slug: refresh-telerik-native-blazor-report-viewer-new-parameters
tags: telerik reporting, reportviewer, parameters, native blazor, onparameterssetasync, reportsourceoptions
res_type: kb
ticketid: 1690218
---

## Environment

<table>
<tbody>
<tr>
<td>Product</td>
<td>Progress® Telerik® Reporting</td>
</tr>
<tr>
<td>Version</td>
<td>19.1.25.521</td>
</tr>
</tbody>
</table>

## Description

I cannot get the Telerik Native Blazor Report Viewer to refresh the report based on new parameter values after displaying the report with default parameters. When I update parameters programmatically—for example, using a dropdown—the report does not refresh, even though the `OnParametersSetAsync` method executes with the new parameter values.

However, if I use the parameter input area in the Report Viewer interface, the report refreshes properly with the updated values. I need a way to programmatically pass new parameters and redisplay the report with these values.

This knowledge base article also answers the following questions:
- How do I refresh Telerik Native Blazor Report Viewer with new parameters?
- Why doesn't the Telerik Native Blazor Report Viewer reflect parameter changes programmatically?
- How can I pass changed parameters to Telerik Native Blazor Report Viewer?

## Solution

To refresh the Telerik Native Blazor Report Viewer programmatically, ensure that you create a new `ReportSourceOptions` object when updating the `ReportSource` property. Modifying the existing object will not trigger the refresh. Below is an example demonstrating this approach.

### Example

Use the following code snippet in the `OnParametersSetAsync` method:

```csharp
protected override async Task OnParametersSetAsync()
{
    // Create a new ReportSourceOptions object with the updated parameters
    var rso = new ReportSourceOptions()
    {
        Report = "Report1.trdp", 
        Parameters = new Dictionary<string, object>
        {
            {"Category", SelectedCategory} // Pass the updated parameter value
        }     
    };

    // Assign the new object to the ReportSource property
    ReportSource = rso;

    await base.OnParametersSetAsync();
}
```

### Key Points
1. Always create a new `ReportSourceOptions` object when updating the `ReportSource` property.
2. Assign the updated parameter values to the `Parameters` dictionary within the new object.
3. Ensure the `ReportSource` property references the new object to trigger the refresh.

## See Also

- [Native Blazor Report Viewer Documentation](https://docs.telerik.com/reporting/embedding-reports/display-reports-in-applications/web-application/native-blazor-report-viewer/overview)
- [Embedding Reports in Blazor Applications](https://docs.telerik.com/reporting/embedding-reports/display-reports-in-applications/web-application/native-blazor-report-viewer/setup)
- [API Reference for ReportSourceOptions](https://docs.telerik.com/reporting/api/telerik.reporting.reportsourceoptions)
