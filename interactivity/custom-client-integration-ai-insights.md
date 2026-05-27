---
title: Enable AI-Powered Insights with Custom AI Client
page_title: How to Enable AI-Powered Insights with Custom AI Client
description: "Learn how to enable AI-powered insights by creating a custom IClient implementation to integrate unsupported LLM providers or implement custom logic."
slug: telerikreporting/designing-reports/adding-interactivity-to-reports/ai-powered-insights-custom-client
tags: telerik, reporting, ai, custom, implementation
tag: new
published: True
position: 3
reportingArea: General
---

# Enable AI-Powered Insights with Custom AI Client

While Telerik Reporting provides built-in support for popular LLM providers like Azure OpenAI, OpenAI, Azure AI Foundry, and Ollama, you may need to integrate with other AI services or implement custom logic, such as token usage tracking. This article shows how to enable AI-powered insights by creating a custom `IClient` implementation to connect any LLM provider.

## Prerequisites

To follow the steps from this tutorial, you must have:

- A running application that hosts a [Telerik Reporting REST service](slug:telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/overview).
- A report viewer connected to that REST service.
- An active subscription (or local runtime) for an LLM model provider with API access.

## Enabling Custom AI Client

To enable a custom AI client implementation, follow these steps:

1. Create a class that implements the `Telerik.Reporting.AI.IClient` interface. 

	The following example demonstrates an Azure OpenAI integration for illustration purposes, though you can use any LLM provider:

	>caption .NET
	{{source=CodeSnippets\Blazor\Docs\CustomAiClient.cs region=Enabling_Custom_AI_Client}}
	>caption .NET Framework
	{{source=CodeSnippets\CS\API\Telerik\Reporting\AI\CustomAIClient.cs region=custom_client_integration_ai_insights_Snippet}}

	> This Azure OpenAI example uses `Azure.AI.OpenAI` version `2.2.0-beta.4` and `Microsoft.Extensions.AI.OpenAI` version `9.4.3-preview.1.25230.7` for demonstration purposes. 
	>
	> For your implementation, you will typically use different packages specific to your LLM provider. Focus on the implementation structure, which is further detailed in the [Understanding the IClient Interface](#understanding-the-iclient-interface) section.

1. Register the custom client in your `ReportServiceConfiguration`:

	>caption .NET
	{{source=CodeSnippets\Blazor\Docs\ProgramWithRestConfig.cs region=custom_client_integration_ai_insights_Snippet_2}}
	>caption .NET Framework
	{{source=CodeSnippets\MvcCS\Controllers\CustomResolverReportsController.cs region=custom_client_integration_ai_insights_Snippet_3}}

You can further customize the AI client to enable additional features like RAG optimization, predefined prompts, and user consent settings.

For more details, refer to [Customizing AI-Powered Insights](slug:telerikreporting/designing-reports/adding-interactivity-to-reports/configuring-ai-powered-insights).

## Understanding the IClient Interface

The `Telerik.Reporting.AI.IClient` interface defines the contract for AI service integration:

{{source=CodeSnippets\Blazor\Docs\ProgramWithRestConfig.cs region=Understanding_the_IClient_Interface}}

### Key Properties and Methods

- **Model**—Specifies the model name used for tokenization encoding. This should match the actual model being used for accurate token counting. For more information on its impact, check the `tokenizationEncoding` option in the [RAG Configuration](slug:telerikreporting/designing-reports/adding-interactivity-to-reports/configuring-ai-powered-insights#retrieval-augmented-generation-rag-configuration) section.
- **SupportsSystemPrompts**—Indicates whether the LLM supports system role messages. When `false`, all messages in the `query` argument from the `GetResponseAsync` method are converted to user role to prevent invalid message types from being unintentionally passed to the LLM client during type conversion.
- **GetResponseAsync**—The core method that processes AI queries and returns responses.

### Implementation Details

The `IChatClient` in the [example above](#enabling-custom-ai-client) is not mandatory—it is used to simplify interaction with the Azure OpenAI service. You can implement the interface using any client that communicates with your chosen LLM provider.

When RAG (Retrieval-Augmented Generation) is enabled via the `allowRAG` configuration option, the `GetResponseAsync` method is called twice per user prompt:

1. **RAG Evaluation Call**—Determines if the prompt is suitable for RAG optimization. The `query` parameter contains instructions for RAG applicability assessment and the user's question.
1. **Main Query Call**—Processes the request with the report data. The `query` parameter includes response instructions, report metadata (may be filtered based on the RAG evaluation), and the user's question.

This dual-call approach optimizes token usage by first determining RAG suitability, then filtering report data only when the evaluation indicates RAG optimization is beneficial.

When RAG is disabled, the method is called only once without the report metadata being pre-filtered.

> RAG is available only in .NET and .NET Standard.

## See Also

- [AI-Powered Insights Overview](slug:telerikreporting/designing-reports/adding-interactivity-to-reports/ai-powered-insights)
- [Enable AI-Powered Insights with Built-in AI Client](slug:telerikreporting/designing-reports/adding-interactivity-to-reports/ai-powered-insights-builtin-client)
- [Customizing AI-Powered Insights](slug:telerikreporting/designing-reports/adding-interactivity-to-reports/configuring-ai-powered-insights)
- [AI Insights Report Demo](https://demos.telerik.com/reporting/ai-insights)
