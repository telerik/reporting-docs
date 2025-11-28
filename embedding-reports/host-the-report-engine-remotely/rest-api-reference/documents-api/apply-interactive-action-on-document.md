---
title: Apply Interactive Action on Document
page_title: Apply Interactive Action on Document Request Revealed
description: "Learn how to make the Apply Interactive Action on Document request to the Telerik Reporting REST Service and what response to expect."
slug: telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/documents-api/apply-interactive-action-on-document
tags: apply,interactive,action,on,document
published: True
reportingArea: RESTService, RESTServiceCore
position: 6
previous_url: /telerik-reporting-rest-documents-api-apply-interactive-action,/embedding-reports/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/documents-api/apply-interactive-action-on-document
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

# `Apply Interactive Action on Document` Overview

## Request

	PUT /api/reports/clients/{clientId}/instances/{instanceId}/documents/{documentId}/actions/{actionId}

__Path parameters__

| Name | Type | Description |
| ------ | ------ | ------ |
|`clientId`|String|ID of the service client. Returned by [Register Client]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/clients-api/register-client%}).|
|`instanceId`|String|ID of the report instance. Returned by [Resolve Report Instance]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/report-instances-api/resolve-report-instance%}).|
|`documentId`|String|ID of the report document. Returned by [Resolve Document]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/documents-api/resolve-document%}).|
|`actionId`|String|ID of the interactive action that is applied on the specified document.|

## Response

| HTTP Status Code | Description |
| ------ | ------ |
|`200 OK`|Action applied successfully.|
|`410 Gone`|The specified clientId cannot be found (expired).|
|`404 Not Found`|The specified instanceId or documentId or actionId cannot be found.|

## Sample

* Request

		PUT /api/reports/clients/2c3d/instances/4d3c/documents/5x3a/actions/4ah1 HTTP/1.1

* Response

		HTTP/1.1 200 OK
