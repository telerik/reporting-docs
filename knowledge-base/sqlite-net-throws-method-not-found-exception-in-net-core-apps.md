---
title: An exception "Method not found" is thrown in .NET Core 3.0 applications
description: The SQLitePCL library throws a "Method not found" exception when Telerik Reporting is used in .NET Core 3.0+ applications.
type: troubleshooting
page_title: SQLitePCL throws "Method not found" exception in .NET Core 3.0 applications
slug: method-not-found-exception-sqlite-net-pcl
position: 
tags: 
ticketid: 1433476
res_type: kb
---

## Environment
<table>
	<tbody>
		<tr>
			<td>Product Version</td>
			<td>13.2.19.918 and earlier</td>
		</tr>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
		</tr>
	</tbody>
</table>


## Description
In certain scenarios the initialization of Telerik Reporting engine throws a "Method not found" exception. 
This is due to an updated version of SQLite used in the application. Telerik Reporting for .NET Core depends on version 1.5.231 of [sqlite-net-pcl](https://www.nuget.org/packages/sqlite-net-pcl/1.5.231)
package. This package has a dependency to SQLitePCLRaw bundle version 1.1.11+. 
When another package, used in the application, has dependency to a newer version of SQLitePCLRaw, the SQLite raw assemblies get overwritten, 
and due to the breaking changes introduced in v.2.0 of SQLitePCLRaw, the reporting engine throws a MethodNotFound exception. 
An example of such package is [EntityFrameworkCore.SQLite](https://www.nuget.org/packages/Microsoft.EntityFrameworkCore.Sqlite), which depends on SQLitePCLRaw 2.0.

The issue is fixed in internal build **13.2.19.1114** where the last available version of SQLitePCL is used.
