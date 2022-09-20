---
title: Adding External Data Provider to .NET Standalone Designer
description: Explains how to additional data provider to the Standalone designer that targets .NET
type: how-to
page_title: How to add External Data Provider to the Standalone Designer Targeting .NET
slug: adding-external-data-provider-to-dotnet-standalone-designer
position: 
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
In R3 2022, we shipped a Stanadalone designer compiled for .NET 6.0 runtime which allows resolving assemblies
that target .NET Core. The designer now has the ability to automatically discover assemblies which means that there is 
no need to reguster them in the configuration file.
The designer can be found in the installation folder of Telerik Reporting -> Report Designer -> .NET.
In this article, you will learn how to add extertarnal data providers used for the SQL DataSource.

## Solution
We will add the SqlClient Data Prover for this example. The approach can be used for any data provider.
1. Create a new console application targeting .NET6.
2. Add the **Microsoft.Data.SqlClient** NuGet package.
3. Build the project and go to the Bin folder.
4. Copy the DLLs related to the Microsoft.Data.SqlClient (**Azure.Core.dll**, **Azure.Identity.dll**, **Microsoft.Data.SqlClient.dll** and so on).
5. Paste them into the Standalone designer's folder.
6. Restart the designer if you have previously opened it.
7. Add a new SQL DataSource. You will see that the Data Provider is in the dropdown.



