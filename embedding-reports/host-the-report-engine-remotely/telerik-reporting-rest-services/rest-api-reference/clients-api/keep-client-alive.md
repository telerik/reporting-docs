---
title: Keep Client Alive
page_title: Keep Client Alive 
description: Keep Client Alive
slug: telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/clients-api/keep-client-alive
tags: keep,client,alive
published: True
position: 2
previous_url: /telerik-reporting-rest-api-keep-client-alive
---
<style>
table th:first-of-type {
    width: 25%;
}
table th:nth-of-type(2) {
    width: 25%;
}
table th:nth-of-type(3) {
    width: 50%;
}
</style>

# Keep Client Alive

## Request

	POST /api/reports/clients/keepAlive/{clientID}

__Path parameters__ 

| Name | Type | Description |
| ------ | ------ | ------ |
|`clientId`|String|ID of the service client. Returned from [Register Client]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/clients-api/register-client%}).|

## Response

| HTTP Status Code | Description |
| ------ | ------ |
|`204 NoContent`|Client expiration successfully extended|
|`400 Bad Request`|The specified clientId cannot be found (expired)|

## Sample

* Request 

		POST /api/reports/clients/2c3d HTTP/1.1
    
* Response 

		HTTP/1.1 204 NoContent     
