---
title: Previewing a report definition that uses an external assembly
description: Preview report definition with user-defined functions or CLR objects defined in an external assembly
type: how-to
page_title: Preview report definition, which uses an external assembly with user-defined functions or CLR objects
slug: deploying-trdx-(xml-report-definition)-that-uses-external-assembly
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

Previewing a report definition containing expressions with user-defined functions or other custom CLR objects coming from an external assembly. The application has to be configured to load the external assembly.
  
## Solution with User-defined functions

Without extending the application to load the external assembly, you will get the following error *"The expression contains object* 'MyReportExtensionsLibrary' *that is not defined in the current context."*

The avoid the error:

- Add the Telerik.Reporting configuration section to the \<configSections\> element. Notice that the section type attribute may differ according to the version. For the exact details check <a href="/configuring-telerik-reporting" target="_blank">Telerik Reporting Configuration Section</a> in the .chm help file for your version.

- Add \<Telerik.Reporting\> section element and \<AssemblyReferences\> element in it, like in the Report Designer configuration file.

- Place the assembly extending the default functionality (MyAssembly.dll) in the directory from where the custom application will be executed or in a subfolder described via relative to the execution folder paths using the <a href="http://msdn.microsoft.com/en-US/library/823z9h8w%28v=vs.80%29" target="_blank">.NET \<probing\> element</a>.

    \* Adding a reference to the assembly in Visual Studio with CopyLocal settings set to **True** will copy the DLL automatically.

  

The entire configuration for extending an application with MyAssembly.dll containing user-defined functions should look as follows:

```
<configuration>  
 <configSections>  
   <section 
           name="Telerik.Reporting"
           type="Telerik.Reporting.Configuration.ReportingConfigurationSection, Telerik.Reporting, Version=x.x.x.x, Culture=neutral, PublicKeyToken=a9d7983dfcc261be"  
           allowLocation="true"  
           allowDefinition="Everywhere"/>  
 </configSections>
  
 <runtime>  
   <assemblyBinding xmlns="urn:schemas-microsoft-com:asm.v1">  
     <probing privatePath="MySubDir; MySubDir\SubDir"/> 
   </assemblyBinding>  
 </runtime>
  
 <Telerik.Reporting>  
   <AssemblyReferences>  
     <add name="MyAssembly" version="1.0.0.0" culture="neutral"publicKeyToken="null" />  
   </AssemblyReferences>  
 </Telerik.Reporting> 
</configuration>
```

    Where **x.x.x.x** stands for the used Telerik Reporting assembly version, e.g. 7.1.13.802.  
  
- Show the report definition in a report viewer control. For this you may find useful the <a href="/report-viewers-overview" target="_blank">Using Telerik Reporting in Applications</a> help article.

> **Important**
> <br>
> If the external assembly depends on other assemblies, all related assemblies have to be placed into the folder from where the application is executed.
  
## Solution with custom CLR objects  

Without extending the application to load the external assembly, CLR objects used as data sources will not be loaded. To avoid the issue you can:

- Add a reference to the external DLL in the project. If the reporting data source components refer to the CLR object by ​its <a href="https://msdn.microsoft.com/en-us/library/system.type.assemblyqualifiedname%28v=vs.110%29.aspx" target="_blank">assembly qualified name</a>, the reporting engine will be able to use <a href="https://msdn.microsoft.com/en-us/library/f7ykdhsy%28v=vs.110%29.aspx" target="_blank">Reflection</a> and use the types since the assembly is already referenced and loaded in the application.

- Extend the application to load the assembly via Telerik.Reporting section as illustrated above for [Reports using external assemblies with User-defined functions](/knowledge-base/deploying-trdx-\(xml-report-definition\)-that-uses-external-assembly#reports-using-external-assemblies-with-user-defined-functions). With this approach, you will have to manually copy the DLL in the application's execution folder, and thus you can skip adding a reference in the project. The configuration will let know the reporting engine that it has to load the assembly.

> **Important**
> <br>
> If the external assembly depends on other assemblies, all related assemblies have to be placed into the folder from where the application is executed.  
    
	
> **Note**
> <br>
> The same configurations are applicable if you need to use external assemblies with User-defined functions or with custom CLR objects in Visual Studio Report Designer where the application is **devenv.exe**, Standalone Report Designer where the application is **Telerik.ReportDesigner.(x86.)exe**, or other custom application with a viewer control.


