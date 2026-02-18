---
title: Telerik Reporting wizards don't show up in VS 2017 Toolbox
description: Telerik Reporting Wizards are not part of Visual Studio 2017 Toolbox items
type: troubleshooting
page_title: Missing Telerik Reporting Toolbox Wizards in Visual Studio 2017
slug: missing-telerik-reporting-toolbox-wizards-in-visual-studio-2017
position:
tags: ToolboxItems, Wizards
ticketid: 1397839
res_type: kb
---

## Environment

<table>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting</td>
	</tr>
	<tr>
		<td>Visual Studio version</td>
		<td>Visual Studio 2017</td>
	</tr>
</table>

## Description

After installing Telerik Reporting, the Visual Studio 2017 Toolbox does not contain any Telerik Reporting wizards.

## Cause\Possible Cause(s)

Тhe assembly that initializes our wizards called **Telerik.Reporting.Design.Components** hasn't got an available path that should be taken from.

## Solution

During the installation of Telerik Reporting on your machine, the Telerik assemblies were added to GAC. The resolution would be to load the **Telerik.Reporting.Design.Components** assembly manually from there. Here are the steps:

1. Open a report in VS designer and open the Toolbox
2. Right-click over the Telerik Reporting R1 2019 -> navigate to Choose items... -> .NET Framework Components
3. Click Browse...
4. Navigate to:

   ```TEXT
   C:\Windows\Microsoft.NET\assembly\GAC_MSIL\Telerik.Reporting.Design.Components\v4.0_13.0.19.116__a9d7983dfcc261be
   ```

5. Add Telerik.Reporting.Design.Components.dll ([check this screen shot](https://www.screencast.com/t/1tbxrbJja6t)).

   After these steps, the wizards should be available for use.
