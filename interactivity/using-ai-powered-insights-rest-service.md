---
title: Using AI-Powered Insights with a REST service
page_title: How to Use AI-Powered Insights with a REST service
description: "Learn how to implement an AI-powered prompt UI as part of any web-based report viewer."
slug: telerikreporting/designing-reports/adding-interactivity-to-reports/ai-powered-insights-rest-service
tags: telerik, reporting, ai, rest
published: True
position: 2
---

# Using AI-Powered Insights With a REST Service

This tutorial shows how to enable and configure AI-powered insights with a [Telerik Reporting REST service]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/overview%}) so that end users can run predefined or custom prompts against the data behind the currently previewed report and receive responses from an LLM.

> If you use a [Telerik Report Server](https://docs.telerik.com/report-server/introduction) instead of a standalone Telerik Reporting REST service, check the Report Server article [AI-Powered Features Settings](https://docs.telerik.com/report-server/implementer-guide/configuration/ai-settings) instead.

## Prerequisites

To follow the steps from this tutorial, you must have:

- A running application that hosts a Reporting REST service.
- A report viewer connected to that REST service.
- An active subscription (or local runtime) for an LLM model provider with API access. The supported out of the box ones are:
    - [Azure AI Foundry](https://learn.microsoft.com/en-us/azure/ai-foundry/concepts/deployments-overview)
    - [Azure OpenAI](https://learn.microsoft.com/en-us/azure/ai-foundry/openai/overview#how-do-i-get-access-to-azure-openai)
    - [OpenAI](https://platform.openai.com/docs/models)
    - [Ollama](https://docs.ollama.com/quickstart)

>tip You can also connect to LLM providers that are not supported out of the box. To do this, create a custom `Telerik.Reporting.AI.IClient` implementation to integrate the provider into Reporting and enable the AI-powered insights functionality. For more details, refer to the article [Creating Custom AI Client Implementation]({%slug telerikreporting/designing-reports/adding-interactivity-to-reports/custom-iclient-implementation%}).

## Using AI-Powered Insights with a REST service

To enable the AI-powered insights, follow these steps:

1. Install exactly one of the following NuGet packages, depending on the LLM provider you use:

    - `Telerik.Reporting.AI.Microsoft.Extensions.AzureAIInference` - for Azure AI Foundry
    - `Telerik.Reporting.AI.Microsoft.Extensions.AzureOpenAI` - for Azure OpenAI resources
    - `Telerik.Reporting.AI.Microsoft.Extensions.OpenAI` - for OpenAI
    - `Telerik.Reporting.AI.Microsoft.Extensions.Ollama` - for Ollama

1. Add the [AIClient element]({%slug telerikreporting/aiclient-element%}) to the report engine configuration in your application's configuration file. This element allows you to specify the AI model, endpoint, and authentication credentials. The following example demonstrates a basic Azure OpenAI configuration:

````JSON
{
    "telerikReporting": {
        "AIClient": {
            "friendlyName": "MicrosoftExtensionsAzureOpenAI",
            "model": "gpt-4o-mini",
            "endpoint": "https://ai-explorations.openai.azure.com/",
            "credential": "YOUR_API_KEY"
        }
    }
}
````
````XML
<Telerik.Reporting>
    <AIClient
        friendlyName="MicrosoftExtensionsAzureOpenAI"
        model="gpt-4o-mini"
        endpoint="https://ai-explorations.openai.azure.com/"
        credential="YOUR_API_KEY">
    </AIClient>
</Telerik.Reporting>
````

>tip If you haven't configured the report engine previously, make sure to check the article [Report Engine Configuration Overview]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/overview%}) to get familiar with this topic.

In this case, the `friendlyName` attribute identifies the LLM provider to the report engine. Each provider has specific configuration requirements:

- Azure OpenAI: Use `MicrosoftExtensionsAzureOpenAI`. Requires `model`, `endpoint`, and `credential`.
- Azure AI Foundry: Use `MicrosoftExtensionsAzureAIInference`. Requires `model`, `endpoint`, and `credential`.
- OpenAI: Use `MicrosoftExtensionsOpenAI`. Requires only `model` and `credential` (uses the default OpenAI API endpoint).
- Ollama: Use `MicrosoftExtensionsOllama`. Requires only `model` and `endpoint` (no authentication needed for local deployments).

## See Also

* [AI-Powered Insights Overview]({%slug telerikreporting/designing-reports/adding-interactivity-to-reports/ai-powered-insights%})
* [Configuring the AI-Powered Insights]({%slug telerikreporting/designing-reports/adding-interactivity-to-reports/configuring-ai-powered-insights%})
* [Creating Custom AI Client Implementation]({%slug telerikreporting/designing-reports/adding-interactivity-to-reports/custom-iclient-implementation%})
* [AI Insights Report Demo](https://demos.telerik.com/reporting/ai-insights)
