---
title: Send Document
page_title: Send Document | for Telerik Reporting Documentation
description: Send Document
slug: telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/documents-api/send-document
tags: send,document
published: True
position: 3
---

# Send Document



## Request

    
          POST /api/reports/clients/{clientId}/instances/{instanceId}/documents/{documentId}/send
        

__Path parameters__ 

| Name | Type | Description |
| ------ | ------ | ------ |
|`clientId`|String|ID of the service client. Returned from [Register Client]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/clients-api/register-client%}).|
|`instanceId`|String|ID of the report instance. Returned from [Resolve Report Instance]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/report-instances-api/resolve-report-instance%}).|
|`documentId`|String|ID of the report document. Returned from [Resolve Document]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/documents-api/resolve-document%})|

__Request Body__ 

[MailMessage]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/json-entities/mailmessage%})

## Response

| HTTP Status Code | Description |
| ------ | ------ |
|`501 Not Implemented`|The required reports controller method SendMailMessage is not implemented.|
|`200 OK`|Document is send as an e-mail attachment.|
|`410 Gone`|The specified clientId cannot be found (expired).|
|`404 Not Found`|The specified instanceId or documentId cannot be found|

## Sample

    
          POST /api/reports/clients/2c3d/instances/4d3c/documents/5x3a/send HTTP/1.1

          {
          'from': 'john.doe@mycompany.com',
          'to': 'jane.doe@mycompany.com',
          'cc': 'john.doe.jr@mycompany.com',
          'subject': 'my mail subject',
          'body': 'my mail body',
          }
        

    
          HTTP/1.1 200 OK
        


