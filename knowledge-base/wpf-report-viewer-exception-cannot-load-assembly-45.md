---
title: Could not load file or assembly 'Telerik.Windows.Controls.Navigation'
description: "Learn why WPF Report Viewer may throw the exception 'Could not load file or assembly Telerik.Windows.Controls.Navigation, Version=X.X.X.40' and how to fix it."
type: how-to
page_title: WPF Report Viewer and 'Telerik.Windows.Controls.Navigation' version
slug: wpf-report-viewer-is-throwing-exception-could-not-load-assembly-45
tags: WPF,report,viewer,version
ticketid: 1176987
res_type: kb
---

## Environment

<table>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting</td>
	</tr>
	<tr>
		<td>Report Viewers</td>
		<td>WPF</td>
	</tr>
</table>

## Description

Telerik.Reporting.Wpf is build with Telerik UI for WPF assemblies for .NET 4.0. When referencing the Telerik UI for WPF assemblies build with .NET 4.5 an exception is thrown "Could not load file or assembly 'Telerik.Windows.Controls.Navigation, Version=2018.2.620.`40`". Note that the required version of the Telerik.Windows assemblies depends on the particular Reporting version and may change.

## Solution

In order to use the Telerik UI for WPF assemblies build with .NET 4.5 you need to add binding redirects in the configuration file of the viewer's application. Here are the binding redirects needed to use the Telerik Reporting WPF Report Viewer with Telerik UI for WPF build with .NET 4.5 (2018.2.620.`45` for the same assembly version). Just replace the versions with the assemblies version used in your application:

````XML
<?xml version="1.0" encoding="utf-8"?>
<configuration>
	<runtime>
		<assemblyBinding xmlns="urn:schemas-microsoft-com:asm.v1">
			<dependentAssembly>
				<assemblyIdentity name="Telerik.Windows.Controls"
								publicKeyToken="5803cfa389c90ce7"
								culture="neutral" />
				<bindingRedirect oldVersion="2018.2.620.40"
							newVersion="2018.2.620.45"/>
			</dependentAssembly>
			<dependentAssembly>
				<assemblyIdentity name="Telerik.Windows.Controls.Navigation"
									publicKeyToken="5803cfa389c90ce7"
									culture="neutral" />
				<bindingRedirect oldVersion="2018.2.620.40"
								newVersion="2018.2.620.45"/>
			</dependentAssembly>
			<dependentAssembly>
				<assemblyIdentity name="Telerik.Windows.Controls.Input"
									publicKeyToken="5803cfa389c90ce7"
									culture="neutral" />
				<bindingRedirect oldVersion="2018.2.620.40"
								newVersion="2018.2.620.45"/>
			</dependentAssembly>
			<dependentAssembly>
				<assemblyIdentity name="Telerik.Windows.Data"
									publicKeyToken="5803cfa389c90ce7"
									culture="neutral" />
				<bindingRedirect oldVersion="2018.2.620.40"
								newVersion="2018.2.620.45"/>
			</dependentAssembly>
		</assemblyBinding>
	</runtime>
<!-- ... -->
````

