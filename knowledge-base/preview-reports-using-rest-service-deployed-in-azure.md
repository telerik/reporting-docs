---
title: Preview Reports in Desktop Viewers Using REST Service Deployed in Azure
description: "Learn how to preview Telerik Reporting reports in desktop viewers using the Reporting REST Service deployed in Azure."
type: how-to
page_title: Use Report Viewers with REST Service on Azure
slug: preview-reports-using-rest-service-deployed-in-azure.md
position: 
tags: Azure,Report Viewer,REST Service
ticketid: 
res_type: kb
---

## Environment

<table>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting</td>
	</tr>
	<tr>
		<td>Viewer</td>
		<td>WinForms, WPF, WinUI</td>
	</tr>
</table>

## Description

Telerik Reporting REST Service can run on Windows and Linux  machine with .NET Framework, .NET Core or .NET, which makes it suitable for various deployment scenarios in Azure. In order to render reports, the engine uses the GDI+ library, which is currently available in **Basic** and higher [App Service plans](https://azure.microsoft.com/en-us/pricing/details/app-service/windows/). Even these implementations have some GDI API restrictions that affect the image rendering.

When working with a desktop client (WinForms, WPF or WinUI), by default the report is rendered using the *ImageRendering* extension in a [Metafile](https://learn.microsoft.com/en-us/openspecs/windows_protocols/ms-emf/91c257d7-c39d-4a36-9b1f-63e3f73d30ca). We use metafiles, because it is a vector format, hence provides scaling/zooming without quality loss. Because metafiles are currently not supported in Azure, an error occurs when rendering a report in a desktop Report Viewer.

The same applies to printing, which is esentially the same process - rendering the report definition in a metafile, which is sent to the printer.

## Solution

The Reporting engine can be configured to use different output formats for rendering and printing the reports in viewers. These configurations are set up in the application configuration file and determine the type of the output image for each rendering extension. A sample configuration that can be used in Azure, because it forces the report to be previewed and rendered in PNG format is shown below:

````XML
<Telerik.Reporting>
	<extensions>
	<render>
		<extension name="IMAGEInteractive">
		<parameters>
			<parameter name="OutputFormat" value="PNG"/>
		</parameters>
		</extension>
		<extension name="IMAGE">
		<parameters>
			<parameter name="OutputFormat" value="PNG"/>
		</parameters>
		</extension>
		<extension name="IMAGEPrintPreview">
		<parameters>
			<parameter name="OutputFormat" value="PNG"/>
		</parameters>
		</extension>
		<extension name="IMAGEPrint">
		<parameters>
			<parameter name="OutputFormat" value="PNG"/>
		</parameters>
		</extension>
	</render>
	</extensions>
</Telerik.Reporting>
````
````JSON
"telerikReporting": {
  "extensions": [
    {
      "name": "IMAGEInteractive",
      "parameters": [
        {
          "name": "OutputFormat",
          "value": "PNG"
        }
      ]
    },
    {
      "name": "IMAGE",
      "parameters": [
        {
          "name": "OutputFormat",
          "value": "PNG"
        }
      ]
    },
    {
      "name": "IMAGEPrintPreview",
      "parameters": [
        {
          "name": "OutputFormat",
          "value": "PNG"
        }
      ]
    },
    {
      "name": "IMAGEPrint",
      "parameters": [
        {
          "name": "OutputFormat",
          "value": "PNG"
        }
      ]
    }
  ]
}
````

## Additional settings

When the report is exported in any of the formats that use the OpenXML SDK, additional rendering extension parameter determines how the Graph and Map items will be rendered. The parameter is named **UseMetafile** and its default value is *true*, which ensures better image quality in Microsoft Office applications. This setting will be respected only if the rendering machine supports metafiles - otherwise a Bitmap instance is used to render the Graph and Map items.

If the export to Microsoft Office formats fails in Azure environment, set the **UseMetafile** to *false*.

## See Also

* [Configuring Telerik Reporting Extensions]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/extensions-element%})
* [Rendering Extensions]({%slug telerikreporting/using-reports-in-applications/export-and-configure/export-formats%})
* [Telerik Reporting Configuration Section]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/overview%})
* [Unable to Print Reports from Azure Environment]({%slug unable-to-print-reports-from-azure-environment%})
* [Problems When Rendering Teleik Reports in Azure]({%slug azure-reporting-problems%})
