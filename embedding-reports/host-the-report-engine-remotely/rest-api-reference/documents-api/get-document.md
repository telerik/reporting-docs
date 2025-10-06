---
title: Get Document
page_title: Get Document Request Revealed
description: "Learn how to make the Get Document request to the Telerik Reporting REST Service and what response to expect."
slug: telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/documents-api/get-document
tags: get,document
published: True
reporting_area: RESTService, RESTServiceCore
position: 2
previous_url: /telerik-reporting-rest-documents-api-get-document,/embedding-reports/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/documents-api/get-document
---

<style>
table th:first-of-type {
	width: 25%;
}
table th:nth-of-type(2) {
	width: 25%;
}
table th:nth-of-type(3) {
	width: 50%;
}
</style>

# `Get Document` Overview

## Request

	GET /api/reports/clients/{clientId}/instances/{instanceId}/documents/{documentId}

__Path parameters__

| Name | Type | Description |
| ------ | ------ | ------ |
|`clientId`|String|ID of the service client. Returned by [Register Client]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/clients-api/register-client%}).|
|`instanceId`|String|ID of the report instance. Returned by [Resolve Report Instance]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/report-instances-api/resolve-report-instance%}).|
|`documentId`|String|ID of the report document. Returned by [Resolve Document]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/documents-api/resolve-document%}).|

## Response

| HTTP Status Code | Description |
| ------ | ------ |
|`200 OK`|Document is downloaded as an attachment.|
|`410 Gone`|The specified clientId cannot be found (expired).|
|`404 Not Found`|The specified instanceId or documentId cannot be found.|

__Response Body__

The document content bytes as attachment.

## Sample

* Request

		GET /api/reports/clients/2c3d/instances/4d3c/documents/5x3a HTTP/1.1

* Response

		HTTP/1.1 200 OK

		Content-Disposition: attachment; filename=ProductCatalog.pdf

		bytes
