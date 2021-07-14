---
title: Converting reports from various versions of CrystalReports
description: Converting reports from various versions of CrystalReports.
type: how-to
page_title: Converting reports from various versions of CrystalReports
slug: converting-reports-from-various-versions-of-crystalreports
tags: telerik reporting
res_type: kb
---
  
## HOW-TO

Convert reports from various versions of CrystalReports.
  
## DESCRIPTION

The Telerik Converter from CrystalReports is built against version 10.2.3600.0 of CrystalReports that comes with the installation of MS Visual Studio 2005.   

> Note
> <br>
> Telerik Reporting R2 2018 now provides two Crystal Reports converters. To convert reports from Crystal Reports 13 or newer use the converter that is build with Crystal Reports 13.0.20.2399.

If you do not have this version installed, you can still use the converter if you have any newer version of the product that has .NET support, such as Crystal Reports XI R2, Crystal Reports Basic for Visual Studio 2008, Crystal Reports 2008. All you need to do is to define <a href="http://msdn.microsoft.com/en-us/library/2fc472t2%28VS.80%29.aspx" target="_blank">binding redirection</a> rules in the configuration file of the Visual Studio you are using.  
  
## SOLUTION

1.Examine the Global Assembly Cache (C:\WINDOWS\assembly) to check which version of Crystal Reports you have installed.
2.Modify the following code snippet accordingly, depending on the version you use and insert it in your configuration file (e.g. for VS2010 on 32 bit machine it is located in **C:\Program Files\Microsoft Visual Studio 10.0\Common7\IDE\devenv.exe.config**. For 64 bit Windows you should look in the **C:\Program Files (x86)\Microsoft Visual Studio 10.0\Common7\IDE\devenv.exe.config**.

````
<configuration>  
  <runtime>  
    <assemblyBinding xmlns="urn:schemas-microsoft-com:asm.v1">  
      <dependentAssembly>  
        <assemblyIdentity name="CrystalDecisions.CrystalReports.Engine"publicKeyToken="692fbea5521e1304"culture="neutral"/>  
        <bindingRedirect oldVersion="x.x.x.x"newVersion="x.x.x.x"/>  
      </dependentAssembly>  
      <dependentAssembly>  
        <assemblyIdentity name="CrystalDecisions.Enterprise.Framework"publicKeyToken="692fbea5521e1304"culture="neutral"/>  
        <bindingRedirect oldVersion="x.x.x.x"newVersion="x.x.x.x"/>  
      </dependentAssembly>  
      <dependentAssembly>  
        <assemblyIdentity name="CrystalDecisions.Enterprise.InfoStore"publicKeyToken="692fbea5521e1304"culture="neutral"/>  
        <bindingRedirect oldVersion="x.x.x.x"newVersion="x.x.x.x"/>  
      </dependentAssembly>  
      <dependentAssembly>  
        <assemblyIdentity name="CrystalDecisions.Shared"publicKeyToken="692fbea5521e1304"culture="neutral"/>  
        <bindingRedirect oldVersion="x.x.x.x"newVersion="x.x.x.x"/>  
      </dependentAssembly>  
    </assemblyBinding>  
  </runtime>  
</configuration>
````

where **newVersion** is the version of Crystal Reports that **you are using** and **oldVersion** is the version mentioned in the "New Report Wizard".

3.Restart Visual Studio.
4.Add new Telerik Report to your project and start the Report Wizard. On its second step, select "Convert from existing report".

Here you can find some presets of the binding redirections you need according to the **Crystal Reports** version yo have installed:

````XIR2
<configuration>  
  <runtime>  
    <assemblyBinding xmlns="urn:schemas-microsoft-com:asm.v1">  
      <dependentAssembly>  
        <assemblyIdentity name="CrystalDecisions.CrystalReports.Engine"publicKeyToken="692fbea5521e1304"culture="neutral"/>  
        <bindingRedirect oldVersion="10.2.3600.0"newVersion="11.5.3700.0"/>  
      </dependentAssembly>  
      <dependentAssembly>  
        <assemblyIdentity name="CrystalDecisions.Enterprise.Framework"publicKeyToken="692fbea5521e1304"culture="neutral"/>  
        <bindingRedirect oldVersion="10.2.3600.0"newVersion="11.5.3700.0"/>  
      </dependentAssembly>  
      <dependentAssembly>  
        <assemblyIdentity name="CrystalDecisions.Enterprise.InfoStore"publicKeyToken="692fbea5521e1304"culture="neutral"/>  
        <bindingRedirect oldVersion="10.2.3600.0"newVersion="11.5.3700.0"/>  
      </dependentAssembly>  
      <dependentAssembly>  
        <assemblyIdentity name="CrystalDecisions.Shared"publicKeyToken="692fbea5521e1304"culture="neutral"/>  
        <bindingRedirect oldVersion="10.2.3600.0"newVersion="11.5.3700.0"/>  
      </dependentAssembly>  
    </assemblyBinding>  
  </runtime>  
</configuration>
````
````2008
<configuration>  
  <runtime>  
    <assemblyBinding xmlns="urn:schemas-microsoft-com:asm.v1">  
      <dependentAssembly>  
        <assemblyIdentity name="CrystalDecisions.CrystalReports.Engine"publicKeyToken="692fbea5521e1304"culture="neutral"/>  
        <bindingRedirect oldVersion="10.2.3600.0"newVersion="12.0.2000.0"/>  
      </dependentAssembly>  
      <dependentAssembly>  
        <assemblyIdentity name="CrystalDecisions.Enterprise.Framework"publicKeyToken="692fbea5521e1304"culture="neutral"/>  
        <bindingRedirect oldVersion="10.2.3600.0"newVersion="12.0.1100.0"/>  
      </dependentAssembly>  
      <dependentAssembly>  
        <assemblyIdentity name="CrystalDecisions.Enterprise.InfoStore"publicKeyToken="692fbea5521e1304"culture="neutral"/>  
        <bindingRedirect oldVersion="10.2.3600.0"newVersion="12.0.1100.0"/>  
      </dependentAssembly>  
      <dependentAssembly>  
        <assemblyIdentity name="CrystalDecisions.Shared"publicKeyToken="692fbea5521e1304"culture="neutral"/>  
        <bindingRedirect oldVersion="10.2.3600.0"newVersion="12.0.2000.0"/>  
      </dependentAssembly>  
    </assemblyBinding>  
  </runtime>  
</configuration> 
````
````BasicForVS2008
<configuration>  
  <runtime>  
    <assemblyBinding xmlns="urn:schemas-microsoft-com:asm.v1">  
      <dependentAssembly>  
        <assemblyIdentity name="CrystalDecisions.CrystalReports.Engine"publicKeyToken="692fbea5521e1304"culture="neutral"/>  
        <bindingRedirect oldVersion="10.2.3600.0"newVersion="10.5.3700.0"/>  
      </dependentAssembly>  
      <dependentAssembly>  
        <assemblyIdentity name="CrystalDecisions.Enterprise.Framework"publicKeyToken="692fbea5521e1304"culture="neutral"/>  
        <bindingRedirect oldVersion="10.2.3600.0"newVersion="10.5.3700.0"/>  
      </dependentAssembly>  
      <dependentAssembly>  
        <assemblyIdentity name="CrystalDecisions.Enterprise.InfoStore"publicKeyToken="692fbea5521e1304"culture="neutral"/>  
        <bindingRedirect oldVersion="10.2.3600.0"newVersion="10.5.3700.0"/>  
      </dependentAssembly>  
      <dependentAssembly>  
        <assemblyIdentity name="CrystalDecisions.Shared"publicKeyToken="692fbea5521e1304"culture="neutral"/>  
        <bindingRedirect oldVersion="10.2.3600.0"newVersion="10.5.3700.0"/>  
      </dependentAssembly>  
    </assemblyBinding>  
  </runtime>  
</configuration>
````
