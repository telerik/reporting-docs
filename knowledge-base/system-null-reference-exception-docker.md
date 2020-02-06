---
title: Docker Container Error System.NullReferenceException Object reference not set to an instance of an object
description: Such error might be thrown in docker for Linux 
type: troubleshooting
page_title: Docker Container Error System.NullReferenceException Object reference not set to an instance of an object. at Telerik.Reporting.Drawing.FontExtensions.ToGdiFont(IFont font)
slug: system- null-reference-exception-docker
position: 
tags: 
ticketid: 1445482
res_type: kb
---

## Environment
<table>
	<tbody>
		<tr>
			<td>Product Version</td>
			<td>13.0.19.116 +</td>
		</tr>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
		</tr>
	</tbody>
</table>


## Description
System.NullReferenceException: Object reference not set to an instance of an object when rendering report in a Docker container on Linux

## Error Message
```
System.NullReferenceException: Object reference not set to an instance of an object.
   at Telerik.Reporting.Drawing.FontExtensions.ToGdiFont(IFont font)
   at Telerik.Reporting.Processing.GdiFontInfoCache.CreateValue(IFont font)
   at Telerik.Reporting.Processing.GdiFontCache1.GetValue(IFont font)
   . . .
```

## Solution
Install the Microsoft true type fonts in the container and point the fonts folder in app.config file.


