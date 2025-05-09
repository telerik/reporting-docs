---
title: AI-powered insights in Report Preview
page_title: AI-powered insights in Report Preview
description: "Learn how to implement a prompt UI as part of the Web report viewer"
slug: telerikreporting/designing-reports/adding-interactivity-to-reports/ai-powered-insights
tags: telerik, reporting, ai, 
published: True
position: 1
---

# AI-powered insights Overview

The AI-powered insights in Report Preview provide comprehensive capabilities, including response generation, prompt creation, AI output interaction, and execution of predefined commands.

## OpenAI Implementations

* Ask AI: This functionality enables users to pose questions to the AI, facilitating interactive and dynamic responses based on the provided document context.

* Output: This feature generates outputs from the AI, including summaries, highlights, and other predefined commands, enhancing the overall productivity and efficiency of the report viewer.

## Configure the AI

| Setting | Description |
| ------ | ------ |
|friendlyName|This setting specifies the name corresponding to the type of AI client you wish to use. For example, setting friendlyName to "MicrosoftExtensionsAzureOpenAI" indicates that the Azure OpenAI client is being utilized|
|model|This setting specifies the AI model to be used for generating responses. For example, setting the model to "gpt-4o-mini" indicates that the GPT-4 model variant is being utilized|
|endpoint|This setting specifies the URL of the AI service endpoint|
|credential|This setting specifies the authentication credentials required to access the AI service. It ensures that the AI client can securely connect to the specified endpoint|
|allowOnlyPredefinedPrompts|This setting is set to false by default. If you set it to `True`, you will not be allowed to ask anything except the predefined prompts. For example, if you write "Hi" it will throw an exception|
|predefinedPrompts|This setting specifies a list of predefined prompts that the AI client can use. Each prompt is defined by a text attribute, which contains the prompt's content|

__AI clients__

We have four available options for the `friendlyName` setting

|  |  |
| ------ | ------ |
|Microsoft.Extensions.AI.AzureAIInference|"MicrosoftExtensionsAzureAIInference"|
|Microsoft.Extensions.AI.OpenAI + Azure.AI.OpenAI|"MicrosoftExtensionsAzureOpenAI"|
|Microsoft.Extensions.AI.Ollama|"MicrosoftExtensionsOllama"|
|Microsoft.Extensions.AI.OpenAI|"MicrosoftExtensionsOpenAI"|

````JSON
"AIClient": {
  "friendlyName": "MicrosoftExtensionsAzureOpenAI",
  "model": "gpt-4o-mini",
  "endpoint": "https://ai-explorations.openai.azure.com/",
  "credential": "",
  "allowOnlyPredefinedPrompts":  true,
  "predefinedPrompts": [
    { "text": "Prompt 1" },
    { "text": "Prompt 2" }
  ]
}
````

````XML
<Telerik.Reporting>
<AIClient
     friendlyName "MicrosoftExtensionsAzureOpenAI"
     model="gpt-4o-mini"
     endpoint="https://ai-explorations.openai.azure.com/"
     credential="ce278499c31c4bfca3fffe0ad49b4330"
     allowOnlyPredefinedPrompts="true">
<predefinedPrompts>
  <add text="Prompt 1"/>
  <add text="Prompt 2"/>
</predefinedPrompts>
</AIClient>
</Telerik.Reporting>
````
## Extensibility

* If necessary, the Reporting engine can use a custom Telerik.Reporting.AI.IClient implementation, which can be registered in the Reporting REST Service configuration:

````C#
builder.Services.TryAddSingleton<IReportServiceConfiguration>(sp => new ReportServiceConfiguration
{
    HostAppId = "MyApp",
    AIClientFactory = GetCustomAIClient,
    ...
});
static Telerik.Reporting.AI.IClient GetCustomAIClient()
{
    return new MyCustomAIClient(...);
}
````

* The configured predefined prompts can be modified at runtime by overriding the "UpdateAIPrompts" method of the ReportsController class.

* Parts of the metadata sent by the Reporting engine to the AI model can be customized through resx files
