---
title: Release Document
page_title: Release Document | for Telerik Reporting Documentation
description: Release Document
slug: telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/documents-api/release-document
tags: release,document
published: True
position: 8
---

# Release Document



## Request

	
          DELETE /api/reports/clients/{clientId}/instances/{instanceId}/documents/{documentId}
        



__Path parameters__ 


| Name | Type | Description |
| ------ | ------ | ------ |
|`clientId`|String|ID of the service client. Returned from [Register Client]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/clients-api/register-client%}).|
|`instanceId`|String|ID of the report instance. Returned from [Resolve Report Instance]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/report-instances-api/resolve-report-instance%}).|
|`documentId`|String|ID of the report document. Returned from [Resolve Document]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/documents-api/resolve-document%})|




## Response


| HTTP Status Code | Description |
| ------ | ------ |
|`204 NoContent`|Document destroyed successfully.|
|`410 Gone`|The specified clientId cannot be found (expired).|
|`404 Not Found`|The specified instanceId or documentId cannot be found|




## Sample

	
          DELETE /api/reports/clients/2c3d/instances/4d3c/documents/5x3a HTTP/1.1
        



	
          HTTP/1.1 204 NoContent
        


