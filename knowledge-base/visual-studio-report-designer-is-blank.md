---
title: Visual Studio Report Designer is Blank
description: On opening a CS report in the VS Designer, the report is blank.
type: how-to
page_title: The Opened in Visual Studio Designer Report is Blank
slug: visual-studio-report-designer-is-blank
res_type: kb
---

## Environment
<table>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting</td>
	</tr>
	<tr>
		<td>Report Designer</td>
		<td>Visual Studio Report Designer</td>
	</tr>
</table>

## Description

On opening a **CS**/**VB** report in the VS Designer, the report is blank. If the VS Report Designer is blank, this indicates that the report's **InitializeComponent** method cannot be accessed and read.  

## Possible Causes   

1. The created class inheriting *Telerik.Reporting.Report* does not have a default parameterless constructor in which the **InitializeComponent** method is called.
2. In rare cases, usually when working under source control, the report's files are *disassociated* - Visual Studio does not recognize the Report's **CS|VB**, **Designer.CS|VB** and **RESX files** as a *whole*. This condition can be recognized by testing to [navigate to the definition](https://docs.microsoft.com/en-us/visualstudio/ide/go-to-and-peek-definition?view=vs-2019) of the **InitializeComponent** method from the report's constructor.  

## Solution 
  
1. Check whether the report class has a default *parameterless* constructor and add such, if needed. *Verify* that the **InitializeComponent** method is called in that constructor.
2. Verify  thatTelerik Reporting is installed on the machine, and the *Telerik Reporting** assemblies are referenced in the project. Then exclude the report files from the project and re-add only the report's *CS|VB** file. Visual Studio should auto-detect the related Designer.CS|VB and RESX files.  

## Notes

You may exclude many reports at once, but re-adding reports must happen adding one by one separate reports' **CS|Vb** files.
