---
title: Cannot Load File or Assembly
page_title: Cannot Load File or Assembly Error Occurs
description: "Learn how to handle the error 'Cannot Load File or Assembly' which occurs when the system cannot load the required Telerik Reporting assemblies."
slug: cannot-load-file-assembly-error
tags: telerik, reporting, run, time, cannot, load, file, assembly, error, occurs
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

When deploying a project with Telerik Reporting on a server, I get the `Could not load file or assembly 'Telerik.ReportViewer.WebForms, Version=x.x.x.x, Culture=neutral, PublicKeyToken=a9d7983dfcc261be` (or one of its dependencies) error.

## Cause

The system cannot find the specified file. During the installation of Telerik Reporting on a developer machine, the Telerik Reporting assemblies are added to [GAC](https://learn.microsoft.com/en-us/dotnet/framework/app-domains/gac). When deploying a project by using the Visual Studio built-in functionality, the assemblies from the GAC are not automatically copied.

## Solution

You need to make sure that the assemblies physically exist in the `bin` folder of your application. For the full details, refer to the [Deploying Web Applications]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/asp.net-web-forms-report-viewer/deploying-web-applications%}) article.
