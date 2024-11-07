---
title: Extending Report Designer
page_title: Extending Report Designer at a Glance
description: "Learn how to make the Telerik Reporting Standalone Designer recognize custom CLR public methods and properties to be used as User functions and ObjectDataSources."
slug: telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/configuration/extending-report-designer
tags: extending,report,designer
published: True
position: 2
previous_url: /standalone-report-designer-extending-configuration
---

# Extending Report Designer to Recognize Custom Assemblies

It is a common requirement to add your own [User Functions]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/extending-expressions/user-functions%}) or bind to custom CLR objects, data models (such as an Telerik Data Access model), external assemblies with custom data source objects, data feeds (including OData), and web services.

In order to expose your data, so it can be utilized by the Object/OpenAccess/Entity [data source components]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/overview%}), or extend the default behavior of the Telerik Reporting engine with custom User Functions, you have to use the [assemblyReferences Element]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/assemblyreferences-element%}) of the Telerik.Reporting configuration section to reference your custom assembly:

````XML
<configuration>
	<configSections>
		<section
			name="Telerik.Reporting"
			type="Telerik.Reporting.Configuration.ReportingConfigurationSection, Telerik.Reporting"
			allowLocation="true"
			allowDefinition="Everywhere"/>
	</configSections>
	...
	<Telerik.Reporting>
		<AssemblyReferences>
			<add name="MyCustomAssembly" version="1.0.0.0" culture="neutral" publicKeyToken ="null" />
		</AssemblyReferences>
	</Telerik.Reporting>
</configuration>
````

This can be achieved either manually or by using the Standalone Report Designer's Options page.

## Manually Update the Designer Configuration File 

The section should be added to the designer configuration file, __Telerik.ReportDesigner.exe.config__ that can be found in the Report Designer folder, which is the root location where the application is being executed. By default this is '(*Telerik Reporting installation folder*)\Report Designer'. The Report Designer would also search the assembly itself in this base folder.

To instruct the Report Designer to look for assemblies in other locations as well, use the [`<probing>` Element](https://learn.microsoft.com/en-us/previous-versions/dotnet/netframework-2.0/823z9h8w(v=vs.80)). For more information, see [Locating the Assembly through Codebases or Probing](https://learn.microsoft.com/en-us/previous-versions/dotnet/netframework-4.0/15hyw9x3(v=vs.100)):

````XML
<configuration>
...
	<runtime>
		<assemblyBinding xmlns="urn:schemas-microsoft-com:asm.v1">
			<probing privatePath="MyDir;MyDir2\SubDir"/>
		</assemblyBinding>
	</runtime>
	<Telerik.Reporting>
		<AssemblyReferences>
			<add name="MyCustomAssembly" version="1.0.0.0" culture="neutral" publicKeyToken ="null" />
		</AssemblyReferences>
	</Telerik.Reporting>
...
</configuration>
````
## Automatically Update the Designer Configuration File  

As of **Q4 2024** the Standalone Report Designer's **Options** page contains a new section: **Assembly References**:

![CS0618 Warning](images/srd-assembly-reference-ui.png)  

## See Also

* [How to use external assemblies with custom CLR objects in the Report Designer]({%slug how-to-use-external-assemblies-with-custom-clr-objects-in-the-report-designer%})
* [Previewing a report definition that uses an external assembly]({%slug deploying-trdx-(xml-report-definition)-that-uses-external-assembly%})
* [Configuration]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/configuration/overview%})
* [Report Designer Configuration]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/configuration/report-designer-configuration%})
