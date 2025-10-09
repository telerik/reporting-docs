---
title: assemblyReferences Element
page_title: assemblyReferences Element Configuration
description: "Learn how to set up the assemblyReferences Element to use custom user functions in the report and create ObjectDataSource components"
slug: telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/assemblyreferences-element
tags: assemblyreferences, element, user, function, ObjectDataSource
published: True
position: 4
previous_url: /configuring-telerik-reporting-assemblyreferences
---

<style>
table th:first-of-type {
	width: 10%;
}
table th:nth-of-type(2) {
	width: 90%;
}
</style>

# assemblyReferences Element Overview

Defines a collection of assembly references used by the Reporting Engine during the processing stage to resolve names of user functions, user aggregate functions, and types used by the ObjectDataSource component and Report Event Handlers.

The types from the assemblies included in the _assemblyReferences_ element do not need to be registered explicitly in the [_typeReferences_ Element]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/typeReferences-element%}) as all types in the assembly will be permitted to be used by the Reporting Engine.

````XML
<configuration>
	<configSections>
		<section name="Telerik.Reporting" type="Telerik.Reporting.Configuration.ReportingConfigurationSection, Telerik.Reporting" allowLocation="true" allowDefinition="Everywhere" />
	</configSections>
	<Telerik.Reporting>
		<assemblyReferences>
			<add />
			<clear />
			<remove />
		</assemblyReferences>
	</Telerik.Reporting>	
</configuration>
````
````JSON
"telerikReporting": {
	"assemblyReferences": [
		{
			"name": "",
			"version": "",
			"culture": "",
			"publicKeyToken": ""
		}
	]
}
````

## Attributes and Elements

The following sections describe attributes, child elements, and parent elements.

|   |   |
| ------ | ------ |
|Attributes|None|
|Child Elements|<ul><li>__add__ - Optional element. Adds an assembly reference to the collection.</li><li>__clear__ - Optional element. Removes all references to inherited assembly names, allowing only the references that are added by the current add element.</li><li>__remove__ - Optional element. Removes a reference to an inherited assembly name from the collection.</li></ul>|
|Parent Elements|<ul><li>__configuration__ - Specifies the root element in every configuration file that is used by the common language runtime and the .NET Framework applications.</li><li>__Telerik.Reporting__ - Configures all settings that Telerik Reporting Engine uses.</li></ul>|

When providing the Public Key Token, the Reporting Engine will try to match it with the Public Key Token of the found DLL. It will not load an assembly with the same name and a different Public Key Token and will throw an exception instead. If the Public Key Token is omitted in the configuration, the Reporting Engine will load the first DLL, whose name matches the provided Assembly Name. Potentially, this may allow bad agents to replace trusted assemblies with malicious ones and constitutes a security vulnerability. Since the Public Key Token provides an extra security layer to your application, we advise to always include it in the configuration file.

In the `assemblyReferences` element `name` attribute, you may specify the full path to the DLL file, and the Reporting Engine will load it if it finds it there. In this case, the rest of the attributes (`version`, `culture`, and `publicKeyToken`) will be ignored by the target framework (.NET or .NET Frameworks) functionality we use in our code. This may be a security concern, as explained above, so you need to ensure the assembly on the path is a trusted one.

## Example

The following code example demonstrates how to configure the reporting engine to use MyUserFunctionsAssembly assembly as a source for user functions. In this example, it would also search for assemblies in MyDir and SubDir application base sub-directories as we have explicitly instructed via the `<probing>` Element. This is not mandatory, and when not specified, it will search in the application base, which is the root location where the application is being executed.

> The [probing](https://learn.microsoft.com/en-us/dotnet/framework/configure-apps/file-schema/runtime/probing-element) element is not supported in the .NET Standalone Designer

````XML
<?xml version="1.0"?>
<configuration>
	<configSections>
		<section name="Telerik.Reporting" type="Telerik.Reporting.Configuration.ReportingConfigurationSection, Telerik.Reporting" allowLocation="true" allowDefinition="Everywhere" />
	</configSections>
	<runtime>
		<assemblyBinding xmlns="urn:schemas-microsoft-com:asm.v1">
			  <probing privatePath="MyDir; MyDir2\SubDir"/>
		</assemblyBinding>
	</runtime>
	<Telerik.Reporting>
		<assemblyReferences>
			<add name="MyUserFunctionsAssembly" version="1.0.0.0" culture="neutral" publicKeyToken ="null" />
		</assemblyReferences>
	</Telerik.Reporting>
</configuration>
````
````JSON
"telerikReporting": {
	"assemblyReferences": [
		{
			"name": "MyUserFunctionsAssembly",
			"version": "1.0.0.0",
			"culture": "neutral",
			"publicKeyToken": "null"
		}
	]
}
````

> When adding the `Telerik.Reporting` section manually, do not forget to register it in `configSections` element of the configuration file. Failing to do so will result in a [ConfigurationErrorsException](https://learn.microsoft.com/en-us/dotnet/api/system.configuration.configurationerrorsexception?view=dotnet-plat-ext-7.0) with the following text: *Configuration system failed to initialize*.

## See Also

* [How the Runtime Locates Assemblies](https://learn.microsoft.com/en-us/dotnet/framework/deployment/how-the-runtime-locates-assemblies)
* [Specifying an Assembly's Location](https://learn.microsoft.com/en-us/dotnet/framework/configure-apps/specify-assembly-location)
* [<probing> Element](https://learn.microsoft.com/en-us/dotnet/framework/configure-apps/file-schema/runtime/probing-element)
* [Application Configuration Files](https://learn.microsoft.com/en-us/windows/win32/sbscs/application-configuration-files)
* [User Functions]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/extending-expressions/user-functions%})
* [User Aggregate Functions]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/extending-expressions/user-aggregate-functions%})
