---
title: Overview
page_title: REST API Reference at a Glance
description: "Find out which are the requests exposed by the Telerik Reporting REST Service API, what is their HTTP method and relative URI."
slug: telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/overview
tags: overview,rest,api,uri,http,service,reporting,request
published: True
position: 0
previous_url: /telerik-reporting-rest-api,/embedding-reports/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/overview, /embedding-reports/host-the-report-engine-remotely/rest-api-reference/, /telerik-reporting-rest-json-entities
---

<style>
table th:first-of-type {
	width: 30%;
}
table th:nth-of-type(2) {
	width: 10%;
}
table th:nth-of-type(3) {
	width: 60%;
}
</style>

# REST API Reference Overview

The four main HTTP methods (GET, PUT, POST, and DELETE) are mapped to CRUD operations as follows:

* GET retrieves the representation of the resource at a specified URI. GET has no side effects on the server.
* PUT updates a resource at a specified URI.
* POST creates a new resource. The server assigns the ID for the new object and returns this ID as part of the response message.
* DELETE deletes a resource at a specified URI.

The API represents resources as hierarchical URIs to force the clients to use certain request sequences.

## The reports API exposes the following methods:

| Action | HTTP method | Relative URI |
| ------ | ------ | ------ |
| [Register Client]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/clients-api/register-client%})|POST|/api/reports/clients|
| [Unregister Client]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/clients-api/unregister-client%})|DELETE|/api/reports/clients/{clientId}|
| [Keep Client Alive]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/clients-api/keep-client-alive%})|POST|/api/reports/clients/keepAlive/{clientID}|
| [Get Clients Session Timeout Seconds]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/clients-api/get-clients-session-timeout-seconds%})|GET|/api/reports/clients/sessionTimeout|
| [Get Report Parameters]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/report-parameters-api/get-report-parameters%})|POST|/api/reports/clients/{clientId}/parameters|
| [Resolve Report Instance]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/report-instances-api/resolve-report-instance%})|POST|/api/reports/clients/{clientId}/instances|
| [Release Report Instance]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/report-instances-api/release-report-instance%})|DELETE|/api/reports/clients/{clientId}/instances/{instanceId}|
| [Resolve Document]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/documents-api/resolve-document%})|POST|/api/reports/clients/{clientId}/instances/{instanceId}/documents|
| [Get Document Info]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/documents-api/get-document-info%})|GET|/api/reports/clients/{clientId}/instances/{instanceId}/documents/{documentId}/info|
| [Get Document]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/documents-api/get-document%})|GET|/api/reports/clients/{clientId}/instances/{instanceId}/documents/{documentId}|
| [Send Document]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/documents-api/send-document%})|POST|/api/reports/clients/{clientId}/instances/{instanceId}/documents/{documentId}/send|
| [Get Document Page]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/documents-api/get-document-page%})|GET|/api/reports/clients/{clientId}/instances/{instanceId}/documents/{documentId}/pages/{pageNumber}|
| [Get Document Resource]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/documents-api/get-document-resource%})|GET|/api/reports/clients/{clientId}/instances/{instanceId}/documents/{documentId}/resources/{resourceId}|
| [Apply Interactive Action on Document]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/documents-api/apply-interactive-action-on-document%})|PUT|/api/reports/clients/{clientId}/instances/{instanceId}/documents/{documentId}/actions/{actionId}|
| [Search in a Document]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/documents-api/search-in-a-document%})|POST|/api/reports/clients/{clientId}/instances/{instanceId}/documents/{documentId}/search|
| [Release Document]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/documents-api/release-document%})|DELETE|/api/reports/clients/{clientId}/instances/{instanceId}/documents/{documentId}|
| [Get Available Document Formats]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/general-api/get-available-document-formats%})|GET|/api/reports/formats|
| [Get Version]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/general-api/get-version%})|GET|/api/reports/version|
