---
title: processing Element
page_title: processing Element | for Telerik Reporting Documentation
description: processing Element
slug: telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/processing-element
tags: processing,element
published: True
position: 3
---

# processing Element



The Processing element specifies the configuration settings that will be applied during the processing of the report.       

## ```<processing>``` element

|   |   |
| ------ | ------ |
Attributes| __cacheDefinitionProperties__ - optional boolean attribute. Determines if the report definition properties will be cached during the processing, making them immutable.|
|Child elements| __resourceResolver__ – optional element. Changes the behavior of the default resource resolving mechanism.                 Only one __resourceResolver__ element can be used in the ```<processing>``` element.|
|Parent element| __Telerik.Reporting__ - specifies the root element of the Telerik Reporting configuration settings.                 Only one                 ```<processing>``` element can be used in the Telerik.Reporting element.|


### Example

XML-based configuration file:

    
````xml
<Telerik.Reporting>
    <processing cacheDefinitionProperties="false">
  <!--The element below represents a Path resource resolver:-->
        <!--<resourceResolver provider="path">
            <parameters>
                <parameter name="directory" value="c:\\CommonResourcesDirectory\\" />
            </parameters>
        </resourceResolver>-->
  <!-- The element below represents a custom implementation of resource resolver:-->
        <resourceResolver provider="custom">
            <parameters>
                <parameter name="typeName" value="CustomResourceResolver.RawDataResourceResolver, CustomResourceResolver" />
                <parameter name="constructorParameter1" value="constructorParameterValue1" />
            </parameters>
        </resourceResolver>
    </processing>
</Telerik.Reporting>
````

JSON-based configuration file:

    
````js
"telerikReporting": {
  "processing": {
    "cacheDefinitionProperties":  "false",
    "resourceResolver": {
      // The element below represents a Path resource resolver:
      //"provider": "path",
      //"parameters": [
      //  {
      //    "name": "directory",
      //    "value": "C:\\Temp\\RestServiceStorage"
      //  }
      //]
      // The element below represents a custom implementation of resource resolver:
      "provider": "custom",
      "parameters": [
        {
          "name": "typeName",
          "value": "CustomResourceResolver.RawDataResourceResolver, CustomResourceResolver"
        },
        {
          "name": "constructorParameter1",
          "value": "constructorParameterValue1"
        }
   ]
    }
  }
}
````

### CacheDefinitionProperties

We provide a mechanism for caching the report definition properties that boosts the performance. Naturally it prevents modifying the report during processing stage.               The default value of the property is __True__.             


Basically, the [Report Events]({%slug telerikreporting/using-reports-in-applications/program-the-report-definition/report-events/overview%}) are not intended to be used to modify the report definition, as explained in the [Understanding Events]({%slug telerikreporting/using-reports-in-applications/program-the-report-definition/report-events/understanding-events%}) article.                   For that reason, in R3 2016 for performance reasons, we introduced a change- cacheDefinitionProperties which caches the report definition properties, so such modifications are not respected.                   Setting the cacheDefinitionProperties to false will skip the definition item properties caching, which will allow the report definition to be changed in the report events. This may result in parformance penalty though.                 

### ResourceResolver

__resourceResolver__ element allows to alter the default resource-resolving mechanism.               This element determines what instance of the                [Telerik.Reporting.Interfaces.IResourceResolver](/reporting/api/Telerik.Reporting.Interfaces.IResourceResolver)  interface               will be used by the processing engine to resolve the resources that are specified in the report definition. Such resources are:             

* Images used by  [Telerik.Reporting.PictureBox](/reporting/api/Telerik.Reporting.PictureBox)  and                    [Telerik.Reporting.CheckBox](/reporting/api/Telerik.Reporting.CheckBox)                    report items, referenced by a relative path.                 

* Elements from report's  [Telerik.Reporting.Drawing.ExternalStyleSheet](/reporting/api/Telerik.Reporting.Drawing.ExternalStyleSheet)  collection, referenced by a relative path.                 

* __Source__ property of                    [Telerik.Reporting.Data.CsvDataSource](/reporting/api/Telerik.Reporting.Data.CsvDataSource)  and                    [Telerik.Reporting.Data.JsonDataSource](/reporting/api/Telerik.Reporting.Data.JsonDataSource)  report items, referenced by a relative path.                 

This __ResourceResolver__ is intended to be used in scenarios where the resources are not retrieved from a local file path but rather obtained from a different type of storage.               As an example, Telerik Report Server persists its assets in a storage that can be file-based or can use a MSSQL or Redis database as a backend.               Processing a report definition that has relative paths to its resources would not work in this scenario, unless the necessary resources are not placed in folders relative to the root of the Telerik Report Server web application.               The custom resource resolver can be used here to provide specific logic that will retrieve the necessary resources as byte arrays using the resource identifier from the report definition.             

### ```<resourceResolver>``` element

|   |   |
| ------ | ------ |
Attributes| __provider__ – required string attribute. Determines the provider type of the ResourceResolver instance. Only two types are supported:<br/>* __path__ - Specifies to use an internal ResourceResolver instance that will resolve the resources from a given directory specified in the                             ```<parameters>``` element.<br/>* __custom__ - Specifies to use a custom ResourceResolver instance that implements                               [Telerik.Reporting.Interfaces.IResourceResolver](/reporting/api/Telerik.Reporting.Interfaces.IResourceResolver)  interface.                             It will be instantiated at runtime from the type name specified in the                             ```<parameters>``` element.|
|Child elements| __parameters__ – specifies a collection of parameters for the resource resolver in the ```<resourceResolver>``` element.                         Only one __parameters__ element can be used in the ```<resourceResolver>``` element. __Supported parameters for__ <br/>* __name__ : *directory* <br/>* __value__ : the path to the directory that contains the resources to be resolved. __Supported parameters for__ <br/>* __name__ : *typeName* <br/>* __value__ : the assembly qualified name of the type that implements the                               [Telerik.Reporting.Interfaces.IResourceResolver](/reporting/api/Telerik.Reporting.Interfaces.IResourceResolver)  interface.The parameters collection of the __custom__ provider can contain additional entries that will be passed to the constructor of the type.                         If no additional parameters are specified, the parameterless constructor will be used.|
|Parent element| __processing__ - specifies the parent element of the Telerik Reporting configuration settings.|



# See Also


 

* [Application Configuration Files](http://msdn.microsoft.com/en-us/library/windows/desktop/aa374182(v=vs.85).aspx)

 

* [How the Runtime Locates Assemblies](https://docs.microsoft.com/en-us/dotnet/framework/deployment/how-the-runtime-locates-assemblies)

 

* [```<probing>``` Element](https://docs.microsoft.com/en-us/dotnet/framework/configure-apps/file-schema/runtime/probing-element)

 

* [Configure the Reporting Engine (Overview)]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/overview%})

