```markdown
---
title: Building Telerik Reporting Connection String for Column Encrypted Key
description: Learn how to configure a connection string for Telerik Reporting to support columns with Column Encryption Key in an ASP.NET Core application.
type: how-to
page_title: Configuring Connection String for Column Encrypted Key in Telerik Reporting
meta_title: Configuring Connection String for Column Encrypted Key in Telerik Reporting
slug: configuring-connection-string-column-encrypted-key
tags: telerik, reporting, connection-string, column-encryption, asp.net-core
res_type: kb
ticketid: 1712873
---

## Environment

<table>
<tbody>
<tr>
<td> Product </td>
<td> Reporting </td>
</tr>
<tr>
<td> Version </td>
<td> 19.3.25.1119 </td>
</tr>
</tbody>
</table>

## Description

I created a report in Telerik Reporting with a column that uses a Column Encryption Key. Using the `Column Encryption Setting=Enabled` connection string, I successfully displayed the encrypted column in the Telerik Report Designer. However, when I applied the same connection string in an ASP.NET Core application's `appsettings.json`, an error occurred.

This knowledge base article also answers the following questions:
- How to use Always Encrypted with Telerik Reporting in ASP.NET Core?
- Why does the connection string with Column Encryption Setting cause an error in ASP.NET Core?
- How to fix connection string issues for encrypted columns in Telerik Reporting?

## Solution

To resolve the issue, follow these steps:

1. Install the required NuGet package:
   Install the `Microsoft.Data.SqlClient` NuGet package, which is required for Always Encrypted support in Telerik Reporting:
   ```bash
   dotnet add package Microsoft.Data.SqlClient --version 7.0.0
   ```

2. Update the `appsettings.json` configuration:
   Modify the connection string and provider as follows:
   ```json
   "XXX_Reports": {
       "connectionString": "Data source=localhost;initial catalog=XXXX;User ID=XXXXX; Password=XXXXXXX; MultipleActiveResultSets=true;MultiSubnetFailover=False;Encrypt=False;Column Encryption Setting=Enabled;",
       "providerName": "Microsoft.Data.SqlClient"
   }
   ```

   Note: Adding `Encrypt=False` to the connection string may be necessary depending on your SQL Server setup.

3. Register the provider factory in your application startup code:
   Add the following code snippet in the application startup to ensure the correct provider is registered:
   ```csharp
   using Microsoft.Data.SqlClient;
   using System.Data.Common;

   DbProviderFactories.RegisterFactory("Microsoft.Data.SqlClient", SqlClientFactory.Instance);
   ```

4. Test the configuration:
   Run the application and verify that the Telerik Reporting displays the encrypted columns correctly.

## See Also

- [Telerik Reporting Documentation - Using Microsoft SQL Client Data Provider](https://www.telerik.com/products/reporting/documentation/designing-reports/connecting-to-data/data-source-components/sqldatasource-component/using-data-providers/using-microsoft-data-sqlclient-data-proivder#setting-up-the-microsoft-data-sqlclient-data-provider-in-net-applications)
- [NuGet Gallery | Microsoft.Data.SqlClient](https://www.nuget.org/packages/Microsoft.Data.SqlClient/)
```
