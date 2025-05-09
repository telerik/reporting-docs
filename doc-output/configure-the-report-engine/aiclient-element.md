---
title: AIClient Element
page_title: AIClient Element Configuration
description: "Learn how to utilize the AIClient Element to configure the AI model used for GenAI-powered insights during report preview"
slug: telerikreporting/aiclient-element
tags: aiclient,element, ai
published: True
position: 13
---

<style>
table th:first-of-type {
	width: 10%;
}
table th:nth-of-type(2) {
	width: 90%;
}
</style>

# AIClient Element Overview

The `AIClient` element specifies the configuration settings for the GenAI-powered insights functionality of Telerik Reporting. It is used to connect the Reporting engine to a local or remote LLM, as well as configure the behavior of the built-in Reporting AI capabilities.  

## Attributes and Elements

__`<AIClient>` element__

|   |   |
| ------ | ------ |
|Attributes|<ul><li>__friendlyName__ - Required string attribute. Specifies the name that corresponds to the type of AI client to be used. The names of the currently supported AI client types are: `MicrosoftExtensionsAzureAIInference`, `MicrosoftExtensionsAzureOpenAI`, `MicrosoftExtensionsOllama`, and `MicrosoftExtensionsOpenAI`.</li><li>__model__ - Required string attribute. Specifies the AI model to be used for generating responses. For example, setting the model to "gpt-4o-mini" indicates that the GPT-4 model variant is being utilized.</li><li>__endpoint__ - Optional string attribute. If set, specifies the URL of the AI service endpoint.</li><li>__credential__ - Optional string attribute. If set, specifies the authentication credentials used to access the AI service.</li><li>__requireConsent__ - Optional boolean attribute _(true by default)_. Determines whether users must explicitly consent to the use of AI services before the AI report insights features can be utilized within the application.</li><li>__allowCustomPrompts__ - Optional boolean attribute _(true by default)_. Determines whether users are allowed to freely communicate with the AI model. If the switch is set to false, custom queries are forbidden and only the predefined prompts can be used.</li></ul>|
|Child Elements|<ul><li>__predefinedPrompts__ - Optional element. Defines a list of predefined prompts that the AI client can use.</li></ul>|
|Parent Element|__Telerik.Reporting__ - Configures all settings that the Telerik Reporting Engine uses.|

__`<predefinedPrompts>` element__

|   |   |
| ------ | ------ |
|Attributes|None|
|Child Elements|<ul><li>__add__ - Optional element. Adds a prompt to the list of predefined prompts.</li></ul>|
|Parent Element|__AIClient__|

__`<add>` element__

|   |   |
| ------ | ------ |
|Attributes|__text__ - The text of a predetermined AI prompt.|
|Child Elements|None|
|Parent Element|__predefinedPrompts__|

## Example

The following code example demonstrates how to configure the Reporting engine with an Azure OpenAI client that uses the `gpt-4o-mini` model. In addition, the AI functionality is restricted to using only a couple of predefined prompts for summarizing and translating the report.

XML-based configuration file:

````XML
<?xml version="1.0"?>
<configuration>
	<configSections>
		<section name="Telerik.Reporting" type="Telerik.Reporting.Configuration.ReportingConfigurationSection, Telerik.Reporting" allowLocation="true" allowDefinition="Everywhere" />
	</configSections>
	<Telerik.Reporting>
		<AIClient
			friendlyName="MicrosoftExtensionsAzureOpenAI"
			model="gpt-4o-mini"
			endpoint="https://ai-explorations.openai.azure.com/"
			credential="..."
			requireConsent="true"
			allowCustomPrompts="false">
			<predefinedPrompts>
				<add text ="Generate an executive summary of this report."/>
				<add text ="Translate the document in German."/>
			</predefinedPrompts>
		</AIClient>
	</Telerik.Reporting>
...
</configuration>
````

JSON-based configuration file:

````JSON
"telerikReporting": {
	"AIClient": {
		"friendlyName": "MicrosoftExtensionsAzureOpenAI",
		"model": "gpt-4o-mini",
		"endpoint": "https://ai-explorations.openai.azure.com/",
		"credential": "...",
		"requireConsent": true,
		"allowCustomPrompts": false,
		"predefinedPrompts": [
			{ "text": "Generate an executive summary of this report." },
			{ "text": "Translate the document in German." }
		]
	}
}
````

> When adding the `Telerik.Reporting` section manually, do not forget to register it in `configSections` element of the configuration file. Failing to do so will result in a [ConfigurationErrorsException](https://learn.microsoft.com/en-us/dotnet/api/system.configuration.configurationerrorsexception?view=dotnet-plat-ext-7.0) with the following text: *Configuration system failed to initialize*.

## See Also
