---
title: Customizing AI-Powered Insights
page_title: How to Customize the AI-Powered Insights
description: "Learn how to configure the AI-powered insights functionality to handle common and not so much use cases."
slug: telerikreporting/designing-reports/adding-interactivity-to-reports/configuring-ai-powered-insights
tags: telerik, reporting, ai, configuration
published: True
position: 3
---

# Customizing AI-Powered Insights

This article explains how to customize the AI-powered insights functionality for different use cases. There are two distinct ways to achieve this:
- [Configuring the Report Engine](#configuring-the-report-engine) - Declarative configuration through application settings.
- [Overriding ReportsControllerBase Methods](#overriding-reportscontrollerbase-methods) - Programmatic customization with custom logic.

## Configuring the Report Engine

As the [Using AI-Powered Insights with a REST service]({%slug telerikreporting/designing-reports/adding-interactivity-to-reports/ai-powered-insights-rest-service%}) article explains, to enable the AI-powered insights functionality, you need to configure the [AIClient element]({%slug telerikreporting/aiclient-element%}) within the report engine configuration in your application's config file. This step is essential for the report engine to connect to the LLM provider. For instance, here is a sample configuration for Azure OpenAI:

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

This is a base configuration, but it can be further extended to handle specific scenarios, as explained in the upcoming sections.

### User Consent Configuration

By default, the **AI Prompt** dialog requests explicit consent from users before sending prompts to the AI model. This ensures transparency about data being sent to external AI services and gives users control over their data privacy

<img src="images/user-consent.png" style="border: 1px solid lightgray; width: 500px" alt="User Consent for AI Summaries" />

In enterprise environments where AI usage policies are already established or when working with trusted internal models, you may want to streamline the user experience by disabling this consent requirement. In these cases, you can set the `requireConsent` option to `false`:

````JSON
{
    "telerikReporting": {
        "AIClient": {
            // ...base configuration...
            "requireConsent": false
        }
    }
}
````
````XML
<Telerik.Reporting>
    <AIClient
        <!-- ...base configuration... -->
        requireConsent="false">
    </AIClient>
</Telerik.Reporting>
````

### Prompts Configuration

By default, users can create their own custom prompts to ask any questions about their reports. While this provides maximum flexibility, it can lead to unpredictable token usage costs and potentially inconsistent results. In these cases, you can provide the users with predefined prompts that are designed to handle specific tasks.

To restrict users to predefined prompts only, you set `allowCustomPrompts` to `false` and add the predefined prompts through the `predefinedPrompts` option:

````JSON
{
    "telerikReporting": {
        "AIClient": {
            // ...base configuration...
            "requireConsent": false,
            "allowCustomPrompts": false,
            "predefinedPrompts": [
                { "text": "Generate a summary of the report." },
                { "text": "Translate the report into German." }
            ],
        }
    }
}
````
````XML
<Telerik.Reporting>
    <AIClient
        <!-- ...base configuration... -->
        requireConsent="false"
        allowCustomPrompts="false">
        <predefinedPrompts>
            <add text="Generate a summary of the report." />
            <add text="Translate the report into German." />
        </predefinedPrompts>
    </AIClient>
</Telerik.Reporting>
````

You can also add predefined prompts without disabling custom ones, giving users both curated options and the flexibility to create their own queries.

### Retrieval-Augmented Generation (RAG) Configuration

By default, the AI-powered insights functionality uses a [Retrieval-Augmented Generation (RAG)](https://aws.amazon.com/what-is/retrieval-augmented-generation/) algorithm to filter out the irrelevant report data before sending it to the AI model. This approach significantly improves the accuracy and relevance of the AI-generated response while optimizing token usage.

> RAG is available only in .NET and .NET Standard. Therefore, the options that are listed below are not supported in .NET Framework configurations.

If needed, you can disable this algorithm by setting `allowRAG` to `false`.

You can also configure the RAG behavior through the `ragSettings` option:
- `modelMaxInputTokenLimit` - Limits the maximum input tokens the AI model can process in a single request. The default value is `15000`.
- `maxNumberOfEmbeddingsSent` - Limits how many embeddings (chunks of retrieved content) are sent to the model in a single request. The default value is `15`.
- `maxTokenSizeOfSingleEmbedding` - Limits token size of each individual embedding, which prevents large chunks from dominating the prompt. The default value is `0` (no limit).
- `tokenizationEncoding` - Specifies tokenization scheme used to estimate the tokens usage before sending the request to the LLM model. By default, the encoding is determined automatically based on the specified model, which is recommended to ensure accurate token counting. Incorrect encoding may lead to miscalculations in token limits, causing either premature truncation of context or exceeding the model’s input capacity.
- `splitTables` - Indicates whether tables should be split during Retrieval-Augmented Generation (RAG) processing. When the splitting is allowed, only the relevant table cells will be taken into account, significantly reducing the number of tokens. The default value is `true`.

Below is an example that takes advantage of the table splitting and automatic encoding inference, but reduces the token limits:

````JSON
"telerikReporting": {
	"AIClient": {
        // ...base configuration...
		"requireConsent": false,
		"allowCustomPrompts": false,
		"predefinedPrompts": [
			{ "text": "Generate an executive summary of this report." },
			{ "text": "Translate the document into German." }
		],
		"ragSettings": {
			"modelMaxInputTokenLimit": 12000,
			"maxNumberOfEmbeddingsSent": 10,
			"maxTokenSizeOfSingleEmbedding": 2000
		}
	}
}
````

For a complete reference of all available `AIClient` options, check the article [AIClient Element Overview]({%slug telerikreporting/aiclient-element%}).

## Overriding ReportsControllerBase Methods

While declarative configuration handles most common scenarios, some advanced use cases require programmatic customization. You can achieve this by overriding specific methods of the [ReportsControllerBase](/api/telerik.reporting.services.webapi.reportscontrollerbase) class in your `ReportsController`. This approach allows you to implement dynamic logic based on user context, report properties, or business rules.

The following methods can be overridden to customize different aspects of the AI-powered insights workflow:

### CreateAIThread(string, string, ClientReportSource)

The [CreateAIThread(string, string, ClientReportSource)](/api/telerik.reporting.services.webapi.reportscontrollerbase#Telerik_Reporting_Services_WebApi_ReportsControllerBase_CreateAIThread_System_String_System_String_Telerik_Reporting_Services_WebApi_ClientReportSource_) method is called when the AI Prompt dialog is about to be displayed. You can override this method to control the UI properties of the dialog, such as configuring the user consent message, as well as setting up custom and predefined prompts. You can also override this method to disable the AI-powered insights functionality entirely. The logic can be tailored based on the currently previewed report, which is represented by the `ClientReportSource` property, which allows for dynamic adjustments outside of the basic configuration. Below, you can find some examples based on common use cases.

#### .NET

````Disabling·AI·Insights·Dynamically
/// <summary>
/// Disables the AI-powered insights functionality dynamically depending on the passed <see cref="ClientReportSource"/> parameter.
/// </summary>
/// <returns></returns>
public override IActionResult CreateAIThread(string clientID, string instanceID, ClientReportSource reportSource)
{
    if (reportSource.Report == "report-with-disabled-ai-insights.trdp")
    {
        return StatusCode(
            StatusCodes.Status403Forbidden,
            new
            {
                message = "An error has occurred.",
                exceptionMessage = "AI Insights functionality is not allowed for this report.",
                exceptionType = "Exception",
                stackTrace = (string?)null
            }
        );
    }

    return base.CreateAIThread(clientID, instanceID, reportSource);
}
````
````Changing·Consent·Message
/// <summary>
/// Overrides the default user consent message.
/// </summary>
/// <returns></returns>
public override IActionResult CreateAIThread(string clientID, string instanceID, ClientReportSource reportSource)
{
    var result = base.CreateAIThread(clientID, instanceID, reportSource);

    if (result is JsonResult jsonResult && jsonResult.Value is AIThreadInfo aiThreadInfo)
    {
        aiThreadInfo.ConsentMessage = "By using this AI functionality, you authorize the processing of any data you provide, including your prompt, for the purposes of delivering the service to you. Your use of this functionality is governed by the Progress privacy policy, available at: <a href='https://www.progress.com/legal/privacy-policy'>Privacy Policy - Progress</a>.";
    }

    return result;
}
````
````Setting·Predefined·Prompts·Dynamically
/// <summary>
/// Sets predefined prompts dynamically depending on the passed <see cref="ClientReportSource"/> parameter.
/// </summary>
/// <returns></returns>
public override IActionResult CreateAIThread(string clientID, string instanceID, ClientReportSource reportSource)
{
    var result = base.CreateAIThread(clientID, instanceID, reportSource);

    if (reportSource.Report == "report-suitable-for-markdown-output.trdp" &&
        result is JsonResult jsonResult &&
        jsonResult.Value is AIThreadInfo aiThreadInfo)
    {
        aiThreadInfo.PredefinedPrompts.Add("Create a summary of the report in Markdown (.md) format.");
    }

    return result;
}
````


#### .NET Framework

````Disabling·AI·Insights·Dynamically
/// <summary>
/// Disables the AI-powered insights functionality dynamically depending on the passed <see cref="ClientReportSource"/> parameter.
/// </summary>
/// <returns></returns>
public override HttpResponseMessage CreateAIThread(string clientID, string instanceID, ClientReportSource reportSource)
{
    if (reportSource.Report == "SampleReport.trdp")
    {
        var errorResponse = new
        {
            message = "An error has occurred.",
            exceptionMessage = "AI Insights functionality is not allowed for this report.",
            exceptionType = "Exception",
            stackTrace = (string)null
        };

        return this.Request.CreateResponse(HttpStatusCode.Forbidden, errorResponse);
    }

    return base.CreateAIThread(clientID, instanceID, reportSource);
}
````
````Changing·Consent·Message
/// <summary>
/// Overrides the default user consent message.
/// </summary>
/// <returns></returns>
public override HttpResponseMessage CreateAIThread(string clientID, string instanceID, ClientReportSource reportSource)
{
    var result = base.CreateAIThread(clientID, instanceID, reportSource);

    if (result.TryGetContentValue(out AIThreadInfo aiThreadInfo))
    {
        aiThreadInfo.ConsentMessage = "By using this AI functionality, you authorize the processing of any data you provide, including your prompt, for the purposes of delivering the service to you. Your use of this functionality is governed by the Progress privacy policy, available at: <a href='https://www.progress.com/legal/privacy-policy'>Privacy Policy - Progress</a>.";
    }

    return result;
}
````
````Setting·Predefined·Prompts·Dynamically
/// <summary>
/// Modifies the collection of predefined prompts before displaying it in the AI Insights dialog.
/// </summary>
/// <returns></returns>
public override HttpResponseMessage CreateAIThread(string clientID, string instanceID, ClientReportSource reportSource)
{
    var result = base.CreateAIThread(clientID, instanceID, reportSource);

    if (reportSource.Report == "report-suitable-for-markdown-output.trdp" &&
        result.TryGetContentValue(out AIThreadInfo aiThreadInfo))
    {
        aiThreadInfo.PredefinedPrompts.Add("Create a summary of the report in Markdown (.md) format.");
    }

    return result;
}
````


### UpdateAIPrompts(ClientReportSource, AIThreadInfo)

The [UpdateAIPrompts(ClientReportSource, AIThreadInfo)](/api/telerik.reporting.services.webapi.reportscontrollerbase#collapsible-Telerik_Reporting_Services_WebApi_ReportsControllerBase_UpdateAIPrompts_Telerik_Reporting_Services_WebApi_ClientReportSource_Telerik_Reporting_Services_Engine_AIThreadInfo_) method is called internally during the execution of the `CreateAIThread()`. It provides easier access to the `AIThreadInfo` object, which allows you to change the predefined prompts directly. The example below demonstrate how to add a Markdown-specific predefined prompt only for a particular report.

#### .NET

````C#
/// <summary>
/// Modifies the collection of predefined prompts before displaying it in the AI Insights dialog.
/// </summary>
/// <param name="reportSource"></param>
/// <param name="aiThreadInfo"></param>
protected override void UpdateAIPrompts(ClientReportSource reportSource, AIThreadInfo aiThreadInfo)
{
    if (reportSource.Report == "report-suitable-for-markdown-output.trdp")
    {
        aiThreadInfo.PredefinedPrompts.Add("Create a summary of the report in Markdown (.md) format.");
    }

    base.UpdateAIPrompts(reportSource, aiThreadInfo);
}
````

#### .NET Framework

````C#
/// <summary>
/// Modifies the collection of predefined prompts before displaying it in the AI Insights dialog.
/// </summary>
/// <param name="reportSource"></param>
/// <param name="aiThreadInfo"></param>
protected override void UpdateAIPrompts(ClientReportSource reportSource, AIThreadInfo aiThreadInfo)
{
    if (reportSource.Report == "report-suitable-for-markdown-output.trdp")
    {
        aiThreadInfo.PredefinedPrompts.Add("Create a summary of the report in Markdown (.md) format.");
    }

    base.UpdateAIPrompts(reportSource, aiThreadInfo);
}
````


### GetAIResponse(string, string, string, string, AIQueryArgs)

The [GetAIResponse(string, string, string, string, AIQueryArgs)](/api/telerik.reporting.services.webapi.reportscontrollerbase#Telerik_Reporting_Services_WebApi_ReportsControllerBase_GetAIResponse_System_String_System_String_System_String_System_String_Telerik_Reporting_Services_Engine_AIQueryArgs_) method is called every time a prompt is sent to the AI model. This method provides control over the AI request workflow, allowing you to intercept, modify, and validate requests before they reach the LLM. Below are examples of common customization scenarios.

#### .NET

````Modifying·Outgoing·Prompts
/// <summary>
/// Modifies the prompt sent from the client before passing it to the LLM.
/// </summary>
/// <returns></returns>
public override async Task<IActionResult> GetAIResponse(string clientID, string instanceID, string documentID, string threadID, AIQueryArgs args)
{
    args.Query += $"{Environment.NewLine}Keep your response concise.";

    return await base.GetAIResponse(clientID, instanceID, documentID, threadID, args);
}
````
````Token·Usage·Validation
/// <summary>
/// Examines the approximate tokens count and determines whether the prompt should be sent to the LLM.
/// </summary>
/// <returns></returns>
public override async Task<IActionResult> GetAIResponse(string clientID, string instanceID, string documentID, string threadID, AIQueryArgs args)
{
    const int MAX_TOKEN_COUNT = 500;
    args.ConfirmationCallBack = (AIRequestInfo info) =>
    {
        if (info.EstimatedTokensCount > MAX_TOKEN_COUNT)
        {
            return ConfirmationResult.CancelResult($"The estimated token count exceeds the allowed limit of {MAX_TOKEN_COUNT} tokens.");
        }

        return ConfirmationResult.ContinueResult();
    };

    return await base.GetAIResponse(clientID, instanceID, documentID, threadID, args);
}
````
````RAG·Optimization·Monitoring
/// <summary>
/// Examines whether the RAG optimization is applied for the current prompt.
/// </summary>
/// <returns></returns>
public override async Task<IActionResult> GetAIResponse(string clientID, string instanceID, string documentID, string threadID, AIQueryArgs args)
{
    args.ConfirmationCallBack = (AIRequestInfo info) =>
    {
        if (info.Origin == AIRequestInfo.AIRequestOrigin.Client)
        {
            System.Diagnostics.Trace.TraceInformation($"RAG optimization is {info.RAGOptimization} for this prompt.");
        }

        return ConfirmationResult.ContinueResult();
    };

    return await base.GetAIResponse(clientID, instanceID, documentID, threadID, args);
}
````

#### .NET Framework

````Modifying·Outgoing·Prompts
/// <summary>
/// Modifies the prompt sent from the client before passing it to the LLM.
/// </summary>
/// <returns></returns>
public override async Task<HttpResponseMessage> GetAIResponse(string clientID, string instanceID, string documentID, string threadID, AIQueryArgs args)
{
    args.Query += $"{Environment.NewLine}Keep your response concise.";

    return await base.GetAIResponse(clientID, instanceID, documentID, threadID, args);
}
````

## See Also

* [AI-Powered Insights Overview]({%slug telerikreporting/designing-reports/adding-interactivity-to-reports/ai-powered-insights%})
* [Using AI-Powered Insights with a REST service]({%slug telerikreporting/designing-reports/adding-interactivity-to-reports/ai-powered-insights-rest-service%})
* [Creating Custom AI Client Implementation]({%slug telerikreporting/designing-reports/adding-interactivity-to-reports/custom-iclient-implementation%})
* [AI Insights Report Demo](https://demos.telerik.com/reporting/ai-insights)
