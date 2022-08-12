---
title: Unregister Client
page_title: Unregister Client 
description: Unregister Client
slug: telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/clients-api/unregister-client
tags: unregister,client
published: True
position: 1
previous_url: /telerik-reporting-rest-api-unregister-client
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

# Unregister Client

## Request
    
	DELETE /api/reports/clients/{clientId}

__Path parameters__ 

| Name | Type | Description |
| ------ | ------ | ------ |
|`clientId`|String|ID of the service client. Returned from [Register Client]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/clients-api/register-client%}).|

## Response

| HTTP Status Code | Description |
| ------ | ------ |
|`204 NoContent`|Client unregistered successfully|
|`410  Gone`|The specified clientId cannot be found (expired)|

## Sample

* Request 

		DELETE /api/reports/clients/2c3d HTTP/1.1
        
* Response 

		HTTP/1.1 204 NoContent
        
