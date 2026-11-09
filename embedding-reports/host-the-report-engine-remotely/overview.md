---
title: Overview
page_title: Telerik Reporting REST Services Explained Briefly
description: "Learn how the Telerik Reporting REST service exposes report generation over HTTP, manages client sessions, and supports viewers and custom clients."
slug: telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/overview
tags: overview,rest,service,configure,reporting,basics
published: True
position: 0
previous_url: /telerik-reporting-rest-conception, /using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/overview,/telerik-reporting-services,/embedding-reports/host-the-report-engine-remotely/telerik-reporting-rest-services/overview, /embedding-reports/host-the-report-engine-remotely/
reportingArea: General
components: [general]
---

# Overview

The Telerik Reporting REST service exposes the report generation engine through an HTTP application programming interface (API). The engine renders report documents in all supported formats.

The service uses simple [Data Transfer Objects](https://martinfowler.com/eaaCatalog/dataTransferObject.html) (DTOs) for client-server communication. All DTOs use JSON encoding.

The primary use of the service is with the [HTML5 Report Viewer](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview), which has a client-side implementation.

>note You can use the Reporting REST service in a JavaScript application without the viewer. Refer to the `telerikReportViewer.ServiceClient` class in the JavaScript API.

This chapter describes implementations for several web service frameworks.

## How It Works

The Reporting REST service exposes all report generation assets as web resources that can be accessed from specific web endpoints. These exposed assets include:

* Report instances
* Report documents
* Images
* Other rendered report metadata

To access these report generation assets, a client host issues a set of requests and wraps them in a client session identified by `clientId`.

### Serving a Request

The following steps describe how the Reporting REST service serves a client's request:

1. The client requests a report by sending a JSON object called a *client report source*.
1. The service resolves the request to a [.NET report source](slug:telerikreporting/designing-reports/report-sources/overview). To do that, it uses a [REST Service Report Source Resolver](slug:telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-service-report-source-resolver/overview).
1. The service serves the rendered reports as web-accessible resources.
1. The service caches all generated resources in a [REST Service Storage](slug:telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-service-storage/overview) of choice.

## Configuration Hints

You can configure the report service in the application's `.config` or `.json` configuration file, depending on the service implementation. For more details, see the [`restReportService` element](slug:telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/restreportservice-element).

You can also configure the following service behaviors:

* The client session expires after a configurable period. Within a single client session, the same request returns the same cached resource.

	>note The [Register Client](slug:telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/clients-api/register-client) endpoint can enforce regeneration for the Refresh Report functionality. Add `useCache = false` to the request body.

* If you share the service with more than one app, enable [Cross-Origin Resource Sharing](https://fetch.spec.whatwg.org/).
* The service executes report generation requests in a task queue. Configure the number of reports rendered at the same time in the [REST service configuration](slug:telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/restreportservice-element).
* To host two or more report services in one application, assign a unique `HostAppId` property to each controller. This creates a dedicated task queue for each service instance. Set the worker count for each queue to avoid system overload.

## See Also

* [Configure the ASP.NET Core Web API implementation](slug:telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/asp.net-core-web-api-implementation/overview)
* [Configure the ASP.NET Web API implementation](slug:telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/asp.net-web-api-implementation/overview)
* [Configure the ServiceStack implementation](slug:telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/servicestack-implementation/overview)
* [Use the REST API reference](slug:telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/overview)
