---
title: Overview
page_title: Telerik Reporting AI Tooling Overview
description: "Learn about the Telerik Reporting AI-powered developer tools that integrate with your IDE or code editor for greater productivity and enhanced developer experience."
slug: ai-coding-assistant
tags: ai, telerik, reporting, coding, assistant
published: True
position: 0
---

# Telerik Reporting AI Coding Assistant

Telerik Reporting offers an **AI Coding Assistant** that leverages AI to enhance developer experience and boost productivity when building web applications with [Telerik Reporting]({%slug telerikreporting/welcome-to-telerik-reporting!%}) integration.

The AI Coding Assistant is an AI code generator that provides specialized context to AI models, enabling them to produce higher-quality code samples.

The **AI Coding Assistant** is integrated in:

* [Telerik Reporting MCP server]({%slug ai-mcp-server%}) - A powerful tool for running complex or multi-step prompts that integrates with any MCP-enabled client.

* [Telerik Reporting GitHub Copilot Extension]({%slug ai-copilot-extension%}) - A Copilot add-on for fast initial code generation, widget configuration, and detailed explanations within Copilot-enabled IDEs.

You can combine both integrations for even more powerful results.

## Getting Started

To use the Telerik Reporting AI Coding Assistant, you need:

* A [Telerik user account](https://www.telerik.com/account/).
* An active [DevCraft or Telerik Reporting license](https://www.telerik.com/purchase.aspx?filter=web), or a [Telerik Reporting trial](https://www.telerik.com/reporting).
* An application that uses [Telerik Reporting]({%slug telerikreporting/welcome-to-telerik-reporting!%}).
* A Telerik [Subscription license](https://www.telerik.com/purchase/faq/licensing-purchasing) is recommended in order to use the Telerik Reporting AI Coding Assistant without restrictions. Perpetual license holders and trial users can make a limited number of requests per year.

> [Microsoft is sunsetting GitHub Copilot extensions](https://github.blog/changelog/2025-09-24-deprecate-github-copilot-extensions-github-apps) on November 10, 2025, in favor of the Model Context Protocol (MCP) standard.
>
> From that date, the Telerik and Kendo UI AI Coding Assistants will be available exclusively through our [MCP servers]({%slug ai-mcp-server%}). You can enjoy the same powerful capabilities that are delivered by a modern, open, and officially recommended standard.

## Intended Use

>warning Always double-check the code and solutions proposed by any AI-powered tool before applying them to your project.

You can use the AI Coding Assistant for:

* **Initial code generation:** Quickly add Report Viewer to your app to speed up the initial development. The Assistant can produce the necessary code for both front-end and back-end modules of your application. 
* **Widget configuration:** Enable or disable specific features, or fine-tune the configuration through prompting. More complex configurations are possible but may require additional manual work to be production-ready.
* **Step-by-step explanations:** Understand the solutions provided by the AI Coding Assistant through the detailed explanations (depends on the tool, mode, and model used). To further develop your knowledge, check the respective documentation.
* **Preliminary troubleshooting:** Resolve obvious and easy-to-solve issues affecting your code. For more complex issues, look for assistance from the community or contact the support team.

> The AI Coding Assistant is not intended for designing reports or applying changes during the report processing and rendering stages.

## Recommendations
Consider the following recommendations when working with the AI Coding Assistant:

* When switching between tasks and files, start a new session in a new chat window to avoid polluting the context with irrelevant or outdated information.
* At the time of publishing, Claude Sonnet 4 and GPT-5 produce optimal results.

## Support

#### Report Viewers

- [HTML5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%})
- [Blazor Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/overview%})
- [Native Blazor Report Viewer]({%slug telerikreporting/embedding-reports/display-reports-in-applications/web-application/native-blazor-report-viewer/overview%})
- [Angular Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/angular-report-viewer-overview%})
- [Native Angular Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/overview%})
- [React Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/react-report-viewer-overview%})

#### Services

- [Telerik Reporting REST Service - ASP.NET Core Web API Implementation]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/asp.net-core-web-api-implementation/overview%})
- [Telerik Reporting REST Service - ASP.NET Web API Implementation]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/asp.net-web-api-implementation/overview%})

## Usage Limits

Access to the AI Coding Assistant depends on your [Telerik license type](https://www.telerik.com/purchase.aspx?filter=web):

#### Subscription License

* A Subscription is the primary license that grants full access to the AI Coding Assistant.
* Includes a virtually unlimited number of requests, with a fair use threshold of 300 requests per day.
* Best for ongoing and high-volume usage.

#### Perpetual License (Limited Access)
* Perpetual licenses include limited access of 50 requests per year.
* Intended for exploring and trying out the AI Coding Assistant.
* For continued or higher-volume access, upgrade to a Subscription license.

#### Trial License
* Trial licenses include 300 requests per trial per year.
* Reactivating the same trial for a new release does not grant additional requests.
* Designed for evaluating the feature before purchasing.

> All Telerik AI tools share a single request quota for your Telerik account. Usage from the [Telerik Copilot extension]({%slug ai-copilot-extension%}) and [Telerik MCP server]({%slug ai-mcp-server%}) counts toward the same limit. Complex prompts in the MCP server may consume multiple requests.

## Privacy

The Telerik Reporting AI Coding Assistant operates under the following conditions:

* The Assistant has no access to your workspace and application code. Note that when using the Telerik Reporting MCP server (or any other MCP server), the LLM generates parameters for the MCP server request, which may include parts of your application code.
* The Assistant does not use your prompts train Telerik AI models.
* The Assistant does not generate the actual responses and has no access to them. The Assistant only enhances the context that helps your selected LLM (for example, GPT, Gemini, Claude) generate more relevant and accurate responses.
* The Assistant does not associate your prompts with your Telerik user account. Your prompts and generated context are anonymized and stored only for statistical analysis and troubleshooting purposes.
* The Assistant stores metrics about how often and how much you use it in order to ensure compliance with the [allowed number of requests that correspond to your current license](#usage-limits).

Please make sure you are familiar with the terms and privacy policy of your selected AI model and AI client.
 
## Next Steps

* [Install the  Telerik Reporting GitHub Copilot Extension]({%slug ai-copilot-extension%})
* [Configure the Telerik Reporting MCP Server]({%slug ai-mcp-server%})
* [Telerik Reporting Prompt Library]({%slug ai-prompt-library%})
 
## See Also

* [GitHub Copilot Documentation](https://docs.github.com/en/copilot)
* [GitHub Copilot Tutorials](https://github.com/features/copilot/tutorials)
* [Telerik Reporting MCP Server]({%slug ai-mcp-server%})
* [Telerik Reporting Prompt Library]({%slug ai-prompt-library%})
* [Kendo UI for Angular GitHub Copilot Extension](https://www.telerik.com/kendo-angular-ui/components/ai-assistant/copilot-extension)
* [Telerik Blazor GitHub Copilot Extension](https://www.telerik.com/blazor-ui/documentation/ai/copilot-extension)
