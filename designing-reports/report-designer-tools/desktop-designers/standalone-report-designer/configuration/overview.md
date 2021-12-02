---
title: Configuration Overview
page_title: Overview | for Telerik Reporting Documentation
description: Overview
slug: telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/configuration/overview
tags: overview
published: True
position: 0
---

# Configuration Overview



The Telerik Report Designer application can be configured through its configuration file. Application configuration files contain settings specific         to the application. This file contains configuration settings such as assembly binding policy, connectionStrings and so on. For example this file can hold         binding redirect to the latest version of the Reporting engine:       

	
````xml
    <runtime>
    <assemblyBinding xmlns="urn:schemas-microsoft-com:asm.v1">
      <!--
      <probing privatePath="path-to-the-assemblies"/>
      -->
      <dependentAssembly>
        <!-- Required for interoperability with older versions of Telerik Reporting -->
        <assemblyIdentity name="Telerik.Reporting" culture="neutral" publicKeyToken="a9d7983dfcc261be"/>
        <bindingRedirect oldVersion="0.0.0.0-6.2.12.1017" newVersion="6.2.12.1017"/>
      </dependentAssembly>
    </assemblyBinding>
   </runtime>
````



or it can specify a global connection string that can be used by all reports created with the Report Designer:

	
````xml
    <connectionStrings>
      <add name="Telerik.Reporting.Examples.CSharp.Properties.Settings.TelerikConnectionString"
          connectionString="Data Source=(local)\SQLEXPRESS;Initial Catalog=AdventureWorks;Integrated Security=SSPI"
          providerName="System.Data.SqlClient" />
    </connectionStrings>
````



For more information, see          [Application Configuration Files](http://msdn.microsoft.com/en-us/library/ms229689%28v=vs.90%29.aspx) .        

## Default Configuration

The following code example shows the default Telerik.ReportDesigner.exe.config file that is distributed with the Report Designer.

	
````xml
    <?xml version ="1.0"?>
    <configuration>
      <configSections>
        <section
            name="Telerik.Reporting"
            type="Telerik.Reporting.Configuration.ReportingConfigurationSection, Telerik.Reporting"
            allowLocation="true"
            allowDefinition="Everywhere"/>
        <section
            name="Telerik.ReportDesigner"
            type="Telerik.ReportDesigner.Configuration.ReportDesignerConfigurationSection, Telerik.ReportDesigner.Configuration"
            allowLocation="true"
            allowDefinition="Everywhere"/>    
      </configSections>
      <startup>
        <supportedRuntime version="v4.0" sku=".NETFramework,Version=v4.0"/>
      </startup>
      <runtime>
        <assemblyBinding xmlns="urn:schemas-microsoft-com:asm.v1">
          <!--
          <probing privatePath="path-to-the-assemblies"/>
          -->
          <dependentAssembly>
            <!-- Required for interoperability with older versions of Telerik Reporting -->
            <assemblyIdentity name="Telerik.Reporting" culture="neutral" publicKeyToken="a9d7983dfcc261be"/>
            <bindingRedirect oldVersion="0.0.0.0-6.2.12.1017" newVersion="6.2.12.1017"/>
          </dependentAssembly>
        </assemblyBinding>
      </runtime>
      <connectionStrings>
        <add name="Telerik.Reporting.Examples.CSharp.Properties.Settings.TelerikConnectionString"
            connectionString="Data Source=(local)\SQLEXPRESS;Initial Catalog=AdventureWorks;Integrated Security=SSPI"
            providerName="System.Data.SqlClient" />
      </connectionStrings>
      <Telerik.ReportDesigner DefaultWorkingDir="Examples">
      </Telerik.ReportDesigner>
      <!-- Add assembly references -->
      <!-- 
      <Telerik.Reporting>
        <AssemblyReferences>
          <add name="MyCustomAssembly" version="1.0.0.0" />
        </AssemblyReferences>
      </Telerik.Reporting>
      -->
      <!--  
      <system.diagnostics>
        <trace autoflush="true" indentsize="4">
          <listeners>
            <add name="myListener" type="System.Diagnostics.TextWriterTraceListener" initializeData="C:\Temp\Telerik.ReportDesigner.log" />
            <remove name="Default" />
          </listeners>
        </trace>
      </system.diagnostics>
      -->
    </configuration>
````



# See Also


 * [Report Designer Configuration]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/configuration/report-designer-configuration%})

 * [Extending Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/configuration/extending-report-designer%})

 * [Telerik Reporting Configuration Section]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/overview%})

 * [extensions Element]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/extensions-element%})
