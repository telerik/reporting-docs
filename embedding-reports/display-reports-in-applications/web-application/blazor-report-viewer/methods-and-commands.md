---
title: Methods and Commands
page_title: Methods and Commands of the Blazor Report Viewer
description: "Learn about what are the methods and commands exposed by the Telerik Reporting Blazor Report Viewer and how to use them."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/methods-and-commands
tags: methods,and,commands,blazor,report,viewer
published: True
position: 3
previous_url: /blazor-report-viewer-methods-and-commands
---

# Methods and Commands Overview

The Blazor Report Viewer exposes methods and commands that allow to control its behavior from application code.

## Get a report viewer reference to access API

To call report viewer methods and execute commands, first get a reference to the report viewer object using the `@ref` attribute. Then, use the __reportViewer1__ object to access the report viewer API. 

For example, refresh and print of the current report can be triggered like this:

````CSHTML
<button type="button" class="btn btn-light btn-sm" @onclick="RefreshReport">Refresh Report</button>
<button type="button" class="btn btn-light btn-sm" @onclick="Print">Print Report</button>

<ReportViewer @ref="reportViewer1"

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

