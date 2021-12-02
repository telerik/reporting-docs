---
title: Resolve Report Instance
page_title: Resolve Report Instance | for Telerik Reporting Documentation
description: Resolve Report Instance
slug: telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/report-instances-api/resolve-report-instance
tags: resolve,report,instance
published: True
position: 0
---

# Resolve Report Instance



## Request

	
          POST /api/reports/clients/{clientId}/instances
        



__Path parameters__ 


| Name | Type | Description |
| ------ | ------ | ------ |
|`clientId`|String|ID of the service client. Returned from [Register Client]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/clients-api/register-client%})|




__Request Body__ 

[ReportSource]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/json-entities/reportsource%}) object identifying the report instance that is created.         

## Response


| HTTP Status Code | Description |
| ------ | ------ |
|`201 Created`|Report instance successfully created|
|`400 BadRequest`|No report name is specified|
|`404 Not Found`|The specified report name cannot be resolved / Parameter values are not valid|
|`410  Gone`|The specified clientId cannot be found (expired|




__Response Body__ 

When the return status is Created the body contains report instance identifier string.         

## Sample

	
````
          POST /api/reports/clients/2c3d/instances HTTP/1.1
          {
            report: “MyReport1”,
            parameterValues: {
	          ‘p1’: ‘v1’,
	          ‘p2’: 20
            },
          }
````
````
          HTTP/1.1 201 Created
          “a5f3”
````



# See Also

