---
title: HTML5 viewer Export button is not working in Internet Explorer and Edge browsers
description: HTML5 report viewer Export button dropdown is not working in Internet Explorer and Edge browsers
type: troubleshooting
page_title: HTML5 viewer Export not working in IE and Edge
slug: html5-viewer-export-toolbar-button-not-working-in-ie-edge
position: 
tags: html5,export,ie,edge
ticketid: 
res_type: kb
---

## Environment
<table>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting</td>
	</tr>
	<tr>
		<td>Project Type</td>
		<td>Web Application</td>
	</tr>
	<tr>
		<td>Viewer</td>
		<td>HTML5 Viewer</td>
	</tr>
	<tr>
		<td>Browser</td>
		<td>Internet Explorer, Edge</td>
	</tr>
</table>


## Description
The HTML5 report viewer has a toolbar (menu) which contains buttons executing different viewer commands such as Print, Export, Navigate, etc.
The Export button's intended behavior is to show a sub-menu with all of the available export formats.
However, the Export button's sub-menu does not open on hover or on click in Internet Explorer and Edge browsers when using jQuery 1.10.2.

## Solution
Upgrade the referenced jQuery version in the application to 1.12.3 or higher supported jQuery version. For a full list of supported jQuery versions by Kendo UI visit [Supported jQuery Versions](https://docs.telerik.com/kendo-ui/intro/supporting/jquery-support).

## See Also

[Menu sub-menu does not open on hover in IE and Edge with jQuery 1.10.2](https://github.com/telerik/kendo-ui-core/issues/3717)
