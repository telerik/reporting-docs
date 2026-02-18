---
title: appData Element
page_title: appData Element Configuration 
description: "Learn how to use the appData Element to choose where temporary application settings will be stored on the file system"
slug: telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/appdata-element
tags: appdata,element
published: True
position: 8
previous_url: /configuring-telerik-reporting-appdata
reportingArea: General
---
<style>
table th:first-of-type {
    width: 20%;
}
table th:nth-of-type(2) {
    width: 80%;
}
</style>

# appData Element Overview

The appData element specifies the configuration settings for the temporary application data stored on the machine. 

## Attributes and Elements

__`<appData>` element__ 

|   |   |
| ------ | ------ |
|Attributes|__path__ – string attribute. Specifies the absolute path to the folder that will be used to store temp data, such as Map tiles cache and SQLite assemblies.|
|Parent element|__Telerik.Reporting__ – specifies the root element of the Telerik Reporting configuration settings. Only one appData child element can be used inside the Telerik.Reporting root element.|

## Example

### Windows

````XML
<configuration>
  <configSections>
		<section name="Telerik.Reporting" type="Telerik.Reporting.Configuration.ReportingConfigurationSection, Telerik.Reporting" allowLocation="true" allowDefinition="Everywhere" />
	</configSections>
    <Telerik.Reporting>
        <appData path="C:\temp" />
    </Telerik.Reporting>
</configuration>
````
````JSON
"telerikReporting": {
  "appData": {
    "path": "C:\\temp"
  }
}
````

### Unix(Linux/Mac):

````XML
<configuration>
	<configSections>
		<section name="Telerik.Reporting" type="Telerik.Reporting.Configuration.ReportingConfigurationSection, Telerik.Reporting" allowLocation="true" allowDefinition="Everywhere" />
	</configSections>
    <Telerik.Reporting>
        <appData path="/tmp/reportingAppData" />
    </Telerik.Reporting>
</configuration>
````
````JSON
"telerikReporting": {
  "appData": {
    "path": "/tmp/reportingAppData"
  }
}
````

