---
title: typeValidation Element
page_title: typeValidation Element Configuration
description: "Learn how to set up the typeValidation Element allowing you to disable the built-in type validation."
slug: telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/typeValidation-element
tags: typeValidation,element,type,validation,security
published: True
position: 12
reportingArea: General
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

> note This element was first introduced in the 2024 Q3 (18.2.24.924) Reporting version.

As Telerik Reporting consumes report definitions, they are a potential attack vector, and a malicious actor could utilize a modified report to execute an attack against a system that uses Telerik Reporting.

To prevent that, the Reporting engine validates the serialization types of the report definition and the expression types used in the report. The `typeValidation` element defines the configuration settings for this validation.

```XML
<typeValidation validateExpressionTypes="true" validateSerializationTypes="true" />
```
```JSON
"typeValidation": {
	"validateExpressionTypes": "true",
	"validateSerializationTypes": "true"
}
```

## Attributes and Elements

The following sections describe attributes and parent elements.

|                 |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
| --------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Attributes      | <ul><li>**validateExpressionTypes** – optional boolean attribute. Specifies whether expression types should be validated by the Reporting engine. _True_, by default. You can disable the validation of expression types if the expressions in your reports are input by a trusted external source.</li><li>**validateSerializationTypes** – optional boolean attribute. Specifies whether serialization types should be validated by the Reporting engine. _True_, by default. If the report definitions consumed by your application are from a trusted source, you can disable the validation of serialization types.</li></ul> |
| Parent Elements | <ul><li>**configuration** - Specifies the root element in every configuration file that is used by the common language runtime and the .NET Framework applications.</li><li>**Telerik.Reporting** - Configures all settings that Telerik Reporting Engine uses.</li></ul>                                                                                                                                                                                                                                                                                                                                                          |

## Example

The following code example demonstrates how to disable the type validation performed by the Reporting Engine.

> warning The type validation of the Reporting engine is an important security feature, and disabling it can make you vulnerable to attacks! Proceed at your own risk, only if you are confident in the security of your environment.

```XML
<?xml version="1.0"?>
<configuration>
	<configSections>
		<section name="Telerik.Reporting" type="Telerik.Reporting.Configuration.ReportingConfigurationSection, Telerik.Reporting" allowLocation="true" allowDefinition="Everywhere" />
	</configSections>
	<Telerik.Reporting>
		<typeValidation validateExpressionTypes="false" validateSerializationTypes="false" />
	</Telerik.Reporting>
</configuration>
```
```JSON
"telerikReporting": {
	"typeValidation": {
		"validateExpressionTypes": "false",
		"validateSerializationTypes": "false"
	}
}
```

> When adding the `Telerik.Reporting` section manually, do not forget to register it in the `configSections` element of the configuration file. Failing to do so will result in a [ConfigurationErrorsException](https://learn.microsoft.com/en-us/dotnet/api/system.configuration.configurationerrorsexception?view=dotnet-plat-ext-7.0) with the following text: _Configuration system failed to initialize_.

## See Also

- [Application Configuration Files](https://learn.microsoft.com/en-us/windows/win32/sbscs/application-configuration-files)
