---
title: Commands
page_title: Commands property
description: "Gets the available report viewer commands."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/options/commands
published: True
reportingArea: BlazorWrapper
---

# The `Commands` option of the Blazor Report Viewer

Gets the available report viewer commands.

## Type

[`Telerik.ReportViewer.Blazor.CommandOptions`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types/commandoptions%})

## Examples

````C#
<ReportViewer @ref="reportViewer"/>
<button @onclick="ExportToPdf">Export to PDF</button>
<button @onclick="GoToPageThree">Go to Page 3</button>
<button @onclick="ExecutePrint">Print</button>

@code {
    ReportViewer reportViewer;
    async void ExportToPdf()
    {
        await reportViewer.Commands.Export.ExecuteAsync("PDF");
    }
    async void GoToPageThree()
    {
        await reportViewer.Commands.GoToPage.ExecuteAsync(3);
    }
    async void ExecutePrint()
    {
        await reportViewer.Commands.Print.ExecuteAsync();
    }
}
````

## See Also

* [Blazor Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/overview%})
* [CommandOptions]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types/commandoptions%})
