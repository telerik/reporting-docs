---
title: Converting reports from various versions of CrystalReports
description: Convert reports from different versions of CrystalReports, using the Telerik Converter.
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

If you do not have this version installed, you can still use the converter if you have any newer version of the product that has .NET support, such as `Crystal Reports XI R2`, `Crystal Reports Basic for Visual Studio 2008`, `Crystal Reports 2008`. All you need to do is to define <a href="https://docs.microsoft.com/en-us/dotnet/framework/configure-apps/redirect-assembly-versions" target="_blank">binding redirection</a> rules in the configuration file of the Visual Studio you are using.  
  
## Solution

- Examine the Global Assembly Cache `(C:\WINDOWS\assembly)` to check which version of Crystal Reports you have installed.

- Modify the following code snippet accordingly, depending on the version you use and insert it in your configuration file (e.g. for VS2010 on 32 bit machine it is located in `C:\Program Files\Microsoft Visual Studio 10.0\Common7\IDE\devenv.exe.config`. 
 
For 64 bit Windows you should look in the `C:\Program Files (x86)\Microsoft Visual Studio 10.0\Common7\IDE\devenv.exe.config`, where `newVersion` is the version of Crystal Reports that **you are using** and **oldVersion** is the version mentioned in the "_New Report Wizard_".

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


- Restart Visual Studio.

- Add new Telerik Report to your project and start the Report Wizard. On its second step, select "Convert from existing report".


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
    </assemblyBinding>  
  </runtime>  
</configuration>
````

