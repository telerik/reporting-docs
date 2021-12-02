---
title: Register Client
page_title: Register Client | for Telerik Reporting Documentation
description: Register Client
slug: telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/clients-api/register-client
tags: register,client
published: True
position: 0
---

# Register Client



## Request

	
````
            POST /api/reports/clients
````



## Response


| HTTP Status Code | Description |
| ------ | ------ |
|`200 OK`|Client registered successfull|




__Response Body__ 

The body contains the newly registered client’s identifier.         

## Sample

	
````
                POST /api/reports/clients HTTP/1.1
````
````
                HTTP/1.1 200 OK
                {"clientId":"a5f3"}
````



# See Also

