---
title: BinaryFormatter Serialization and Deserialization Are Disabled
description: "Learn why .NET 5 projects may throw the error 'BinaryFormatter serialization and deserialization are disabled within this application' and how to fix it."
type: troubleshooting
page_title: Error related to disabled BinaryFormatter serialization in .NET 5
slug: binaryformatter-exception-after-upgrade-to-net5
tags: .NET 5.0
ticketid: 1494918
res_type: kb
---

## Environment

<table>
	<tbody>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
			<td>Up to R3 2020</td>
		</tr>
	</tbody>
</table>

## Description

The following error might be thrown after upgrade to .NET 5 from .NET Core or Blazor Projects.

## Error Message

````
Error registering the viewer with the service.
An error has occurred.
BinaryFormatter serialization and deserialization are disabled within this application. See https://aka.ms/binaryformatter for more information.
````

## Solution

In the [Telerik Reporting R1 2021(15.0.21.120)](https://www.telerik.com/support/whats-new/reporting/release-history/progress-telerik-reporting-r1-2021-15-0-21-120) release, the issue is resolved. If you are using a previous version, we strongly recommend upgrading. If that's not possible, you can use the suggested workaround below.

## Suggested Workarounds

Add the following lines of code to the `csproj` file:

````XML
<PropertyGroup>
	<TargetFramework>net5.0</TargetFramework>
	<EnableUnsafeBinaryFormatterSerialization>true</EnableUnsafeBinaryFormatterSerialization>
</PropertyGroup>
````

