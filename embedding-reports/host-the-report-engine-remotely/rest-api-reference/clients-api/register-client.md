---
title: Register Client
page_title: Register Client Request Revealed
description: "Learn how to make the Register Client request to the Telerik Reporting REST Service and what response to expect."
slug: telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/clients-api/register-client
tags: register,client
published: True
reportingArea: RESTService, RESTServiceCore
position: 0
previous_url: /telerik-reporting-rest-api-register-client,/embedding-reports/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/clients-api/register-client, /embedding-reports/host-the-report-engine-remotely/rest-api-reference/clients-api/
---

# `Register Client` Overview

## Request

	POST /api/reports/clients

## Response

| HTTP Status Code | Description |
| ------ | ------ |
|`200 OK`|Client registered successfully|

__Response Body__

The body contains the newly registered client’s identifier.

## Sample

* Request

		POST /api/reports/clients HTTP/1.1

* Response

		HTTP/1.1 200 OK

		{"clientId": "a5f3"}
