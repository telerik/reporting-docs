---
title: Cannot Serialize the Sessions State
page_title: Cannot Serialize the Sessions State in ASP.NET WebForms ReportViewer
description: "Learn how to serialize the session state when working with the legacy ASP.NET WebForms ReportViewer in Telerik Reporting."
slug: cannot-serialize-sessions-state
tags: telerik, reporting, run, time, cannot, unable, to, serizalize, sessions, state
published: True
component:
type: troubleshooting
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
			<td>Q2 2012 and later</td>
		</tr>
		<tr>
			<td>Report Viewers</td>
			<td>Legacy ASP.NET WebForms Viewer</td>
		</tr>
	</tbody>
</table>

> The described scenario and suggested solution relate to the legacy ASP.NET WebForms ReportViewer. It is recommended that you migrate to the [HTML5 ReportViewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-asp.net-web-forms-report-viewer/overview%}).

## Description

I am unable to serialize the session state when working with Telerik Reporting.

## Cause

In the `StateServer` and `SQLServer` modes, ASP.NET will serialize the session state objects, and as a result non-serializable objects or `MarshalByRef` objects are not permitted. The same restriction applies if similar serialization is done by the custom session state store in the `Custom` mode.

## Solution

This exception might occur if you try to use objects which do not implement `ISerializable` for a Report or Data Item data source. For example, if this is an `IList`, you can try using a `List` instead as shown in the [cars Reporting demo](https://demos.telerik.com/reporting/list-bound-report).

You can also use the `NeedDataSource` event of the report and assign the data source to the "processing report", thus avoiding any need for serialization or deserialization.

Another approach is to use a `DataSet` or `DataTable`:

````C#
DataTable dt = new DataTable();
DataColumn col = new DataColumn("ColumnName", typeof(string));
//....
dt.Columns.Add(col);
foreach (object Item in MyIList)
{
	DataRow row = dt.NewRow();
	row["ColumnName"] = Item;
	//.....
	dt.Rows.Add(row);
}
````

