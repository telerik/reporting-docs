---
title: Telerik Reporting Missing in Visual Studio
description: This article shows how to add the Telerik Reporting package if it is missing in Visual Studio
type: troubleshooting
page_title: Telerik Reporting Missing in Visual Studio
slug: telerik-reporting-missing-in-visual-studio
position: 
tags: 
ticketid: 1448597
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


## Description
Sometimes you are unable to add any Telerik Reporting items in Visual Studio. This articles provides steps on how to solve this issue.

## Cause\Possible Cause(s)
A possible reason for the issue can be the **Telerik Reporting** and/or **Telerik.CommonPackage** extensions might be disabled or they are not installed. 

## Visual Studio 2019
Navigate to **Extensions** -> **Manage Extensions**. Then under **Installed**, there should be both aforementioned extensions 
and they should be **Enabled**. 

If there aren't any Telerik extensions, locate the **Telerik.Reporting.VsX.vsix** under
```
 %programfiles(x86)%\Progress\Telerik Reporting [Version]\Bin\VS2019
 ```
 and run it. It should install all necessary extensions.

## Visual Studio 2017 and 2015
Navigating to **Tools** -> **Extensions and Updates**. Then under **Installed**, there should be both aforementioned extensions 
and they should be **Enabled**. 

If there aren't any Telerik extensions, locate the **Telerik.Reporting.VsX.vsix** under
```
 %programfiles(x86)%\Progress\Telerik Reporting [Version]\Bin\VS2017 ( or 2015)
 ```
 and run it. It should install all necessary extensions.

