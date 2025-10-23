---
title: Creating Custom AI Client Implementation
page_title: How to Create a Custom AI Client Implementation
description: "Learn how to create a custom IClient implementation to integrate unsupported LLM providers with Telerik Reporting AI-powered insights."
slug: telerikreporting/designing-reports/adding-interactivity-to-reports/custom-iclient-implementation
tags: telerik, reporting, ai, custom, implementation
published: True
position: 4
---

# Creating Custom AI Client Implementation

While Telerik Reporting provides built-in support for popular LLM providers like Azure OpenAI, OpenAI, and Ollama, you may need to integrate with other AI services or implement custom logic. This article shows how to create a custom `IClient` implementation to connect any LLM provider to the AI-powered insights functionality.

## Enabling Custom AI Client

To enable a custom AI client implementation, follow these steps:

1. Create a class that implements the `Telerik.Reporting.AI.IClient` interface. The following example demonstrates an Azure OpenAI integration for illustration purposes, though you can use any LLM provider:

    ````C#
using Azure.AI.OpenAI;
    using Microsoft.Extensions.AI;
    using System.ClientModel;
    using Telerik.Reporting.AI;

    namespace WebApplication1.AI;

    public class CustomAIClient : IClient
    {
        public string Model { get; } = "gpt-4o-mini";

        public bool SupportsSystemPrompts => false;

        private readonly IChatClient chatClient;

        public CustomAIClient()
        {
            string endpoint = "https://ai-explorations.openai.azure.com/";
            string credential = "YOUR_API_KEY";
            string model = "gpt-4o-mini";

            chatClient = new AzureOpenAIClient(new Uri(endpoint), new ApiKeyCredential(credential))
                .GetChatClient(model)
                .AsIChatClient();
        }

        public async Task<IReadOnlyCollection<IMessage>> GetResponseAsync(IReadOnlyCollection<IMessage> query, CancellationToken cancellationToken)
        {
            // Convert Telerik.Reporting.AI IMessage to Microsoft.Extensions.AI ChatMessage
            var chatMessages = new List<ChatMessage>();
            foreach (var message in query)
            {
                ChatRole chatRole = message.Role switch
                {
                    MessageRole.System => ChatRole.System,
                    MessageRole.Assistant => ChatRole.Assistant,
                    MessageRole.User => ChatRole.User,
                    _ => throw new ArgumentException($"Invalid MessageRole: {message.Role}")
                };

                // Convert text contents from Telerik.Reporting.AI TO Microsoft.Extensions.AI
                var textContents = message.Contents
                    .OfType<Telerik.Reporting.AI.TextContent>()
                    .Select(textContent => new Microsoft.Extensions.AI.TextContent(textContent.Text))
                    .Cast<AIContent>()
                    .ToList();

                chatMessages.Add(new ChatMessage(chatRole, textContents));
            }

            // Call Azure OpenAI
            var response = await chatClient.GetResponseAsync(chatMessages, new ChatOptions(), cancellationToken);

            // Convert response back to Telerik.Reporting.AI IMessage
            var resultMessages = new List<IMessage>();
            foreach (var responseMessage in response.Messages)
            {
                MessageRole messageRole = responseMessage.Role.Value switch
                {
                    "system" => MessageRole.System,
                    "assistant" => MessageRole.Assistant,
                    "user" => MessageRole.User,
                    _ => throw new ArgumentException($"Invalid ChatRole: {responseMessage.Role}")
                };

                // Convert back to Telerik.Reporting.AI content
                var contents = responseMessage.Contents
                    .OfType<Microsoft.Extensions.AI.TextContent>()
                    .Select(tc => new Telerik.Reporting.AI.TextContent(tc.Text))
                    .Cast<IContent>()
                    .ToList();

                resultMessages.Add(new Message(messageRole, contents));
            }

            return resultMessages;
        }

        public static IClient GetCustomAIClient()
        {
            return new CustomAIClient();
        }
    }
````


1. Register the custom client in your `ReportServiceConfiguration`:

    * .NET

    ````C#
builder.Services.TryAddSingleton<IReportServiceConfiguration>(sp => new ReportServiceConfiguration
    {
        HostAppId = "MyApp",
        AIClientFactory = WebApplication1.AI.CustomAIClient.GetCustomAIClient,
        // ...
    });
````


* .NET Framework

    ````C#
public class CustomResolverReportsController : ReportsControllerBase
    {
        static ReportServiceConfiguration configurationInstance;

        static CustomResolverReportsController()
        {
            configurationInstance = new ReportServiceConfiguration
            {
                HostAppId = "MyApp",
                AIClientFactory = WebApplication1.AI.CustomAIClient.GetCustomAIClient,
                // ...
            };
        }
    }
````


You can further customize the AI client to enable additional features like RAG optimization, predefined prompts, and user consent settings. For more details, refer to [Configuring the AI-Powered Insights]({%slug telerikreporting/designing-reports/adding-interactivity-to-reports/configuring-ai-powered-insights%}).

## Understanding the IClient Interface

The `Telerik.Reporting.AI.IClient` interface defines the contract for AI service integration:

````C#
public interface IClient
{
    string Model { get; }
    bool SupportsSystemPrompts { get; }
    Task<IReadOnlyCollection<IMessage>> GetResponseAsync(IReadOnlyCollection<IMessage> query, CancellationToken cancellationToken);
}
````

### Key Properties and Methods

- **Model**—Specifies the model name used for tokenization encoding. This should match the actual model being used for accurate token counting. For more information on its impact, check the `tokenizationEncoding` option in the [RAG Configuration]({%slug telerikreporting/designing-reports/adding-interactivity-to-reports/configuring-ai-powered-insights%}#retrieval-augmented-generation-rag-configuration) section.
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

* [AI-Powered Insights Overview]({%slug telerikreporting/designing-reports/adding-interactivity-to-reports/ai-powered-insights%})
* [Using AI-Powered Insights with a REST service]({%slug telerikreporting/designing-reports/adding-interactivity-to-reports/ai-powered-insights-rest-service%})
* [Configuring the AI-Powered Insights]({%slug telerikreporting/designing-reports/adding-interactivity-to-reports/configuring-ai-powered-insights%})
* [AI Insights Report Demo](https://demos.telerik.com/reporting/ai-insights)
