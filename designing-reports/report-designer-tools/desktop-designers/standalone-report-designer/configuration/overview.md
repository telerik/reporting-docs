---
title: Overview
page_title: Standalone Report Designer Configuration Overview
description: "Learn how to configure the Standalone Report Designer in Telerik Reporting through its Configuration file."
slug: telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/configuration/overview
tags: overview
published: True
position: 0
previous_url: /standalone-report-designer-configuration
---

# Standalone Report Designer Configuration File

The Telerik Report Designer application can be configured through its configuration file. Application configuration files contain settings specific to the application. This file contains configuration settings such as connectionStrings, traceListeners, assembly binding policy (for the .NET Framework version only), and so on. For example, this file can specify a global connection string that can be used by all reports created with the Report Designer:

````XML
<connectionStrings>
	<add name="Telerik.Reporting.Examples.CSharp.Properties.Settings.TelerikConnectionString"
		connectionString="Data Source=(local)\SQLEXPRESS;Initial Catalog=AdventureWorks;Integrated Security=SSPI"
		providerName="System.Data.SqlClient" />
</connectionStrings>
````

or it can define Trace Listeners to log important information for troubleshooting:

* For `.NET Framework` version this may be done in `system.diagnostics` section:

	````XML
<system.diagnostics>
		<trace autoflush="true" indentsize="4">
			<listeners>
				<add name="myListener" type="System.Diagnostics.TextWriterTraceListener" initializeData="C:\Temp\Telerik.ReportDesigner.log" />
				<remove name="Default" />
			</listeners>
		</trace>
	</system.diagnostics>
````


* For `.NET` version this may be done in `Telerik.Reporting` section:

	````XML
<Telerik.Reporting>
		<traceListeners>
			<add name="myListener" type="System.Diagnostics.TextWriterTraceListener"  initializeData="Telerik.ReportDesigner.Net.log" />
			<remove name="Default" />
		</traceListeners>
	</Telerik.Reporting>
````


In the .NET Framework version, it can hold binding redirect to the latest version of the Reporting engine:

````XML
<runtime>
<assemblyBinding xmlns="urn:schemas-microsoft-com:asm.v1">
	<!--
	<probing privatePath="path-to-the-assemblies"/>
	-->
	<dependentAssembly>
		<!-- Required for interoperability with older versions of Telerik Reporting -->
		<assemblyIdentity name="Telerik.Reporting" culture="neutral" publicKeyToken="a9d7983dfcc261be"/>
		<bindingRedirect oldVersion="0.0.0.0-{{buildversion}}" newVersion="{{buildversion}}"/>
	</dependentAssembly>
</assemblyBinding>
</runtime>
````

For more information, see [Application Configuration Files](https://learn.microsoft.com/en-us/previous-versions/visualstudio/visual-studio-2008/ms229689(v=vs.90)).

> The configuration files of all Standalone Report Designer versions use `UTF-8` encoding. Make sure that your text editor of choice does not override the default encoding when you modify these files, as this can prevent the designers from loading.

## Default Configuration for the .NET Framework Standalone Report Designer

The following code example shows the default `Telerik.ReportDesigner.exe.config` file that is distributed with the Report Designer for .NET Framework.

````XML
<?xml version ="1.0"?>
<configuration>
	<configSections>
		<section
			name="Telerik.Reporting"
			type="Telerik.Reporting.Configuration.ReportingConfigurationSection, Telerik.Reporting"
			allowLocation="true"
			allowDefinition="Everywhere"/>
		<section
			name="Telerik.ReportDesigner"
			type="Telerik.ReportDesigner.Configuration.ReportDesignerConfigurationSection, Telerik.ReportDesigner.Configuration"
			allowLocation="true"
			allowDefinition="Everywhere"/>
	</configSections>
	<startup>
		<supportedRuntime version="v4.0" sku=".NETFramework,Version=v4.0"/>
	</startup>
	<runtime>
		<assemblyBinding xmlns="urn:schemas-microsoft-com:asm.v1">
			<!--
			<probing privatePath="path-to-the-assemblies"/>
			-->
			<dependentAssembly>
				<!-- Required for interoperability with older versions of Telerik Reporting -->
				<assemblyIdentity name="Telerik.Reporting" culture="neutral" publicKeyToken="a9d7983dfcc261be"/>
				<bindingRedirect oldVersion="0.0.0.0-{{buildversion}}" newVersion="{{buildversion}}"/>
			</dependentAssembly>
		</assemblyBinding>
	</runtime>
	<connectionStrings>
		<add name="Telerik.Reporting.Examples.CSharp.Properties.Settings.TelerikConnectionString"
			connectionString="Data Source=(local)\SQLEXPRESS;Initial Catalog=AdventureWorks;Integrated Security=SSPI"
			providerName="System.Data.SqlClient" />
	</connectionStrings>
	<Telerik.ReportDesigner DefaultWorkingDir="Examples">
	</Telerik.ReportDesigner>
	<!-- Add assembly references -->
	<!--
	<Telerik.Reporting>
		<AssemblyReferences>
			<add name="MyCustomAssembly" version="1.0.0.0" />
		</AssemblyReferences>
	</Telerik.Reporting>
	-->
	<!--
	<system.diagnostics>
		<trace autoflush="true" indentsize="4">
			<listeners>
				<add name="myListener" type="System.Diagnostics.TextWriterTraceListener" initializeData="C:\Temp\Telerik.ReportDesigner.log" />
				<remove name="Default" />
			</listeners>
		</trace>
	</system.diagnostics>
	-->
</configuration>
````


## Default Configuration for the .NET 6 Standalone Report Designer

The following code example shows the default `Telerik.ReportDesigner.Net.dll.config` file that is distributed with the Report Designer for .NET. A major difference with the designer for .NET Framework is that the Trace Listener for .NET is in the `Telerik.Reporting` section rather than in the `system.diagnostics` section as in .NET Framework.

````XML
<?xml version ="1.0"?>
<configuration>
	<configSections>
		<section
				name="Telerik.Reporting"
				type="Telerik.Reporting.Configuration.ReportingConfigurationSection, Telerik.Reporting"
				allowLocation="true"
				allowDefinition="Everywhere"/>
		<section
			name="Telerik.ReportDesigner"
			type="Telerik.ReportDesigner.Configuration.ReportDesignerConfigurationSection, Telerik.ReportDesigner.Configuration"
			allowLocation="true"
			allowDefinition="Everywhere"/>
	</configSections>
	<connectionStrings>
		<clear/>
		<add name="AdventureWorks" connectionString="server=(local)\sqlexpress;database=AdventureWorks;integrated security=true;" providerName="System.Data.SqlClient"/>
		<add name="Telerik.Reporting.Examples.CSharp.Properties.Settings.TelerikConnectionString" connectionString="server=(local)\sqlexpress;database=AdventureWorks;integrated security=true;" providerName="System.Data.SqlClient"/>
	</connectionStrings>
	
	<Telerik.ReportDesigner DefaultWorkingDir="Examples">
	</Telerik.ReportDesigner>
	<Telerik.Reporting>
	<!-- Add assembly references (in .NET6 and later assemblies are resolved by file name) -->
	<!--
		<AssemblyReferences>
			<add name="MyUserFunctions" />
			<add name="MyBusinessObjects" />
		</AssemblyReferences>
	-->
	<!-- Add trace listeners (in .NET6 and later assemblies that contain custom listeners are resolved by file name)-->
	<!--
		<traceListeners>
			<add name="myCustomListener" type="CustomListenersNamespace.CustomListener, CustomListenersAssembly"  initializeData="Telerik.ReportDesigner.custom.log" />
			<add name="myListener" type="System.Diagnostics.TextWriterTraceListener"  initializeData="Telerik.ReportDesigner.Net.log" />
			<remove name="Default" />
		</traceListeners>
	-->
	</Telerik.Reporting>
</configuration>
````

If you configure a custom Trace Listener, you need to provide in the `type` the Assembly Qualified Name of the Trace Listener type implementing the abstract class [System.Diagnostics.TraceListener](https://learn.microsoft.com/en-us/dotnet/api/system.diagnostics.tracelistener?view=net-6.0). The assembly name _CustomListenersAssembly_ must be specified along with the full type name _CustomListenersNamespace.CustomListener_. You need also to copy the assembly in the designer's folder, by default __[InstallDir]/Report Designer/.NET__.

You may use the Trace Listeners in `System.Diagnosics` like [System.Diagnostics.TextWriterTraceListener](https://learn.microsoft.com/en-us/dotnet/api/system.diagnostics.textwritertracelistener?view=net-6.0) without the assembly name. The full type name _System.Diagnostics.TextWriterTraceListener_ is sufficient to discover and utilize the Trace Listener.

## See Also

* [Report Designer Configuration]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/configuration/report-designer-configuration%})
* [Extending Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/configuration/extending-report-designer%})
* [Telerik Reporting Configuration Section]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/overview%})
* [extensions Element]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/extensions-element%})
