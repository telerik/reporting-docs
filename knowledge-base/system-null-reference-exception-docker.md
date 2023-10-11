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
			<td>OS</td>
			<td>Docker for Linux</td>
		</tr>
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
_System.NullReferenceException: Object reference not set to an instance of an object_ when rendering report in a Docker container on Linux

## Error Message
```
System.NullReferenceException: Object reference not set to an instance of an object.
   at Telerik.Reporting.Drawing.FontExtensions.ToGdiFont(IFont font)
   at Telerik.Reporting.Processing.GdiFontInfoCache.CreateValue(IFont font)
   at Telerik.Reporting.Processing.GdiFontCache1.GetValue(IFont font)
   . . .
```

## Solution
[Install the Microsoft true type fonts](https://www.maketecheasier.com/install-microsoft-truetype-fonts-linux/) in the container and point the fonts folder in the application configuration file, for example, __app.config__ file for desktop applications.


