---
title: fontLibrary Element
page_title: fontLibrary Element | for Telerik Reporting Documentation
description: fontLibrary Element
slug: telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/fontlibrary-element
tags: fontlibrary,element
published: True
position: 7
---

# fontLibrary Element



__FontLibrary__  configuration element specifies the folders that will be used by the rendering engine when searching for a specific font.       

This element is respected only when the PDF rendering extension is used in .NET Core applications under __Linux / MacOS__ .         The element is not respected in applications that run on Windows machine or when other than PDF rendering extension is used.       

## Attributes and Elements

The following sections describe attributes, child elements, and parent elements.


>caption ```<fontLibrary>``` element


|   |   |
| ------ | ------ |
Attributes| __useDefaultLocations__ - determines if the system's default font locations to be included in the search.                 On Linux machines these folders are`/usr/share/fonts/truetype/`and`/usr/local/share/fonts`.                 On macOS machines the folder is`/Library/Fonts`.                 Default value: __true__ .|
|Child Elements|*  __add__ - Optional element. Adds a font location to the collection.|
|Parent Elements|*  __configuration__ - Specifies the root element in every configuration file that is used by                     the common language runtime and the .NET Framework applications.<br/>*  __Telerik.Reporting__ - Configures all settings that Telerik Reporting Engine uses|





>caption ```<add>``` element


|Attribut|



| __path__ |Required attribute. Specifies the path to a fonts folder. The path can be absolute or relative to the current application folder.|
| __searchSubfolders__ |Required attribute. Determines if the subfolders of the specified path will be recursively traversed.


|   |   |
| ------ | ------ |
|
|Child elements|None|
|Parent element| __fontLibrary__|




## Example

The following example demonstrates how to configure the reporting engine to skip searching the default font folders and declares a folder to be for used for font resolving.         

XML-based configuration file:

	
````xml
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

	
````js
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



# See Also


 * [Overview]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/overview%})
