---
title: Keep Client Alive
page_title: Keep Client Alive | for Telerik Reporting Documentation
description: Keep Client Alive
slug: telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/clients-api/keep-client-alive
tags: keep,client,alive
published: True
position: 2
---

# Keep Client Alive



## Request

	
````
            POST /api/reports/clients/keepAlive/{clientID}
````



__Path parameters__ 


| Name | Type | Description |
| ------ | ------ | ------ |
|`clientId`|String|ID of the service client. Returned from [Register Client]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/clients-api/register-client%})|




## Response


| HTTP Status Code | Description |
| ------ | ------ |
|`204 NoContent`|Client expiration successfully extended|
|`400 Bad Request`|The specified clientId cannot be found (expired|




## Sample

	
````
                POST /api/reports/clients/2c3d HTTP/1.1
````



	
          HTTP/1.1 204 NoContent
        



# See Also

