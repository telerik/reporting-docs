---
title: Мigrate an existing ASP.NET Core project from full .NET Framework 4.6 to .Net Core 2.2 
description: This article elaborates on how to migrate an existing ASP.NET Core project from full .NET Framework to .Net Core. It could be also related to other versions of both frameworks (for full framework 4.0+ and for .NET Core 2.1+)
type: troubleshooting
page_title: Мigrate an existing ASP.NET Core project from full .NET Framework 4.6 to .Net Core 2.2 
slug: migrate-an-existing-asp-net-core-project-from-full-dotnet-framework-4-6-to-dotnet-core-2-2 
position: 
tags: ASP.NET, ASP.NET Core
ticketid: 
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
As of [Telerik Reporting R1 2019](https://www.telerik.com/support/whats-new/reporting/release-history/progress-telerik-reporting-r1-2019-13-0-19-116), we support report rendering runtime targeting .NET Core 2.1+ applications. For more information how to use reports in a .NET Core application for Windows and Linux platforms, please refer to [.NET Core Support](../use-reports-in-net-core-apps) help article.

Prior to that, the only available workaround was to switch the .NET Core application's target framework to full .NET Framework.

Now, how to migrate the existing ASP.NET Core project from full .NET Framework back to .Net Core? In this article we would show you step-by-step and we would assume that the [Telerik Rest Service](./telerik-reporting-rest-conception) is configured within that application (hosted on the same domain).

## Solution
  
1. Unload the project and edit .csproj file's setting 

	```XML
	<TargetFramework>netcoreapp2.2</TargetFramework>
	```
and reload it back.

2. Remove the old Telerik libraries. The new Telerik Reporting libraries for .NET Core projects are available through Telerik NuGet private feed - [Telerik Reporting NuGet packages](../installation-installing-from-msi#installing-telerik-reporting).

3. Update Microsoft.AspNetCore libraries to newer version (if needed).

4. App configuration in ASP.NET Core uses the new SDK-style project and utilizes appsettings.json as a configuration file. The **ConnectionStrings** setting should be configured in JSON-based format like for example:

  ```JavaScript
  //appsettings.json
  "ConnectionStrings": [
    {
      "name": "Telerik.Reporting.Examples.CSharp.Properties.Settings.TelerikConnectionString",
      "connectionString": "Data Source=.\\SQLEXPRESS;Initial Catalog=AdventureWorks;Integrated Security=true",
      "providerName": "System.Data.SqlClient"
    }
  ]
  ```
5. I need to mention that **appsettings.json** would be respected if there is an additional configuration included in **Startup.cs**. In our demos, we provide a new class named ConfigurationService which ensure reading the appsettings.json as config file and used in the ReportsController constructor:

  ```CSharp
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
  ```
  
## Notes
A sample demo could be downloaded from [here](https://www.telerik.com/docs/default-source/knowledgebasearticleattachments/reporting/core2-2withembedservice.zip?sfvrsn=bbac0990_2).
