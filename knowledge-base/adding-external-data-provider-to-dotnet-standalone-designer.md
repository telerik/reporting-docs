---
title: Adding External Data Provider to .NET Standalone Designer
description: "Learn how to add a data provider to the Standalone Report Designer that targets .NET in Telerik Reporting."
type: how-to
page_title: Adding External Data Provider to Standalone Designer Targeting .NET
slug: adding-external-data-provider-to-dotnet-standalone-designer
tags: standalone designer, .net
ticketid: 1560108
res_type: kb
---

## Environment

<table>
	<tbody>
		<tr>
			<td>Product Version</td>
			<td>16.2.22.914+</td>
		</tr>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
		</tr>
		<tr>
			<td>Report Designer</td>
			<td>.NET Standalone Designer</td>
		</tr>
	</tbody>
</table>


## Description

> Visit the updated [Integrating the Microsoft SQL Client Data Provider]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/sqldatasource-component/using-data-providers/using-microsfost-data-sqlclient-data-provider%}) article for a how-to on connecting to MS SQL Databases.

With [R3 2022](https://www.telerik.com/support/whats-new/reporting/release-history/progress-telerik-reporting-r3-2022-16-2-22-914), we started shipping a Stanadalone Report Designer compiled for the .NET runtime, which allows resolving assemblies that target .NET. The designer now has the ability to automatically discover assemblies, which means that there is no need to register them in the configuration file.

The designer can be found in the installation folder of Telerik Reporting -> `\Report Designer\.NET`.

In this article, you will learn how to add external data providers used for the SQL DataSource.

## Solution

We will add the SqlClient Data Provider for this example. The approach can be used for any data provider.

1. Create a new console application targeting .NET.
1. Add the `Microsoft.Data.SqlClient` NuGet package.
1. Build the project and go to the `Bin` folder.
1. Copy the DLLs related to the __Microsoft.Data.SqlClient__: `Azure.Core.dll`, `Azure.Identity.dll`, `Microsoft.Data.SqlClient.dll` and so on.
1. Paste them into the Standalone Designer for .NET folder. By default, this would be the installation folder of Telerik Reporting -> `\Report Designer\.NET`.
1. The `Bin` folder of the console application should contain an additional folder named `runtimes` with several subfolders such as `win`, `unix`, `win-x64`, etc. Copy the DLLs from the folders that correspond to your Operating System and CPU architecture.
1. Paste the additional assemblies in the folder of the  Standalone Designer for .NET and replace the existing ones if there are any duplicates.
1. Restart the designer if you have previously opened it.
1. Add a new SQL DataSource. You will see that the Data Provider is in the dropdown.
