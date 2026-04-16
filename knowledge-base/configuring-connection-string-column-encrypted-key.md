---
title: Building Connection String for Column Encrypted Key
description: "Learn how to configure a connection string for Telerik Reporting to support columns with Column Encryption Key in an ASP.NET Core application."
type: how-to
page_title: Configuring Connection String for Column Encrypted Key in Telerik Reporting
meta_title: Configuring Connection String for Column Encrypted Key in Telerik Reporting
slug: configuring-connection-string-column-encrypted-key
tags: telerik, reporting, connection-string, column-encryption, asp.net-core
res_type: kb
ticketid: 1712873
---

## Description

I created a report in Telerik Reporting with a column that uses a Column Encryption Key. Using the `Column Encryption Setting=Enabled` connection string, I successfully displayed the encrypted column in the Telerik Report Designer. However, when I applied the same connection string in an ASP.NET Core application's `appsettings.json`, an error occurred.

## Error Message

```error
Unable to get report parameters. Unable to establish a connection to the database. Please verify that your connection string is valid. In case you use a named connection string from the application configuration file, make sure the name is correct and the connection string settings are present in the configuration file of your application.
```

## Solution

1. Install the [Microsoft.Data.SqlClient](https://www.nuget.org/packages/microsoft.data.sqlclient) NuGet package, which is required for Always Encrypted support in Telerik Reporting:
   
   ```bash
   dotnet add package Microsoft.Data.SqlClient
   ```

1. Update the `appsettings.json` configuration to use the **Microsoft.Data.SqlClient** data provider:
   
   ```json
   "CONNECTION_ALIAS": {
       "connectionString": "Data source=localhost;initial catalog=XXXX;User ID=XXXXX; Password=XXXXXXX; MultipleActiveResultSets=true;MultiSubnetFailover=False;Encrypt=False;Column Encryption Setting=Enabled;",
       "providerName": "Microsoft.Data.SqlClient"
   }
   ```

   > tip Adding `Encrypt=False` to the connection string may be necessary depending on your SQL Server setup.

   Run the application and verify that the Telerik Reporting displays the encrypted columns correctly.

## See Also

* [Telerik Reporting Documentation - Using Microsoft SQL Client Data Provider](slug:telerikreporting/designing-reports/connecting-to-data/data-source-components/sqldatasource-component/using-data-providers/using-microsfost-data-sqlclient-data-provider)
