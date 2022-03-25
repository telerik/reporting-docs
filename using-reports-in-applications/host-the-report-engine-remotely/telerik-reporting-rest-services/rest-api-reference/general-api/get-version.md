---
title: Get Version
page_title: Get Version 
description: Get Version
slug: telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/general-api/get-version
tags: get,version
published: True
position: 1
---

# Get Version

Public interface for retrieving the Telerik Reporting REST Service version.

## Request

	GET /api/reports/version

## Response

| HTTP Status Code | Description |
| ------ | ------ |
|`200 OK`|The Version of the Telerik Reporting REST Service retrieved successfully|

__Response Body__ 

A string, which represent the version of the Telerik Reporting REST Service. 

## Sample

	GET /api/reports/formats HTTP/1.1
    
		Response Message
		HTTP/1.1 200 OK

		"{{site.buildversion}}"
