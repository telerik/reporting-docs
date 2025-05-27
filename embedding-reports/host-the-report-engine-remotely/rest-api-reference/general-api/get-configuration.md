---
title: Get Configuration
page_title: Get Configuration Request Explained
description: "Learn how to make the Get Configuration request to the Telerik Reporting REST Service and what response to expect."
slug: telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/general-api/get-configuration
tags: get,configuration
published: True
position: 1
---

# `Get Configuration` Overview

The public interface for retrieving Telerik Reporting REST Service configuration information, including details about version, license status, and available functionality, such as [AI-powered insights]({%slug telerikreporting/designing-reports/adding-interactivity-to-reports/ai-powered-insights%}). 

## Request

	GET /api/reports/configuration

## Response

| HTTP Status Code | Description |
| ------ | ------ |
|`200 OK`|The configuration of the Telerik Reporting REST Service is retrieved successfully.|

__Response Body__

A configuration object that includes details about version, license status, and available functionality, such as [AI-powered insights]({%slug telerikreporting/designing-reports/adding-interactivity-to-reports/ai-powered-insights%}).

## Sample

* Request

		GET /api/reports/version HTTP/1.1

* Response

		HTTP/1.1 200 OK

        {
            "version": "{{site.buildversion}}",
            "license": {
                "type": 2,
                "isValid": true,
                "title": null,
                "message": null,
                "messageIcon": 0,
                "statusCode": null,
                "actionLink": null,
                "actionMessage": null,
                "expiration": "2026-01-01T05:00:00"
        },
            "options": [
                {
                "name": "ai-insights",
                "requireConsent": false,
                "allowCustomPrompts": false,
                "isAvailable": false
                }
            ]
        }