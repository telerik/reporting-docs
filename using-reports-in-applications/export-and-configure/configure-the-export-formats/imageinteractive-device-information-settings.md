---
title: ImageInteractive Device Information Settings
page_title: ImageInteractive Device Information Settings | for Telerik Reporting Documentation
description: ImageInteractive Device Information Settings
slug: telerikreporting/using-reports-in-applications/export-and-configure/configure-the-export-formats/imageinteractive-device-information-settings
tags: imageinteractive,device,information,settings
published: True
position: 2
---

# ImageInteractive Device Information Settings



The following table lists the device information settings for rendering in IMAGEInteractive format.

## ImageInteractive Device Information Settings


| Name | Type | Description |
| ------ | ------ | ------ |
|OutputFormat|String|Defines the output format of the produced image. Supported formats are: __BMP__ , __EMF__ , __EMFPLUS__ , __GIF__ , __JPEG__ , __PNG__ .|
|TextRenderingHint|string|Sets the rendering mode for text using a  [TextRenderingHint](https://msdn.microsoft.com/en-us/library/ssazt6bs(v=vs.110).aspx) enumeration member. The default value depends on the machine settings - if it has  [ClearType](https://www.microsoft.com/en-us/Typography/ClearTypeInfo.aspx) enabled, then __ClearTypeGridFit__ will be used. Otherwise the rendering algorithm will use __AntiAliasGridFit__ hinting.                 If text rendering hinting is not supported, the __SystemDefault__ value will be used|




For a detailed example of how to set up the settings for a rendering extension, see [extensions Element]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/extensions-element%}).         

## Example

XML-based configuration file:

	
````xml
							<configuration>
								…
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
								…
							</configuration>
````



JSON-based configuration file:

	
````js
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



# See Also


 * [Device Information Settings]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-export-formats/overview%})

 * [Export Formats]({%slug telerikreporting/using-reports-in-applications/export-and-configure/export-formats%})
