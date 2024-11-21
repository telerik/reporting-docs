---
title: Report Viewer and Reporting REST Service
page_title: The Communication between the Viewer and the REST Service Explained
description: "Learn how to use the Telerik Report Viewer and how to configure the Telerik Reporting REST Service so that they can communicate fluently."
slug: telerikreporting/using-reports-in-applications/export-and-configure/cache-management/html5-report-viewer-and-reporting-rest-services
previous_url: /using-reports-in-applications/export-and-configure/cache-management/html5-report-viewer-and-reporting-rest-services, /using-telerik-reporting-in-applications-rest-service-cache-management-overview
tags: telerik, reporting, embedding, reports, html5, report, viewer, reporting, rest, service
published: True
position: 3
---

# Telerik Report Viewer and Telerik Reporting REST Service

Most of the [Telerik Report Viewers]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/overview%}) can connect to a running [Telerik Reporting REST Service]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/overview%}) to request and get report documents rendered server-side. In this article we will use the [HTML5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%}) for clarity. The information regarding the communication between the viewer and the service is valid for the other Report Viewers as well.

The HTML5 Report Viewer is a client-side widget served by a running instance of Telerik Reporting REST Service. The state of the report displayed in the viewer is preserved between requests by the __Reporting REST Service__ and having reports' __cache storage is obligatory__.

To configure the Reporting REST service cache you can choose between the available storage implementations - [REST Service Storage Settings]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-service-storage/overview%}). The cache storage settings must be considered with the type of hosting of the Reporting REST Service.

## The Communication Between the Report Viewer and the Reporting REST Service

The following actions are performed on displaying a report in a viewer that utilizes a Telerik Reporting REST Service for rendering the reports. For example, in the HTML5 Report Viewer:

1. On loading the page with the HTML5 Viewer, the viewer sends a request to the Reporting REST service to cache a viewer with a unique clientId;
1. The client-side report source (report description as a string and parameters collection in a JSON formatted string) is sent to the Reporting REST service in a request for information about visible parameters;
1. The Reporting REST service resolves the received string description to a valid server-side report source object through its [report source resolver]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-service-report-source-resolver/overview%}) set in the service's configuration. Then the service returns JSON serialized information about the report's __ReportParameters__ collection. The HTML5 Viewer generates its Parameters Area based on the information for visible report parameters, their types, and default|initial values;
1. The client-side report source (report description as a string and parameters collection in a JSON formatted string) is sent to the Reporting REST service in a request for registering the report instance on the server;
1. The Reporting REST service resolves the received string description to a valid server-side report source object through its [report source resolver]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-service-report-source-resolver/overview%}) set in the service's configuration. Then the service caches the server-side report source with a unique instanceId for the current clientId;
1. The viewer sends a request for creating a document with the appropriate rendering format. The service adds a cache entry for the document with a unique documentId for the current instanceId;
1. The client (HTML5 Viewer) awaits the report processing and rendering on the server to end. The viewer requests the state of the document and the number of rendered pages on an even interval from the Reporting REST service.
1. When the first page is ready, the viewer requests the page and it is displayed. The polling continues until all document pages are ready. Additional requests for resources as images may follow. All pages and resources are cached by the service.

The communication between the HTML5 Viewer and Reporting REST Service happens via AJAX requests. More details about the type of each request to the service can be found in the [REST API]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/overview%}).

> If you connect a [WinForms ReportViewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/windows-forms-application/how-to-use-windows-forms-report-viewer-with-rest-service%}) or [WPF ReportViewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/wpf-application/how-to-use-wpf-report-viewer-with-rest-service%}) to a Reporting REST Service instance, there will be a new ClientId generated on each request sent by the desktop viewer.

On each interaction with the report in the HTML5 Viewer, the service accesses the cache storage provided in the service's configuration (ReportServiceConfiguration property). The current client ID, instance ID, and document ID are used to locate the correct resources for the report and return them to the viewer.

The Reporting REST Service storage assets expire. The expired assets are cleaned by the service periodically. More details about the storage structure and assets handling may be found in the blog post [Telerik Reporting REST Service Storage Revealed](https://www.telerik.com/blogs/telerik-reporting-rest-service-storage-revealed).

The created cache records expiration period, as well as other service settings, may be set up using an implementation of the  [IReportServiceConfiguration](/api/Telerik.Reporting.Services.IReportServiceConfiguration) interface as service configuration. See the [How to implement the ReportsController in an application]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/asp.net-web-api-implementation/how-to-implement-the-reportscontroller-in-an-application%}) and the [How to Add Telerik Reporting REST ServiceStack to Web Application]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/servicestack-implementation/how-to-add-telerik-reporting-rest-servicestack-to-web-application%}) help articles accordingly for implementation details.

Important cache management-related properties of the IReportServiceConfiguration:

* __[ClientSessionTimeout](/api/Telerik.Reporting.Services.IReportServiceConfiguration#Telerik_Reporting_Services_IReportServiceConfiguration_ClientSessionTimeout) property__ Gets or sets a value in minutes indicating how long a client(viewer) session will be preserved in the service storage after the last interaction initiated by this client. When this timeout expires, operations with the viewer will not be possible - there must be registered a new client(viewer). The entries of expired clients are removed automatically when a new HTML5 Viewer(client) is registered in the cache storage. The value should be positive. The zero (`0`) value is invalid.
* __[ReportSharingTimeout](/api/Telerik.Reporting.Services.IReportServiceConfiguration#Telerik_Reporting_Services_IReportServiceConfiguration_ReportSharingTimeout) property__ Gets or sets a value in minutes indicating how long a rendered report document from a client will be available to be reused, by the current and other clients which request the same report document. Two report documents are considered the same when they both comply with the following conditions:
	+ Use the same Report definition. For example, the same TRDP report file;
	+ Use the same [Report Parameter]({%slug telerikreporting/designing-reports/connecting-to-data/report-parameters/overview%}) values;
	+ The [Interactive Actions]({%slug telerikreporting/designing-reports/adding-interactivity-to-reports/actions/overview%}) are with the same state. For example, the _Toggle Visibility_ is either in expanded or collapsed state, or the _Sorting_ is in the same order;
	+ Are rendered in the same [Export Format]({%slug telerikreporting/using-reports-in-applications/export-and-configure/export-formats%}).

	When a report is rendered once for a given set of the above requirements, it can be reused for the time specified as `ReportSharingTimeout`. Setting the `ReportSharingTimeout` to `0` (`zero`, default) will cause each client request for a report to produce a new report document instead of reusing an already rendered document.

> When you navigate to reports via [NavigateToReportAction]({%slug telerikreporting/designing-reports/adding-interactivity-to-reports/actions/drillthrough-report-action%}) the Reporting engine always creates a new instance of the target report.

## See Also

* [Embedding Telerik Reporting in ASP.NET Core Reporting Applications]({%slug asp-net-core-reporting%})
