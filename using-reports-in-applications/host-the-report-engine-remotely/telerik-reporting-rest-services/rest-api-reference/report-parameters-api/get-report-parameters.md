---
title: Get Report Parameters
page_title: Get Report Parameters 
description: Get Report Parameters
slug: telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/report-parameters-api/get-report-parameters
tags: get,report,parameters
published: True
position: 0
---

# Get Report Parameters



## Request

    
          POST /api/reports/clients/{clientId}/parameters
        

__Path parameters__ 


| Name | Type | Description |
| ------ | ------ | ------ |
|`clientId`|String|ID of the service client. Returned from [Register Client]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/clients-api/register-client%}).|


__Request Body__ 

[ReportSource]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/json-entities/reportsource%}) object. Represent a report and its current parameter values.         

## Response


| HTTP Status Code | Description |
| ------ | ------ |
|`200 OK`|Report instance successfully created|
|`400 BadRequest`|No report name is specified|
|`404 Not Found`|The specified report name cannot be resolved / Parameter values are not valid|
|`410  Gone`|The specified clientId cannot be found (expired)|


__Response Body__ 

Array containing [Parameter]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/json-entities/parameter%}) objects representing the report parameters that should be used to prompt the user.         

## Sample

    
````
POST /api/reports/clients/2c3d/parameters HTTP/1.1
{
  report: “MyReport1”,
  parameterValues: {
    ‘p1’: ‘v1’,
    ‘p2’: 20
  },
}
````
````
HTTP/1.1 200 OK
[
    {
      ‘name’: ‘p1’,
      ‘id’: ‘p1’,
      ‘type’: ‘System.Integer’,
      ‘text’: ‘Input p1’,
      ‘multivalue’: false,
      ‘allowNull’: true,
      ‘allowBlank’: false,
      ‘isVisible’: true,
      ‘autoRefresh’: false,
      ‘hasChildParameters’: true,
      ‘childParameters’: [‘p2’],
      ‘value’:1
      ‘label’: ‘1’,
    },
    {
      ‘name’: ‘p2’,
      ‘id’: ‘p2’,
      ‘type’: ‘System.String’,
      ‘text’: ‘Please input p2’,
      ‘multivalue’: false,
      ‘allowNull’: false,
      ‘allowBlank’: false,
      ‘isVisible’: true,
      ‘autoRefresh’: false,
      ‘hasChildParameters’: false,
      ‘availableValues’: [
              {‘name’: ‘Sofia’, ‘value’: ‘Sofia’}
              {‘name’: ‘Berlin’, ‘value’: ‘Berlin’}
   ],
      ‘value’: ‘Sofia’
      ‘label’: ‘Sofia’,
    }
]
````



