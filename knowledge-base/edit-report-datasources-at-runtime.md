---
title: Edit the Report Data Source Components at Runtime
description: Dynamically change the connection string of the SqlDataSource components
page_title: Modify the Report Data Sources through code
type: how-to
slug: edit-report-datasources-at-runtime
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
			<td>Version</td>
			<td>15.2.21.1110 and higher</td>
		</tr>
	</tbody>
</table>

## Description

In the [Reporting R3 2021 SP1](https://www.telerik.com/support/whats-new/reporting/release-history/progress-telerik-reporting-r3-2021-sp1-15-2-21-1110) release of Telerik Reporting, we introduced to the [Report Class](/reporting/api/Telerik.Reporting.Report) the method [GetDataSources](/reporting/api/Telerik.Reporting.Report#Telerik_Reporting_Report_GetDataSources).

The `GetDataSources` method allows you to access and/or modify any [data source component]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/overview%}) in the report definition, regardless of whether they are referenced by a data item or a report parameter.

An example in which this method will be useful is when the connection string, used by the report data sources, has to change dynamically at runtime.

## Solution

Let's assume that the report file is with the `TRDP` extension, then the following code could be used to [unpackage]({%slug telerikreporting/using-reports-in-applications/program-the-report-definition/package-report-definition%}#unpackaging) the report and then to edit its connection and even the SQL query:

````C#
var query = "SQL_QUERY_HERE";
var reportPackager = new ReportPackager();
Telerik.Reporting.Report report = null;

using (var sourceStream = System.IO.File.OpenRead("Report1.trdp"))
{
	report = (Telerik.Reporting.Report)reportPackager.UnpackageDocument(sourceStream);
}

var sqlDS = report.GetDataSources().OfType<SqlDataSource>();

foreach (var sqlDataSource in sqlDS)
{
	sqlDataSource.ConnectionString = "CONNECTION_STRING_HERE";
	sqlDataSource.SelectCommand = query;
}

var irs = new InstanceReportSource() { ReportDocument = report };
````


## Notes

If the above code is to be used for modifying reports displayed by an **HTML5-based Report Viewer**, the code must be placed in the `Resolve` method of a custom [IReportSourceResolver](/reporting/api/Telerik.Reporting.Services.IReportSourceResolver) used by the **Reporting REST service**.

## See Also

* [Embedded Report Engine]({%slug telerikreporting/using-reports-in-applications/call-the-report-engine-via-apis/embedded-report-engine%})
* [How to display a report via InstanceReportSource in the HTML5 Viewer]({%slug how-to-display-a-report-via-instancereportsource-in-the-html5-viewer%})
