---
title: The WPF Report Is Messed Up or Different from Design-Time Preview
page_title: The WPF Report Is Messed Up or Different from Design-Time Preview
description: "Learn how to fix the WPF report if it is messed up or looks different from its preview in design-time."
slug: wpf-report-messed-different-from-preview
tags: telerik, reporting, troubleshoot, wpf, reportviewer, messed, up, or, different, from, preview, design, time
published: True
res_type: kb
type: troubleshooting
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
			<td>WPF</td>
		</tr>
	</tbody>
</table>

## Description

The report in the WPF ReportViewer is messed up or is different from the design-time preview.

## Cause

The WPF ReportViewer displays the rendered report in XAML format, so external styles may affect the produced XAML that contains standard elements like Canvas, TextBlock, and more.

## Solution  

Try to exclude styles to check if they change the displayed content. Alternatively, try to export the report in a format like PDF.
