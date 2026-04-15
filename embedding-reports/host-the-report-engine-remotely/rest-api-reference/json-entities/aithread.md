---
title: AiThread
page_title: AiThread JSON Entity at a Glance
description: "Learn more about the AiThread JSON Entity in Telerik Reporting REST Service and the type and meaning of each field."
slug: telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/json-entities/aithread
tags: aithread
published: True
reportingArea: RESTService, RESTServiceCore
position: 0
---

<style>
    table th:nth-of-type(2) {
		width: 10%;
	}

    table th:nth-of-type(3) {
		width: 10%;
	}

    table th:nth-of-type(4) {
		width: 60%;
	}
</style>

# AiThread Overview

An AI thread that can be used to start a conversation with an AI assistant.

{{source=CodeSnippets\Blazor\Docs\JSON\RestApiEntities.json region=AiThread}}

> caption Fields

| Field                | Type      | Required | Description                                                                                                 |
| -------------------- | --------- | -------- | ----------------------------------------------------------------------------------------------------------- |
| `threadId`           | `String`  | `true`   | The unique identifier of the AI thread.                                                                     |
| `predefinedPrompts`  | `Array`   | `true`   | A list of predefined prompt strings that can be used to interact with the AI assistant.                     |
| `requireConsent`     | `Boolean` | `true`   | Indicates whether user consent is required before using the AI functionality.                               |
| `consentMessage`     | `String`  | `true`   | The message shown to the user to obtain consent for processing data. May include links to privacy policies. |
| `allowCustomPrompts` | `Boolean` | `true`   | Specifies if users are allowed to enter their own custom prompts in addition to the predefined ones.        |
