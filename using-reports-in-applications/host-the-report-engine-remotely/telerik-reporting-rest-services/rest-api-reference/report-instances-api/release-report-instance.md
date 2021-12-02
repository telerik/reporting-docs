---
title: Release Report Instance
page_title: Release Report Instance | for Telerik Reporting Documentation
description: Release Report Instance
slug: telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/report-instances-api/release-report-instance
tags: release,report,instance
published: True
position: 1
---

# Release Report Instance



## Request

	
          DELETE /api/reports/clients/{clientId}/instances/{instanceId}
        



__Path parameters__ 


| Name | Type | Description |
| ------ | ------ | ------ |
|`clientId`|String|ID of the service client. Returned from [Register Client]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/clients-api/register-client%}).|
|`instanceId`|String|ID of the report instance. Returned from [Resolve Report Instance]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/report-instances-api/resolve-report-instance%})|




## Response


| HTTP Status Code | Description |
| ------ | ------ |
|`204 NoContent`|Report instance destroyed successfully|
|`404 Not Found`|The specified instanceId cannot be found|
|`410  Gone`|The specified clientId cannot be found (expired|




## Sample

	
````
          DELETE /api/reports/clients/2c3d/instances/4d3c HTTP/1.1
````
````
          HTTP/1.1 204 NoContent
````



# See Also

