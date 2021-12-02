---
title: HTML5 Report Viewer and Reporting REST services
page_title: HTML5 Report Viewer and Reporting REST services | for Telerik Reporting Documentation
description: HTML5 Report Viewer and Reporting REST services
slug: telerikreporting/using-reports-in-applications/export-and-configure/cache-management/html5-report-viewer-and-reporting-rest-services
tags: html5,report,viewer,and,reporting,rest,services
published: True
position: 0
---

# HTML5 Report Viewer and Reporting REST services



The [HTML5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%}) is a client-side widget         served by a running instance of [Telerik Reporting REST Service]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/overview%}).         The state of the report displayed in the viewer is preserved between requests by the __Reporting REST Service__          and having reports' __cache storage is obligatory__ .       

To configure the Reporting REST service cache you can choose         between the available storage implementations - [REST Service Storage Settings]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-service-storage/overview%}).         The cache storage settings must be considered with the type of hosting of the Reporting REST Service.       

## Cache Management

The following actions are performed on displaying a report in the HTML5 Report Viewer:

1. On loading the page with the HTML5 Viewer, the viewer sends a request to the Reporting REST service to cache a viewer with an unique clientId;

1. The client-side report source (report description as a string and parameters collection in a JSON formatted string) is sent to the Reporting REST service               in a request for information about visible parameters;             

1. The Reporting REST service resolves the received string description to a valid server-side report source object               through its [report source resolver]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-service-report-source-resolver/overview%}) set in the               service's configuration. Then the service returns JSON serialized information about               the report's __ReportParameters__  collection. The HTML5 Viewer generates its Parameters Area               based on the information for visible report parameters, their types and default|initial values;             

1. The client-side report source (report description as a string and parameters collection in a JSON formatted string) is sent to the Reporting REST service               in a request for registering the report instance on the server;             

1. The Reporting REST service resolves the received string description to a valid server-side report source object               through its [report source resolver]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-service-report-source-resolver/overview%}) set in the               service's configuration. Then the service caches the server-side report source with an unique instanceId for the current clientId;             

1. The viewer sends a request for creating a document with appropriate rendering format.               The service adds a cache entry for the document with an unique documentId for the current instanceId;             

1. The client (HTML5 Viewer) awaits the report processing and rendering on the server to end.               The viewer requests the state of the document and the number of rendered page on an even interval from the Reporting REST service.             

1. When the first page is ready, the viewer requests the page and it is displayed. The polling continues untill all document pages are ready.               Additional requests for resources as images may follow. All pages and resources are cached by the service.             

The communication between the HTML5 Viewer and Reporting REST Service happens via AJAX requests.           More details about the type of each request to the service can be found in the           [REST API]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/overview%}).          

>note If you connect a [WinForms ReportViewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/windows-forms-application/how-to-use-windows-forms-report-viewer-with-rest-service%}) or             [WPF ReportViewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/wpf-application/how-to-use-wpf-report-viewer-with-rest-service%}) to a Reporting REST Service instance,             there will be a new ClientId generated on each request sent by the desktop viewer.           


## 

On each interaction with the report in the HTML5 Viewer, the service accesses the cache storage provided           in the service's configuration (ReportServiceConfiguration property).           The current client ID, instance ID and document ID are used to locate the correct           resources for the report and return them to the viewer.         

The created cache records expiration period as well as other service settings may be setup           using an implementation of the  [IReportServiceConfiguration](/reporting/api/Telerik.Reporting.Services.IReportServiceConfiguration)            interface as service configuration.           See the [How to implement the ReportsController in an application]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/asp.net-web-api-implementation/how-to-implement-the-reportscontroller-in-an-application%})           and the [How to Add Telerik Reporting REST ServiceStack to Web Application]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/servicestack-implementation/how-to-add-telerik-reporting-rest-servicestack-to-web-application%})           help articles accordingly for implementation details.         

Important cache management related properties of the IReportServiceConfiguration:

* __[ClientSessionTimeout](/reporting/api/Telerik.Reporting.Services.IReportServiceConfiguration#Telerik_Reporting_Services_IReportServiceConfiguration_ClientSessionTimeout) property__ Gets or sets a value in minutes indicating how long a client(viewer) session will be preserved in the service storage after the               last interaction initiated by this client. When this timeout expires, operations with the viewer will not be possible               - there must be registered a new client(viewer).             The entries of expired clients are removed automatically when a new HTML5 Viewer(client) is registered in the cache storage.

* __[ReportSharingTimeout](/reporting/api/Telerik.Reporting.Services.IReportServiceConfiguration#Telerik_Reporting_Services_IReportServiceConfiguration_ReportSharingTimeout) property__ Gets or sets a value in minutes indicating how long a rendered report document from a client will be available to be reused,               by the current and other clients which request the same report, with the same report parameter values, and in the same rendering format.               When a report is rendered once for a given set of report parameter values, it can be reused for the               time set as ReportSharingTimeout. Setting the ReportSharingTimeout to zero (default) will cause each client request for a report to produce a               new report document instead of reusing an already rendered document.             

   >note When you navigate to reports via [NavigateToReportAction]({%slug telerikreporting/designing-reports/adding-interactivity-to-reports/actions/drillthrough-report-action%})                 the Reporting engine always creates a new instance of the target report.               

# See Also

