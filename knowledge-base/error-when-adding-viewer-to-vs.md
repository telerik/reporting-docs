---
title: An Error Message Occurs When Adding a Viewer in Visual Studio
page_title: An Error Message Occurs When Adding a Viewer in Visual Studio
description: "Learn how to handle the situation if an error message occurs when adding a viewer in Visual Studio."
slug: error-when-adding-viewer-to-vs
tags: telerik, reporting, troubleshoot, asp, net, webforms, reportviewer, error, message, when, adding, viewer, to, vs, visual, studio
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

An error message occurs when adding a viewer in Visual Studio.

## Error Message

`The ReportViewer control failed to setup the http handler in the web.config file. You may experience troubles when viewing the report. Exception details: Unable to cast COM object of type 'System.__ComObject' to class type 'Telerik.Reporting.Vs.Common.AssemblyReference'. Instances of types that represent COM components cannot be cast to types that do not represent COM components; however they can be cast to interfaces as long as the underlying COM component supports QueryInterface calls for the IID of the interface.`

## Cause

Web sites handle assembly references differently and the Telerik Reporting Wizards and Designers are not designed to work with such settings.

## Solution  

Manually add viewers or upgrade the web site&mdash;you need to design reports in an external `ClassLibrary` project referenced by the web site project.
