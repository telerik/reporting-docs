---
title: assemblyReferences Element
page_title: assemblyReferences Element 
description: assemblyReferences Element
slug: telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/assemblyreferences-element
tags: assemblyreferences,element
published: True
position: 4
---

# assemblyReferences Element



Defines a collection of assembly references that are used from Reporting Engine during processing stage to         resolve names of user functions and user aggregate functions and also the types used by ObjectDataSource component.       

XML-based configuration file:

    
````xml
<assemblyReferences>
    <add />
    <clear />
    <remove />
</assemblyReferences>
````

JSON-based configuration file:

    
````js
"assemblyReferences": [
],
````

## Attributes and Elements

The following sections describe attributes, child elements, and parent elements.

|   |   |
| ------ | ------ |
Attributes|None|
|Child Elements|* __add__ - Optional element. Adds an assembly reference to the collection.<br/>* __clear__ - Optional element. Removes all references to inherited assembly names,<br/>                  allowing only the references that are added by the current add element.<br/>* __remove__ - Optional element. Removes a reference to an inherited assembly name from<br/>                  the collection.|
|Parent Elements|* __configuration__ - Specifies the root element in every configuration file that is used by<br/>                  the common language runtime and the.NET Framework applications.<br/>* __Telerik.Reporting__ - Configures all settings that Telerik Reporting Engine uses.|


## Example

The following code example demonstrates how to configure the reporting engine to use MyUserFunctionsAssembly           assembly as source for user functions. In this example it would also search for assemblies in MyDir and           SubDir application base subdirectories as we have explicitly instructed that via the ```<probing>``` Element.           This is not mandatory, and when not specified, it would search in the application base, which is the root           location where the application is being executed.         

XML-based configuration file:

    
````xml
<?xml version="1.0"?>
<configuration>
    <configSections>
        <section name="Telerik.Reporting" type="Telerik.Reporting.Configuration.ReportingConfigurationSection, Telerik.Reporting" allowLocation="true" allowDefinition="Everywhere" />
    </configSections>
    <runtime>
    <assemblyBinding xmlns="urn:schemas-microsoft-com:asm.v1">
          <probing privatePath="MyDir; MyDir2\SubDir"/>
    </assemblyBinding>
       </runtime>
      <Telerik.Reporting>
          <assemblyReferences>
              <add name="MyUserFunctionsAssembly" version="1.0.0.0" culture="neutral" publicKeyToken ="null" />
        </assemblyReferences>
       </Telerik.Reporting>
...
</configuration>
````

JSON-based configuration file:

    
````js
"telerikReporting": {
  "assemblyReferences": [
      {
        "name": "MyUserFunctionsAssembly",
        "version": "1.0.0.0",
        "culture": "neutral",
        "publicKeyToken": "null"
      }
 ]
}
````

> When adding the `Telerik.Reporting` section manually, do not forget to register it in `configSections`             element of configuration file. Failing to do so will result in a              [ConfigurationErrorsException](https://msdn.microsoft.com/en-us/library/system.configuration.configurationerrorsexception(v=vs.110).aspx)              with following text: *Configuration system failed to initialize*.           



# See Also


 

* [How the Runtime Locates Assemblies](https://docs.microsoft.com/en-us/dotnet/framework/deployment/how-the-runtime-locates-assemblies)

 

* [Specifying an Assembly's Location](https://docs.microsoft.com/en-us/dotnet/framework/configure-apps/specify-assembly-location)

 

* [```<probing>``` Element](https://docs.microsoft.com/en-us/dotnet/framework/configure-apps/file-schema/runtime/probing-element)

 

* [Application Configuration Files](http://msdn.microsoft.com/en-us/library/windows/desktop/aa374182(v=vs.85).aspx)

 

* [User Functions]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/extending-expressions/user-functions%})

 

* [User Aggregate Functions]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/extending-expressions/user-aggregate-functions%})

