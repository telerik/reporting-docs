---
title: Preview reports using REST Service deployed in Azure
description: How to preview reports using the Reporting REST Service deployed in Azure
type: how-to
page_title: Use Report Viewers with reports using REST Service and Azure
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
		<td>All</td>
	</tr>
</table>


## Description
Telerik Reporting REST Service can run on any Windows machine with full .NET Framework, which makes it suitable for various deployment scenarios in Azure.
In order to render reports, the engine uses the GDI+ library, which is currently available in **Basic** and higher [App Service plans](https://azure.microsoft.com/en-us/pricing/details/app-service/windows/).
Even these implementations have some GDI API restrictions that affect the image rendering.

When working with a desktop client (WinForms or WPF), by default the report is rendered using the *ImageRendering* extension in a [Metafile](https://msdn.microsoft.com/en-us/library/windows/desktop/dd145051(v=vs.85).aspx). 
We use metafiles, because it is a vector format, hence provides scaling/zooming without quality loss. 
Because metafiles are currently not supported in Azure, an error occurs when rendering a report in a WinForms or WPF Report Viewer.
The same applies to printing, which is esentially the same process - rendering the report definition in a metafile, which is sent to the printer.

## Solution
The Reporting engine can be configured to use different output formats for rendering and printing the reports in viewers. 
These configurations are set up in the application configuration file and determine the type of the output image for each rendering extension.
A sample configuration that can be used in Azure, because it forces the report to be previewed and rendered in PNG format is shown below:
```xml
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
```
## Additional settings
When the report is exported in any of the formats that use the OpenXML SDK, additional rendering extension parameter determines how the Graph and Map items will be rendered.
The parameter is named **UseMetafile** and its default value is *true*, which ensures better image quality in Microsoft Office applications.
This setting will be respected only if the rendering machine supports metafiles - otherwise a Bitmap instance is used to render the Graph and Map items.
If the export to Microsoft Office formats fails in Azure environment, set the **UseMetafile** to *false*. 

## See Also
- [Configuring Telerik Reporting Extensions]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/extensions-element%})
- [Rendering Extensions]({%slug telerikreporting/using-reports-in-applications/export-and-configure/export-formats%})
- [Telerik Reporting Configuration Section]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/overview%})
