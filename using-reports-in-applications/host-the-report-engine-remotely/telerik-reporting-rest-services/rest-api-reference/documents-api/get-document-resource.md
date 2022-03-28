---
title: Get Document Resource
page_title: Get Document Resource 
description: Get Document Resource
slug: telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/documents-api/get-document-resource
tags: get,document,resource
published: True
position: 5
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

# Get Document Resource

## Request
    
	GET /api/reports/clients/{clientId}/instances/{instanceId}/documents/{documentId}/resources/{resourceId}

__Path parameters__ 

| Name | Type | Description |
| ------ | ------ | ------ |
|`clientId`|String|ID of the service client. Returned from [Register Client]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/clients-api/register-client%}).|
|`instanceId`|String|ID of the report instance. Returned from [Resolve Report Instance]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/report-instances-api/resolve-report-instance%}).|
|`documentId`|String|ID of the report document. Returned from [Resolve Document]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/documents-api/resolve-document%}).|
|`resourceId`|String|ID of the requested resource. Requested from the page content.|

## Response

| HTTP Status Code | Description |
| ------ | ------ |
|`200 OK`|Page is ready and its content is retrieved.|
|`410 Gone`|The specified clientId cannot be found (expired).|
|`404 Not Found`|The specified instanceId or documentId or resourceId cannot be found.|

__Response Body__ 

resource file (image, etc.) 

## Sample

* Request 

		GET /api/reports/clients/2c3d/instances/4d3c/documents/5x3a/resources/4t6d HTTP/1.1
        
* Response 

		HTTP/1.1 200 OK
		
		file-content
