---
title: An error has occurred while loading the ReportDesigner's Workbench
description: An error has occurred while loading the ReportDesigner's Workbench might occur when starting the Standalone designer
type: troubleshooting
page_title: An Error Has Occurred while Loading the ReportDesigner's Workbench
slug: an-error-has-occurred-while-loading-the-reportdesigners-workbench
position: 
tags: standalonedesigner,reportdesigner
ticketid: 1557617
res_type: kb
---

## Environment
<table>
	<tbody>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
		</tr>
	</tbody>
</table>


## Description
The following error might be seen when starting the Standaline designer:
***Fatal error in workbench. Now closing...
An error has occurred while loading the ReportDesigner's Workbench***

## Solution
The problem might come from a wrong configuration in the config file of the designer. To troubleshoot the described issue, attach a Trace Listener to the designer
by adding the following to ***Telerik.ReportDesigner.exe.config*** to generate a log file :

````xml
   <system.diagnostics>
        <trace autoflush="true" indentsize="4">
          <listeners>
            <add name="myListener" type="System.Diagnostics.TextWriterTraceListener" initializeData="c:\temp\StandaloneDesigner.LOG" />              
            <remove name="Default" />
          </listeners>
        </trace>
    </system.diagnostics>
````
    
Inspect the generated file for any errors. You can also send us the log file in a support ticket with the configuration file of the designer.


Another possibility for the issue is to have an ***invalid user.config*** file. 
This is a file where the user preferences like connection strings, last opened files, window statuses, etc. are stored. This file can be found in the ***%localappdata%\Telerik_AD\*** folder and there should be a subfolder called Telerik.ReportDesigner with a strong name key suffix. 

Rename or move these files so the designer would load with default values instead of reading them from these configuration files.
