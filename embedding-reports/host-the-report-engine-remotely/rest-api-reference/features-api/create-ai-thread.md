---
title: Create AI Thread
page_title: Create AI Thread Request Explained
description: "Learn how to make the Create AI Thread request to the Telerik Reporting REST Service and what response to expect."
slug: telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/features-api/create-ai-thread
tags: create,ai,thread
published: True
reportingArea: RESTService, RESTServiceCore
position: 1
---

# `Create AI Thread` Overview

The `Create AI Thread` endpoint initializes a new AI interaction session for the Telerik Reporting REST Service. It provides a unique thread identifier, available AI prompts, and consent requirements.

## Request

	POST /api/reports/clients/{clientId}/instances/{instanceId}/ai

__Path parameters__

| Name | Type | Description |
| ------ | ------ | ------ |
|`clientId`|String|The ID of the service client that started the AI thread. Returned by [Register Client]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/clients-api/register-client%}).|
|`instanceId`|String|The ID of the report instance used for the AI thread. Returned by [Resolve Report Instance]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/report-instances-api/resolve-report-instance%}).|

__Request Body__

[ReportSource]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/json-entities/reportsource%}) object identifying the report instance.

## Response

| HTTP Status Code | Description |
| ------ | ------ |
|`201 Created`|A new AI thread is created and its details are returned.|

__Response Body__

[AiThread]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/json-entities/aithread%}) object that can be used to start a conversation with an AI assistant.

## Sample

* Request

        POST /api/reports/clients/4476c114dbb/instances/99834da5858/ai HTTP/1.1

* Response

        HTTP/1.1 201 Created

        {
			"threadId": "57fc76d2cf8",
			"predefinedPrompts": [
				"Generate an executive summary of this report.",
				"Translate the document in German."
			],
			"requireConsent": true,
			"consentMessage": "By using this AI functionality, you authorize the processing of any data you provide, including your prompt, for the purposes of delivering the service to you. Your use of this functionality is governed by the Progress privacy policy, available at: <a href='https://www.progress.com/legal/privacy-policy'>Privacy Policy - Progress</a>",
			"allowCustomPrompts": true
        }
