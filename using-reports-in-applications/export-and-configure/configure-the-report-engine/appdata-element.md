---
title: appData Element
page_title: appData Element | for Telerik Reporting Documentation
description: appData Element
slug: telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/appdata-element
tags: appdata,element
published: True
position: 8
---

# appData Element



The appData element specifies the configuration settings for the temporary application data stored on the machine.       

## Attributes and Elements

__```<appData>``` element__ 



|   |   |
| ------ | ------ |
Attributes| __path__ – string attribute. Specifies the absolute path to the folder which will be used to store temp data, such as Map tiles cache and                 SQLite assemblies.|
|Parent element| __Telerik.Reporting__ – specifies the root element of the Telerik Reporting configuration settings. Only one appData child element can be used inside                 the Telerik.Reporting root element|




## Example

XML-based configuration file:

	
````xml
							<configuration>
								…
								<Telerik.Reporting>
									<appData path="c:\temp" />
								</Telerik.Reporting>
								…
							</configuration>
````



JSON-based configuration file:

	
````js
  "telerikReporting": {
    "appData": {
      "path": "c:\\temp"
    }
  }
````

