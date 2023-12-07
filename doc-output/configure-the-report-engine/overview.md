---
title: Configure the Report Engine
page_title: Basic Configuration of the Reporting Engine
description: "Learn how to use the Telerik.Reporting root element to configure the reporting engine for your needs."
slug: telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/overview
tags: overview
published: True
position: 0
previous_url: /configuring-telerik-reporting, /doc-output/configure-the-report-engine/
---

<style>
table th:first-of-type {
	width: 15%;
}
table th:nth-of-type(2) {
	width: 85%;
}
</style>

# Report Engine Configuration Overview

Particular settings can be applied to the Telerik Reporting engine to influence its behavior or extend it. These are defined in the application's configuration file. For __Windows and WPF applications__ the configuration file is called `app.config`, for __ASP.NET Framework applications__ – `web.config`. This configuration file is XML-based and its content is divided into sections.

On the other hand, __.NET Core applications__ provide another way of storing configuration - a key-value JSON-based file named `appsettings.json`. For __.NET Core console applications__ both configuration types are supported, but __appsettings.json__ has precedence over __app.config__. __ASP.NET Core applications__ no longer use *web.config* so the configuration should be set to any of the supported [key-value-based files](https://learn.microsoft.com/en-us/aspnet/core/fundamentals/configuration/?view=aspnetcore-7.0).

> For more information about configuring a __.NET__ application, see [Configuring Apps by using Configuration Files](https://learn.microsoft.com/en-us/dotnet/framework/configure-apps/).

## Telerik Reporting Configuration Layout

__Telerik Reporting root element__ 

The root element of the configuration is named `<Telerik.Reporting>` in XML-based configuration files and `"telerikReporting"` in JSON-based configuration files. All the settings of the Reporting engine are nested in this root element.

|   |   |
| ------ | ------ |
|Attributes|No attributes are defined for this element|
|Child elements| [extensions Element]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/extensions-element%})- specifies a collection of extensions, for which the configuration is applied<br/>[cache Element]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/cache-element%})- specifies the configuration settings for the cache management system which is utilized by the viewers to store and cache rendered pages and resources.<br/>[restReportService Element]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/restreportservice-element%})- specifies the configuration settings for the REST report service.<br/>[assemblyReferences Element]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/assemblyreferences-element%})- specifies a collection of assembly references that are used from Reporting Engine during processing stage to resolve names of user functions and user aggregate functions.<br/>[privateFonts Element]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/privatefonts-element%})- specifies a collection that allows the Reporting Engine to use a private version of a font without installing the font on the host machine. This element is __mandatory__ for rendering PDF files on Linux in a .Net Core application.<br/>[appData Element]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/appdata-element%})- specifies the configuration settings for the temporary application data stored on the machine.<br/>[dpiAware Element]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/dpiaware-element%})- specifies the application's DPI awareness setting which affects the reports rendering.|
|Parent element| __Configuration__ - Specifies the required root element in every configuration file that is used by the common language runtime and the .NET Framework applications. Only one Telerik.Reporting element can be used in the Configuration element.|

## XML-based Configuration

The snippets in this section show the `<Telerik.Reporting>` configuration used in XML-based configuration files like `app.config` and `web.config`.

The settings for the Telerik Reporting engine are stored in a custom configuration section called `Telerik.Reporting`. The declaration of this section has to be included in a `<configSections>` element which should be the __first child element__ of `<configuration>`, like this:

````XML
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

````XML
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
	<processing>
		<graphicsEngine>
		</graphicsEngine>
		<resourceResolver>
			<parameters>
				<parameter/>
			</parameters>
		</resourceResolver>
		<sharedResourceResolver>
			<parameters>
				<parameter/>
			</parameters>
		</sharedResourceResolver>
	</processing>
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

The JSON-based configuration structure used in `appsettings.json` or other key-value-based files looks like the following:

````JSON
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
	"processing": {
		"graphicsEngine": {
			"engineName": null
		},
		"cacheDefinitionProperties": null,
		"resourceResolver": {
			"provider": null,
			"parameters": [
				{
					"name": null,
					"value": null
				},
				{
					"name": null,
					"value": null
				}
			]
		},
		"sharedDataSourceResolver": {
			"provider": null,
				"parameters": [
				{
					"name": null,
					"value": null
				}
			]
		}
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

## See Also

* [Device Information Settings]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-export-formats/overview%})
* [Configuring Cache]({%slug telerikreporting/using-reports-in-applications/export-and-configure/cache-management/other-reportviewer-controls/configuring-cache%})
