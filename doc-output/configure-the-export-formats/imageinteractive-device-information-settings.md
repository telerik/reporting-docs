---
title: ImageInteractive Device Information Settings
page_title: ImageInteractive Device Information Settings at a glance
description: "Find detailed information about the different ImageInteractive rendering settings available, and understand their XML-based and JSON-based configuration file formats."
slug: telerikreporting/using-reports-in-applications/export-and-configure/configure-the-export-formats/imageinteractive-device-information-settings
tags: imageinteractive, device, information, settings, options
published: True
position: 2
previous_url: /device-information-settings-imageinteractive
---

<style>
table th:first-of-type {
	width: 15%;
}
table th:nth-of-type(2) {
	width: 10%;
}
table th:nth-of-type(3) {
	width: 75%;
}
</style>

# Device Information Settings for the ImageInteractive Rendering Format

The following table lists the device information settings for rendering in IMAGEInteractive format.

## Available ImageInteractive Device Information Settings

> The names of the properties in Device Information Settings are __Case-Sensitive__.

|__Name__|__Type__|__Description__|
| ------ | ------ | ------ |
|OutputFormat|String|Defines the output format of the produced image. Supported formats are: __BMP__, __EMF__, __EMFPLUS__, __GIF__, __JPEG__, __PNG__.|
|TextRenderingHint|string|Sets the rendering mode for text using a [TextRenderingHint](https://learn.microsoft.com/en-us/dotnet/api/system.drawing.text.textrenderinghint?view=dotnet-plat-ext-7.0) enumeration member. The default value depends on the machine settings - if it has [ClearType](https://learn.microsoft.com/en-us/typography/cleartype) enabled, then __ClearTypeGridFit__ will be used. Otherwise the rendering algorithm will use __AntiAliasGridFit__ hinting. If text rendering hinting is not supported, the __SystemDefault__ value will be used.|

For a detailed example of how to set up the settings for a rendering extension, see [extensions Element]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/extensions-element%}).

## Example

XML-based configuration file:

````XML
<configuration>
	<configSections>
		<section name="Telerik.Reporting" type="Telerik.Reporting.Configuration.ReportingConfigurationSection, Telerik.Reporting" allowLocation="true" allowDefinition="Everywhere" />
	</configSections>
	<Telerik.Reporting>
		<extensions>
			<render>
				<extension name="IMAGEInteractive">
					<parameters>
						<parameter name="OutputFormat" value="PNG"/>
						<parameter name="TextRenderingHint" value="AntiAliasGridFit"/>
					</parameters>
				</extension>
			</render>
		</extensions>
	</Telerik.Reporting>
</configuration>
````
````JSON
"telerikReporting": {
	"extensions": [
		{
			"name": "IMAGEInteractive",
			"parameters": [
				{
					"Name": "OutputFormat",
					"Value": "PNG"
				},
				{
					"Name": "TextRenderingHint",
					"Value": "AntiAliasGridFit"
				}
			]
		}
	]
}
````

## See Also

* [Device Information Settings]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-export-formats/overview%})
* [Export Formats]({%slug telerikreporting/using-reports-in-applications/export-and-configure/export-formats%})
