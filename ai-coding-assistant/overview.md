---
title: AI Assistant Overview
page_title: Telerik Reporting AI Tooling Overview
description: "Learn about the Telerik Reporting AI-powered developer tools that integrate with your IDE or code editor for greater productivity and enhanced developer experience."
slug: ai-coding-assistant
tags: ai, telerik, reporting, coding, assistant
published: True
position: 0
---

# Telerik Reporting AI Coding Assistant

Telerik Reporting offers an **AI Coding Assistant**, which leverages AI to enhance productivity, reduce guesswork, and ensure compliance with security standards when building applications that integrate [Telerik Reporting]({%slug telerikreporting/welcome-to-telerik-reporting!%}). The coding assistant is an AI code generator that provides specialized context to AI models, enabling them to produce higher-quality code samples.


The **AI Coding Assistant** is available through:

* [Telerik Reporting GitHub Copilot Extension]({%slug ai-copilot-extension%})

* [Telerik Reporting MCP server]({%slug ai-mcp-server%})

You can combine both integrations for even more powerful results.

## Getting Started

To use the Telerik Reporting AI Coding Assistant, you need:

* A [Telerik user account](https://www.telerik.com/account/).
* An active [DevCraft or Telerik Reporting license](https://www.telerik.com/purchase.aspx?filter=web), or a [Telerik Reporting trial](https://www.telerik.com/reporting).
* An application that uses [Telerik Reporting]({%slug telerikreporting/welcome-to-telerik-reporting!%}).
* A Telerik [Subscription license](https://www.telerik.com/purchase/faq/licensing-purchasing) is recommended in order to use the Telerik Reporting AI Coding Assistant without restrictions. Perpetual license holders and trial users can make a limited number of requests per year.

## Intended Use

>warning Always double-check the code and solutions proposed by any AI-powered tool before applying them to your project.

You can use the AI Coding Assistant for:

* **Initial code generation:** Quickly add Report Viewer to your app to speed up the initial development. The Assistant can produce the necessary code for both front-end and back-end modules of your application. 
* **Basic component configuration:** Enable or disable specific features, or fine tune the configuration through prompting. More complex configurations are possible but may require additional manual work to be production-ready.
* **Step-by-step explanations:** Understand the solutions provided by the AI Coding Assistant through the detailed explanations (depends on the tool, mode, and model used). To further develop your knowledge, check the respective documentation.
* **Preliminary troubleshooting:** Resolve obvious and easy-to-solve issues affecting your code. For more complex issues, look for assistance from the community or contact the support team.

> The AI Coding Assistant is not intended for designing reports or applying changes during the report processing and rendering stages.

## Number of Requests

The Reporting AI Coding Assistant allows the following maximum number of requests depending on your [Telerik license type](https://www.telerik.com/purchase.aspx?filter=web):

| License Type | Request Limit |
|--------------|---------------|
| Perpetual | 50 requests per year |
| Subscription | Virtually unlimited with fair use threshold of 300 requests per day |
| Trial | 300 requests per trial period (does not reset with new trial activations) |

> All Telerik AI tools share a single request quota for your Telerik account. Usage from the [Telerik Copilot extension]({%slug ai-copilot-extension%}) and [Telerik MCP server]({%slug ai-mcp-server%}) counts toward the same limit. Complex prompts in the MCP server may consume multiple requests.

## Privacy

The Telerik Reporting AI Coding Assistant operates under strict privacy guidelines:

### Data Access:

* The Assistant has no access to your workspace and application code.
* Exception: when using the Telerik MCP server (or any other MCP server), the LLM generates parameters for the MCP server request, which may include parts of your application code.

### Data Usage:
* Your prompts are not used to train Telerik AI models.
* The Assistant does not generate or alter the responses returned by the selected LLM. 
* The Assistant enhances the context that helps your selected LLM (for example, GPT, Gemini, Claude) generate more relevant and accurate responses.
* Your prompts are not linked to your Telerik user account. They are anonymized and stored only for statistical analysis and troubleshooting purposes.
* The Assistant stores metrics about how often and how much you use it in order to ensure compliance with the allowed number of requests that correspond to your current license.

Please make sure you are familiar with the terms and privacy policy of your selected AI model and AI client.
 
## Next Steps

* Install the [Telerik Reporting GitHub Copilot Extension]({%slug ai-copilot-extension%}).
* Configure the [Telerik Reporting MCP Server]({%slug ai-mcp-server%}) with an MCP-enabled client.
