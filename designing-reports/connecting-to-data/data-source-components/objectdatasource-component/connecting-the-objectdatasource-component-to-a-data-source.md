---
title: Connecting the ObjectDataSource component to a Data Source
page_title: Connecting the ObjectDataSource component to a Data Source 
description: Connecting the ObjectDataSource component to a Data Source
slug: telerikreporting/designing-reports/connecting-to-data/data-source-components/objectdatasource-component/connecting-the-objectdatasource-component-to-a-data-source
tags: connecting,the,objectdatasource,component,to,a,data,source
published: True
position: 1
---

# Connecting the ObjectDataSource component to a Data Source

The purpose of the ObjectDataSource component is to provide business objects data to data items in a declarative manner. The [ObjectDataSource.DataSource](https://docs.telerik.com/reporting/p-telerik-reporting-objectdatasource-datasource) property should be the [assembly qualified name](https://msdn.microsoft.com/en-us/library/30wyt9tk) or the Type of the data access layer (class), where the reporting engine will use *System.Reflection* to create the instance of the class by using its default constructor, and to execute its method specified by the *ObjectDataSource.DataMember* property. 

When you configure the ObjectDataSource component the settings below are obligatory to avoid runtime error due to failed data retrieval:

* Visual Studio is a 32-bit application, so the report designer is restricted to x86 mode even on x64 platforms, which prevents the [ObjectDataSource Wizard]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/data-source-wizards/objectdatasource-wizard%}) from discovering any types from x64 assemblies. The solution is to use different platform configurations: for "__Debug__" builds it is best to use "__Any CPU__", while for "__Release__" builds you can use "__x64__" instead. 

* Some [Data Items]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/overview%}) ([Graph]({%slug telerikreporting/designing-reports/report-structure/graph/overview%}), [Map]({%slug telerikreporting/designing-reports/report-structure/map/structure/overview%})) will call the constructor or the data retrieval method of your business object during design-time. This is required in order to obtain the data, process it, and create a live preview of the data item. For this reason the business object used to feed the data item with data should be accessible during design-time, otherwise the data item will not be able to generate a live preview of the data. 

## Creating the DataSource

1. Open __Visual Studio__ and create a new [Class Library](https://docs.microsoft.com/en-us/cpp/mfc/class-library-overview?view=vs-2019).             

   >The Standalone Report Designer is a WPF application built against.NET Framework 4.0. For that reason, it cannot load and resolve classes from assemblies built against.NET Standard 2.1,.NET Core and.NET5. You can see the [.NET Standard compatibility chart](https://docs.microsoft.com/en-us/dotnet/standard/net-standard) which explains how and when the assemblies can be loaded in different framework versions. 

1. Add the following piece of code from [How to Bind to a BusinessObject]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/objectdatasource-component/how-to/how-to-bind-to-a-businessobject%}).

   {{source=CodeSnippets\CS\API\Telerik\Reporting\ObjectDataSourceSnippets.cs region=SampleDataSource}}
   ````C#
class Product
{
    //properties
}

[DataObject]
class Products
{
    //objects
}
````
   {{source=CodeSnippets\VB\API\Telerik\Reporting\ObjectDataSourceSnippets.vb region=SampleDataSource}}
   ````VB
Class Product
    'properties
End Class

<DataObject()>
Class Products
    'objects
End Class
````

1. Build the project and close it.

## Configuration

For security reasons the ObjectDataSource can resolve only types that are declared either in the current report's assembly or in AssemblyReferences element nodes in Telerik.Reporting section of application configuration file. During report processing, the ObjectDataSource component tries to resolve its type and if it is not listed in these two places, an exception will be thrown. 

* Configuration in the [Visual Studio Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/visual-studio-report-designer/overview%}): In this case, you will need to add a reference to the Class Library project or to the dll which contains the data source definition. 

* Configuration in the [Standalone Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/overview%}): 

   1. Open the project folder of the Class Library -> __bin__ -> __Debug__ and copy the dll file. 

   1. Paste it at the installation folder of the Report designer (C:\Program Files (x86)\Progress\Telerik Reporting __[Version]__ \Report Designer). 

   1. Open Telerik.ReportDesigner.exe.config file with a text editor. 

   1. Add an [AssemblyReferences]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/assemblyreferences-element%}) in __Telerik.Reporting__ section of application configuration file: 
    
      ````xml
<?xml version="1.0"?>
<configuration>
    <configSections>
        <section name="Telerik.Reporting" type="Telerik.Reporting.Configuration.ReportingConfigurationSection, Telerik.Reporting" allowLocation="true" allowDefinition="Everywhere" />
    </configSections>
 ...
      <Telerik.Reporting>
          <assemblyReferences>
              <add name="yourAssemblyName"/>
        </assemblyReferences>
       </Telerik.Reporting>
...
</configuration>
````

The additional attributes like __version__, __culture__ and __publicKeyToken__ are not mandatory, because the.NET runtime can resolve the assembly only by its name. After modifying the configuration file the application needs to be restarted so the new configuration settings will be read again. 

## Using the ObjectDataSource in the Report

1. Open the Report Designer and [create a new report]({%slug telerikreporting/getting-started/first-steps%}). 

1. Navigate to __Data__ and click __Object Data Source__. 

1. Select from the __Available data source types__ and follow the Wizard instructions until the process is completed. 

## Configuration in the Report Viewers

1. Add the reference which contains the data source to the project. 

1. Open the project's configuration file and add the same assembly reference like the one required for the Standalone designer. 

## Sample

Sample report that uses Object DataSource can be found at the installation folder of Telerik Reporting: C:\Program Files (x86)\Progress\Telerik Reporting __{Version}__ \Examples\CSharp\ReportLibrary\DataBinding
