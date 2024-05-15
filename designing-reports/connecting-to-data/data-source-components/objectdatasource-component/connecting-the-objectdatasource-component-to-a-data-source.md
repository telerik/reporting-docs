---
title: Connecting to a Data Source
page_title: Connecting the ObjectDataSource component to a Data Source explained
description: "Learn how to connect the Telerik Reporting ObjectDataSource component to the business objects and how to configure the application to use it."
slug: telerikreporting/designing-reports/connecting-to-data/data-source-components/objectdatasource-component/connecting-the-objectdatasource-component-to-a-data-source
tags: connecting,objectdatasource,component,data,source
published: True
position: 1
previous_url: /objectdatasource-connecting
---

# Connecting the ObjectDataSource Component to a Data Source

The purpose of the ObjectDataSource component is to provide business object data to data items in a declarative manner. The [ObjectDataSource.DataSource](/api/telerik.reporting.objectdatasource.html#Telerik_Reporting_ObjectDataSource_DataSource) property should be the [assembly qualified name](https://learn.microsoft.com/en-us/dotnet/api/system.type.assemblyqualifiedname?view=net-7.0#System_Type_AssemblyQualifiedName) or the Type of the data access layer (class), where the reporting engine will use *System.Reflection* to create the instance of the class by using its default constructor, and to execute its method specified by the `ObjectDataSource.DataMember` property.

When you configure the ObjectDataSource component the settings below are obligatory to avoid runtime errors due to failed data retrieval:

* Visual Studio is a 32-bit application, so the report designer is restricted to x86 mode even on x64 platforms, which prevents the [ObjectDataSource Wizard]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/data-source-wizards/objectdatasource-wizard%}) from discovering any types from x64 assemblies. The solution is to use different platform configurations: for `Debug` builds it is best to use `Any CPU`, while for `Release` builds you can use `x64` instead.
* Some [Data Items]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/overview%}) ([Graph]({%slug telerikreporting/designing-reports/report-structure/graph/overview%}), [Map]({%slug telerikreporting/designing-reports/report-structure/map/structure/overview%})) will call the constructor or the data retrieval method of your business object during design-time. This is required to obtain the data, process it, and create a live preview of the data item. For this reason, the business object used to feed the data item with data should be accessible during design time, otherwise, the data item will not be able to generate a live preview of the data.

## Creating the DataSource

1. Open __Visual Studio__ and create a new [Class Library](https://learn.microsoft.com/en-us/cpp/mfc/class-library-overview?view=msvc-170).

	>The Standalone Report Designer for .NET Framework is a WPF application built against __.NET Framework 4.0__. For that reason, it cannot load and resolve classes from assemblies built against .NET Standard 2.1 or .NET 6+. You can see the [.NET Standard compatibility chart](https://learn.microsoft.com/en-us/dotnet/standard/net-standard?tabs=net-standard-2-0) which explains how and when the assemblies can be loaded in different framework versions.

	>The new .NET Standalone Report Designer is built for __.NET 8__ and can resolve assemblies built with `.NET Standard`, `.NET 6` and higher - [Starting the Standalone Report Designer for .NET]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/overview%}#starting-the-standalone-report-designer-for-net).

1. Add the following piece of code from [Bind to a BusinessObject]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/objectdatasource-component/how-to/how-to-bind-to-a-businessobject%}).

	{{source=CodeSnippets\CS\API\Telerik\Reporting\ObjectDataSourceSnippets.cs region=SampleDataSource}}
	{{source=CodeSnippets\VB\API\Telerik\Reporting\ObjectDataSourceSnippets.vb region=SampleDataSource}}


1. Build the project and close it.

## Configuration

For security reasons, the ObjectDataSource can resolve only types that are declared either in the current report's assembly or in AssemblyReferences element nodes in `Telerik.Reporting` section of the application configuration file. During report processing, the ObjectDataSource component tries to resolve its type and if it is not listed in these two places, an exception will be thrown. 

* Configuration in the [Visual Studio Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/visual-studio-report-designer/overview%}): In this case, you will need to add a reference to the Class Library project or to the dll which contains the data source definition.
* Configuration in the [Standalone Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/overview%}): 

	1. Open the project folder of the Class Library -> __bin__ -> __Debug__ and copy the dll file.
	1. Paste it at the installation folder of the Report Designer `C:\Program Files (x86)\Progress\Telerik Reporting {{site.suiteversion}}\Report Designer`.
	1. Open Telerik.ReportDesigner.exe.config file with a text editor.
	1. Add an [AssemblyReferences]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/assemblyreferences-element%}) in __Telerik.Reporting__ section of application configuration file:

		````XML
<?xml version="1.0"?>
		<configuration>
			<configSections>
				<section name="Telerik.Reporting" type="Telerik.Reporting.Configuration.ReportingConfigurationSection, Telerik.Reporting" allowLocation="true" allowDefinition="Everywhere" />
			</configSections>
		...
			<Telerik.Reporting>
				<assemblyReferences>
					<add name="yourAssemblyName"/>
				</assemblyReferences>
			</Telerik.Reporting>
		...
		</configuration>
````


The additional attributes like __version__, __culture__ and __publicKeyToken__ are not mandatory, because the .NET runtime can resolve the assembly only by its name. After modifying the configuration file the application needs to be restarted so the new configuration settings will be read again.

## Using the ObjectDataSource in the Report

1. Open the Report Designer and [create a new report]({%slug telerikreporting/getting-started/first-steps%}).
1. Navigate to __Data__ and click __Object Data Source__.
1. Select from the __Available data source types__ and follow the Wizard instructions until the process is completed.

## Configuration for the Report Viewer/Web Report Designer

The `ObjectDataSource` component is resolved, at runtime, using the configuration of the running application. For example, in the Standalone Report Designer that would be the `Telerik.ReportDesigner.exe.config` configuration file. However, when a report that uses an ObjectDataSource component is to be displayed in some application via a Report Viewer or the Web Report Designer, the runtime configuration will be retrieved through the `.config`/`.json` configuration file of that project.

This means that if the assembly used by the ObjectDataSource component is not referenced in the configuration file of that project via the [AssemblyReferences]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/assemblyreferences-element%}) element, the report will display errors on Preview.

Usually, in `.NET Framework` projects, the configuration file would be called `App.config` (for the desktop applications) or `Web.config` (for the web applications), while `.NET` uses JSON-based configuration most often named `appsettings.json`. The `AssemblyReferences` element can be included in the `Telerik.Reporting` section of the `XML`. The `assemblyReferences` element should reside in the `telerikReporting` section of the `JSON` configuration files.

Here are the steps you may follow when referencing the assembly in the project so that it can be resolved by the Telerik Reporting Engine:

1. [Add a reference to the assembly](https://learn.microsoft.com/en-us/visualstudio/ide/how-to-add-or-remove-references-by-using-the-reference-manager) used by the ObjectDataSource to the project hosting the Reporting engine. For example, when you use an Html5-based Report Viewer, this would be the [Reporting REST Service]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/overview%}) project. Instead of referencing the built assembly itself, it is also possible to add a `Project Reference` to the project that the assembly is built from. It is required for the assembly to be available in the `bin` folder during the runtime of the application.
1. Open the project's configuration file and add the same assembly reference as the one required for the Standalone designer. If the project is `.NET Framework`, this step will be simply copying the necessary XML but for `.NET`, the XML has to be converted to JSON, for example:

	````JSON
"telerikReporting": {
		"assemblyReferences": [
			{
				"name": "yourAssemblyName"
			}
		]
	}
````


## Configuration for the ReportProcessor in .NET

When rendering a report relying on custom assemblies with the [ReportProcessor](/api/telerik.reporting.processing.reportprocessor) class in a [.NET application](https://dotnet.microsoft.com/en-us/learn/dotnet/what-is-dotnet), it is necessary to manually pass an [IConfiguration](https://learn.microsoft.com/en-us/dotnet/api/microsoft.extensions.configuration.iconfiguration) instance to the constructor of the `ReportProcessor` class, for example:

````CSharp
IConfiguration configuration = new ConfigurationBuilder()
	.SetBasePath(Directory.GetCurrentDirectory())
	.AddJsonFile("appsettings.json")
	.Build();
       
var reportProcessor = new ReportProcessor(configuration);
````

The `appsettings.json` configuration file provided to the `ReportProcessor` must have the assembly registered in the [assemblyReferences]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/assemblyreferences-element%}) section as shown the section above.

## Sample

Sample report that uses Object DataSource can be found in the installation folder of Telerik Reporting `C:\Program Files (x86)\Progress\Telerik Reporting {{site.suiteversion}}\Examples\CSharp\.NET Framework\ReportLibrary\DataBinding`


## See Also

* [AssemblyReferences]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/assemblyreferences-element%})
* [ObjectDataSource Wizard]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/data-source-wizards/objectdatasource-wizard%})
* [Loading .NET 7 assemblies in the Standalone Report Designer for .NET]({%slug how-to-load-dot-net-7-assemblies-in-srd-dot-net%})
* [Bind to a BusinessObject]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/objectdatasource-component/how-to/how-to-bind-to-a-businessobject%})
* [Data Items]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/overview%})
