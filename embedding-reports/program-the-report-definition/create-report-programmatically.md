---
title: Create a Report
page_title: Creating a Report with code
description: "Create a Telerik Reporting report programmatically, by instantiating a Telerik.Reporting.Report object and setting its properties."
slug: telerikreporting/using-reports-in-applications/program-the-report-definition/create-report-programmatically
tags: create, report, programmatically, code
published: True
position: 1
previous_url: /programmatic-creating-report
reportingArea: General
---

# Create a Report Programmatically

To create a Telerik report in code, you need to instantiate a [Telerik.Reporting.Report](/api/Telerik.Reporting.Report) object and set its properties. For example, this code will create a report and set up its data source:

````C#
Telerik.Reporting.Report report = new Telerik.Reporting.Report();
string selectCommand = @"SELECT * FROM Sales.Store";
string connectionString = "Data Source=(local)\\SQLEXPRESS;Initial Catalog=AdventureWorks;Integrated Security=True";
Telerik.Reporting.SqlDataSource sqlDataSource = new Telerik.Reporting.SqlDataSource(connectionString, selectCommand);
report.DataSource = sqlDataSource;
````
````VB.NET
Dim report As New Telerik.Reporting.Report()
Dim selectCommand As String = "SELECT * FROM Sales.Store"
Dim connectionString As String = "Data Source=(local)\SQLEXPRESS;Initial Catalog=AdventureWorks;Integrated Security=True"
Dim sqlDataSource As New Telerik.Reporting.SqlDataSource(connectionString, selectCommand)
report.DataSource = sqlDataSource
````

## Next Steps

The code sample above demonstrates how to create an empty report. To create a functional report, you can add [sections]({%slug telerikreporting/using-reports-in-applications/program-the-report-definition/create-sections-programmatically%}) and [items]({%slug telerikreporting/using-reports-in-applications/program-the-report-definition/create-report-items-programmatically%}) in code.

When you create reports programmatically, you must use a [Custom Report Source Resolver]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-service-report-source-resolver/how-to-implement-a-custom-report-source-resolver%}) to display these reports in a Report Viewer that utilizes [Telerik Reporting REST Service]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/overview%}) to render its reports.

You can also [programmatically export the report]({%slug telerikreporting/using-reports-in-applications/call-the-report-engine-via-apis/embedded-report-engine%}) that you created.

## See Also

* [Report](/api/Telerik.Reporting.Report)
