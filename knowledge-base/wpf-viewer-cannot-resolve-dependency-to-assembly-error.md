---
title: Cannot Resolve Dependency to Assembly Error Occurs
page_title: Cannot Resolve Dependency to Assembly Error Occurs
description: "Learn how to handle the cannot resolve dependency to assembly error when working with the WPF ReportViewer."
slug: wpf-viewer-cannot-resolve-dependency-to-assembly-error
tags: telerik, reporting, troubleshoot, wpf, reportviewer, cannot, resolve, dependency, to, assembly, error, occurs
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

An error that the dependency to a Telerik assembly cannot be resolved occurs.

## Error Message

`Cannot resolve dependency to assembly 'Telerik.Windows.XXXX...'.`

## Cause

The WPf ReportViewer is built against a specific version of Telerik UI for WPF on each official release. Therefore, the versions may not be synchronized.

## Solution  

[Check the dependencies for the Telerik Reporting version you are using]({%slug telerikreporting/upgrade/overview%}) and update the assembly references accordingly or add [binding redirect](http://msdn.microsoft.com/en-us/library/eftw1fys(v=vs.110).aspx).         

For more details about the settings required by the WPF ReportViewer, refer to the article on the [WPF ReportViewer manual setup]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/wpf-application/how-to-add--manually-report-viewer-to-a-wpf-.net-framework-project%}).
