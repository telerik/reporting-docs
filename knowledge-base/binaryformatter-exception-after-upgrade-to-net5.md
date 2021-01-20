---
title: NET5 projects may throw the error BinaryFormatter serialization and deserialization are disabled within this application
description: BinaryFormatter serialization and deserialization are disabled within this application after upgrade to .NET5
type: troubleshooting
page_title: BinaryFormatter serialization and deserialization are disabled within this application is thrown in .NET5
slug: binaryformatter-exception-after-upgrade-to-net5
position: 
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
The following error: **Error registering the viewer with the service.
An error has occurred.
BinaryFormatter serialization and deserialization are disabled within this application** might be thrown after upgrade to .NET 5 from .NET Core or Blazor Projects.


## Error Message
Error registering the viewer with the service.
An error has occurred.
BinaryFormatter serialization and deserialization are disabled within this application. See https://aka.ms/binaryformatter for more information.


## Solution
In the Telerik Reporting R1 2021 release, the issue is resolved. If you are using a previous version, we strongly recommend upgrading. If that's not possible, 
you can use the suggested workaround below.


## Suggested Workarounds
Add the following lines of code to the **csproj** file:
```
<PropertyGroup>
    <TargetFramework>net5.0</TargetFramework>
<EnableUnsafeBinaryFormatterSerialization>true</EnableUnsafeBinaryFormatterSerialization>
</PropertyGroup>
```
