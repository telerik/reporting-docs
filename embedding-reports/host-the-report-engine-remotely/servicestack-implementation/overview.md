---
title: Overview
page_title: ServiceStack Implementation at a Glance
description: "Learn more about the Telerik Reporting ServiceStack Implementation of the REST Service and what clients may use it."
slug: telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/servicestack-implementation/overview
tags: overview
published: True
reporting_area: RESTService
position: 0
previous_url: /telerik-reporting-rest-service-service-stack,/embedding-reports/host-the-report-engine-remotely/telerik-reporting-rest-services/servicestack-implementation/overview, /embedding-reports/host-the-report-engine-remotely/servicestack-implementation/
---

# ServiceStack Implementation Overview

The ServiceStack implementation of the Telerik Reporting REST Service is a __REST__ full web service built upon the [ServiceStack](https://servicestack.net/) framework.

In order to utilize the service, you have to create a new class that inherits from the abstract [ReportsHostBase](/api/Telerik.Reporting.Services.ServiceStack.ReportsHostBase) class. The *ReportsHostBase* class contains one important property needed by the reporting engine: [ReportServiceConfiguration](/api/Telerik.Reporting.Services.ServiceStack.ReportsHostBase#Telerik_Reporting_Services_ServiceStack_ReportsHostBase_ReportServiceConfiguration).

The service can be hosted on [IIS]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/servicestack-implementation/how-to-add-telerik-reporting-rest-servicestack-to-web-application%}) or self-hosted.

As Telerik Reporting ServiceStack REST service is a pure HTTP web service it can be accessed with any HTTP-capable client. For example, you can create one of the following clients in order to utilize the service:

* JavaScript client
* C# client
* Silverlight client

The service can be used from the [HTML5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%}), [Windows Forms ReportViewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/windows-forms-application/how-to-use-windows-forms-report-viewer-with-report-server%}) and [WPF ReportViewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/wpf-application/how-to-use-wpf-report-viewer-with-report-server%}) as well.

The current ServiceStack implementation is based on [ServiceStack](https://servicestack.net/) V3 __(3.9.70.0)__

> The __Telerik Reporting ServiceStack REST Service__ should be the only ServiceStack-based Web Service in a project, as all ServiceStack services have [a single AppHost per AppDomain](https://docs.servicestack.net/modularizing-services).

## See Also

* [REST API Reference]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/overview%})
* [HTML5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%})
