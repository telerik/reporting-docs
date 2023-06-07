---
title: Adding External Data Provider to .NET 6 Standalone Designer
description: "Learn how to add an additional data provider to the Standalone Report Designer that targets .NET 6.0 in Telerik Reporting."
type: how-to
page_title: Adding External Data Provider to Standalone Designer Targeting .NET 6
slug: adding-external-data-provider-to-dotnet-standalone-designer
tags: standalonde designer, .net, .net6
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

With [R3 2022](https://www.telerik.com/support/whats-new/reporting/release-history/progress-telerik-reporting-r3-2022-16-2-22-914), we started shipping a Stanadalone Report Designer compiled for .NET 6.0 runtime which allows resolving assemblies that target .NET Core/5/6. The designer now has the ability to automatically discover assemblies which means that there is no need to register them in the configuration file.

The designer can be found in the installation folder of Telerik Reporting -> `\Report Designer\.NET`.

In this article, you will learn how to add extertarnal data providers used for the SQL DataSource.

## Solution

We will add the SqlClient Data Prover for this example. The approach can be used for any data provider.

1. Create a new console application targeting .NET 6.
1. Add the `Microsoft.Data.SqlClient` NuGet package.
1. Build the project and go to the `Bin` folder.
1. Copy the DLLs related to the __Microsoft.Data.SqlClient__: `Azure.Core.dll`, `Azure.Identity.dll`, `Microsoft.Data.SqlClient.dll` and so on.
1. Paste them into the Standalone Designer for .NET 6 folder, by default this would be the installation folder of Telerik Reporting -> `\Report Designer\.NET`.
1. Restart the designer if you have previously opened it.
1. Add a new SQL DataSource. You will see that the Data Provider is in the dropdown.
