---
title: Cannot Render Multiple Columns in Subreports
page_title: Multi-Column functionality not working in Subreports
description: "Learn why the multi-column layout is not respected by design in the SubReport items in Telerik Reporting."
slug: unable-to-show-multi-column-subreports
tags: telerik, reporting, design, time, cannot, show, multicolumn, subreports
published: True
component: 
type: troubleshooting
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
			<td>Version</td>
			<td>Q2 2012 and later</td>
		</tr>
		<tr>
			<td>Report Viewers</td>
			<td>WinForms, WPF, ASP.NET</td>
		</tr>
	</tbody>
</table>

## Description

A multi-column report shows fine in preview, but when used as a subreport, it shows as a one-column report only.

## Cause

The multi-column functionality is intended to be used only in the main report because all report sections (excluding `Page` sections) are rendered in a column-wise layout.

## Solution

This issue occurs by design and it is not intended for multi-column reports to be used as subreports.

As a workaround, you may try the approach from the KB [How to Create a Multi-Column Report - Across the Page and Then Down]({%slug how-to-create-multi-column-report---across-the-page-and-then-down%}) in the subreport.\

## See Also

[How to Create a Multi-Column Report - Across the Page and Then Down]({%slug how-to-create-multi-column-report---across-the-page-and-then-down%})
