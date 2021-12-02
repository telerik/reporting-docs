---
title: REST API Reference Overview
page_title: Overview | for Telerik Reporting Documentation
description: Overview
slug: telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/overview
tags: overview
published: True
position: 0
---

# REST API Reference Overview



The four main HTTP methods (GET, PUT, POST, and DELETE) are mapped to CRUD operations as follows:       

* GET retrieves the representation of the resource at a specified URI. GET have no side effects on the server.

* PUT updates a resource at a specified URI.

* POST creates a new resource. The server assigns the ID for the new object and returns this ID as part of the response message.

* DELETE deletes a resource at a specified URI.



The API represent resources as hierarchical URIs in order to force the clients to use certain request sequence.

## The reports API exposes following methods:


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
| [Get Document Page]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/documents-api/get-document-page%})|GET|/api/reports/clients/{clientId}/instances/{instanceId}/documents/{documentId}/pages/{pageNumber}|
| [Get Document Resource]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/documents-api/get-document-resource%})|GET|/api/reports/clients/{clientId}/instances/{instanceId}/documents/{documentId}/resources/{resourceId}|
| [Apply Interactive Action on Document]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/documents-api/apply-interactive-action-on-document%})|PUT|/api/reports/clients/{clientId}/instances/{instanceId}/documents/{documentId}/actions/{actionId}|
| [Release Document]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/documents-api/release-document%})|DELETE|/api/reports/clients/{clientId}/instances/{instanceId}/documents/{documentId}|
| [Get Available Document Formats]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/general-api/get-available-document-formats%})|GET|/api/reports/format|




# See Also

