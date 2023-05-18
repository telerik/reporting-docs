---
title: Converting Crystal Reports to Telerik Reports
description: "Learn how to convert reports created from various versions of Crystal Reports, using the built-in Telerik Reporting Converter."
type: how-to
page_title: Convert reports from various versions of CrystalReports
slug: converting-reports-from-various-versions-of-crystalreports
tags: telerik reporting
res_type: kb
---

## Environment
<table>
	<tbody>
		<tr>
			<td>Product Version</td>
			<td>Up to R3 2019</td>
		</tr>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
		</tr>
	</tbody>
</table>


## Description

The Telerik Converter from CrystalReports is built against version `10.2.3600.0` of CrystalReports that comes with the installation of `MS Visual Studio 2005`.   

> Telerik Reporting R2 2018 now provides two Crystal Reports converters. To convert reports from Crystal Reports 13 or newer use the converter that is build with Crystal Reports 13.0.20.2399.

If you do not have this version installed, you can still use the converter if you have any newer version of the product that has .NET support, such as `Crystal Reports XI R2`, `Crystal Reports Basic for Visual Studio 2008`, `Crystal Reports 2008`. All you need to do is to define <a href="https://docs.microsoft.com/en-us/dotnet/framework/configure-apps/redirect-assembly-versions" target="_blank">binding redirection</a> rules in the configuration file of the Visual Studio you are using or in the configuration of the Standalone Report Designer application.
  
## Solution

- Examine the Global Assembly Cache `(C:\WINDOWS\assembly)` to check which version of Crystal Reports you have installed.

- Modify the following code snippet accordingly, depending on the version you use and insert it in the configuration file of the application that will be used for the conversion process (`Standalone Report Designer` or `Visual Studio`)

	- Visual Studio - (e.g. for Visual Studio 2015) it is located in `C:\Program Files (x86)\Microsoft Visual Studio 2015\Common7\IDE\devenv.exe.config`. 
	- Standalone Report Designer - The configuration file is located next to the executable of the Standalone Report Designer, for example `C:\Program Files (x86)\Progress\Telerik Reporting R2 2019\Report Designer\Telerik.ReportDesigner.exe.config`
	
	> If the Crystal Reports assemblies are built for 32-bit, the 32-bit Standalone Report Designer(`Telerik.ReportDesigner.x86.exe`) should be used and its configuration file(`Telerik.ReportDesigner.x86.exe.config`) should be modified with the code down below.
	

````XML
<configuration>  
	<runtime>  
		<assemblyBinding xmlns="urn:schemas-microsoft-com:asm.v1">  
			<dependentAssembly>  
				<assemblyIdentity name="CrystalDecisions.CrystalReports.Engine" publicKeyToken="692fbea5521e1304" culture="neutral"/>  
				<bindingRedirect oldVersion="x.x.x.x" newVersion="x.x.x.x"/>  
			</dependentAssembly>  
			<dependentAssembly>  
				<assemblyIdentity name="CrystalDecisions.Enterprise.Framework" publicKeyToken="692fbea5521e1304" culture="neutral"/>  
				<bindingRedirect oldVersion="x.x.x.x" newVersion="x.x.x.x"/>  
			</dependentAssembly>  
			<dependentAssembly>  
				<assemblyIdentity name="CrystalDecisions.Enterprise.InfoStore" publicKeyToken="692fbea5521e1304" culture="neutral"/>  
				<bindingRedirect oldVersion="x.x.x.x" newVersion="x.x.x.x"/>  
			</dependentAssembly>  
			<dependentAssembly>  
				<assemblyIdentity name="CrystalDecisions.Shared" publicKeyToken="692fbea5521e1304" culture="neutral"/>  
				<bindingRedirect oldVersion="x.x.x.x" newVersion="x.x.x.x"/>  
			</dependentAssembly>
			<dependentAssembly>
				<assemblyIdentity name="CrystalDecisions.ReportAppServer.DataDefModel" publicKeyToken="692fbea5521e1304" culture="neutral"/>  
				<bindingRedirect oldVersion="x.x.x.x" newVersion="x.x.x.x"/>
			</dependentAssembly>
			<dependentAssembly>
				<assemblyIdentity name="CrystalDecisions.ReportAppServer.ReportDefModel" publicKeyToken="692fbea5521e1304" culture="neutral"/>  
				<bindingRedirect oldVersion="x.x.x.x" newVersion="x.x.x.x"/>
			</dependentAssembly>	    
		</assemblyBinding>  
	</runtime>  
</configuration>
````


- Restart `Visual Studio` or the `Standalone Report Designer`.

- Lastly, depending on which application is used for the conversion:

	- Visual Studio - Add new `Telerik Report` to your project and start the `Report Wizard`. On its second step, select "Convert from existing report".
	- Standalone Report Designer - Use the `Import Report Wizard` on creating a new report. It will first prompt you to choose the name of the TRDP file that will be produced as result of the conversion. The actual convert wizard will open afterward.


## See Also 

Here you can find some presets of the binding redirections you need according to the **Crystal Reports** version yo have installed:

````XML
<configuration>  
	<runtime>  
		<assemblyBinding xmlns="urn:schemas-microsoft-com:asm.v1">  
			<dependentAssembly>  
				<assemblyIdentity name="CrystalDecisions.CrystalReports.Engine" publicKeyToken="692fbea5521e1304" culture="neutral"/>  
				<bindingRedirect oldVersion="10.2.3600.0" newVersion="11.5.3700.0"/>  
			</dependentAssembly>  
			<dependentAssembly>  
				<assemblyIdentity name="CrystalDecisions.Enterprise.Framework" publicKeyToken="692fbea5521e1304" culture="neutral"/>  
				<bindingRedirect oldVersion="10.2.3600.0" newVersion="11.5.3700.0"/>  
			</dependentAssembly>  
			<dependentAssembly>  
				<assemblyIdentity name="CrystalDecisions.Enterprise.InfoStore" publicKeyToken="692fbea5521e1304" culture="neutral"/>  
				<bindingRedirect oldVersion="10.2.3600.0" newVersion="11.5.3700.0"/>  
			</dependentAssembly>  
			<dependentAssembly>  
				<assemblyIdentity name="CrystalDecisions.Shared" publicKeyToken="692fbea5521e1304" culture="neutral"/>  
				<bindingRedirect oldVersion="10.2.3600.0" newVersion="11.5.3700.0"/>  
			</dependentAssembly>
			<dependentAssembly>
				<assemblyIdentity name="CrystalDecisions.ReportAppServer.DataDefModel" publicKeyToken="692fbea5521e1304" culture="neutral"/>  
				<bindingRedirect oldVersion="10.2.3600.0" newVersion="11.5.3700.0"/>
			</dependentAssembly>
			<dependentAssembly>
				<assemblyIdentity name="CrystalDecisions.ReportAppServer.ReportDefModel" publicKeyToken="692fbea5521e1304" culture="neutral"/>  
				<bindingRedirect oldVersion="10.2.3600.0" newVersion="11.5.3700.0"/>
			</dependentAssembly>	
		</assemblyBinding>  
	</runtime>
</configuration>
````


````XML
<configuration>  
	<runtime>  
		<assemblyBinding xmlns="urn:schemas-microsoft-com:asm.v1">
			<dependentAssembly>
				<assemblyIdentity name="CrystalDecisions.CrystalReports.Engine" publicKeyToken="692fbea5521e1304" culture="neutral"/>
				<bindingRedirect oldVersion="10.2.3600.0" newVersion="12.0.2000.0"/>
			</dependentAssembly>
			<dependentAssembly>
				<assemblyIdentity name="CrystalDecisions.Enterprise.Framework" publicKeyToken="692fbea5521e1304" culture="neutral"/>
				<bindingRedirect oldVersion="10.2.3600.0" newVersion="12.0.1100.0"/>
			</dependentAssembly>
			<dependentAssembly>
				<assemblyIdentity name="CrystalDecisions.Enterprise.InfoStore" publicKeyToken="692fbea5521e1304" culture="neutral"/>
				<bindingRedirect oldVersion="10.2.3600.0" newVersion="12.0.1100.0"/>
			</dependentAssembly>
			<dependentAssembly>
				<assemblyIdentity name="CrystalDecisions.Shared" publicKeyToken="692fbea5521e1304" culture="neutral"/>
				<bindingRedirect oldVersion="10.2.3600.0" newVersion="12.0.2000.0"/>
			</dependentAssembly>
			<dependentAssembly>
				<assemblyIdentity name="CrystalDecisions.ReportAppServer.DataDefModel" publicKeyToken="692fbea5521e1304" culture="neutral"/>
				<bindingRedirect oldVersion="10.2.3600.0" newVersion="12.0.1100.0"/>
			</dependentAssembly>
			<dependentAssembly>
				<assemblyIdentity name="CrystalDecisions.ReportAppServer.ReportDefModel" publicKeyToken="692fbea5521e1304" culture="neutral"/>
				<bindingRedirect oldVersion="10.2.3600.0" newVersion="12.0.1100.0"/>
			</dependentAssembly>	
		</assemblyBinding>  
	</runtime>
</configuration>
````


````XML
<configuration>
	<runtime>
		<assemblyBinding xmlns="urn:schemas-microsoft-com:asm.v1">
			<dependentAssembly>
				<assemblyIdentity name="CrystalDecisions.CrystalReports.Engine" publicKeyToken="692fbea5521e1304" culture="neutral"/>
				<bindingRedirect oldVersion="10.2.3600.0" newVersion="10.5.3700.0"/>
			</dependentAssembly>
			<dependentAssembly>
				<assemblyIdentity name="CrystalDecisions.Enterprise.Framework" publicKeyToken="692fbea5521e1304" culture="neutral"/>
				<bindingRedirect oldVersion="10.2.3600.0" newVersion="10.5.3700.0"/>
			</dependentAssembly>
			<dependentAssembly>
				<assemblyIdentity name="CrystalDecisions.Enterprise.InfoStore" publicKeyToken="692fbea5521e1304" culture="neutral"/>
				<bindingRedirect oldVersion="10.2.3600.0" newVersion="10.5.3700.0"/>
			</dependentAssembly>
			<dependentAssembly>
				<assemblyIdentity name="CrystalDecisions.Shared" publicKeyToken="692fbea5521e1304" culture="neutral"/>
				<bindingRedirect oldVersion="10.2.3600.0" newVersion="10.5.3700.0"/>
			</dependentAssembly>
			<dependentAssembly>
				<assemblyIdentity name="CrystalDecisions.ReportAppServer.DataDefModel" publicKeyToken="692fbea5521e1304" culture="neutral"/>
				<bindingRedirect oldVersion="10.2.3600.0" newVersion="10.5.3700.0"/>
			</dependentAssembly>
			<dependentAssembly>
				<assemblyIdentity name="CrystalDecisions.ReportAppServer.ReportDefModel" publicKeyToken="692fbea5521e1304" culture="neutral"/>
				<bindingRedirect oldVersion="10.2.3600.0" newVersion="10.5.3700.0"/>
			</dependentAssembly>	
		</assemblyBinding>
	</runtime>
</configuration>
````

