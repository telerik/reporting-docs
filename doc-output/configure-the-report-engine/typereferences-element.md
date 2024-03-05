---
title: typeReferences Element
page_title: typeReferences Element Configuration
description: "Learn how to set up the typeReferences Element in order to use custom user functions in the report and create ObjectDataSource components"
slug: telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/typeReferences-element
tags: typeReferences,element, user, function, ObjectDataSource
published: True
position: 11
previous_url: /configuring-telerik-reporting-typeReferences
---

<style>
table th:first-of-type {
	width: 10%;
}
table th:nth-of-type(2) {
	width: 90%;
}
</style>

# TypeReferences Element Overview

Defines a collection of type references that are used from Reporting Engine to resolve the custom types that are permitted to be used during the design and processing stages. The assemblies used by the types in TypeReferences section are loaded into application domain if the type is successfully resolved, so it's not necessary to declare the assembly also in the AssemblyReferences section.

XML-based configuration file:

````XML
<TypeReferences>
	<add />
	<clear />
	<remove />
</TypeReferences>
````

JSON-based configuration file:

````JSON
"typeReferences": [
],
````

## Attributes and Elements

The following sections describe attributes, child elements, and parent elements.

|   |   |
| ------ | ------ |
|Attributes|<ul><li>__typeName__ – mandatory string attribute. Specifies the full name of the type, i.e. namespace and class name.</li><li>__assemblyName__ – mandatory string attribute. Specifies the name of the assembly that contains the type.</li><li>__publicKeyToken__ – optional string attribute. Specifies the public key token of the assembly. Can be omitted or can have empty or null value.</li></ul>|
|Child Elements|<ul><li>__add__ - Optional element. Adds an type reference to the collection.</li><li>__clear__ - Optional element. Removes all references to inherited type names, allowing only the references that are added by the current add element.</li><li>__remove__ - Optional element. Removes a reference to an inherited type name from the collection.</li></ul>|
|Parent Elements|<ul><li>__configuration__ - Specifies the root element in every configuration file that is used by the common language runtime and the.NET Framework applications.</li><li>__Telerik.Reporting__ - Configures all settings that Telerik Reporting Engine uses.</li></ul>|

## Example

The following code example demonstrates how to configure the reporting engine to use "MyNamespace.MyClassName" type from "MyAssemblyName" assembly, which has a public key token with value "my-assembly-public-key-token". If the type is correctly resolvable at runtime, it will be permitted to be used as a source for ObjectDataSource's data retrieval. This configuration element also allows to list custom types that are allowed in the report definition.

XML-based configuration file:

````XML
<?xml version="1.0"?>
<configuration>
	<configSections>
		<section name="Telerik.Reporting" type="Telerik.Reporting.Configuration.ReportingConfigurationSection, Telerik.Reporting" allowLocation="true" allowDefinition="Everywhere" />
	</configSections>
	<Telerik.Reporting>
		<TypeReferences>
			<add typeName="MyNamespace.MyClassName" assemblyName="MyAssemblyName" publicKeyToken ="my-assembly-public-key-token" />
		</TypeReferences>
	</Telerik.Reporting>
...
</configuration>
````

JSON-based configuration file:

````JSON
"telerikReporting": {
	"typeReferences": [
		{
			"typeName": "MyNamespace.MyClassName",
			"assemblyName": "MyAssemblyName",
			"publicKeyToken": "my-assembly-public-key-token"
		}
	]
}
````

> When adding the `Telerik.Reporting` section manually, do not forget to register it in `configSections` element of configuration file. Failing to do so will result in a [ConfigurationErrorsException](https://learn.microsoft.com/en-us/dotnet/api/system.configuration.configurationerrorsexception?view=dotnet-plat-ext-7.0) with following text: *Configuration system failed to initialize*.

## See Also

* [Application Configuration Files](https://learn.microsoft.com/en-us/windows/win32/sbscs/application-configuration-files)
* [ObjectDataSource]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/objectdatasource-component/overview%})
