---
title:  Could not retrieve information for folder error is thrown on loading the Web Designer
description: Could not retrieve information for folder
type: troubleshooting
page_title: Could not retrieve information for folder
slug: could-not-retrieve-information-for-folder-web-designer
position: 
tags: Web Report Designer, Web, Designer
ticketid: 1568828
res_type: kb
---

## Environment
<table>
	<tbody>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
		</tr>
		<tr>
			<td>Project Type</td>
			<td>Web Application</td>
		</tr>
	</tbody>
</table>


## Description

On loading the Web Report Designer, an error is thrown in the bottom right corner, and also in the browser's console


## Error Message

````
Could not retrieve information for folder. Error: An error has occurred.
````

## Possible Cause

The `ReportDesignerControllerBase` includes the following method:

````C#
public override IActionResult GetFolderModel([FromQuery] string uri)
````
The problem is that parameters on actions are treated as *required* if they do not have the nullable? annotation. 

## Suggested Workarounds

### Configure the Nullable setting of the Project to warnings

Open the `.csproj` file of your project and add the following setting:

````XML
<Nullable>warnings</Nullable>
````
### Override ReportDesignerControllerBase Actions To Include Nullable? Annotations

The methods of the `ReportDesignerControllerBase` class are `virtual` and thus, they can be `overriden`.  In this case, the following method can be overriden to fix the error:

````C#
public override IActionResult GetFolderModel([FromQuery] string? uri)
{
    return base.GetFolderModel(uri);
}
````
