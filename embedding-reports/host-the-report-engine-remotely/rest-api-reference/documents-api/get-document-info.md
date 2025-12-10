---
title: Get Document Info
page_title: Get Document Info Request Revealed
description: "Learn how to make the Get Document Info request to the Telerik Reporting REST Service and what response to expect."
slug: telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/documents-api/get-document-info
tags: get,document,info
published: True
reportingArea: RESTService, RESTServiceCore
position: 1
previous_url: /telerik-reporting-rest-documents-api-get-document-info,/embedding-reports/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/documents-api/get-document-info
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

# `Get Document Info` Overview

## Request

	GET /api/reports/clients/{clientId}/instances/{instanceId}/documents/{documentId}/info

__Path parameters__

| Name | Type | Description |
| ------ | ------ | ------ |
|`clientId`|String|ID of the service client. Returned by [Register Client]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/clients-api/register-client%}).|
|`instanceId`|String|ID of the report instance. Returned by [Resolve Report Instance]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/report-instances-api/resolve-report-instance%}).|
|`documentId`|String|ID of the report document. Returned by [Resolve Document]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/documents-api/resolve-document%}).|

## Response

| HTTP Status Code | Description |
| ------ | ------ |
|`202 Accepted`|Document processing is still in progress.|
|`200 OK`|Document processing is ready.|
|`410 Gone`|The specified clientId cannot be found (expired).|
|`404 Not Found`|The specified instanceId or documentId cannot be found.|

__Response Body__

[DocumentInfo]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/json-entities/documentinfo%})

## Sample

* Request

		GET /api/reports/clients/2c3d/instances/4d3c/documents/5x3a/info HTTP/1.1

* Response

		HTTP/1.1 202 Accepted

		{
			"documentReady": false,
			"PageCount": 2,
			"DocumentMapAvailable": false,
		}
