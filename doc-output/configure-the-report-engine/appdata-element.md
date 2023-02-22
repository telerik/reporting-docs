---
title: appData Element
page_title: appData Element Information 
description: "Learn how to use the appData Element to the choose where temporary application settings will be stored on the file system"
slug: telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/appdata-element
tags: appdata,element
published: True
position: 8
previous_url: /configuring-telerik-reporting-appdata
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
|Attributes|__path__ – string attribute. Specifies the absolute path to the folder which will be used to store temp data, such as Map tiles cache and SQLite assemblies.|
|Parent element|__Telerik.Reporting__ – specifies the root element of the Telerik Reporting configuration settings. Only one appData child element can be used inside the Telerik.Reporting root element.|

## Example

XML-based configuration file:
    
````XML
<configuration>
    …
    <Telerik.Reporting>
        <appData path="c:\temp" />
    </Telerik.Reporting>
    …
</configuration>
````

JSON-based configuration file:
    
````JSON
"telerikReporting": {
  "appData": {
    "path": "c:\\temp"
  }
}
````

