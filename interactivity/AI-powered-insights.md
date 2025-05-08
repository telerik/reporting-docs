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

|   |   |
| ------ | ------ |
|friendlyName||
|model||
|endpoint||
|credential||
|allowOnlyPredefinedPrompts|This setting is set to false by default. If you set it to true you will not be allowed to ask anything except the predefined prompts. For example, if you write "Hi" it will throw an exception|
|predefinedPrompts||

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
     friendlyName="MicrosoftExtensionsAzureOpenAI"
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