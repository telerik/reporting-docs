---
title: Assembly Used in ObjectDataSource is Not Loaded by the Standalone Report Designer
description: How to troubleshoot which assemblies to add to the Standalone Report Designer folder when an ObjectDataSource assembly types are missing in the wizard.
type: troubleshooting
page_title: 
slug: objectdatasource-assembly-not-loaded-by-standalone-report-designer
position: 
tags: 
ticketid: 1453347
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
The Standalone Report Designer may not recognize the main ObjectDataSource assembly even though the assembly is properly added to the designer folder and registered in its configuration file when this assembly depends on other assemblies.

## Cause\Possible Cause(s)
The reason is that the Standalone Report Designer cannot find the external assemblies when trying to get the data source schema.

## Solution
You may use [Fuslogvw](https://docs.microsoft.com/en-us/dotnet/framework/tools/fuslogvw-exe-assembly-binding-log-viewer) to investigate the issue. The idea is to see which dependencies the designer tries to load and eventually which ones cannot be found. 
Here we demonstrate the approach step-by-step with an [ObjectDataSource](../objectdatasource) that utilizes EntityFrameworkCore version 3.1.1.

1. Start [Fuslogvw](https://techcommunity.microsoft.com/t5/iis-support-blog/fusion-log-viewer-fuslogvw-exe/ba-p/784396) in [Developer Command Prompt for Visual Studio](https://docs.microsoft.com/en-us/dotnet/framework/tools/developer-command-prompt-for-vs) - screenshot [StartFuslogvw.png](https://www.telerik.com/docs/default-source/knowledgebasearticleattachments/reporting/startfuslogvw.png?sfvrsn=e57b63f_2)
2. Setup Fuslogvw to record the failures in a custom folder, for example, 'c:\temp' - screenshot [SetupFuslogvw.png](https://www.telerik.com/docs/default-source/knowledgebasearticleattachments/reporting/setupfuslogvw.png?sfvrsn=d915da24_2)
3. Add the assembly (e.g. _ClassLibrary2_) with the DataSource/DataMember of the ObjectDataSource in the Standalone Report Designer folder and register it in the designer configuration file - [Extending Report Designer](../standalone-report-designer-extending-configuration)
4. Open the Standalone Report Designer and start the [ObjectDataSource Wizard](../objectdatasource-wizard) to configure it. If _ClassLibrary2_ is not discovered by the wizard, as shown in screenshot [DataSourcesNotFound.png](https://www.telerik.com/docs/default-source/knowledgebasearticleattachments/reporting/datasourcesnotfound.png?sfvrsn=9efca29c_2), the Fuslogvw should have logged a failure in the '(_specified folder_)\Default\Telerik.ReportDesigner.exe', in our case 'C:\temp\Default\Telerik.ReportDesigner.exe'. The particular log file is _Microsoft.EntityFrameworkCore, Version=3.1.1.0, Culture=neutral, PublicKeyToken=adb9793829ddae60.HTM_ and indicates that this assembly was not found
5. Add the above assembly to the designer folder. You may check where to find the assembly in the assembly properties in the Visual Studio -  screenshot [AssemblyPathInVS.png](https://www.telerik.com/docs/default-source/knowledgebasearticleattachments/reporting/assemblypathinvs.png?sfvrsn=403c4748_2) or in the folder where NuGet packages for the user are generally stored - 'C:\Users\\_username_\\.nuget\\packages\\_packagename_\\_version_\\lib\\_framework_', for example, 'C:\Users\arabadzhiev\.nuget\packages\microsoft.entityframeworkcore\3.1.1\lib\netstandard2.0'
6. Close the designer and repeat steps 4-6 until the assembly is discovered by the designer.

Note that there may be other failures to discover assemblies logged by Fuslogvw. Those assemblies are used internally by the designer - you don't need to add them. The [FuslogvwLogs.zip](https://www.telerik.com/docs/default-source/knowledgebasearticleattachments/reporting/fuslogvwlogs.zip?sfvrsn=cfa37cc5_2) file contains the ObjectDataSource-relevant logs for the example. A screenshot of the entire log folder can be seen on [FuslogvwForReportDesigner.png](https://www.telerik.com/docs/default-source/knowledgebasearticleattachments/reporting/fuslogvwforreportdesigner.png?sfvrsn=43802be5_2).

