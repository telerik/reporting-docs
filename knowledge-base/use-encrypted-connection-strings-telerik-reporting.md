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

The project's connection strings are stored encrypted in the `appsettings.json` configuration file and when the [SqlDataSource]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/sqldatasource-component/overview%}) component attempts to connect using a *shared* connection resolved from the configuration, it fails due to the connection string being encrypted.

In this article, we will demonstrate how to use encrypted connection strings with [SqlDataSource]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/sqldatasource-component/overview%}) (including those that are used within [SharedDataSource components]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/shareddatasource-component%})) in both the [HTML5 Report Viewers]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%}) and the [Web Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/web-report-designer/overview%}).

## Solution

### Decrypting Connection Strings for SqlDataSource Components - HTML5 Report Viewers

To assign a decrypted connection string to the [ConnectionString](/api/telerik.reporting.sqldatasource#Telerik_Reporting_SqlDataSource_ConnectionString) property of a [SqlDataSource component]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/sqldatasource-component/overview%}), it will be necessary to implement a custom [IReportSourceResolver](/api/telerik.reporting.services.ireportsourceresolver) in whose's [Resolve](/api/telerik.reporting.services.ireportsourceresolver#Telerik_Reporting_Services_IReportSourceResolver_Resolve_System_String_Telerik_Reporting_Services_OperationOrigin_System_Collections_Generic_IDictionary_System_String_System_Object__) method, we can [unpackage]({%slug telerikreporting/using-reports-in-applications/program-the-report-definition/package-report-definition%}#unpackaging) or [deserialize]({%slug telerikreporting/using-reports-in-applications/program-the-report-definition/serialize-report-definition-in-xml%}#deserialize-from-xml) our TRDP/TRDX report. This will create a [Telerik.Reporting.Report](/api/telerik.reporting.report) instance upon which we can invoke the [GetDataSources()](/api/telerik.reporting.report#Telerik_Reporting_Report_GetDataSources) method to get references of all data source components in the report and filter them by the `SqlDataSource` type:

````CSharp
using Microsoft.Extensions.Configuration;
using System.Collections.Generic;
using System.Linq;
using Telerik.Reporting;
using Telerik.Reporting.Services;

namespace CSharp.Net8.Html5IntegrationDemo
{
    public class CustomReportSourceResolver(IConfiguration configuration) : IReportSourceResolver
    {
        private IConfiguration _configuration = configuration;

        public Telerik.Reporting.ReportSource Resolve(string reportId, OperationOrigin operationOrigin, IDictionary<string, object> currentParameterValues)
        {
            var reportPacker = new ReportPackager();
            Report report = null;

            using (var sourceStream = System.IO.File.OpenRead(reportId))
            {
                report = (Report)reportPacker.UnpackageDocument(sourceStream);
            }

            var sqlDataSources = report.GetDataSources().OfType<SqlDataSource>();

            foreach (var sqlDataSource in sqlDataSources)
            {
                string encryptedConnectionString = _configuration.GetSection($"ConnectionStrings:{sqlDataSource.ConnectionString}").Value; // Get the encrypted connection string from the config
                sqlDataSource.ConnectionString = DecryptClass.DecryptConnectionString(encryptedConnectionString); // Decrypt the connection string and assign it to the SqlDataSource componnent 
            }

            return new InstanceReportSource() { ReportDocument = report };

        }
    }
}
````

To use the custom [IReportSourceResolver](/api/telerik.reporting.services.ireportsourceresolver), it must be registered on the [ReportSourceResolver]() property of the [ReportServiceConfiguration](/api/telerik.reporting.services.reportserviceconfiguration) class in `Program.cs`/`Startup.cs`:

````CSharp
// Configure dependencies for ReportsController.
builder.Services.TryAddSingleton<IReportServiceConfiguration>(sp =>
    new ReportServiceConfiguration
    {
        HostAppId = "ReportingNet8",
        Storage = new FileStorage(),
        ReportSourceResolver = new CustomReportSourceResolver(sp.GetService<IConfiguration>())
    });
````

### Decrypting Connection Strings for SqlDataSource Components in SubReports/Navigate To Report Action - HTML5 Report Viewers



### Decrypting Connection Strings for SqlDataSource Components - Web Report Designer

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

### Decrypting Connection Strings for SharedDataSource Components

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
