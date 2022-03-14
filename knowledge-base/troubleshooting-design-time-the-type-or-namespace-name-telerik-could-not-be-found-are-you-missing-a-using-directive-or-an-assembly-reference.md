---
title: Design Time Problems. 'The type or namespace name "Telerik" could not be found (are you missing a using directive or an assembly reference?)' Error on build.
description: The type or namespace name "Telerik" could not be found (are you missing a using directive or an assembly reference?) - Error on build.
type: troubleshooting
page_title: The type or namespace name "Telerik" could not be found.
slug: troubleshooting-design-time-the-type-or-namespace-name-telerik-could-not-be-found-are-you-missing-a-using-directive-or-an-assembly-reference
position: 
tags: 
ticketid: 
res_type: kb
---

## Environment
<table>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting</td>
	</tr>
</table>


## Description
'The type or namespace name 'Telerik' could not be found (are you missing a using directive or an assembly reference?)' Error on build.
## Solution
Double-check if the project has references to Telerik Reporting assemblies, and if the references _CopyLocal_ is set to true in the Visual Studio Property grid. In case you recently updated your Telerik Reporting installation, run the [Upgrade Wizard]({% slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/visual-studio-report-designer/upgrade-wizard %}) in all related projects in Visual Studio.

If Telerik Reporting assemblies are referenced and updated, verify that the project targets .NET4+ framework Full Profile version.
