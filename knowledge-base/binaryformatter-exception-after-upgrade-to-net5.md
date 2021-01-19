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

## Solution
Telerik Reporting R1 2021 and beyond does not use the unsafe **BinaryFormatter**, therefore the issue is no longer present. 

## Error Message
Error registering the viewer with the service.
An error has occurred.
BinaryFormatter serialization and deserialization are disabled within this application. See https://aka.ms/binaryformatter for more information.

## Cause\Possible Cause(s)
We are currently working on building and distributing our packages built against  .NET 5.
They are expected to be available in R1 2021 that is coming in the middle of January.
You can find further information in [.Net 5.0 support of Desktop ReportViewers and Reports generation WEB service](https://feedback.telerik.com/reporting/1489782-net-5-0-support-of-desktop-reportviewers-and-reports-generation-web-service)
feature request or at [Remove BinaryFormatter from the shared framework in .NET 5](https://github.com/dotnet/runtime/issues/29976) GitHub thread.


## Suggested Workarounds
Add the following lines of code to the **csproj** file:
```
<PropertyGroup>
    <TargetFramework>net5.0</TargetFramework>
<EnableUnsafeBinaryFormatterSerialization>true</EnableUnsafeBinaryFormatterSerialization>
</PropertyGroup>
```
