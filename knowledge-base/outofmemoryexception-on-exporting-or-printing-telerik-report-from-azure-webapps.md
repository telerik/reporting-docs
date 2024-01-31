---
title: GDI+ Error or OutOfMemoryException on Exporting or Printing Telerik Report from Azure Web Apps
description: "Learn why may GDI+ error or OutOfMemoryException occur on attempting to render a Telerik Report to some export formats from Azure Web Apps."
type: how-to
page_title: Generic error occurred in GDI+ when running on Azure Web Apps
slug: outofmemoryexception-on-exporting-or-printing-telerik-report-from-azure-webapps
res_type: kb
---

## Environment

<table>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting</td>
	</tr>
	<tr>
		<td>Deployment Environment</td>
		<td>Azure</td>
	</tr>
	<tr>
		<td>Rendering Format</td>
		<td>PDF, XLSX, DOCX, PPTX, RTF</td>
	</tr>
</table>

## Description

Exporting Telerik reports to PDF and OpenXML formats deployed to Azure Web Apps may result in `OutOfMemoryException` or `Generic GDI+ Error`.

> The issue affects also the print operation, which relies on the PDF rendering mechanism.

## Error Message

`System.OutOfMemoryException: Out of memory...`

## Cause

The reason for the error is that Windows Azure Web Apps restricts applications from accessing some system resources, including the [GDI APIs](https://learn.microsoft.com/en-us/windows/win32/gdi/windows-gdi), and rendering extensions such as PDF, PPTX, DOCX, XLSX, RTF, etc. would not be able to produce a document.

## Solution

1. Use Azure Web Role to host the application or the module handling the report processing and rendering e.g., switch to `Azure Cloud Service` or other plan.
1. Use Azure Web Apps - Basic and Standard modes only. As of July 2014, Microsoft released an update allowing applications hosted in Azure Web Apps to generate PDF, Excel, Word, PowerPoint, and RTF files. If the reports contain a Barcode, Map, Graph item, or other rendered as a Metafile(EMF), you will need to turn off the usage of [Metafile](https://learn.microsoft.com/en-us/windows/win32/gdiplus/-gdiplus-metafiles-about) and use [Bitmap](https://learn.microsoft.com/en-us/dotnet/api/system.drawing.bitmap?view=dotnet-plat-ext-8.0).

	For the purpose:

	* Declare [Telerik.Reporting Section]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/overview%})
	* Add the setting for the [DOCX]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-export-formats/word-device-information-settings%}), [PPTX]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-export-formats/powerpoint-device-information-settings%}), [XLSX]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-export-formats/excel-2007-device-information-settings%}), and [RTF]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-export-formats/rtf-device-information-settings%}) rendering extensions:

		````XML
<configuration> 
			<configSections>
				<section
						name="Telerik.Reporting"
						type="Telerik.Reporting.Configuration.ReportingConfigurationSection, Telerik.Reporting"
						allowLocation="true"
						allowDefinition="Everywhere"/>
			</configSections>
			…
			<Telerik.Reporting>
				<Extensions>
					<Render>
						<Extension name="DOCX" >
							<Parameters>
								<Parameter name="UseMetafile" value="false"/>
							</Parameters>
						</Extension>
						<Extension name="XLSX" >
							<Parameters>
								<Parameter name="UseMetafile" value="false"/>
							</Parameters>
						</Extension>
						<Extension name="PPTX" >
							<Parameters>
								<Parameter name="UseMetafile" value="false"/>
							</Parameters>
						</Extension>
						<Extension name="RTF" >
							<Parameters>
								<Parameter name="UseMetafile" value="false"/>
							</Parameters>
						</Extension>
					</Render>
				</Extensions>
			</Telerik.Reporting>
			…
		</configuration>
````
		````JSON
{
    "telerikReporting": {
        "extensions": [
            {
                "name": "DOCX",
                "parameters": [
                    {
                        "Name": "UseMetafile",
                        "Value": false
                    }
                ]
            },
            {
                "name": "PPTX",
                "parameters": [
                    {
                        "Name": "UseMetafile",
                        "Value": false
                    }
                ]
            },
            {
                "name": "XLSX",
                "parameters": [
                    {
                        "Name": "UseMetafile",
                        "Value": false
                    }
                ]
            }
        ]
    }
}
````


## See Also

* [Report Viewer Control - Fix for export to PDF available?](https://social.msdn.microsoft.com/forums/azure/en-US/d14bc4fa-256e-4f8f-9682-432ab556f74d/report-viewer-control-fix-for-export-to-pdf-available?forum=windowsazurewebsitespreview)
* [Telerik.Reporting Section]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/overview%})
* [DOCX Device Information Settings]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-export-formats/word-device-information-settings%})
* [PPTX Device Information Settings]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-export-formats/powerpoint-device-information-settings%})
* [XLSX Device Information Settings]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-export-formats/excel-2007-device-information-settings%})
* [RTF Device Information Settings]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-export-formats/rtf-device-information-settings%})
* [Problems When Rendering Teleik Reports in Azure]({%slug azure-reporting-problems%})
