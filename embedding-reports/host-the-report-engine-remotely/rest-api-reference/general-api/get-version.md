---
title: Get Version
page_title: Get Version Request Revealed
description: "Learn how to make the Get Version request to the Telerik Reporting REST Service and what response to expect."
slug: telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/general-api/get-version
tags: get,version
published: True
position: 1
previous_url: /embedding-reports/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/general-api/get-version, /embedding-reports/host-the-report-engine-remotely/rest-api-reference/general-api/
---

# `Get Version` Overview

The public interface for retrieving the Telerik Reporting REST Service version.

## Request

	GET /api/reports/version

## Response

| HTTP Status Code | Description |
| ------ | ------ |
|`200 OK`|The Version of the Telerik Reporting REST Service retrieved successfully|

__Response Body__

A string, which represents the version of the Telerik Reporting REST Service.

## Sample

* Request

		GET /api/reports/version HTTP/1.1

* Response

		HTTP/1.1 200 OK

		"{{site.buildversion}}"
