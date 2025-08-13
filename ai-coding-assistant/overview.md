---
title: AI Assistent Overview
page_title: Telerik Reporting AI Tooling Overview
description: "Learn about the Telerik ReportingAI-powered developer tools that integrate with your IDE or code editor for greater productivity and enhanced developer experience."
slug: ai-coding-assistant
tags: ai, telerik, reporting, coding, assistant
published: True
position: 0
---

# Telerik Reporting AI Coding Assistant

Telerik Reporting offers an **AI Coding Assistant** which will leverage AI to enhance productivity, reduce guesswork, and ensure compliance with security standards when building applications that integrate [Telerik Reporting]({%slug telerikreporting/welcome-to-telerik-reporting!%}). The coding assistant is an AI code generator that provides specialized context to AI models, enabling them to produce higher-quality code samples.


## Available Tools

The **AI Coding Assistant** is represented by:

* GenAI-powered Embeddability [Copilot Extension]({%slug ai-copilot-extension%})

* [MCP server]({%slug ai-mcp-server%})

### Key Differences

The major differences between these tools are:

| Feature| MCP Server| GitHub Copilot Extension|
|-----|----|----|
|Prompt Handling|Handles complex, multi-step prompts| Offers shorter, focused code snippets|
|Client Compatibility|Works with MCP-enabled clients (e.g., Cursor, Copilot Agent mode)|Integrated as a Copilot extension|
|Code Suggestions|Can directly suggest changes and rebuild applications to verify code|Provides detailed explanations alongside code suggestions|
|Response Focus|Primarily code-focused|Better for learning and understanding implementation|

## Prerequisites for the AI Coding Assistant

To use the Telerik Reporting AI Coding Assistant, you need:

* A [Telerik user account](https://www.telerik.com/account/).
* An active [Telerik license](https://www.telerik.com/purchase.aspx?filter=web) that includes Telerik Reporting.
* An application that uses the [Telerik Reporting]({%slug telerikreporting/welcome-to-telerik-reporting!%}).

## Number of Requests

The Reporting AI Coding Assistant allows the following maximum number of requests based on your [Telerik license type](https://www.telerik.com/purchase.aspx?filter=web):

| License Type | Request Limit |
|--------------|---------------|
| Perpetual | 50 requests per year |
| Subscription | Virtually unlimited with fair use threshold of 300 requests per day |
| Trial | 300 requests per trial period (does not reset with new trial activations) |

> All Telerik AI tools share a single request quota for your Telerik account. Usage from the [Telerik Copilot extension]({%slug ai-copilot-extension%}) and [Telerik MCP server]({%slug ai-mcp-server%}) counts toward the same limit. Complex prompts in the MCP server may consume multiple requests.

## Privacy

The Telerik Reporting AI Coding Assistant operates under strict privacy guidelines:

Data Access:

* No access to your workspace and application code.
* Exception: when using the Telerik MCP server (or any other MCP server), the LLM generates parameters for the MCP server request, which may include parts of your application code.
 
## Next Steps

* Install the [Telerik Reporting GitHub Copilot Extension]({%slug ai-copilot-extension%})
* Configure the [Telerik Reporting MCP Server]({%slug ai-mcp-server%}) with an MCP-enabled client
