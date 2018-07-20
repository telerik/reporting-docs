---
title: WPF Report viewer is throwing exception "Could not load file or assembly 'Telerik.Windows.Controls.Navigation, Version=2018.2.620.40"
description: 
type: how-to
page_title: WPF Report viewer is throwing exception
slug: wpf-report-viewer-is-throwing-exception-could-not-load-assembly-45
position: 
tags: 
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
		<td>Viewer</td>
		<td>WPF Viewer</td>
	</tr>
</table>

## Description
Telerik.Reporting.Wpf is build with Telerik UI for WPF assemblies for.NET 4.0. When referencing the Telerik UI for WPF assemblies build with .NET 4.5 an exception is thrown "Could not load file or assembly 'Telerik.Windows.Controls.Navigation, Version=2018.2.620.40"

## Solution
In order to use the Telerik UI for WPF assemblies build with .NET 4.5 binding redirects are required. Here are the binding redirects needed to use the Telerik Reporting WPF Report Viewer with Telerik UI for WPF build with .NET 4.5 (2018.2.620.45). Just replace the versions with the one used in the application:
```
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
        <assemblyIdentity name="Telerik.Windows.Controls.Data"
                          publicKeyToken="5803cfa389c90ce7"
                          culture="neutral" />
        <bindingRedirect oldVersion="2018.2.620.40"
                         newVersion="2018.2.620.45"/>
      </dependentAssembly>
    </assemblyBinding>
  </runtime>
....
```
