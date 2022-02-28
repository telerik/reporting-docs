---
title: System Runtime Exception or Out-of-Memory Error Occurs in WinForms Reports
page_title: System Runtime Exception or Out-of-Memory Error Occurs in WinForms Reports
description: "Learn how to handle errors about a system runtime exception or out-of-memory error when working with the WinForms ReportViewer."
slug: winforms-system-runtime-exception-outofmemory-error
tags: telerik, reporting, winforms, report, viewer, system, runtime, exception, out, of, memory, error, occurs
published: True
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
			<td>WinForms</td>
		</tr>
	</tbody>
</table>

## Description

When rendering the WinForms ReportViewer report, either of the following error messages occurs:

* `System.Runtime.InteropServices.ExternalException: A generic error occurred in GDI+.`
* `System.OutOfMemoryException: Exception of type 'System.OutOfMemoryException' was thrown.`

## Cause

To display content, the WinForms ReportViewer uses Image rendering. The error messages may be caused by the inability of the machine to handle the number of rendered elements.

## Solution  

To solve this issue, refer to the suggestions in the article on [performance considerations]({%slug telerikreporting/designing-reports/performance-considerations%}).
