---
title: Implementing Report Definition Storage
page_title: Implementing a custom report definition storage for the web report designer
description: "Learn how to implement a custom report definition storage for the Telerik Web Report Designer though the IDefinitionStorage interface."
slug: telerikreporting/designing-reports/report-designer-tools/web-report-designer/how-to-implement-a-report-definition-storage
tags: how,to,implement,a,report,definition,storage
published: True
position: 5
previous_url: /how-to-implement-a-report-definition-storage
---

# Using Custom Report Definition Storage

This article describes how to use the Web Report Designer to design reports that are stored in a custom storage location.

## Overview

Out-of-the-box, we provide a [`FileDefinitionStorage`](/api/telerik.webreportdesigner.services.filedefinitionstorage) that is configured to use the file system. To open reports stored differently, you need to implement the [`IDefinitionStorage`](/api/Telerik.WebReportDesigner.Services.IDefinitionStorage) interface. This will enable the web designer to load reports from a custom location, such as a database, cloud, in-memory, etc.

> The Web Report Designer previews the reports in the [HTML5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%}). The latter utilizes a [Telerik Reporting REST Service]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/overview%}) to render the reports. The [client-side reportSource]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/reportsource()%}) sent by the web designer is resolved to a [server-side ReportSource]({%slug telerikreporting/designing-reports/report-sources/overview%}#available-report-sources) by the `Resolve` method of the Reporting REST Service [ReportSource Resolver]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-service-report-source-resolver/overview%}). The ReportSource resolver is supposed to read report definitions created with the web report designer. For that reason, in the most of the cases when creating custom `IDefinitionStorage` it will be necessary to create also a [custom IReportSourceResolver]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-service-report-source-resolver/how-to-implement-a-custom-report-source-resolver%}) that is able to read the report definitions from the storage and return them as valid server-side ReportSources.

## Implement Custom Storage

The purpose of the report definition storage is to describe how to browse, open, save, and delete reports from the Web Report Designer. The storage is configured as a setting of the [`ReportDesignerServiceConfiguration`](/api/Telerik.WebReportDesigner.Services.ReportDesignerServiceConfiguration).

The default implementation of the storage is the [`FileDefinitionStorage`](/api/telerik.webreportdesigner.services.filedefinitionstorage). It provides functionality for working with `TRDP`/`TRDX` report files stored on the server-side file system. To load the reports from a custom storage, change the [`ReportDesignerServiceConfiguration.DefinitionStorage`](/api/Telerik.WebReportDesigner.Services.ReportDesignerServiceConfiguration#Telerik_WebReportDesigner_Services_ReportDesignerServiceConfiguration_DefinitionStorage) property to point to an instance of the class with the custom implementation of the definition storage, for example:

{{source=CodeSnippets\CS\API\Telerik\WebReportDesigner\ReportDesignerController.cs region=ReportDesignerServiceConfiguration}}

A full implementation of a custom `IDefinitionStorage` using MSSQL database and Entity Framework Core for .NET 7 is available in our GitHub Reporting Samples repository [SqlDefinitionStorageExample](https://github.com/telerik/reporting-samples/tree/master/SqlDefinitionStorageExample). More details about the specific implementation may be found also in the KB article [Implementing EFCore MSSQL IDefinitionStorage]({%slug implement-database-definition-storage-efcore%})

## See Also

* [Implementing EFCore MSSQL IDefinitionStorage]({%slug implement-database-definition-storage-efcore%})
* [Sample Project `SqlDefinitionStorageExample`](https://github.com/telerik/reporting-samples/tree/master/SqlDefinitionStorageExample)
