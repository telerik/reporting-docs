---
title: Configure the Report Engine Overview
page_title: Overview | for Telerik Reporting Documentation
description: Overview
slug: telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/overview
tags: overview
published: True
position: 0
---

# Configure the Report Engine Overview



There are particular settings that can be applied to the Telerik Reporting engine          to influence its behavior or extend it. These are defined in the application's configuration file.         For __Windows and WPF applications__  the configuration file is called __app.config__  and for         __ASP.NET applications__  – __web.config__ .         This configuration file is XML-based and its content is divided into sections.       

__.NET Core applications__  provide another way of storing configuration - a key-value JSON-based file named         __appSettings.json__ .         For __.NET Core console applications__  both configuration types are supported,         but __appSettings.json__  has precedence over __app.config__ .         __ASP.NET Core applications__  no longer use *web.config*  so the configuration should be set to any of the supported          [key-value based files](https://docs.microsoft.com/en-us/aspnet/core/fundamentals/configuration/?view=aspnetcore-2.2) .       

>important For more information about configuring a .NET application, see            [Configuring Apps by using Configuration Files](https://docs.microsoft.com/en-us/dotnet/framework/configure-apps/) .         


## Telerik Reporting Configuration Layout

__Telerik Reporting root element__ 

The root element of the configuration is named __```<Telerik.Reporting>```__  in XML-based configuration files and __"telerikReporting"__  in JSON-based configuration files.           All the settings of the Reporting engine are nested in this root element.         



|   |   |
| ------ | ------ |
Attributes|No attributes are defined for this element|
|Child elements| [extensions Element]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/extensions-element%})- specifies a collection of extensions,                 for which the configuration is applied [cache Element]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/cache-element%})- specifies the configuration settings for                 the cache management system which is utilized by the viewers to store and cache rendered pages and resources. [restReportService Element]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/restreportservice-element%})- specifies the configuration settings for the REST                 report service. [assemblyReferences Element]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/assemblyreferences-element%})- specifies a collection of assembly references that are used from Reporting Engine during processing stage to                 resolve names of user functions and user aggregate functions. [privateFonts Element]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/privatefonts-element%})- specifies a collection that allows the Reporting                 Engine to use a private version of a font without installing the font on the host machine. This element is __mandatory__ for rendering PDF files on Linux in a .Net Core application. [appData Element]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/appdata-element%})- specifies the configuration settings for the temporary application data stored on the machine. [dpiAware Element]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/dpiaware-element%})- specifies the application's DPI awareness setting which affects the reports rendering.|
|Parent element| __Configuration__ - Specifies the required root element in every configuration file that is used by the common language runtime and                 the .NET Framework applications. Only one Telerik.Reporting element can be used in the Configuration element|




## XML-based Configuration

The snippets in this section show the ```<Telerik.Reporting>``` configuration used in XML-based configuration files like __app.config__  and __web.config__ .         

The settings for the Telerik Reporting engine are stored in a custom configuration section called *Telerik.Reporting* .           The declaration of this section has to be included in a __```<configSections>```__  element which should be the __first child element__            of __```<configuration>```__ , like this:         

	
````xml
<configuration> 
	<configSections>
		<section
				name="Telerik.Reporting"
				type="Telerik.Reporting.Configuration.ReportingConfigurationSection, Telerik.Reporting, Version=x.x.x.x, Culture=neutral, PublicKeyToken=a9d7983dfcc261be"
				allowLocation="true"
				allowDefinition="Everywhere"/>
	</configSections>
	…
</configuration>
````



The custom configuration section's content:         

	
````xml
<Telerik.Reporting>
  <extensions>
    <render>
      <extension>
        <parameters>
          <parameter/>
        </parameters>
      </extension>
    </render>
  </extensions>
  <cache>
    <providers>
      <provider>
        <parameters>
          <parameter/>
        </parameters>
      </provider>
    </providers>
  </cache>
  <restReportService>
    <reportResolver/>
    <storage>
      <parameters>
        <parameter/>
      </parameters>
    </storage>
  </restReportService>
  <assemblyReferences>
    <add />
    <clear />
    <remove />
  </assemblyReferences>
  <privateFonts>
    <add />
  </privateFonts>
  <fontLibrary>    
  </fontLibrary>
  <dpiAware>
  </dpiAware>
  <appData>
  </appData>
</Telerik.Reporting>
````



## JSON-based Configuration

The JSON-based configuration structure used in __appSettings.json__  or other key-value based files looks like this:         

	
````js
"telerikReporting": {
    "extensions": [
      {
        "name": null,
        "parameters": [
          {
            "name": null,
            "value": null
          }
        ]
      }
    ],
    "cache": {
      "provider": null,
      "providers": [
        {
          "name": null,
          "parameters": [
            {
              "Name": null,
              "Value": null
            }
          ]
        }
      ]
    },
    "restReportService": {
      "hostAppId": null,
      "workerCount": 0,
      "reportSharingTimeout": 0,
      "clientSessionTimeout": 0,
      "reportResolver": {
        "provider": null,
        "parameters": [
          {
            "name": null,
            "value": null
          }
        ]
      },
      "storage": {
        "provider": null,
        "parameters": [
          {
            "name": null,
            "value": null
          }
        ]
      }
    },
    "assemblyReferences": [
      {
        "name": null,
        "version": null,
        "culture": null
      }
    ],
    "privateFonts": [
      {
        "fontFamily": null,
        "path": null,
        "fontStyle": null
      }
    ],
    "fontLibrary":{
      "useDefaultLocations": "true",
      "fontLocations": [
        {
          "path": null,
          "searchSubfolders": null
        }
      ]
    },
    "dpiAware": {
      "dpiAwareness": null
    },
    "appData": {
      "Path": null
    }
  }
````



# See Also


 * [Device Information Settings]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-export-formats/overview%})

 * [Configuring Cache]({%slug telerikreporting/using-reports-in-applications/export-and-configure/cache-management/other-reportviewer-controls/configuring-cache%})
