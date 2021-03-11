---
title: How to Retrieve the Oracle Connection Strings from Environment Variables
description: This article explains how to get the Oracle connection string from environment variable in .NET Core 
type: troubleshooting
page_title: Retrieving the Connection Strings from Environment Variables in .NET Core 
slug: how-to-retrieve-the-oracle-connection-strings-from-environment-variables
position: 
tags: 
ticketid: 1504053
res_type: kb
---

## Environment
<table>
	<tbody>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
		</tr>
	</tbody>
</table>


## Description
In order to retrieve the connection strings from environment variables, the keys there must be formatted in a specific way, so they can be read from the underlying **IConfiguration**. 

## Solution
A single key-value pair is not sufficient to define the Oracle connection string and provider name, so environment should hold two separate entries - one for the connection string and one - for the provider name:
 
 ```CSharp
 /// <summary>
        /// Loads a reporting configuration from a specific JSON-based configuration file.
        /// </summary>
        /// <param name="environment">The current web hosting environment used to obtain the content root path</param>
        /// <returns>IConfiguration instance used to initialize the Reporting engine</returns>
        static IConfiguration ResolveSpecificReportingConfiguration(IWebHostEnvironment environment)
        {
            Environment.SetEnvironmentVariable("MyOracleApp_ConnectionStrings:OracleConn:connectionString", "Data Source=reportingvista;User Id=telerik;Password=telerikpass");
            Environment.SetEnvironmentVariable("MyOracleApp_ConnectionStrings:OracleConn:providerName", "Oracle.ManagedDataAccess.Client");
            return new ConfigurationBuilder()
                .AddEnvironmentVariables("MyOracleApp_")
                .Build();
        }
```

The first two lines just set the environment variables that contain information about the connection and provider name. Note the specific colon character (:)that acts as a delimiter between the keys hierarchy. **MyOracleApp_** is used as a prefix by which the environment variables will be filtered from the rest.

The method **ResolveSpecificReportingConfiguration** must be called in the **Startup.cs** like this:

 ```CSharp
// Configure dependencies for ReportsController.
            services.TryAddSingleton<IReportServiceConfiguration>(sp =>
                new ReportServiceConfiguration
                {

                    // In case the ReportingEngineConfiguration needs to be loaded from a specific configuration file, use the approach below:
                    ReportingEngineConfiguration = ResolveSpecificReportingConfiguration(this.WebHostEnvironment),
                    HostAppId = "Html5DemoAppCore3",
                    Storage = new FileStorage(),
                    ReportSourceResolver = new TypeReportSourceResolver().AddFallbackResolver(
                                           new UriReportSourceResolver(reportsPath))
                });
```



## See Also
[How to Connect to an Oracle Database](../how-to-sqldatasource-oracle)
