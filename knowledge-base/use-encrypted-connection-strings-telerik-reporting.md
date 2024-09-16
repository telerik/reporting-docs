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

To use the custom [IReportSourceResolver](/api/telerik.reporting.services.ireportsourceresolver), it must be registered on the [ReportSourceResolver](/api/telerik.reporting.services.reportserviceconfiguration#Telerik_Reporting_Services_ReportServiceConfiguration_ReportSourceResolver) property of the [ReportServiceConfiguration](/api/telerik.reporting.services.reportserviceconfiguration) class in `Program.cs`/`Startup.cs`:

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

To use the decrypted connection strings in [SqlDataSource components]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/sqldatasource-component/overview%}) of reports that are used as [SubReports]({%slug telerikreporting/designing-reports/report-structure/subreport%}) or those who are loaded with the [Navigate To Report]({%slug telerikreporting/designing-reports/adding-interactivity-to-reports/actions/drillthrough-report-action%}) action, it is necessary to also implement the [IReportDocumentResolver](/api/telerik.reporting.services.ireportdocumentresolver) interface since it handles those cases. We can use the approach from the previous section:

````CSharp
using System.IO;
using System;
using Telerik.Reporting;
using Telerik.Reporting.Services;
using System.Linq;
using Microsoft.Extensions.Configuration;

namespace CSharp.Net8.Html5IntegrationDemo
{
    public class CustomDocumentResolver(IConfiguration configuration) : IReportDocumentResolver
    {
        private IConfiguration _configuration = configuration;
        readonly string BaseDir = "C:\\Reports";
        public IReportDocument Resolve(ReportSource reportSource)
        {
            // The main report is wrapped in an InstanceReportSource by CustomReportSourceResolver
            if (reportSource is InstanceReportSource)
            {
                return (reportSource as InstanceReportSource).ReportDocument;
            }
            // the subreport is resolved in the context of the main report SubReport
            else if (reportSource is UriReportSource)
            {
                var reportPackager = new ReportPackager();
                var uri = (reportSource as UriReportSource).Uri.Replace(AppDomain.CurrentDomain.BaseDirectory, string.Empty);

                var reportPacker = new ReportPackager();
                Report report = null;

                using (var sourceStream = System.IO.File.OpenRead(Path.Combine(BaseDir, uri)))
                {
                    report = (Report)reportPacker.UnpackageDocument(sourceStream);
                }

                var sqlDataSources = report.GetDataSources().OfType<SqlDataSource>();

                foreach (var sqlDataSource in sqlDataSources)
                {
                    string encryptedConnectionString = _configuration.GetSection($"ConnectionStrings:{sqlDataSource.ConnectionString}").Value; // Get the encrypted connection string from the config
                    sqlDataSource.ConnectionString = DecryptClass.DecryptConnectionString(encryptedConnectionString); // Decrypt the connection string and assign it to the SqlDataSource componnent 
                }

                return report;
            }
            return null;
        }
    }
}

````

To use the custom [IReportDocumentResolver](/api/telerik.reporting.services.ireportdocumentresolver), it must be registered on the [ReportDocumentResolver](/api/telerik.reporting.services.reportserviceconfiguration#Telerik_Reporting_Services_ReportServiceConfiguration_ReportDocumentResolver) property of the [ReportServiceConfiguration](/api/telerik.reporting.services.reportserviceconfiguration) class in `Program.cs`/`Startup.cs`:

````CSharp
// Configure dependencies for ReportsController.
builder.Services.TryAddSingleton<IReportServiceConfiguration>(sp =>
    new ReportServiceConfiguration
    {
        HostAppId = "ReportingNet8",
        Storage = new FileStorage(),
        ReportSourceResolver = new CustomReportSourceResolver(sp.GetService<IConfiguration>()),
        ReportDocumentResolver = new CustomReportDocumentResolver(sp.GetService<IConfiguration>())
    });
````

### Decrypting Connection Strings for SqlDataSource Components - Web Report Designer

When using the [Web Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/web-report-designer/overview%}), if connection strings stored in the coonfiguration file(e.g. `appsettings.json`) are encrypted, it will be necessary to use a custom implementation of the [ISettingsStorage](/api/telerik.webreportdesigner.services.isettingsstorage) interface to return decrypted connections. 

In the [ISettingsStorage.GetConnections()](/api/telerik.webreportdesigner.services.isettingsstorage#collapsible-Telerik_WebReportDesigner_Services_ISettingsStorage_GetConnections) method, we must return a list of the connections with *decrypted* connection strings. This list will be used by the Web Report Designer on the client to send the connections to the server, and retrieve data.

The [ISettingsStorage.AddConnection(ConnectionInfo)](/api/telerik.webreportdesigner.services.isettingsstorage#Telerik_WebReportDesigner_Services_ISettingsStorage_AddConnection_Telerik_Reporting_Data_Schema_ConnectionInfo_) method will be executed when an end-user adds a new connection through the Web Report Designer client. The connection string here will be as is and we will need to save it decrypted in the configuration.

````CSharp
using Microsoft.Extensions.Configuration;
using Newtonsoft.Json;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using Telerik.Reporting.Data.Schema;
using Telerik.WebReportDesigner.Services;

namespace CSharp.Net8.Html5IntegrationDemo
{
    public class CustomSettingsStorage(IConfiguration configuration, string settingsDirectory) : ISettingsStorage
    {
        readonly FileSettingsManager settingsManager = new FileSettingsManager(settingsDirectory);
        readonly IConfiguration _configuration = configuration;

        public IEnumerable<ConnectionInfo> GetConnections()
        {
            var configConnections = _configuration.GetSection("ConnectionStrings").GetChildren();
            var settingsConnections = this.settingsManager.GetConnections().ToList();

            foreach (var settingConnection in settingsConnections)
            {
                // Decrypt the saved connections in the WebReportDesigner.json file 
                settingConnection.ConnectionString = DecryptClass.DecryptConnectionString(settingConnection.ConnectionString)
            }

            foreach (var connection in configConnections)
            {
                var connectionInfo = new ConnectionInfo
                {
                    Name = connection.Key,
                    // Decrypt the connection saved in the .json configuration file loaded by the project itself
                    ConnectionString = DecryptClass.DecryptConnectionString(connection.GetSection("connectionString").Value),
                    Provider = connection.GetSection("providerName").Value
                };
                settingsConnections.Add(connectionInfo);
            }

            return settingsConnections;
        }

        public void AddConnection(ConnectionInfo connectionInfo)
        {
            // Encrypt the connection before saving it
            connectionInfo.ConnectionString = EncryptClass.EncryptConnectionString(connectionInfo.ConnectionString);
            this.settingsManager.AddConnection(connectionInfo);
        }
    }

    class WebReportDesignerSettings
    {
        public List<ConnectionInfo> ConnectionStrings { get; set; }

        public WebReportDesignerSettings()
        {
            this.ConnectionStrings = new List<ConnectionInfo>();
        }
    }

    class FileSettingsManager
    {
        static object padlock = new object();

        readonly string settingsDir;
        readonly string settingsFilePath;
        WebReportDesignerSettings settings;

        public FileSettingsManager(string settingsDir)
        {
            const string SettingsFileName = "WebReportDesignerSettings.json";
            this.settingsDir = settingsDir;
            this.settingsFilePath = Path.Combine(settingsDir, SettingsFileName);

            this.InitSettings();
        }

        void InitSettings()
        {
            lock (padlock)
            {
                if (File.Exists(this.settingsFilePath))
                {
                    var text = File.ReadAllText(this.settingsFilePath);
                    this.settings = JsonConvert.DeserializeObject<WebReportDesignerSettings>(text);
                }
                else
                {
                    Directory.CreateDirectory(this.settingsDir);
                    using (File.Create(this.settingsFilePath))
                    {
                    }
                }
            }

            if (this.settings == null)
            {
                this.settings = new WebReportDesignerSettings();
            }
        }

        public void AddConnection(ConnectionInfo connection)
        {
            lock (padlock)
            {
                this.settings.ConnectionStrings.Add(connection);
                File.WriteAllText(this.settingsFilePath, JsonConvert.SerializeObject(this.settings));
            }
        }

        public IEnumerable<ConnectionInfo> GetConnections()
        {
            return this.settings.ConnectionStrings;
        }
    }
}

````

Afterward, set the custom implementation in the [ReportDesignerServiceConfiguration](/api/telerik.webreportdesigner.services.reportdesignerserviceconfiguration). 

````CSharp
builder.Services.TryAddSingleton<IReportDesignerServiceConfiguration>(sp => new ReportDesignerServiceConfiguration
{
    DefinitionStorage = new FileDefinitionStorage(reportsPath, new[] { "Resources", "Shared Data Sources" }),
    ResourceStorage = new ResourceStorage(Path.Combine(reportsPath, "Resources")),
    SharedDataSourceStorage = new FileSharedDataSourceStorage(Path.Combine(reportsPath, "Shared Data Sources")),
    SettingsStorage = new CustomSettingsStorage(sp.GetService<IConfiguration>(), Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData), "Telerik Reporting"))
});
````

### Decrypting Connection Strings for SharedDataSource Components

For reports utilizing the [SharedDataSource components]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/shareddatasource-component%}), the solution is a custom implementation of the [ISharedDataSourceResolver](/api/telerik.reporting.processing.data.ishareddatasourceresolver) interface:

```CSharp
public class CustomSharedDataSourceResolver : ISharedDataSourceResolver
{
    readonly string BaseDir = "C:\\Shared Data Sources Directory";
    public DataSource Resolve(string sharedDataSourceUri)
    {
        var path = Path.Combine(BaseDir, sharedDataSourceUri);
        using var fileStream = new FileStream(path, FileMode.Open, FileAccess.Read, FileShare.Read);
        var sqlDataSource = (Telerik.Reporting.SqlDataSource)new Telerik.Reporting.XmlSerialization.ReportXmlSerializer()
            .Deserialize(fileStream);

        sqlDataSource.ConnectionString = DecryptClass.DecryptConnectionString(sqlDataSource.ConnectionString);

        return sqlDataSource;
    }
}
```

Register the custom [ISharedDataSourceResolver](/api/telerik.reporting.processing.data.ishareddatasourceresolver) in the project's configuration file (e.g., `appsettings.json`) to ensure it is utilized when rendering the reports.

````JSON
  "telerikReporting": {
    "processing": {
      "sharedDataSourceResolver": {
        "provider": "custom",
        "parameters": [
          {
            "name": "typename",
            "value": "CSharp.Net8.Html5IntegrationDemo.CustomSharedDataSourceResolver, CSharp.Net8.Html5IntegrationDemo"
          }
        ]
      }
    }
  }
````

> For more detailed instructions on how to register the custom resolver, refer to the [Configuring the processing Element]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/processing-element%}#shareddatasourceresolver) article.

### Notes

* Ensure the encrypted connection string is correctly decrypted before assigning it to the data source.
* The custom implementations for `ISettingsStorage` and `ISharedDataSourceResolver` must be adjusted based on the specific project's structure and requirements.

## See Also

* [Implementing Custom IReportSourceResolver and IReportDocumentResolver]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-service-report-source-resolver/how-to-use-custom-report-source-resolver-and-custom-report-document-resolver%})
* [Implementing Custom ISettingsStorage](/api/telerik.webreportdesigner.services.isettingsstorage)
* [Configuring the SharedDataSourceResolver via the Processing Element]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/processing-element%}#shareddatasourceresolver)
