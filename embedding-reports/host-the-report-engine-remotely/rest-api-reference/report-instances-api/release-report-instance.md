---
title: Release Report Instance
page_title: Release Report Instance Request Revealed
description: "Learn how to make the Release Report Instance request to the Telerik Reporting REST Service and what response to expect."
slug: telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/report-instances-api/release-report-instance
tags: release,report,instance
published: True
position: 1
previous_url: /telerik-reporting-rest-report-instances-api-destroy-report-instance,/embedding-reports/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/report-instances-api/release-report-instance
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

# `Release Report Instance` Overview

## Request

	DELETE /api/reports/clients/{clientId}/instances/{instanceId}

__Path parameters__

| Name | Type | Description |
| ------ | ------ | ------ |
|`clientId`|String|ID of the service client. Returned by [Register Client]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/clients-api/register-client%}).|
|`instanceId`|String|ID of the report instance. Returned by [Resolve Report Instance]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/report-instances-api/resolve-report-instance%}).|

## Response

| HTTP Status Code | Description |
| ------ | ------ |
|`204 NoContent`|Report instance destroyed successfully|
|`404 Not Found`|The specified instanceId cannot be found|
|`410  Gone`|The specified clientId cannot be found (expired)|

## Sample

* Request

		DELETE /api/reports/clients/2c3d/instances/4d3c HTTP/1.1

* Response

		HTTP/1.1 204 NoContent
