---
title: Get AI Thread
page_title: Get AI Thread Request Explained
description: "Learn how to make the Get AI Thread request to the Telerik Reporting REST Service and what response to expect."
slug: telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/features-api/get-ai-thread
tags: get,ai,thread
published: True
position: 1
---

# `Get AI Thread` Overview

The `Get AI Thread` endpoint initializes a new AI interaction session for the Telerik Reporting REST Service. It provides a unique thread identifier, available AI prompts, and consent requirements for using AI-powered features. This endpoint is intended for scenarios where users interact with AI-driven insights or automation within reports.

## Request

    GET /api/reports/ai/thread

## Response

| HTTP Status Code | Description |
| ------ | ------ |
|`200 OK`|A new AI thread is created and its details are returned.|

__Response Body__

A JSON object containing the thread ID, predefined AI prompts, consent requirements, and whether custom prompts are allowed.

| Property | Type | Description |
|----------|------|-------------|
| `threadId` | string | Unique identifier for the AI thread. |
| `predefinedPrompts` | array of strings | List of available predefined prompts for the user. |
| `requireConsent` | boolean | Indicates if user consent is required before using AI features. |
| `consentMessage` | string | Message to display to the user regarding consent and privacy. |
| `allowCustomPrompts` | boolean | Indicates if users can enter their own custom prompts. |

## Sample

* Request

        GET /api/reports/ai/thread HTTP/1.1

* Response

        HTTP/1.1 200 OK

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
