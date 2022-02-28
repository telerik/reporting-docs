---
title: Cannot Render Multiple Columns in Sub-Reports
page_title: Cannot Render Multi-Column Reports as Sub-Reports
description: "Learn how to manage multi-column reports in Telerik Reporting."
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

A multi-column report shows fine in preview, but when used as a sub-report, it shows as a one-column report only.

## Cause

The multi-column functionality is intended to be used only in the main report because all report sections (excluding **Page** sections) are rendered in a column-wise layout.

## Solution  

This issue occurs by design and it is not intended for multi-column reports to be used as sub-reports.
