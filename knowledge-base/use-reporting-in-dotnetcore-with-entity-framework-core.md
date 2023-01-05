---
title: Use Telerik Reporting in .Net Core with Entity Data Model
description: How to use Entity Framework Core for data fetching in .NET Core/Standard projects
type: how-to
page_title: Use Telerik Reporting in .Net Core with Entity Framework Core
slug: use-reporting-in-dotnetcore-with-entity-framework-core
position: 
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
The [EntityDataSource component]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/entitydatasource-component/overview%}) is dedicated to the Entity Framework and cannot work with Entity Framework Core. The latter can be used with .NET Framework 4.5+, .NET Core Framework and .NET Standard - 
[EF Core Introduction](https://www.entityframeworktutorial.net/efcore/entity-framework-core.aspx).

## Solution
Use an **ObjectDataSource** component instead, which supports the Entity Framework Core to fetch the data and return it 
in one of the formats that the [ObjectDataSource]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/objectdatasource-component/overview%}) allows.

If you would like to be able to use the same ObjectDataSource to design your reports in the 
[Standalone Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/overview%}), the project should be built against **.NET Standard 2.0**. This technical 
limitation comes from the fact that the Standalone Report Designer is a WPF application with Windows Forms Report Viewer built against 
.NET Framework, and can resolve assemblies built with .NET Standard - see 
[.NET implementation support](https://docs.microsoft.com/en-us/dotnet/standard/net-standard#net-implementation-support). The Stanandalone Report Designer cannot recognize assemblies that target .NET Core or .NET Standard 2.1. For that reason, the ObjectDataSource assembly should reference .NET Standard 2.0.  
It is necessary to register the assembly in the designer's configuration file as explained in the 
[Extending Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/configuration/extending-report-designer%}) article. It also may be necessary to undertake 
the steps described in the [Assembly Used in ObjectDataSource is Not Loaded by the Standalone Report Designer](objectdatasource-assembly-not-loaded-by-standalone-report-designer) 
KB article.  
As an example, our tests with an ObjectDataSource defined in .NET Standard 2.0 ClassLibrary project utilizing Microsoft.EntityFrameworkCore 2.2.0 revealed that it was sufficient for __design purposes__ to add the ClassLibrary project itself and the assembly 'Microsoft.EntityFrameworkCore' with version 2.2 to the designer's folder.  
For __preview purposes__, however, it was necessary to add all the dependencies of 'Microsoft.EntityFrameworkCore' package in the folder of the designer as well. Generally, in .NET Core/Standard projects these dependencies are added as NuGet packages, and for that reason cannot be found in the [Global Assembly Cache (GAC)](https://docs.microsoft.com/en-us/dotnet/framework/app-domains/gac) where a regular .NET application will look for them by default.
