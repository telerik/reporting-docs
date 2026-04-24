```markdown
---
title: Microsoft.Data.Sqlite doesn't work with the SqlDataSource component
description: Learn how to configure SQLite as a DataSource in Telerik Reporting using supported providers and addressing compatibility issues.
type: how-to
page_title: Using SQLite as a DataSource in Telerik Reporting with Proper Configuration
meta_title: Using SQLite as a DataSource in Telerik Reporting with Proper Configuration
slug: microsoft-data-sqlite-datasource-telerik-reporting
tags: reporting, sqlite, datasource, system.data.sqlite, microsoft.data.sqlite
res_type: kb
ticketid: 1713472
---

## Environment
<table>
<tbody>
<tr>
<td> Product </td>
<td> Reporting </td>
</tr>
</tbody>
</table>

## Description

Telerik Reporting can use SQLite as a DataSource for reports. However, issues may arise depending on the SQLite ADO.NET provider used. For example, when using the `Microsoft.Data.Sqlite` provider, errors such as "The requested collection 'DataSourceInformation' is not defined" may occur. This issue arises because `Microsoft.Data.Sqlite` is a lightweight provider that omits the `GetSchema` metadata collections required by Telerik's `SqlDataSource` for parameter and command parsing. 

To avoid this issue, a provider with full ADO.NET implementation, such as `System.Data.SQLite`, must be used.

This knowledge base article also answers the following questions:
- How to use SQLite with Telerik Reporting?
- Why does Microsoft.Data.Sqlite not work with Telerik's SqlDataSource?
- What are the steps to configure SQLite for Telerik Reporting?

## Solution

To configure SQLite as a DataSource in Telerik Reporting, follow these steps:

1. Use the `System.Data.SQLite` provider as it includes the full ADO.NET implementation required for Telerik's `SqlDataSource`.

2. Install the latest version of the `System.Data.SQLite` NuGet package. Version 2.0.3 or later is recommended:
   ```bash
   dotnet add package System.Data.SQLite --version 2.0.3
   ```

3. Register the `System.Data.SQLite` provider in your application using the `DbProviderFactories.RegisterFactory` method:
   ```csharp
   Telerik.Reporting.Processing.Data.DbProviderFactories.RegisterFactory(
       "System.Data.SQLite",
       System.Data.SQLite.SQLiteFactory.Instance);
   ```

4. Configure the connection string for your SQLite database. For example:
   ```csharp
   var connectionString = "Data Source=your-database-file.db;Version=3;";
   ```

5. Use the connection string in the `SqlDataSource` component of your Telerik report.

6. If you encounter errors during runtime, enable tracing in the Reporting Engine to capture detailed logs. Refer to [Troubleshooting Reporting Implementation in ASP.NET Core Application](https://www.telerik.com/products/reporting/documentation/knowledge-base/how-to-troubleshoot-errors-in-asp-net-core-applications) for guidance.

### Additional Notes
- The `Microsoft.Data.Sqlite` provider is not recommended for use with Telerik Reporting due to its lack of support for schema metadata.
- The `System.Data.SQLite` provider is automatically registered by Telerik Reporting and does not require manual registration unless overridden.

## See Also

- [Using SQLite in Reporting](https://www.telerik.com/products/reporting/documentation/designing-reports/connecting-to-data/data-source-components/sqldatasource-component/using-data-providers/using-sqlite-data-provider)
- [How to Register a DbProviderFactory in a .NET Core Project](https://www.telerik.com/products/reporting/documentation/knowledge-base/how-to-register-db-provider-factory-in-net-core-project)
- [Troubleshooting Reporting Implementation in ASP.NET Core Application](https://www.telerik.com/products/reporting/documentation/knowledge-base/how-to-troubleshoot-errors-in-asp-net-core-applications)
- [System.Data.SQLite on NuGet](https://www.nuget.org/packages/system.data.sqlite)
```
