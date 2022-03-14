---
title: The Visual Studio Report designer is not available after upgrading Telerik Reporting.
description: The Visual Studio Desinger is unable to load reports after upgrading Telerik Reporting.
type: how-to
page_title: The Visual Studio Designer cannot open reports after upgrading Telerik Reporting.
slug: report-designer-is-not-available-after-upgrading-telerik-reporting
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

After upgrading Telerik Reporting and opening an existing report (created with the previous version) in VS design mode, the one of the errors below is thrown. 

## Error Message
 
- **Unable to load one or more of the requested types** 

- **Telerik.Reporting.Drawing.Unit cannot be converted to type Telerik.Reporting.Drawing.Unit**  
   
## Possible Cause  
 
A possible reason for this problem is that your project uses "*stale*" assemblies from the previous Telerik Reporting version, which do not match the new DLL versions. In other words, the assemblies from the older missing version are still in your project's ***bin*** folder, and these assemblies do not comply with the new ones, leading to the error above.   
   
## Soluton
 
 - Go through the [Upgrade Wizard]({% slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/visual-studio-report-designer/upgrade-wizard %});
 
 - Delete the project's "***bin***" and "***obj***" folders as described below:
    - Backup your project.
    - Close all reports in the project.
    - Close Visual Studio.
    - Physically delete the "***bin***" and "***obj***" directories for this project.  

 > Unless you have manually put any new files in these folders, the correct contents of these directories will be recreated automatically.
 
 - Open Visual Studio.
 
 - Add References to the new assemblies.
 
 - Rebuild the solution.
 
 - Delete the **.resx** file for the reports throwing the error, **rebuild** the project and open the report designer again.
