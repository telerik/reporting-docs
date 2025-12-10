---
title: Overview
page_title: Telerik Reporting REST Services Explained Briefly
description: "Learn the basics about the Telerik Reporting REST Services, including what it is, how it works and how to configure it."
slug: telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/overview
tags: overview,rest,service,configure,reporting,basics
published: True
position: 0
previous_url: /telerik-reporting-rest-conception, /using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/overview,/telerik-reporting-services,/embedding-reports/host-the-report-engine-remotely/telerik-reporting-rest-services/overview, /embedding-reports/host-the-report-engine-remotely/
reportingArea: General
---

# Telerik Reporting REST Services Overview

The Telerik Reporting REST service provides an Application Programming Interface (API) over HTTP to the reports generation engine. This engine allows the exporting of report documents in all supported rendering formats. The server-client communication relies on simple [Data Transfer Objects](https://martinfowler.com/eaaCatalog/dataTransferObject.html) (DTOs). All DTOs are JSON encoded.

The primary usage of the service is in the [HTML5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%}) ecosystem. It leverages the pure client-side implementation of the viewer.

> You can use the Reporting REST service in a JavaScript application without the viewer. Refer to the _telerikReportViewer.ServiceClient_ class in the JavaScript API.

The service has several implementations targeting different web service frameworks which are described in this chapter.

## How it Works

The Reporting REST service exposes all report generation assets as web resources that can be accessed from specific web endpoints. These exposed assets include:

* Report instances
* Report documents
* Images
* Other rendered report meta-data

To access these report generation assets, a client host issues a set of requests and wraps them in a client session identified by a `clientId`.

### Serving a Request

The following steps describe how the Reporting REST service serves a client's request:

1. The client of the service requests a report by a JSON object called a __client report source__.
1. The service resolves the request to a [.NET report source]({%slug telerikreporting/designing-reports/report-sources/overview%}). To do that, it uses a [REST Service Report Source Resolver]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-service-report-source-resolver/overview%}).
1. The service serves the rendered reports as web-accessible resources.
1. The service caches all generated resources in a [REST Service Storage]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-service-storage/overview%}) of choice.

## Configuration Hints

You can configure the report service in the application's configuration file - either .config or .json for the different service implementations. For more details, see [restReportService Element]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/restreportservice-element%}).

Furthermore, each of the steps listed above allows you additional configuration and customization, for example:

* The client session expires within a particular time, which can be configured. That said, within a single client session, the same request will always return the same cached resource.

	>An exception is the [Register Client]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/clients-api/register-client%}) endpoint, which can enforce regeneration to support the Refresh Report functionality. To achieve that, add a useCache = false setting to the request's body.

* In some scenarios, you need to share the service with more than one app. For these, you may need to turn on [Cross-Origin Resource Sharing](https://fetch.spec.whatwg.org/).
* If all new report requests get executed simultaneously, the host will get overloaded. To avoid this, the service executes the report generation requests in a task queue. The count of the simultaneously rendered reports is [configurable]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/restreportservice-element%}).
* In some scenarios, you need to host two or more report services in a single application. To achieve that, assign a unique HostAppId property to each implementing controller. This will produce a dedicated task queue for each service instance. Additionally, you must set the appropriate worker count for each queue to avoid system overload.
