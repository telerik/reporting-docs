---
title: Resolve Document
page_title: Resolve Document | for Telerik Reporting Documentation
description: Resolve Document
slug: telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/documents-api/resolve-document
tags: resolve,document
published: True
position: 0
---

# Resolve Document



## Request

	
          POST /api/reports/clients/{clientId}/instances/{instanceId}/documents
        



__Path parameters__ 


| Name | Type | Description |
| ------ | ------ | ------ |
|`clientId`|String|ID of the service client. Returned from [Register Client]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/clients-api/register-client%}).|
|`instanceId`|String|ID of the report instance. Returned from [Resolve Report Instance]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/report-instances-api/resolve-report-instance%})|




__Request Body__ 

[FormatKey]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/json-entities/formatkey%}) describing the document to be requested.         

## Response


| HTTP Status Code | Description |
| ------ | ------ |
|`202 Accepted`|Document instance created and rendering is initiated.|
|`201 Created`|Document instance already available.|
|`410 Gone`|The specified clientId cannot be found (expired).|
|`404 Not Found`|The specified instanceId cannot be found|




__Response Body__ 

When the return status is `Accepted/Created` the body contains a document identifier string which is used to get pages/document.         

## Sample

	
          POST /api/reports/clients/2c3d/instances/4d3c/documents HTTP/1.1

          {
          ‘format’: ‘HTML5’,
          ‘deviceInfo’: { ‘xxx’: ‘zzz’ },
          ‘useCache’: true,
          ‘baseDocumentId’: ‘xxxx’,
          ‘actionId’: ‘xxxx’
          }
        



	
          HTTP/1.1 202 Accepted

          “5x3a”
        


