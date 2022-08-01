---
title: How to implement a report definition storage
page_title: How to implement a report definition storage 
description: How to implement a report definition storage
slug: telerikreporting/designing-reports/report-designer-tools/web-report-designer/how-to-implement-a-report-definition-storage
tags: how,to,implement,a,report,definition,storage
published: True
position: 5
---

# How to implement a report definition storage

This article describes how to use the Web Report Designer to design reports that are stored in a custom storage location.       

## Overview

Out-of-the-box we provide a __FileDefinitionStorage__ that is configured to use the file system. To open reports stored differently, you need to implement the __IDefinitionStorage__ interface. This will enable the web designer to load reports from a custom location, such as a database, cloud, in-memory, etc. 

> The Web Report Designer previews the reports in [Html5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%}). The latter utilizes a [Telerik Reporting REST Service]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/overview%}) to render the reports. The [client-side reportSource]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/reportsource()%}) sent by the web designer is resolved to a [server-side ReportSource]({%slug telerikreporting/designing-reports/report-sources/overview%}#available-report-sources) by the *Resolve* method of the Reporting REST Service [ReportSource Resolver]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-service-report-source-resolver/overview%}). The ReportSource resolver is supposed to read report definitions created with the web report designer. For that reason, in the most of the cases when creating custom *IDefinitionStorage* it will be necessary to create also a [custom ReportSource resolver]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-service-report-source-resolver/how-to-implement-a-custom-report-source-resolver%}) that is able to read the report definitions from the storage and return them as valid server-side ReportSources.         


## Implement Custom Storage

The purpose of the report definition storage is to describe how to browse, open, save, and delete reports from the Web Report Designer. The storage is configured as a setting of the __ReportDesignerController__. 

The default implementation of the storage is the __FileDefinitionStorage__. It provides functionality for working with TRDP/TRDX report files stored on the server-side file system. To load the reports from a custom storage, change the implementation of the definition storage like this: 

{{source=CodeSnippets\CS\API\Telerik\WebReportDesigner\CustomDefinitionStorage.cs region=CustomDefinitionStorage}}

Then you can set the new definition storage implementation in the __ReportDesignerController__. 

{{source=CodeSnippets\CS\API\Telerik\WebReportDesigner\ReportDesignerController.cs region=ReportDesignerServiceConfiguration}}

