---
title: typeValidation Element
page_title: typeValidation Element Configuration
description: "Learn how to set up the typeValidation Element allowing you to disable the built-in type validation."
slug: telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/typeValidation-element
tags: typeValidation,element,type,validation,security
published: True
position: 12
---

<style>
table th:first-of-type {
	width: 10%;
}
table th:nth-of-type(2) {
	width: 90%;
}
</style>

# typeValidation Element Overview

The typeValidation element defines configuration settings for the type validation performed by the Reporting engine.

XML-based configuration file:

````XML
<typeValidation validateExpressionTypes="true" validateSerializationTypes="true" />
````

JSON-based configuration file:

````JSON
"typeValidation": {
	"validateExpressionTypes": "true",
	"validateSerializationTypes": "true"
}
````

## Attributes and Elements

The following sections describe attributes and parent elements.

|   |   |
| ------ | ------ |
|Attributes|<ul><li>__validateExpressionTypes__ – optional boolean attribute. Specifies whether expression types should be validated by the Reporting engine. True by default.</li><li>__validateSerializationTypes__ – optional boolean attribute. Specifies whether serialization types should be validated by the Reporting engine. True by default.</li></ul>|
|Parent Elements|<ul><li>__configuration__ - Specifies the root element in every configuration file that is used by the common language runtime and the .NET Framework applications.</li><li>__Telerik.Reporting__ - Configures all settings that Telerik Reporting Engine uses.</li></ul>|

## Example

The following code example demonstrates how to disable the type validation performed by the Reporting Engine.

>warning The type validation of the Reporting engine is an important security feature and disabling it can make you vulnerable to attacks! Proceed at your own risk, only if you are confident in the security of your environment.

XML-based configuration file:

````XML
<?xml version="1.0"?>
<configuration>
	<configSections>
		<section name="Telerik.Reporting" type="Telerik.Reporting.Configuration.ReportingConfigurationSection, Telerik.Reporting" allowLocation="true" allowDefinition="Everywhere" />
	</configSections>
	<Telerik.Reporting>
		<typeValidation validateExpressionTypes="false" validateSerializationTypes="false" />
	</Telerik.Reporting>
...
</configuration>
````

JSON-based configuration file:

````JSON
"telerikReporting": {
	"typeValidation": {
		"validateExpressionTypes": "false",
		"validateSerializationTypes": "false"
	}
}
````

> When adding the `Telerik.Reporting` section manually, do not forget to register it in `configSections` element of the configuration file. Failing to do so will result in a [ConfigurationErrorsException](https://learn.microsoft.com/en-us/dotnet/api/system.configuration.configurationerrorsexception?view=dotnet-plat-ext-7.0) with the following text: *Configuration system failed to initialize*.

## See Also

* [Application Configuration Files](https://learn.microsoft.com/en-us/windows/win32/sbscs/application-configuration-files)
