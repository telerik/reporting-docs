---
title: Get Document Page
page_title: Get Document Page | for Telerik Reporting Documentation
description: Get Document Page
slug: telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/documents-api/get-document-page
tags: get,document,page
published: True
position: 4
---

# Get Document Page



## Request

    
          GET /api/reports/clients/{clientId}/instances/{instanceId}/documents/{documentId}/pages/{pageNumber}
        

__Path parameters__ 

| Name | Type | Description |
| ------ | ------ | ------ |
|`clientId`|String|ID of the service client. Returned from [Register Client]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/clients-api/register-client%}).|
|`instanceId`|String|ID of the report instance. Returned from [Resolve Report Instance]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/report-instances-api/resolve-report-instance%}).|
|`documentId`|String|ID of the report document. Returned from [Resolve Document]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/documents-api/resolve-document%}).|
|`pageNumber`|Number|An integer representing the number of the requested page.|

## Response

| HTTP Status Code | Description |
| ------ | ------ |
|`202 Accepted`|Page is not ready.|
|`200 OK`|Page is ready and its content is retrieved.|
|`410 Gone`|The specified clientId cannot be found (expired).|
|`404 Not Found`|The specified instanceId or documentId or pageNumber cannot be found.|

__Response Body__ 

[PageInfo]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/json-entities/pageinfo%}) - a single page content.         

## Sample

    
          GET /api/reports/clients/2c3d/instances/4d3c/documents/5x3a/pages/1 HTTP/1.1
        

    
          HTTP/1.1 202 Accepted

          {
            ‘pageReady’: false,
            ‘pageNumber’: 1
          }

