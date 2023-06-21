---
title: Using Query Parameters with Blazor Report Viewer
description: "Learn how to use query parameters and dynamically set reportsource with the native Blazor Report Viewer."
type: how-to
page_title: Passing Query Parameters to the Blazor Report Viewer
slug: how-to-use-query-parameters-native-blazor-report-viewer
tags: Blazor
ticketid: 1613387
res_type: kb
---

## Environment

<table>
	<tbody>
		<tr>
			<td>Product Version</td>
			<td>16.2.22.914+</td>
		</tr>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
		</tr>
		<tr>
			<td>Report Viewer</td>
			<td>Native Blazor Report Viewer</td>
		</tr>
	</tbody>
</table>


## Description

I need to be able to dynamically load a report and its report parameters through the current URL's query parameters, how can I achieve this with the Native Blazor Report Viewer?

For the below example, we will be using the Dashboard report - [Dashboard Report Demo](https://demos.telerik.com/reporting/dashboard). The report is shipped with the installation of the Telerik Reporting product and with a default installation, it would be at the following path:

`C:\Program Files (x86)\Progress\Telerik Reporting <Release>\Report Designer\Examples`

## Solution

1. To catch the query string, we may use the [SupplyParameterFromQuery](https://learn.microsoft.com/en-us/dotnet/api/microsoft.aspnetcore.components.supplyparameterfromqueryattribute?view=aspnetcore-7.0) attribute with the [Parameter](https://learn.microsoft.com/en-us/dotnet/api/microsoft.aspnetcore.components.parameterattribute?view=aspnetcore-7.0) attribute to specify that a component parameter of a routable component can come from the query string. For example:

	````CSharp
[Parameter]
	[SupplyParameterFromQuery(Name = "ReportName")]
	public string? ReportName { get; set; }

	[Parameter]
	[SupplyParameterFromQuery(Name = "ReportYear")]
	public int? ReportYear { get; set; }
````


1. Since we can use those values only once the parameters have been set, we need to use an empty report source initially:

	````CSharp
<ReportViewer @ref=rv1 ServiceUrl="/api/reports"
		@bind-ReportSource="@ReportSource"
		ServiceType="@ReportViewerServiceType.REST"
		Height="800px"
		Width="100%">
	</ReportViewer>


	@code {
		public ReportSourceOptions ReportSource { get; set; } = new ReportSourceOptions();
	}
````


1. [After parameters are set (OnParametersSet{Async})](https://learn.microsoft.com/en-us/aspnet/core/blazor/components/lifecycle?view=aspnetcore-7.0#after-parameters-are-set-onparameterssetasync), we may update the `ReportSource` property:

	````CSharp
protected override Task OnParametersSetAsync()
	{
		ReportSource.Report = ReportName ?? "Dashboard.trdp";
		ReportSource.Parameters.Add("ReportYear", ReportYear ?? 2002);

		return base.OnParametersSetAsync();
	}
````


## See Also

* [Integrating Native Blazor Viewer in Blazor Server or WebAssembly App]({%slug telerikreporting/embedding-reports/display-reports-in-applications/web-application/native-blazor-report-viewer/how-to-use-native-blazor-report-viewer%})
* [ASP.NET Core Blazor routing and navigation](https://learn.microsoft.com/en-us/aspnet/core/blazor/fundamentals/routing)
