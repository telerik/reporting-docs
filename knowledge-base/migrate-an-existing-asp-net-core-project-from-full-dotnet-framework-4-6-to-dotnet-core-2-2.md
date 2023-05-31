---
title: Мigrate ASP.NET Core project from .NET Framework to .NET
description: "Learn how to migrate an existing ASP.NET Core Telerik Reporting project from the .NET Framework to .NET Core or .NET."
type: troubleshooting
page_title: Мigrate existing ASP.NET Core project from .NET Framework 4 to .NET
slug: migrate-an-existing-asp-net-core-project-from-full-dotnet-framework-4-6-to-dotnet-core-2-2
tags: ASP.NET Core,.NET,.NET Core,.NET Framework,Reporting
res_type: kb
---

## Environment

<table>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting </td>
	</tr>
	<tr>
		<td>Project Type</td>
		<td>ASP.NET Core targetting the full .NET Framework</td>
	</tr>
</table>

## Description

Starting with [Telerik Reporting R1 2019](https://www.telerik.com/support/whats-new/reporting/release-history/progress-telerik-reporting-r1-2019-13-0-19-116), we support report rendering runtime targeting .NET Standard 2.0 and the .NET Core 2.1+ and .NET 5+ applications that are compatible with it. For more information how to use reports in .NET/.NET Core/.NET Standard application for Windows and Linux platforms, please refer to [.NET Core Support]({%slug telerikreporting/using-reports-in-applications/dot-net-core-support%}) help article.

Prior to that, the only available workaround was to switch the .NET Core application's target framework to full .NET Framework.

Now, how to migrate the existing ASP.NET Core project from full .NET Framework back to .NET or .NET Core? In this article we would show you step-by-step and we would assume that the [Telerik Rest Service]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/overview%}) is configured within that application (hosted on the same domain).

## Solution

1. Unload the project and edit `.csproj` file's setting

	````XML
<TargetFramework>netcoreapp2.2</TargetFramework>
````

	and reload it back.

	The above setting is for .NET Core 2.2. Change it correspondingly for the other target frameworks.

1. Remove the old Telerik libraries. The new Telerik Reporting libraries for .NET Core projects are available through Telerik NuGet private feed - [Telerik Reporting NuGet packages]({%slug telerikreporting/installation%}#installing-telerik-reporting).
1. Update `Microsoft.AspNetCore` libraries to newer version (if needed).
1. Application configuration in ASP.NET Core uses the new SDK-style project and utilizes `appsettings.json` as a configuration file. The `ConnectionStrings` setting should be configured in JSON-based format like for example:

	````JSON
//appsettings.json
	//Supported ConnectionStrings section configurations:
	"ConnectionStrings": {
		//This connection string will use System.Data.SqlClient as data provider invariant name.
		//"Telerik.Reporting.Examples.CSharp.Properties.Settings.TelerikConnectionString": "Data Source=.\\SQLEXPRESS;Initial Catalog=AdventureWorks;Integrated Security=true"

		//This connection string explicitly states the data provider invariant name - mandatory for databases other than MSSQL Server.
		"Telerik.Reporting.Examples.CSharp.Properties.Settings.TelerikConnectionString": {
			"connectionString": "Data Source=.\\SQLEXPRESS;Initial Catalog=AdventureWorks;Integrated Security=true",
			"providerName": "System.Data.SqlClient"
		}
	}

	//This type of connection string configuration is also supported.
	//"ConnectionStrings": [
	//	{
	//		"name": "Telerik.Reporting.Examples.CSharp.Properties.Settings.TelerikConnectionString",
	//		"connectionString": "Data Source=.\\SQLEXPRESS;Initial Catalog=AdventureWorks;Integrated Security=true",
	//		"providerName": "System.Data.SqlClient"
	//	}
	//]
````


1. In order to load the configuration from the `appsettings.json` file, an additional instance of type `ConfigurationService` needs to be created in `Startup.cs`. This class will add the appsettings.json as configuration file and will be used later in the ReportsController constructor:

	````CSharp
public class ConfigurationService
	{
		public IConfiguration Configuration { get; private set; }

		public IHostingEnvironment Environment { get; private set; }
		public ConfigurationService(IHostingEnvironment environment)
		{
			this.Environment = environment;

			var configFileName = System.IO.Path.Combine(environment.ContentRootPath,"appsettings.json");
			var config = new ConfigurationBuilder()
							.AddJsonFile(configFileName, true)
							.Build();

			this.Configuration = config;
		}
	}
````


## Notes

A sample demo can be downloaded from the [Reporting-Samples GitHub repository](https://github.com/telerik/reporting-samples/tree/master/Core2.2WithEmbedService).
