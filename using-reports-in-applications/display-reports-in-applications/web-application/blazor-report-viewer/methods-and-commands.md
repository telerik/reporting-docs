---
title: Methods and Commands
page_title: Methods and Commands 
description: Methods and Commands
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/methods-and-commands
tags: methods,and,commands
published: True
position: 3
---

# Methods and Commands

The Blazor Report Viewer exposes methods and commands that allow to control its behavior from application code.

## Get a report viewer reference to access API

To call report viewer methods and execute commands it is required to first get a reference to the report viewer object using the __@ref__ attribute. Then use the *reportViewer1* object to access the report viewer API. For example, refresh and print of the current report can be triggered like this: 
    
````c#
<button type="button" class="btn btn-light btn-sm" @onclick="RefreshReport">Refresh Report</button>
<button type="button" class="btn btn-light btn-sm" @onclick="Print">Print Report</button>
...
<ReportViewer @ref="reportViewer1"
...
@code {
    ReportViewer reportViewer1;
    async void RefreshReport()
    {
        await reportViewer1.RefreshReportAsync();
    }
    async void Print()
    {
        await reportViewer1.Commands.Print.ExecuteAsync();
    }
}
````

