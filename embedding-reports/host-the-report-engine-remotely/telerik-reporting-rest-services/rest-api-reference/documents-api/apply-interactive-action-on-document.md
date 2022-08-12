---
title: Apply Interactive Action on Document
page_title: Apply Interactive Action on Document 
description: Apply Interactive Action on Document
slug: telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/documents-api/apply-interactive-action-on-document
tags: apply,interactive,action,on,document
published: True
position: 6
previous_url: /telerik-reporting-rest-documents-api-apply-interactive-action
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

# Apply Interactive Action on Document

## Request
    
	PUT /api/reports/clients/{clientId}/instances/{instanceId}/documents/{documentId}/actions/{actionId}

__Path parameters__ 

| Name | Type | Description |
| ------ | ------ | ------ |
|`clientId`|String|ID of the service client. Returned from [Register Client]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/clients-api/register-client%}).|
|`instanceId`|String|ID of the report instance. Returned from [Resolve Report Instance]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/report-instances-api/resolve-report-instance%}).|
|`documentId`|String|ID of the report document. Returned from [Resolve Document]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/documents-api/resolve-document%}).|
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
