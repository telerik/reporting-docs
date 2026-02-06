---
title: Using the Microsoft SQL Client Data Provider
page_title: Integrating the Microsoft SQL Client Data Provider
description: "Learn more about how the Microsoft SQL Client data provider can be used by the SqlDataSource component to connect to MS SQL databases in Telerik Reporting."
slug: telerikreporting/designing-reports/connecting-to-data/data-source-components/sqldatasource-component/using-data-providers/using-microsfost-data-sqlclient-data-provider
tags: Microsoft.Data.SqlClient,data,provider
published: True
position: 4
reportingArea: General
---

# Using Microsoft.Data.SqlClient in Reporting

The [Microsoft.Data.SqlClient](https://learn.microsoft.com/en-us/sql/connect/ado-net/introduction-microsoft-data-sqlclient-namespace?view=sql-server-ver16) namespace is essentially a new version of the [System.Data.SqlClient](https://learn.microsoft.com/en-us/dotnet/api/system.data.sqlclient?view=net-8.0) namespace and can thus be used for connecting to Microsoft SQL Databases.

## Setting up the Microsoft.Data.SqlClient Data Provider in the .NET Standalone Report Designer

1. Create a new [.NET 8 Console Application](https://learn.microsoft.com/en-us/dotnet/csharp/tutorials/console-teleprompter) project.
1. Install the [Microsoft.Data.SqlClient](https://www.nuget.org/packages/Microsoft.Data.SqlClient/) NuGet package to it and `build` the project.
1. Navigate to the `bin/Debug/net8.0` subdirectory of the project, and copy all assemblies there except for the assembly with the name of the project.
1. Paste the assemblies in the .NET Standalone Report Designer installation directory e.g. `C:\Program Files (x86)\Progress\Telerik Reporting {{site.suiteversion}}\Report Designer\.NET`.
1. The `bin/Debug/net8.0` folder of the console application should contain an additional folder named `runtimes` with several subfolders such as `win`, `unix`, `win-x64`, etc. Copy the DLLs from the folders that correspond to your Operating System and CPU architecture.
1. Paste the additional runtime assemblies in the .NET Standalone Report Designer installation directory e.g. `C:\Program Files (x86)\Progress\Telerik Reporting {{site.suiteversion}}\Report Designer\.NET`.
1. Restart the designer if you have previously opened it.
1. Add a new SQL DataSource and you should see that the `Microsoft.Data.SqlClient` Data Provider is in the dropdown.

## Setting up the Microsoft.Data.SqlClient Data Provider in .NET Applications

### .NET Application with the Web Report Designer

1. Install the [Microsoft.Data.SqlClient](https://www.nuget.org/packages/Microsoft.Data.SqlClient/) NuGet package to it and `build` the project.
1. Register the [SqlClientFactory.Instance](https://learn.microsoft.com/en-us/dotnet/api/microsoft.data.sqlclient.sqlclientfactory.instance) in the `Telerik.Reporting.Processing.Data.DbProviderFactories` using the `RegisterFactory` method within the `static` constructor of the controller that inherits from [ReportDesignerControllerBase](/api/telerik.webreportdesigner.services.controllers.reportdesignercontrollerbase). For example:

   ```C#
   [Route("api/reportdesigner")]
   public class ReportDesignerController : ReportDesignerControllerBase
   {

   		static ReportDesignerController()
   		{
   			Telerik.Reporting.Processing.Data.DbProviderFactories.RegisterFactory("Microsoft.Data.SqlClient", Microsoft.Data.SqlClient.SqlClientFactory.Instance);
   		}
   		public ReportDesignerController(IReportDesignerServiceConfiguration reportDesignerServiceConfiguration, IReportServiceConfiguration reportServiceConfiguration)
   			: base(reportDesignerServiceConfiguration, reportServiceConfiguration)
   		{
   		}
   }
   ```

1. If the [SqlDataSource component]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/sqldatasource-component/overview%}) uses a `shared` connection where it is retrieved from the configuration file of the project(e.g. `appsettings.json`), the provider name must be specified in the connection. For example:

   ```JSON
   {
   "ConnectionStrings":{
   	"mssql":
   		{
   			"connectionString":"Server=myServerAddress;Database=myDataBase;User Id=myUsername;Password=myPassword;",
   			"providerName":"Microsoft.Data.SqlClient"
   		}
   	}
   }
   ```

### .NET Application with Web Report Viewer

1. Install the [Microsoft.Data.SqlClient](https://www.nuget.org/packages/Microsoft.Data.SqlClient/) NuGet package to it and `build` the project.
1. Register the [SqlClientFactory.Instance](https://learn.microsoft.com/en-us/dotnet/api/microsoft.data.sqlclient.sqlclientfactory.instance) in the `Telerik.Reporting.Processing.Data.DbProviderFactories` using the `RegisterFactory` method within the `static` constructor of the controller that inherits from [ReportsControllerBase](/api/telerik.reporting.services.webapi.reportscontrollerbase). For example:

   ```CSharp
   [Route("api/reports")]
   public class ReportsController : ReportsControllerBase
   {

   		static ReportsController()
   		{
   			Telerik.Reporting.Processing.Data.DbProviderFactories.RegisterFactory("Microsoft.Data.SqlClient", Microsoft.Data.SqlClient.SqlClientFactory.Instance);
   		}
   		public ReportsController(IReportServiceConfiguration reportServiceConfiguration)
   			: base(reportServiceConfiguration)
   		{
   		}
   }
   ```

1. If the [SqlDataSource component]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/sqldatasource-component/overview%}) uses a `shared` connection where it is retrieved from the configuration file of the project(e.g. `appsettings.json`), the provider name must be specified in the connection. For example:

   ```JSON
   {
   	"ConnectionStrings":{
   		"mssql":
   		{
   			"connectionString":"Server=myServerAddress;Database=myDataBase;User Id=myUsername;Password=myPassword;",
   			"providerName":"Microsoft.Data.SqlClient"
   		}
   	}
   }
   ```

## See Also

- [How to Use Microsoft.Data.SqlClient Data Provider in Web Report Designer]({%slug connecting-to-microsoft-data-sqlclient-in-web-report-designer%})
- [Adding External Data Provider to .NET Standalone Designer]({%slug adding-external-data-provider-to-dotnet-standalone-designer%})
- [How to register a DbProviderFactory in a .NET Core project]({%slug how-to-register-db-provider-factory-in-net-core-project%})
- [Microsoft SqlClient Data Provider for SQL Server connection strings](https://www.connectionstrings.com/microsoft-data-sqlclient/)
