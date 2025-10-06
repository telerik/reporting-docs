---
title: Get Clients Session Timeout Seconds
page_title: Get Clients Session Timeout Seconds Request Revealed
description: "Learn how to make the Get Clients Session Timeout Seconds request to the Telerik Reporting REST Service and what response to expect."
slug: telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/clients-api/get-clients-session-timeout-seconds
tags: get,clients,session,timeout,seconds
published: True
reporting_area: RESTService, RESTServiceCore
position: 3
previous_url: /telerik-reporting-rest-api-get-clients-session-timeout-seconds,/embedding-reports/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/clients-api/get-clients-session-timeout-seconds
---

# `Get Clients Session Timeout Seconds` Overview

The request is performed only if the [viewer's option]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/report-viewer-initialization%}) `keepClientAlive` is set to `true`. The response returns a time in seconds that is used by the viewer to determine how often to perform the request [Keep Client Alive]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/clients-api/keep-client-alive%}).

## Request

	GET /api/reports/clients/sessionTimeout

## Response

| HTTP Status Code | Description |
| ------ | ------ |
|`200 OK`|Successfully retrieved the client's session timeout|

__Response Body__

The body contains the client's session timeout in seconds

## Sample

* Request

		GET /api/reports/clients/sessionTimeout HTTP/1.1

* Response

		HTTP/1.1 200 OK

		{"clientSessionTimeout": 900}
