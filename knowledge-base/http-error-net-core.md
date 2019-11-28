---
title: HTTP Error 503.0 error
description: HTTP Error 503.0 error .NET Core 2.2 when InProcess hosting is used
type: troubleshooting
page_title: HTTP Error 503.0 error .NET Core
slug: http-error-net-core
position: 
tags: .NET Core
ticketid: 1428716
res_type: kb
---

## Environment
<table>
	<tbody>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
		</tr>
	</tbody>
</table>


## Error Message
HTTP Error 503.0 error 

## Cause\Possible Cause(s)
The error message appears when **InProcess** hosting is used in .NET Core 2.2 applications.

## Solution
1. Remove the following line from the CSPROJ file and keep using .NET Core 2.2:

```
<AspNetCoreHostingModel>InProcess</AspNetCoreHostingModel>
```
2. Upgrade to .NET Core 3.0 or downgrade to .NET Core 2.1.

Note that in .NET Core 2.1 the problem does not exist and in .NET Core 3.0 the problem has been solved. 
