---
title: The PageNumber input in the toolbar is cutoff at the top
description: The PageNumber input is not aligned correctly in the toolbar
type: troubleshooting
page_title: Part of the PageNumber input in missing in the toolbar
slug: pagenumber-input-is-cutoff-html5
position: 
tags: Html5ReportViewer, MvcReportViewer
res_type: kb
---

## Environment
<table>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting</td>
	</tr>
  	<tr>
		<td>Version</td>
		<td>R1 2022</td>
	</tr>
	<tr>
		<td>Report Viewer</td>
		<td>HTML5-based Report Viewers</td>
	</tr>
</table>

## Description
The page number input located in the report viewer's toolbar seems to be cutoff at the top when using [Telerik UI for MVC R1 2022](https://www.telerik.com/support/whats-new/aspnet-mvc/release-history/ui-for-asp-net-mvc-r1-2022-(version-2022-1-119)).

![PageNumber input being cutoff](resources/PageNumberInputToolbar.png)

## Cause
This is caused by the input having a default **-2px** margin at the top. 

## Solution
Setting the **margin-top** style of the input to **2px** or higher should fix the issue:

```css
        input[data-role='telerik_ReportViewer_PageNumberInput'] {
            margin-top: 2px !important;
        }
```
