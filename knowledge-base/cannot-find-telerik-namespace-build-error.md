---
title: Cannot Find Telerik Namespace
page_title: Cannot Find Telerik Namespace Error Occurs on Build
description: "Learn how to handle the build error Cannot Find Telerik Namespace when working with Telerik Reporting."
slug: cannot-find-telerik-namespace-error
tags: telerik, reporting, design, time, cannot, find, telerik, namespace, error, occurs, on, build
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
			<td>WinForms, WPF, ASP.NET</td>
		</tr>
	</tbody>
</table>

## Description

A `The type or namespace name 'Telerik' could not be found (are you missing a using directive or an assembly reference?)` error occurs on build.

## Cause

The possible reason for this issue is that Telerik assemblies are not properly referenced or updated.

## Solution

Double-check if the project has references to Telerik Reporting assemblies and if `CopyLocal` is set to `true` in the Visual Studio Property grid. If you have recently updated your Telerik Reporting installation, run the [Upgrade Wizard]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/visual-studio-report-designer/upgrade-wizard%}) in all related projects in Visual Studio.

If Telerik Reporting assemblies are referenced and updated, verify that the project targets the `.NET4+ Framework` Full Profile version.
