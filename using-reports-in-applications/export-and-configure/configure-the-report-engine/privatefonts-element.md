---
title: privateFonts Element
page_title: privateFonts Element | for Telerik Reporting Documentation
description: privateFonts Element
slug: telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/privatefonts-element
tags: privatefonts,element
published: True
position: 6
---

# privateFonts Element



Defines a collection that allows the Reporting Engine to use a private version         of an existing font without the requirement to install the font on the host machine.         If the font is already installed the installed font is used.       

>warning  __Known issue with the Windows Platform:__ If you order the fonts in the PrivateFontCollection first regular then bold           the GDI+ measure string size for bold font style is incorrect.            This is observed in Windows 8.1 and newer and may lead to unexpected rendering and aligning issues.           For more information see            [               Wrong Measurements from MeasureString             ](               https://github.com/Microsoft/DirectXTK/issues/34             ) .          __Known issue with Azure:__ The required .NET API for handling private fonts is making GDI calls that are blocked in Azure App Services.           If private fonts are required our recommendation is to use Cloud Service plan. More details can be found in             [               PrivateFontCollection is not working             ](               https://feedback.azure.com/forums/34192--general-feedback/suggestions/31381390-privatefontcollection-is-not-working             ) .         


>warning  __Known issue with PDF rendering in .NET Core application on Linux:__ The PDF rendering engine needs to obtain the bytes for fonts used in the report. The font resolving mechanism currently relies on the  __privateFonts__            element to provide path to each font along with a style description. This includes the substitute fonts that are picked by the runtime when the font,            used in the report, is not available.         


The private fonts are used for all rendering extensions. Still the font rendering on the client         computer depends on the viewer configuration and document format specifications:       

As with most types of software, font files are licensed, rather than sold,         and licenses that govern the use of fonts vary from vendor to vendor.         As a developer it is your responsibility to ensure that you have the required license rights         for any font you use as private font, or otherwise redistribute.       

	
````xml
    	<privateFonts>
        	<add />
		</privateFonts>
````



## Attributes and Elements

The following sections describe attributes, child elements, and parent elements.


>caption ```<privateFonts>``` element


|   |   |
| ------ | ------ |
Attributes|None|
|Child Elements|*  __add__ - Optional element. Adds a font to the collection.|
|Parent Elements|*  __configuration__ - Specifies the root element in every configuration file that is used by<br/>                  the common language runtime and the .NET Framework applications.<br/>*  __Telerik.Reporting__ - Configures all settings that Telerik Reporting Engine uses|





>caption ```<add>``` element


|Attribut|



| __fontFamily__ |The attribute is required and case sensitive.|
| __path__ |The attribute is required and is permitted to specify relative or absolute path information.
                    Relative path information is interpreted as relative to the current working directory.
                    To obtain the current working directory, see MSDN [Directory.GetCurrentDirectory Method ()](https://msdn.microsoft.com/en-us/library/system.io.directory.getcurrentdirectory.aspx) For web projects you can use ~ operator to specify a root-relative path for a font. For more informarion see MSDN: [ASP.NET Web Project Paths](https://msdn.microsoft.com/en-us/library/ms178116.aspx) |
| __fontStyle__ |The attribute is optional with valid values Regular, Bold, Italic, Strikeout and Underline.
                    The default value is Regular.
                    Specify this attribute if you have to specify font family with multiple font
                    files for different style or if specified font file is not containing Regular style.


|   |   |
| ------ | ------ |
|
|Child elements|None|
|Parent element| __privateFonts__|




## Example

The following example demonstrates how to configure the reporting engine to use Ubuntu and Courier New fonts.           The fonts are part of the project with the following properties:         

XML-based configuration file:

	
````xml
<?xml version="1.0"?>
<configuration>
   ...
	<Telerik.Reporting>
		<privateFonts>
    	<add fontFamily="Courier New" path="CourBI.ttf" fontStyle="Bold, Italic" />
			<add fontFamily="ubuntu" path="Ubuntu-R.ttf" />
			<add fontFamily="Courier New" path="CourI.ttf" fontStyle="Italic" />
    	</privateFonts>
 	</Telerik.Reporting>
   ...
</configuration>
````



JSON-based configuration file:

	
````js
  "telerikReporting": {
    "privateFonts": [
      {
        "fontFamily": "ubuntu",
        "path": "Ubuntu-R.ttf",
      },
      {
        "fontFamily": "Courier New",
        "path": "CourI.ttf",
        "fontStyle": "Italic"
      },
      {
        "fontFamily": "CourBI",
        "path": "CourBI.ttf",
        "fontStyle": "Bold,Italic"
      }
    ]
  }
````



# See Also


 * [Overview]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/overview%})

 * [Overview]({%slug telerikreporting/designing-reports/rendering-and-paging/overview%})
