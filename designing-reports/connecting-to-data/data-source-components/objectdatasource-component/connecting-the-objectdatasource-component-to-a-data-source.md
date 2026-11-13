---
title: Connecting to a Data Source
page_title: Connecting the ObjectDataSource component to a Data Source explained
description: "Learn how to connect the Telerik Reporting ObjectDataSource component to the business objects and how to configure the application to use it."
slug: telerikreporting/designing-reports/connecting-to-data/data-source-components/objectdatasource-component/connecting-the-objectdatasource-component-to-a-data-source
tags: connecting,objectdatasource,component,data,source
published: True
position: 1
previous_url: /objectdatasource-connecting
reportingArea: General
components: [general]
---

# Connecting to a Data Source

The `ObjectDataSource` component provides business object data to data items declaratively. The [ObjectDataSource.DataSource](/api/telerik.reporting.objectdatasource#Telerik_Reporting_ObjectDataSource_DataSource) property must contain the [assembly-qualified name](https://learn.microsoft.com/en-us/dotnet/api/system.type.assemblyqualifiedname?view=net-7.0#System_Type_AssemblyQualifiedName) or the `Type` of the data access layer class. The reporting engine uses `System.Reflection` to create the class instance with its default constructor and execute the method specified by `ObjectDataSource.DataMember`.

Configure the following settings to avoid runtime errors caused by failed data retrieval:

 - In Visual Studio versions before 2022, the .NET Framework report designer runs in x86 mode, even on x64 platforms. This prevents the [ObjectDataSource configuration wizard](slug:telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/data-source-wizards/objectdatasource-wizard) from discovering types in x64 assemblies. Use different platform configurations: use `Any CPU` for `Debug` builds and `x64` for `Release` builds. In Visual Studio 2022, the .NET Framework designer runs in the 64-bit Visual Studio process, so make sure the report project's `Platform target` is not `x86`.
 - Some [report data items](slug:telerikreporting/designing-reports/connecting-to-data/data-items/overview), such as [Graph](slug:telerikreporting/designing-reports/report-structure/graph/overview) and [Map](slug:telerikreporting/designing-reports/report-structure/map/structure/overview), call the business object's constructor or data retrieval method at design time. This process retrieves and processes data to create a live preview. Make sure the business object is accessible at design time.

## Creating the Data Source

1. Open **Visual Studio** and create a new **Class Library** project.

	> The Standalone Report Designer for .NET Framework is a WPF application built against **.NET
	> Framework 4.0**. For that reason, it cannot load and resolve classes from assemblies built
	> against .NET Standard 2.1 or .NET {{site.mindotnetversion}}+. You can see the [.NET Standard compatibility chart](https://learn.microsoft.com/en-us/dotnet/standard/net-standard?tabs=net-standard-2-0), which explains how and when the assemblies can be loaded in different framework versions.

	>The new [.NET Standalone Report Designer](slug:telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/overview#starting-the-standalone-report-designer-for-net) is built for .NET 10 and can resolve assemblies built with `.NET Standard`, `.NET {{site.mindotnetversion}}` and later.

1. Add the following code from [binding to a business object](slug:telerikreporting/designing-reports/connecting-to-data/data-source-components/objectdatasource-component/how-to/how-to-bind-to-a-businessobject).

	{{source=CodeSnippets\CS\API\Telerik\Reporting\ObjectDataSourceSnippets.cs region=SampleDataSource}}
	{{source=CodeSnippets\VB\API\Telerik\Reporting\ObjectDataSourceSnippets.vb region=SampleDataSource}}

1. Build the project.

## Configuring the Data Source

For security reasons, the `ObjectDataSource` resolves only types declared in the current report assembly or in `AssemblyReferences` elements in the `Telerik.Reporting` section of the application configuration file. During report processing, the component throws an exception if the type is not listed in either location. Choose the configuration that matches your report designer:

- [Visual Studio Report Designer](slug:telerikreporting/designing-reports/report-designer-tools/desktop-designers/visual-studio-report-designer/overview): Add a reference to the Class Library project or to the DLL that contains the data source definition.
- [Standalone Report Designer](slug:telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/overview):

	1. Open the Class Library project folder, then open **bin** > **Debug**, and copy the DLL file.
	1. Paste the DLL file in the Report Designer installation folder: `C:\Program Files (x86)\Progress\Telerik Reporting {{site.suiteversion}}\Report Designer`.
	1. Open the `Telerik.ReportDesigner.exe.config` file in a text editor.
	1. Add an [AssemblyReferences](slug:telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/assemblyreferences-element) element to the **Telerik.Reporting** section of the application configuration file:

		{{source=CodeSnippets\MvcCS\XmlConfiguration\ConnectingToADataSource.xml region=Configuration}}

The additional attributes, such as **version**, **culture**, and **publicKeyToken**, are optional because the .NET runtime can resolve the assembly by name. Restart the application after you modify the configuration file so it reads the new settings.

## Using the ObjectDataSource in a Report

1. Open the Report Designer and [create a new report](slug:telerikreporting/getting-started/first-steps).
1. Navigate to **Data** and click **Object Data Source**.
1. Select a data source type from **Available data source types** and follow the **Wizard** instructions until the process is complete.

## Configuring the Report Viewer and Web Report Designer

At runtime, the running application's configuration resolves the `ObjectDataSource` component. In the Standalone Report Designer, this configuration is in the `Telerik.ReportDesigner.exe.config` file. A Report Viewer or Web Report Designer uses the `.config` or `.json` configuration file of the application that displays the report.

If the configuration file does not reference the assembly used by the `ObjectDataSource` through the [AssemblyReferences](slug:telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/assemblyreferences-element) element, the report displays errors in **Preview**.

In `.NET Framework` projects, desktop applications typically use `App.config`, and web applications use `Web.config`. `.NET` applications use JSON-based configuration, most often in `appsettings.json`. Add the `AssemblyReferences` element to the `Telerik.Reporting` section of the XML configuration. In JSON configuration, add the `assemblyReferences` element to the `telerikReporting` section.

Use the following steps to reference the assembly in the project that hosts the Telerik Reporting engine:

1. [Add a reference to the assembly](https://learn.microsoft.com/en-us/visualstudio/ide/how-to-add-or-remove-references-by-using-the-reference-manager) used by the `ObjectDataSource` to the project hosting the Reporting engine. For example, when you use an HTML5-based Report Viewer, this is the [Reporting REST Service](slug:telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/overview) project. You can also add a `Project Reference` to the project that builds the assembly. This makes the assembly available in the application's `bin` folder at runtime.
1. Open the project's configuration file and add the same assembly reference required for the Standalone designer. For a `.NET Framework` project, copy the necessary XML. For a `.NET` project, convert the XML to JSON, as shown in the following example:

	{{source=CodeSnippets\Blazor\Docs\JSON\AssemblyReferencesNameOnlyConfig.json region=AssemblyReferencesExample}}

## Configuring the ReportProcessor in .NET

When you render a report that relies on custom assemblies with the [ReportProcessor](/api/telerik.reporting.processing.reportprocessor) class in a [.NET application](https://dotnet.microsoft.com/en-us/learn/dotnet/what-is-dotnet), pass an [IConfiguration](https://learn.microsoft.com/en-us/dotnet/api/microsoft.extensions.configuration.iconfiguration) instance to the `ReportProcessor` constructor:

{{source=CodeSnippets\Blazor\Docs\Controllers\ReportsController.cs region=Configuration_for_the_ReportProcessor_in_NET}}


The `appsettings.json` configuration file provided to the `ReportProcessor` must have the assembly registered in the [assemblyReferences](slug:telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/assemblyreferences-element) section as shown in the section above.

## Viewing a Sample

Find a sample report that uses `ObjectDataSource` in the Telerik Reporting installation folder: `C:\Program Files (x86)\Progress\Telerik Reporting {{site.suiteversion}}\Examples\CSharp\.NET Framework\ReportLibrary\DataBinding`.

## See Also

- [AssemblyReferences](slug:telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/assemblyreferences-element)
- [ObjectDataSource Configuration Wizard](slug:telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/data-source-wizards/objectdatasource-wizard)
- [Loading .NET 7 assemblies in the Standalone Report Designer for .NET](slug:how-to-load-dot-net-7-assemblies-in-srd-dot-net)
- [Bind to a BusinessObject](slug:telerikreporting/designing-reports/connecting-to-data/data-source-components/objectdatasource-component/how-to/how-to-bind-to-a-businessobject)
- [Report Data Items](slug:telerikreporting/designing-reports/connecting-to-data/data-items/overview)
