---
title: fontLibrary Element
page_title: fontLibrary Element Configuration
description: "Learn how to configure which folders the rendering engine will traverse when searching for a specific font through the fontLibrary configuration element."
slug: telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/fontlibrary-element
tags: fontlibrary,element
published: True
position: 7
previous_url: /configuring-telerik-reporting-fontlibrary
reportingArea: General
---
<style>
table th:first-of-type {
    width: 14%;
}
table th:nth-of-type(2) {
    width: 86%;
}
</style>

# fontLibrary Element Overview

The `FontLibrary` configuration element specifies the folders that will be used by the rendering engine when searching for a specific font. 

> This element is respected only when the PDF rendering extension is used in .NET Core applications under __Linux / MacOS__. The element is not respected in applications that run on Windows machine or when any other rendering extension is used. 

## Attributes and Elements

The following sections describe attributes, child elements, and parent elements.

>caption `<fontLibrary>` element 

|   |   |
| ------ | ------ |
|Attributes| __useDefaultLocations__ - determines if the system's default font locations to be included in the search. On Linux machines these folders are `/usr/share/fonts/truetype/` and `/usr/local/share/fonts`. On macOS machines the folder is `/Library/Fonts`.<br/>Default value: __true__.|
|Child Elements|__fontLocations__ - Optional element. Adds collection with font locations.|
|Parent Elements|<ul><li>__configuration__ - Specifies the root element in every configuration file that is used by the common language runtime and the .NET Framework applications.</li><li>__Telerik.Reporting__ - Configures all settings that Telerik Reporting Engine uses.</li></ul>|

>caption `<fontLocations>` element 
|   |   |
| ------ | ------ |
|Attributes|No attributes are defined for this element.|
|Child elements|__add__ - Optional element. Adds a font location to the collection.|
|Parent element|__fontLibrary__|

>caption `<add>` element 
|   |   |
| ------ | ------ |
|Attributes|<table><colgroup><col span="1" style="width: 17%;"><col span="1" style="width: 83%;"></colgroup><tbody><tr><tr><td><strong>path</strong></td><td>Required attribute. Specifies the path to a fonts folder. The path can be absolute or relative to the current application folder.</td></tr><tr><td><strong>searchSubfolders</strong></td><td>Required attribute. Determines if the subfolders of the specified path will be recursively traversed. </td></tr></tbody></table>|
|Child elements|None|
|Parent element|__fontLocations__|

## Example

The following example demonstrates how to configure the reporting engine to skip searching the default font folders and declares which folder will be used for font resolving. 

XML-based configuration file: 
    
````XML
<?xml version="1.0"?>
<configuration>
...
    <Telerik.Reporting>
		<fontLibrary useDefaultLocations ="false">
			<fontLocations>
				<add path="/usr/customFonts/trueType" searchSubfolders="true"></add>
			</fontLocations>
		</fontLibrary>
  </Telerik.Reporting>
...
</configuration>
````

JSON-based configuration file:
    
````JSON
"telerikReporting": {
	"fontLibrary": {
		"useDefaultLocations": "false",
		"fontLocations": [
			{
				"path": "/usr/customFonts/trueType",
				"searchSubfolders": "true"
			}
		]
	}
}
````


## See Also

* [Configure the Report Engine Overview]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/overview%})
