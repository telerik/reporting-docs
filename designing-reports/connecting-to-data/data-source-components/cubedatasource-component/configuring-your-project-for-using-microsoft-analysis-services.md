---
title: Configuring Microsoft Analysis Services
page_title: Configuring the project for using Microsoft Analysis Services
description: "Learn how to configure the project for using Microsoft Analysis Services before using the CubeDataSource in your Telerik Reports."
slug: telerikreporting/designing-reports/connecting-to-data/data-source-components/cubedatasource-component/configuring-your-project-for-using-microsoft-analysis-services
tags: configuring,your,project,for,using,microsoft,analysis,services
published: True
position: 1
previous_url: /cubedatasource-configuring-project
reportingArea: General
---

# Configurations for using Microsoft Analysis Services

Before utilizing the **CubeDataSource** component in your reports you need to configure your report class library for using **Microsoft Analysis Services** first:

1. **Install the Microsoft ADOMD.NET client data provider** : The **CubeDataSource** component requires the **Microsoft ADOMD.NET** client data provider to be installed on your machine. The present version of **Telerik Reporting** is compiled against the **ADOMD.NET** provider for **SQL Server 2008 R2**.

   > caution You need to use **Microsoft.AnalysisServices.AdomdClient** with version **12** or lower. In _AdomdClient_ version _13.0_ the security configuration has changed and it cannot be used by our runtime. The reason is that the security policy changed and the assembly methods can no longer be accessed from assemblies that have _AllowPartiallyTrustedCallers_ set to _true_, like ours.

1. **Add the required assembly references to your project:** You need to add the following assembly references to your report class library:

   - **Microsoft.AnalysisServices.AdomdClient** - this is the **ADOMD.NET** client data provider assembly which is normally located in the following directory after installation:

     `<Program Files>`\\Microsoft.NET\\ADOMD.NET\\`<Product Version>`

     Here `<Program Files>` is the directory with your program files, and `<Product Version>` is the version of the installed product (this should be **100** for **ADOMD.NET for SQL Server 2008 R2**).

   - **Telerik.Reporting.Adomd** - this is the **Telerik Reporting** provider assembly for **ADOMD.NET** which is located in the _"Bin"_ subdirectory of your **Telerik Reporting** installation.

1. **Add an assembly binding redirect if necessary:** The current version of **Telerik Reporting** uses **ADOMD.NET** for **SQL Server 2008 R2**. Please, verify that the version of the **Microsoft.AnalysisServices.AdomdClient** assembly is _"10.0.0.0"_. If you have a greater version of that assembly you need to add an appropriate assembly binding redirect in the configuration file of the start application as illustrated below:

   ```XML
   <configuration>
   	<runtime>
   		<assemblyBinding xmlns="urn:schemas-microsoft-com:asm.v1">
   			<dependentAssembly>
   				<assemblyIdentity name="Microsoft.AnalysisServices.AdomdClient"
   				publicKeyToken="89845dcd8080cc91"
   				culture="neutral" />
   				<bindingRedirect oldVersion="0.0.0.0-65535.65535.65535.65535"
   				newVersion="<Your Version>" />
   			</dependentAssembly>
   		</assemblyBinding>
   	</runtime>
   </configuration>
   ```

   Here `<Your Version>` is the actual version of your **Microsoft.AnalysisServices.AdomdClient** assembly. It should be either 12 or lower due to the security policy introduced with version 13. In the case of a ClassLibrary project containing report definitions, the binding redirects should be applied in Visual Studio configuration file (**devenv.exe.config**).
