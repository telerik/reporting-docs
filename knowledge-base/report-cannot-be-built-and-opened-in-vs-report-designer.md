---
title: The report cannot be built and opened in Visual Studio Report Designer
description: The report cannot be built and opened in Visual Studio Report Designer
type: troubleshooting
page_title: The report cannot be built and opened in Visual Studio Report Designer
slug: report-cannot-be-built-and-opened-in-vs-report-designer
position: 
tags: vs designer
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
CLR report (i.e. CS or VB type inheriting from [Telerik.Reporting.Report](/api/telerik.reporting.report.html)) cannot be opened in the Visual Studio Report Designer.

## Solution
1. Run the [Upgrade Wizard]({% slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/visual-studio-report-designer/upgrade-wizard %}).
2. Build the project. 
3. Resolve any errors and warnings for removed or obsolete properties by checking the [Upgrade]({%slug telerikreporting/upgrade/overview%}). 

Changes in the Report Designer will automatically resolve obsolete code warnings in the report definition. 

Before their complete removal, all obsolete types and properties are kept in Release History for several official releases. If an error which is related to a removed property or namespace occurs: 

1.  Downgrade to an earlier Telerik Reporting version. 
2.	Check the warnings of the project build. 
3.	Handle the obsolete code warnings. 
4.	Upgrade the project to the desired version without errors.
