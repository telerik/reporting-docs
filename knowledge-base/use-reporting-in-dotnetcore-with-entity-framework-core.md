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
The [EntityDataSource component](../entitydatasource) is dedicated to the Entity Framework and cannot work with Entity Framework Core, 
although the latter can be used with .NET Framework 4.5+, .NET Core. Framework and .NET Standard - 
[EF Core Introduction](https://www.entityframeworktutorial.net/efcore/entity-framework-core.aspx).

## Solution
Use an **ObjectDataSource** component instead. In the latter, you may use the Entity Framework Core to fetch the data and return it 
in one of the formats that the [ObjectDataSource](../objectdatasource) supports.

If you would like to be able to use the same ObjectDataSource to design your reports in the 
[Standalone Report Designer](../standalone-report-designer), the project should be built against **.NET Standard 2.0**. This technical 
limitation comes from the fact that the Standalone Report Designer is a WPF application with Windows Forms Report Viewer built against 
.NET Framework 4.6.2, and can resolve assemblies built with .NET Standard 2.0 - see 
[.NET implementation support](https://docs.microsoft.com/en-us/dotnet/standard/net-standard#net-implementation-support). The designer 
cannot recognize assemblies that target .NET Core or .NET Standard 2.1. For that reason, the ObjectDataSource assembly should reference 
.NET Standard 2.0. It will be necessary to register the assembly in the designer's configuration file as explained in the 
[Extending Report Designer](../standalone-report-designer-extending-configuration) article. It may be necessary to undertake also 
the steps described in the [Assembly Used in ObjectDataSource is Not Loaded by the Standalone Report Designer](objectdatasource-assembly-not-loaded-by-standalone-report-designer) 
KB article.
