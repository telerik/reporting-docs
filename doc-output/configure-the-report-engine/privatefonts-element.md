---
title: privateFonts Element
page_title: Configuring the privateFonts Element 
description: "Learn how to use any TrueType font, without having to install it on the host machine, through the privateFonts configuration element."
slug: telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/privatefonts-element
tags: privatefonts,element
published: True
position: 6
previous_url: /configuring-telerik-reproting-privatefonts
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

# privateFonts Element Overview

Defines a collection that allows the Reporting Engine to use a private version of an existing font without the requirement to install the font on the host machine. If the font is already installed the installed font is used.

>note __Known issue with the Windows Platform:__ If you order the fonts in the PrivateFontCollection first regular then bold the GDI+ measure string size for bold font style is incorrect. This is observed in Windows 8.1 and later and may lead to unexpected rendering and aligning issues. For more information see [Wrong Measurements from MeasureString](https://github.com/Microsoft/DirectXTK/issues/34).

>note __Known issue with Azure:__ The required .NET API for handling private fonts is making GDI calls that are blocked in Azure App Services. If private fonts are required our recommendation is to use Cloud Service plan. More details can be found in [Custom Fonts not working on Azure App Service](https://github.com/wkhtmltopdf/wkhtmltopdf/issues/4398).

>note __Known issue with PDF rendering in .NET Core application on Linux:__ The PDF rendering engine needs to obtain the bytes for fonts used in the report. The font resolving mechanism currently relies on the __privateFonts__ element to provide path to each font along with a style description. This includes the substitute fonts that are picked by the runtime when the font, used in the report, is not available.

>note __Known issue with `privateFonts` in .NET Core application on Linux:__ The library [libgdiplus](https://www.mono-project.com/docs/gui/libgdiplus/) that we use as GDI+ implementatin for Linux returns as a Family Font Name the `Preferred Family` rather than `Family` name from the font meta information. Details may be found in [Font.Name returns incorrect results on Linux](https://github.com/mono/libgdiplus/issues/617). The two names may be different in the general case. In such scenario, the font should be referenced with its `Family` name for Windows and `Preferred Family` name for Linux.
>
> In the rare case when the `Preferred Family` name of two fonts conincide and the `Family` names are different, on Linux only the second font registered as private would be respected as it will override the first one.

The private fonts are used for all rendering extensions. Still the font rendering on the client computer depends on the viewer configuration and document format specifications:

* PDF: The rendering extension embeds fonts by default. This functionality is controlled by the [FontEmbedding device information setting]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-export-formats/pdf-device-information-settings%});
* HTML5 Rendering: In order web browser to render HTML with private fonts you have to set up font-face rules. For more information see the [W3.org article for font-face rules](https://www.w3.org/TR/css-fonts-3/#font-face-rule);
* WPF XAML rendering: embeds private fonts by default;
* Silverlight XAML rendering: In addition to add the private fonts as content to the WCF hosting project you have to add the fonts as resources to the Silverlight project with the same relative path;
* For all other document formats the Reporting Engine is using private fonts but in order the document viewer to use them the fonts should be installed on the client computer;
* Windows Forms Report Viewer uses Image rendering to render in EMF+ that don't support private fonts.

As with most types of software, font files are licensed, rather than sold, and licenses that govern the use of fonts vary from vendor to vendor. As a developer it is your responsibility to ensure that you have the required license rights for any font you use as private font, or otherwise redistribute.

````XML
<configuration>
	<configSections>
		<section name="Telerik.Reporting" type="Telerik.Reporting.Configuration.ReportingConfigurationSection, Telerik.Reporting" allowLocation="true" allowDefinition="Everywhere" />
	</configSections>
	<Telerik.Reporting>
		<privateFonts>
			<add />
		</privateFonts>
	</Telerik.Reporting>	
</configuration>
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
|Attribute|<table><colgroup><col span="1" style="width: 10%;"><col span="1" style="width: 90%;"></colgroup><tbody><tr><td><strong>fontFamily</strong></td><td>The attribute is required and case sensitive.</td></tr><tr><td><strong>path</strong></td><td>The attribute is required and is permitted to specify relative or absolute path information. Relative path information is interpreted as relative to the current working directory. To obtain the current working directory, see MSDN <a href="https://learn.microsoft.com/en-us/dotnet/api/system.io.directory.getcurrentdirectory?view=net-7.0#System_IO_Directory_GetCurrentDirectory">Directory.GetCurrentDirectory() method</a><br/>For web projects you can use ~ operator to specify a root-relative path for a font. For more informarion see MSDN <a href="https://learn.microsoft.com/en-us/previous-versions/ms178116(v=vs.140)">ASP.NET Web Project Paths</a>.</td></tr><tr><td><strong>fontStyle</strong></td><td>The attribute is optional with valid values Regular, Bold, Italic, Strikeout and Underline. The default value is Regular. Specify this attribute if you have to specify font family with multiple font files for different style or if specified font file is not containing Regular style.</td></tr></tbody></table>|
|Child elements|None|
|Parent element|__privateFonts__|

## Example

The following example demonstrates how to configure the reporting engine to use Ubuntu and Courier New fonts. The fonts are part of the project with the following properties:

````XML
<?xml version="1.0"?>
<configuration>
	<configSections>
		<section name="Telerik.Reporting" type="Telerik.Reporting.Configuration.ReportingConfigurationSection, Telerik.Reporting" allowLocation="true" allowDefinition="Everywhere" />
	</configSections>
	<Telerik.Reporting>
		<privateFonts>
			<add fontFamily="Courier New" path="CourBI.ttf" fontStyle="Bold, Italic" />
			<add fontFamily="ubuntu" path="Ubuntu-R.ttf" />
			<add fontFamily="Courier New" path="CourI.ttf" fontStyle="Italic" />
		</privateFonts>
	</Telerik.Reporting>
</configuration>
````
````JSON
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

## See Also

* [Configure the Report Engine Overview]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/overview%})
* [Rendering and Paging Overview]({%slug telerikreporting/designing-reports/rendering-and-paging/overview%})
