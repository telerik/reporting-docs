---
title: privateFonts Element
page_title: privateFonts Element 
description: privateFonts Element
slug: telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/privatefonts-element
tags: privatefonts,element
published: True
position: 6
---
<style>
table th:first-of-type {
    width: 20%;
}
table th:nth-of-type(2) {
    width: 80%;
}
</style>

# privateFonts Element

Defines a collection that allows the Reporting Engine to use a private version of an existing font without the requirement to install the font on the host machine. If the font is already installed the installed font is used. 

>note __Known issue with the Windows Platform:__ If you order the fonts in the PrivateFontCollection first regular then bold the GDI+ measure string size for bold font style is incorrect. This is observed in Windows 8.1 and later and may lead to unexpected rendering and aligning issues. For more information see [Wrong Measurements from MeasureString](https://github.com/Microsoft/DirectXTK/issues/34).

>note __Known issue with Azure:__ The required .NET API for handling private fonts is making GDI calls that are blocked in Azure App Services. If private fonts are required our recommendation is to use Cloud Service plan. More details can be found in [PrivateFontCollection is not working](https://feedback.azure.com/forums/34192--general-feedback/suggestions/31381390-privatefontcollection-is-not-working). 

>note __Known issue with PDF rendering in .NET Core application on Linux:__ The PDF rendering engine needs to obtain the bytes for fonts used in the report. The font resolving mechanism currently relies on the  __privateFonts__ element to provide path to each font along with a style description. This includes the substitute fonts that are picked by the runtime when the font, used in the report, is not available. 

The private fonts are used for all rendering extensions. Still the font rendering on the client computer depends on the viewer configuration and document format specifications: 

+ PDF: The rendering extension embeds fonts by default. This functionality is controlled by the [FontEmbedding device information setting]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-export-formats/pdf-device-information-settings%}); 

+ HTML5 Rendering: In order web browser to render HTML with private fonts you have to set up font-face rules. For more information see the [W3.org article for font-face rules](https://www.w3.org/TR/css-fonts-3/#font-face-rule);

+ WPF XAML rendering: embeds private fonts by default; 

+ Silverlight XAML rendering: In addition to add the private fonts as content to the WCF hosting project you have to add the fonts as resources to the Silverlight project with the same relative path; 

+ For all other document formats the Reporting Engine is using private fonts but in order the document viewer to use them the fonts should be installed on the client computer; 

+ Windows Forms Report Viewer uses Image rendering to render in EMF+ that don't support private fonts. 

As with most types of software, font files are licensed, rather than sold, and licenses that govern the use of fonts vary from vendor to vendor. As a developer it is your responsibility to ensure that you have the required license rights for any font you use as private font, or otherwise redistribute. 
    
````xml
<privateFonts>
    <add />
</privateFonts>
````

## Attributes and Elements

The following sections describe attributes, child elements, and parent elements. 

>caption `<privateFonts>` element 

|   |   |
| ------ | ------ |
|Attributes|None|
|Child Elements|__add__ - Optional element. Adds a font to the collection.|
|Parent Elements|<ul><li>__configuration__ - Specifies the root element in every configuration file that is used by the common language runtime and the .NET Framework applications.</li><li>__Telerik.Reporting__ - Configures all settings that Telerik Reporting Engine uses.</li></ul>|


>caption `<add>` element 

|   |   |
| ------ | ------ |
|Attribute|<table><colgroup><col span="1" style="width: 10%;"><col span="1" style="width: 90%;"></colgroup><tbody><tr><td><strong>fontFamily</strong></td><td>The attribute is required and case sensitive.</td></tr><tr><td><strong>path</strong></td><td>The attribute is required and is permitted to specify relative or absolute path information. Relative path information is interpreted as relative to the current working directory. To obtain the current working directory, see MSDN <a href="https://msdn.microsoft.com/en-us/library/system.io.directory.getcurrentdirectory.aspx">Directory.GetCurrentDirectory() method</a><br/>For web projects you can use ~ operator to specify a root-relative path for a font. For more informarion see MSDN <a href="https://msdn.microsoft.com/en-us/library/ms178116.aspx">ASP.NET Web Project Paths</a>.</td></tr><tr><td><strong>fontStyle</strong></td><td>The attribute is optional with valid values Regular, Bold, Italic, Strikeout and Underline. The default value is Regular. Specify this attribute if you have to specify font family with multiple font files for different style or if specified font file is not containing Regular style.</td></tr></tbody></table>|
|Child elements|None|
|Parent element|__privateFonts__|

## Example

The following example demonstrates how to configure the reporting engine to use Ubuntu and Courier New fonts. The fonts are part of the project with the following properties: 

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

* [Configure the Report Engine Overview]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/overview%})

* [Rendering and Paging Overview]({%slug telerikreporting/designing-reports/rendering-and-paging/overview%})
