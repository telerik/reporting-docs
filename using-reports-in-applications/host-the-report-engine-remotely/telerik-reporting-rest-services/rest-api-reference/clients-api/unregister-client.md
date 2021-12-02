---
title: Unregister Client
page_title: Unregister Client | for Telerik Reporting Documentation
description: Unregister Client
slug: telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/clients-api/unregister-client
tags: unregister,client
published: True
position: 1
---

# Unregister Client



## Request

	
          DELETE /api/reports/clients/{clientId}
        



__Path parameters__ 


| Name | Type | Description |
| ------ | ------ | ------ |
|`clientId`|String|ID of the service client. Returned from [Register Client]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/clients-api/register-client%})|




## Response


| HTTP Status Code | Description |
| ------ | ------ |
|`204 NoContent`|Client unregistered successfully|
|`410  Gone`|The specified clientId cannot be found (expired|




## Sample

	
          DELETE /api/reports/clients/2c3d HTTP/1.1
        



	
          HTTP/1.1 204 NoContent
        



# See Also

