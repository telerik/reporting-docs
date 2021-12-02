---
title: Create Report Programmatically
page_title: Create Report Programmatically | for Telerik Reporting Documentation
description: Create Report Programmatically
slug: telerikreporting/using-reports-in-applications/program-the-report-definition/create-report-programmatically
tags: create,report,programmatically
published: True
position: 1
---

# Create Report Programmatically



To create a Telerik report in code, you need to instantiate a __Telerik.Reporting.Report__  object and set its properties. For example, this code will create a report and set up its data source:

	
````C#
MyReport report = new MyReport();
string selectCommand = @"SELECT * FROM Sales.Store";
string connectionString = "Data Source=(local)\\SQLEXPRESS;Initial Catalog=AdventureWorks;Integrated Security=True";
Telerik.Reporting.SqlDataSource sqlDataSource = new Telerik.Reporting.SqlDataSource(connectionString, selectCommand);
report.DataSource = sqlDataSource;
````
````VB.NET
Dim report As New MyReport()
Dim selectCommand As String = "SELECT * FROM Sales.Store"
Dim connectionString As String = "Data Source=(local)\SQLEXPRESS;Initial Catalog=AdventureWorks;Integrated Security=True"
Dim sqlDataSource As New Telerik.Reporting.SqlDataSource(connectionString, selectCommand)
report.DataSource = sqlDataSource
````



## Next Steps

The code sample above demonstrates how to create an empty report. To create a functional report, you can            add [sections]({%slug telerikreporting/using-reports-in-applications/program-the-report-definition/create-sections-programmatically%}) and [items]({%slug telerikreporting/using-reports-in-applications/program-the-report-definition/create-report-items-programmatically%}) in code.       

When you create reports programmatically, you must use a [Custom Report Source]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-service-report-source-resolver/how-to-implement-a-custom-report-source-resolver%}) to display these reports in a Report Viewer.         

You can also [programmatically export the report]({%slug telerikreporting/using-reports-in-applications/call-the-report-engine-via-apis/embedded-report-engine%}) that you created.         

# See Also
 * [Report](/reporting/api/Telerik.Reporting.Report) 
