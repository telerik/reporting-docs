---
title: Resolving "Unable to Find the Requested .NET Framework Data Provider" error when using Oracle.DataAccess unmanaged driver
description: "Learn how to resolve the 'Unable to find the requested .NET Framework Data Provider' error when using Oracle.DataAccess unmanaged driver."
type: how-to
page_title: Fixing Missing .NET Framework Data Provider Error in Telerik Reporting for Oracle Unmanaged Driver
meta_title: Fixing Missing .NET Framework Data Provider Error in Telerik Reporting for Oracle Unmanaged Driver
slug: fixing-missing-net-framework-data-provider-error-reporting-oracle-unmanaged
tags: reporting, sqldatasource, oracle, dataaccess, .net-framework-provider
res_type: kb
ticketid: 1712742
---

## Description

When exporting reports in Telerik Reporting, the error **"Unable to find the requested .NET Framework Data Provider. It may not be installed"** might occur. 

This issue arises when using the Oracle unmanaged driver `Oracle.DataAccess` and the required data provider is not registered in the .NET Framework configuration. 

Database access may still function because the Oracle client libraries are present, but Telerik Reporting will fail due to the missing provider registration.

## Solution

1. **Install the Oracle Data Access Components (ODAC):**
   * Download the appropriate ODAC package from the [Oracle .NET Downloads](https://www.oracle.com/database/technologies/net-downloads.html).
   * Choose the **ODAC with Oracle Developer Tools for Visual Studio** package matching your server architecture (64-bit for most IIS x64 app pools).
   * Run the installer. This will:
     * Install the Oracle Client and register the `Oracle.DataAccess.dll` in the GAC.
     * Register the `Oracle.DataAccess.Client` provider in the machine.config under `<DbProviderFactories>`.
     * Install the Oracle networking layer for TNS name resolution.
   * Ensure the `tnsnames.ora` file is reachable by placing it in the Oracle home `network/admin` folder or setting the `TNS_ADMIN` environment variable to its location.
   * Recycle the IIS application pool after installation.

2. **Manually Register the Data Provider (if installer cannot be used):**
   * Add the following configuration to your application's `web.config`:
   
     ```xml
     <configuration>
       <system.data>
         <DbProviderFactories>
           <remove invariant="Oracle.DataAccess.Client" />
           <add name="ODP.NET, Unmanaged Driver"
                invariant="Oracle.DataAccess.Client"
                description="Oracle Data Provider for .NET, Unmanaged Driver"
                type="Oracle.DataAccess.Client.OracleClientFactory, Oracle.DataAccess, Version=4.122.21.1, Culture=neutral, PublicKeyToken=89b483f429c47342" />
         </DbProviderFactories>
       </system.data>
     </configuration>
     ```
     
   * Adjust the `Version` to match the exact version of `Oracle.DataAccess.dll` you are deploying.
   * Ensure the following:
     * `Oracle.DataAccess.dll` and its native dependencies (e.g., `oci.dll`, `oraociei*.dll`) are accessible either in the [GAC](https://learn.microsoft.com/en-us/dotnet/framework/app-domains/gac) and Oracle home or in the application's `bin` folder.
     * An Oracle client is installed for TNS name resolution.

3. **Configure the Connection String:**
   * Update the connection string in the `web.config` to use the TNS name and the correct provider:
     
     ```xml
     <connectionStrings>
       <add name="OracleConn"
            connectionString="Data Source=YOUR_TNS_NAME;User Id=myUser;Password=myPass;"
            providerName="Oracle.DataAccess.Client" />
     </connectionStrings>
     ```
     
   * Ensure the `providerName` matches the invariant name of the unmanaged driver: `Oracle.DataAccess.Client`.

### Alternative Approach Without Installing the Driver
  
If installing the data provider is not possible, manually register the provider as described in the following article: [Registering SqlDataSource Data Providers Without Installing Driver](slug:how-to-register-sqldatasource-data-providers-without-driver-installation).

> note Although the example uses the `Npgsql` provider, the same concept applies to other providers like `Oracle.DataAccess`.

## See Also

* [Using ODP.NET Data Provider](slug:telerikreporting/designing-reports/connecting-to-data/data-source-components/sqldatasource-component/using-data-providers/using-odpnet-data-provider)
* [Registering SqlDataSource Data Providers Without Installing Driver](slug:how-to-register-sqldatasource-data-providers-without-driver-installation)
* [Oracle .NET Downloads](https://www.oracle.com/database/technologies/net-downloads.html)
