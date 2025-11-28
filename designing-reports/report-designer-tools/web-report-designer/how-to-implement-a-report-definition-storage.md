---
title: Report Definition Storage
page_title: Implementing custom report definition storage for the web designer
description: "Learn how to implement a custom report definition storage for the Telerik Web Report Designer through the IDefinitionStorage interface."
slug: telerikreporting/designing-reports/report-designer-tools/web-report-designer/how-to-implement-a-report-definition-storage
tags: how,to,implement,a,report,definition,storage
published: True
reportingArea: WRDRestService, WRDRestServiceCore
position: 5
previous_url: /how-to-implement-a-report-definition-storage
---

# Report Definition Storage Overview

The Report Definition Storage is a mandatory dependency component of the server-side Web Report Designer. This dependency is passed in the startup configuration. Its main purpose is to browse the available reports, retrieve and provide the report definition content when requested by name, save the content back in the repository when the save operation is requested, and delete report definitions. A component should implement the [`IDefinitionStorage`](/api/Telerik.WebReportDesigner.Services.IDefinitionStorage) interface so that it suits the needs of the designer and gets accepted in the configuration. The storage is passed as a setting of the [`ReportDesignerServiceConfiguration`](/api/Telerik.WebReportDesigner.Services.ReportDesignerServiceConfiguration).

## Available Report Definition Storage implementations

Out of the box, Telerik Reporting provides the [`FileDefinitionStorage`](/api/telerik.webreportdesigner.services.filedefinitionstorage) storage implementation that enables using the server-side file system as a reports repository. It supports all declarative [report definition]({%slug on-telerik-reporting%}#report-definition) files, e.g., `TRDP`, `TRDX`, and `TRBP`. It accepts a base directory that represents the root of the reports repository.

Additionally, an `IDefinitionStorage` implementation using MSSQL database and Entity Framework Core for .NET 8 is available in our GitHub Reporting Samples repository [SqlDefinitionStorageExample](https://github.com/telerik/reporting-samples/tree/master/SqlDefinitionStorageExample). More details about the specific implementation may also be found in the KB article [Implementing EFCore MSSQL IDefinitionStorage]({%slug implement-database-definition-storage-efcore%})

## Using Custom Report Definition Storage

To provide open and save functionality for reports stored differently, you need to implement the [`IDefinitionStorage`](/api/Telerik.WebReportDesigner.Services.IDefinitionStorage) interface. For example, you may need to enable the Web Report Designer to load reports from a specific database, cloud provider, in-memory cache, etc.

The easiest way to start implementing the needed storage is to copy the [SqlDefinitionStorageExample](https://github.com/telerik/reporting-samples/tree/master/SqlDefinitionStorageExample) storage and start changing it to meet your scenario.

To pass the new storage implementation, change the [`ReportDesignerServiceConfiguration.DefinitionStorage`](/api/Telerik.WebReportDesigner.Services.ReportDesignerServiceConfiguration#Telerik_WebReportDesigner_Services_ReportDesignerServiceConfiguration_DefinitionStorage) property to point to an instance of the class with the custom implementation of the definition storage, for example:

{{source=CodeSnippets\CS\API\Telerik\WebReportDesigner\ReportDesignerController.cs region=ReportDesignerServiceConfiguration}}

The Web Report Designer previews the reports in the [HTML5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%}). The latter utilizes a [Telerik Reporting REST Service]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/overview%}) to render the reports. The [client-side reportSource]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/reportsource()%}) sent by the web designer is resolved to a [server-side ReportSource]({%slug telerikreporting/designing-reports/report-sources/overview%}#available-report-sources) by the `Resolve` method of the Reporting REST Service [ReportSource Resolver]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-service-report-source-resolver/overview%}). The ReportSource resolver is supposed to read report definitions created with the web report designer. For that reason, in the most of the cases when creating custom `IDefinitionStorage` it will be necessary to create also a [custom IReportSourceResolver]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-service-report-source-resolver/how-to-implement-a-custom-report-source-resolver%}) that can read the report definitions from the storage and return them as valid server-side ReportSources.

## See Also

* [Implementing EFCore MSSQL IDefinitionStorage]({%slug implement-database-definition-storage-efcore%})
* [Sample Project `SqlDefinitionStorageExample`](https://github.com/telerik/reporting-samples/tree/master/SqlDefinitionStorageExample)
