---
title: Using EFCore in Telerik Reporting
description: "Learn how to use EntityFramework Core for data fetching in .NET Core/Standard projects with Telerik Reporting."
type: how-to
page_title: Integrating EFCore with the ObjectDataSource Component
slug: use-reporting-in-dotnetcore-with-entity-framework-core
tags: 
ticketid: 1453347
res_type: kb
---

## Environment
<table>
	<tbody>
		<tr>
			<td>Product Version</td>
			<td>13.0.19.116 and above</td>
		</tr>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
		</tr>
	</tbody>
</table>

## Description

The [EntityDataSource component]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/entitydatasource-component/overview%}) is dedicated to the [Entity Framework](https://learn.microsoft.com/en-us/aspnet/entity-framework) and cannot work with [Entity Framework Core](https://learn.microsoft.com/en-us/ef/core/). The latter can be used with .NET Framework 4.5+, .NET Core Framework, and .NET Standard.

## Solution

Use an `ObjectDataSource` component instead, which supports the [Entity Framework Core](https://learn.microsoft.com/en-us/ef/core/) to fetch the data and return it in one of the formats that the [ObjectDataSource]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/objectdatasource-component/overview%}) allows.

### Standalone Report Designer

- Standalone Report Designer for .NET Framework

	To use the same `ObjectDataSource` to design reports in the [Standalone Report Designer for .NET Framework]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/overview%}#starting-the-standalone-report-designer-for-net-framework-40), the project should be built against `.NET Standard 2.0`. This technical limitation comes from the fact that this Report Designer is a WPF application with Windows Forms Report Viewer built against .NET Framework, and can resolve assemblies built with .NET Standard - see [.NET implementation support](https://learn.microsoft.com/en-us/dotnet/standard/net-standard?tabs=net-standard-1-0#net-implementation-support).

- Standalone Report Designer for .NET

	The [Standalone Report Designer for .NET]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/overview%}#starting-the-standalone-report-designer-for-net) is built on `.NET 10` and can thus resolve assemblies built targeting .NET Core up to .NET 10, or .NET Standard.

It is necessary to register the assembly in the designer's configuration file as explained in the [Extending Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/configuration/extending-report-designer%}) article.

As an example, our tests with an *ObjectDataSource* defined in `.NET Standard 2.0 ClassLibrary` project utilizing `Microsoft.EntityFrameworkCore 2.2.0` revealed that it was sufficient for __design purposes__ to add the ClassLibrary project itself and the assembly `Microsoft.EntityFrameworkCore` with version 2.2 to the designer's folder.

For __preview purposes__, however, it was necessary to add all the dependencies of the `Microsoft.EntityFrameworkCore` package in the folder of the designer as well. Generally, in .NET Core/Standard projects these dependencies are added as NuGet packages, and for that reason cannot be found in the [Global Assembly Cache (GAC)](https://learn.microsoft.com/en-us/dotnet/framework/app-domains/gac) where a regular .NET application will look for them by default.

### Web Report Designer

The above approach can also be implemented in the [Web Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/web-report-designer/overview%}) and there are no limitations to the target framework in this scenario since the `Class Library` project will be resolved by the main project hosting the Web Report Designer. For example, if the project with the Web Report Designer is using .NET 7, there will be no issue with creating a class library that also targets .NET 7, which would be a problem with the Standalone Report Designer for .NET.

For details on how to use the `ObjectDataSource` component in the Web Report Designer, we recommend following the [ObjectDataSource Wizard in the Web Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/web-report-designer/tools/objectdatasource-wizard%}) tutorial.

There is no need to add additional packages in this scenario, as long as they are added to the class library, they will be loaded by the project hosting the Web Report Designer provided that the class library is added as a `Project Reference`.

## See Also

* [Assembly Used in ObjectDataSource is Not Loaded by the Standalone Report Designer](objectdatasource-assembly-not-loaded-by-standalone-report-designer)
* [ObjectDataSource Wizard in the Web Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/web-report-designer/tools/objectdatasource-wizard%})
