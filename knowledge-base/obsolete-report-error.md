---
title: Obsolete Report Error Occurs
page_title: An Obsolete Report Error Occurs Troubleshooting
description: "Learn how to fix an error for an obsolete report when working with the Telerik .NET Reporting tool for web and desktop applications."
slug: obsolete-report-error
tags: telerik, reporting, troubleshoot, obsolete, report, error, occurs
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

The Telerik Reporting project throws a `The report is now obsolete. Please use the ReportSource property instead.` error.          

## Cause

This message may appear in projects which use a Telerik Reporting Q2 2012 or later version.

## Solution

To fix this issue, refer to the article on [migrating your project to utilize the new `ReportSource` objects]({% slug how-to-migrate-your-project-to-utilize-the-new-reportsource-objects %}).         
