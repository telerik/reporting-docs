---
title: Implementing Encrypted Connection Strings with Telerik Reporting
description: "Learn how to use encrypted connection strings with Telerik Reporting, including handling encrypted strings for data sources and shared data sources in .NET Framework and .NET Core projects".
type: how-to
page_title: How to Use Encrypted Connection Strings in Telerik Reporting
slug: use-encrypted-connection-strings-telerik-reporting
tags: telerik, reporting, encrypted, connection, string, sqldatasource, shareddatasource, .net framework, .net core
res_type: kb
ticketid: 1659115
---

## Environment

| Product | Progress® Telerik® Reporting |
| --- | --- |
| Version | 18.1.24.514 |

## Description

When attempting to use an encrypted connection string from `web.config` or `appsettings.json` for Telerik Reporting, it works initially but fails when used with the data source. This article outlines the steps to implement encrypted connection strings in Telerik Reporting projects, catering to both .NET Framework and .NET Core environments. 

This KB article also answers the following questions:
- How can I decrypt connection strings for Telerik Reporting at runtime?
- Is it possible to use encrypted connection strings with shared data sources in Telerik Reporting?
- How do I configure custom resolvers for encrypted connection strings in Telerik Reporting?

## Solution

### Decrypting Connection Strings for SQL Data Sources

For projects using the [SqlDataSource](https://docs.telerik.com/reporting/designing-reports/connecting-to-data/data-source-components/sqldatasource-component/overview) component in Telerik Reporting, the connection string needs to be decrypted at runtime. Implement custom code to edit the report and assign a decrypted connection string.

Refer to the guide on how to [Modify the Report Data Sources through code](https://docs.telerik.com/reporting/knowledge-base/edit-report-datasources-at-runtime) for more details.

### Handling Encrypted Connection Strings with the Web Report Designer

If using the Web Report Designer, implement the `ISettingsStorage` interface to return decrypted connections. Set the custom implementation in the `ReportDesignerServiceConfiguration`. 

```csharp
new ReportDesignerServiceConfiguration
{
    DefinitionStorage = new FileDefinitionStorage(reportsPath, new[] { "Resources", "Shared Data Sources" }),
    ResourceStorage = new ResourceStorage(Path.Combine(reportsPath, "Resources")),
    SharedDataSourceStorage = new FileSharedDataSourceStorage(Path.Combine(reportsPath, "Shared Data Sources")),
    SettingsStorage = new CustomSettingsStorage(),
}
```

For previewing reports through the Web Report Designer's internal viewer, implement the `IReportSourceResolver` interface to decrypt the connection strings for the reports.

### Using Encrypted Connection Strings with Shared Data Sources

For reports utilizing SharedDataSource components, the solution involves implementing the `ISharedDataSourceResolver` interface. This approach allows passing the decrypted connection string to your components.

```csharp
public class CustomSharedDataSourceResolver : ISharedDataSourceResolver
{
    readonly string BaseDir = "C:\\Shared Data Sources Directory";
    public DataSource Resolve(string sharedDataSourceUri)
    {
        var path = Path.Combine(BaseDir, sharedDataSourceUri);
        using var fileStream = new FileStream(path, FileMode.Open, FileAccess.Read, FileShare.Read);
        var sqlDataSource = (Telerik.Reporting.SqlDataSource)new Telerik.Reporting.XmlSerialization.ReportXmlSerializer()
            .Deserialize(fileStream);

        sqlDataSource.ConnectionString = "DECRYPTED_CONNECTION_STRING";

        return sqlDataSource;
    }
}
```

Register the custom resolver in the project's configuration file (e.g., Web.config) to ensure it's utilized when rendering reports.

For more detailed instructions, refer to the [Configuring the processing Element](https://docs.telerik.com/reporting/doc-output/configure-the-report-engine/processing-element#shareddatasourceresolver) article in the Telerik Reporting documentation.

### Notes

- Ensure the encrypted connection string is correctly decrypted before assigning it to the data source.
- The custom implementations for `ISettingsStorage` and `ISharedDataSourceResolver` must be adjusted based on the specific project's structure and requirements.

## See Also

- [SqlDataSource Component Overview](https://docs.telerik.com/reporting/designing-reports/connecting-to-data/data-source-components/sqldatasource-component/overview)
- [Web Report Designer Overview](https://docs.telerik.com/reporting/designing-reports/report-designer-tools/web-report-designer/overview)
- [Implementing Custom ISettingsStorage](https://docs.telerik.com/reporting/api/telerik.webreportdesigner.services.isettingsstorage)
- [Configuring the Processing Element](https://docs.telerik.com/reporting/doc-output/configure-the-report-engine/processing-element#shareddatasourceresolver)
