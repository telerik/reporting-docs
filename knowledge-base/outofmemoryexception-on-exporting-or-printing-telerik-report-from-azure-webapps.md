---
title: GDI+ Error or OutOfMemoryException on Exporting or Printing Telerik Report from Azure Web Apps
description: "Learn why may GDI+ error or OutOfMemoryException occur on attempting to render a Telerik Report to some export formats from Azure Web Apps."
type: how-to
page_title: GDI+ or OutOfMemoryException when rendering in Azure Web Apps
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
		<td>PDF, XLSX, DOCX, PPTX</td>
	</tr>
</table>

## Description

Exporting Telerik reports to PDF and Excel formats deployed to Azure Web Apps may result in **OutOfMemoryException**.

> The issue affects also the print operation, which relies on the PDF rendering mechanism.

## Error Message

`System.OutOfMemoryException: Out of memory...`

## Cause

The reason for the error is that Windows Azure Web Apps restricts application from accessing some system resources, including the **GDI API**, and rendering extensions such as PDF would not be able to produce a document.

## Solution

1. Use Azure Web Role to host the application or the module handling the report processing and rendering e.g., switch to Azure Cloud Service or other plan.
1. Use Azure Web Apps - Basic and Standard modes only. As of [July, 2014 Microsoft released an update](https://social.msdn.microsoft.com/forums/azure/en-US/d14bc4fa-256e-4f8f-9682-432ab556f74d/report-viewer-control-fix-for-export-to-pdf-available?forum=windowsazurewebsitespreview) allowing applications hosted in Azure Web Apps to generate PDF and Excel files. If the reports contain Barcode, Map, Graph item or other rendered as a Metafile(EMF), you will need to turn of the usage of Metafile and use Bitmap.

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


## See Also

* [Report Viewer Control - Fix for export to PDF available?](https://social.msdn.microsoft.com/forums/azure/en-US/d14bc4fa-256e-4f8f-9682-432ab556f74d/report-viewer-control-fix-for-export-to-pdf-available?forum=windowsazurewebsitespreview)
* [Telerik.Reporting Section]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/overview%})
* [DOCX Device Information Settings]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-export-formats/word-device-information-settings%})
* [PPTX Device Information Settings]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-export-formats/powerpoint-device-information-settings%})
* [XLSX Device Information Settings]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-export-formats/excel-2007-device-information-settings%})
* [RTF Device Information Settings]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-export-formats/rtf-device-information-settings%})
* [Problems When Rendering Teleik Reports in Azure]({%slug azure-reporting-problems%})
