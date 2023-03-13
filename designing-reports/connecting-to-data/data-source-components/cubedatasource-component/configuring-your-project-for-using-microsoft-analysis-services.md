---
title: Configuring Microsoft Analysis Services
page_title: Configuring the project for using Microsoft Analysis Services
description: "Learn how to configure the project for using Microsoft Analysis Services before using the CubeDataSource in your Telerik Reports."
slug: telerikreporting/designing-reports/connecting-to-data/data-source-components/cubedatasource-component/configuring-your-project-for-using-microsoft-analysis-services
tags: configuring,your,project,for,using,microsoft,analysis,services
published: True
position: 1
previous_url: /cubedatasource-configuring-project
---

# Configurations for using Microsoft Analysis Services

Before utilizing the __CubeDataSource__ component in your reports you need to configure your report class library for using __Microsoft Analysis Services__ first:

1. __Install the Microsoft ADOMD.NET client data provider__ : The __CubeDataSource__ component requires the __Microsoft ADOMD.NET__ client data provider to be installed on your machine. The present version of __Telerik Reporting__ is compiled against the __ADOMD.NET__ provider for __SQL Server 2008 R2__.

	>caution You need to use __Microsoft.AnalysisServices.AdomdClient__ with version __12__ or lower. In _AdomdClient_ version _13.0_ the security configuration has changed and it cannot be used by our runtime. The reason is that the security policy changed and the assembly methods can no longer be accessed from assemblies that have _AllowPartiallyTrustedCallers_ set to _true_, like ours.

1. __Add the required assembly references to your project:__ You need to add the following assembly references to your report class library: 

	+ __Microsoft.AnalysisServices.AdomdClient__ - this is the __ADOMD.NET__ client data provider assembly which is normally located in the following directory after installation:

		`<Program Files>`\\Microsoft.NET\\ADOMD.NET\\`<Product Version>`

		Here `<Program Files>` is the directory with your program files, and `<Product Version>` is the version of the installed product (this should be __100__ for __ADOMD.NET for SQL Server 2008 R2__).

	+ __Telerik.Reporting.Adomd__ - this is the __Telerik Reporting__ provider assembly for __ADOMD.NET__ which is located in the *"Bin"* subdirectory of your __Telerik Reporting__ installation.

1. __Add an assembly binding redirect if necessary:__ The current version of __Telerik Reporting__ uses __ADOMD.NET__ for __SQL Server 2008 R2__. Please, verify that the version of the __Microsoft.AnalysisServices.AdomdClient__ assembly is *"10.0.0.0"*. If you have a greater version of that assembly you need to add an appropriate assembly binding redirect in the configuration file of the start application as illustrated below: 

	````XML
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
````

	Here `<Your Version>` is the actual version of your __Microsoft.AnalysisServices.AdomdClient__ assembly. It should be either 12 or lower due to the security policy introduced with version 13. In the case of a ClassLibrary project containing report definitions, the binding redirects should be applied in Visual Studio configuration file (__devenv.exe.config__).
