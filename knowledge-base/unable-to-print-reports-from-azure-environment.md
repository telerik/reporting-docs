---
title: Unable to Print Reports from Azure Environment
description: "Learn why when running reports on Azure Web Site the reports are not able to print, and how you may fix this."
type: troubleshooting
page_title: Unable to print reports from Azure environment
slug: unable-to-print-reports-from-azure-environment
position: 
tags: WinFormsReportViewer, WPFReportViewer, Printing, Azure
ticketid: 1175913
res_type: kb
---

## Environment

<table>
	<tr>
		<td>Product Version</td>
		<td>12.1.18.620+</td>
	</tr>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting </td>
	</tr>
	<tr>
		<td>Project Type</td>
		<td>Desktop Application</td>
	</tr>
	<tr>
		<td>Viewer</td>
		<td>WinForms/WPF Viewer</td>
	</tr>
</table>


## Description

Azure websites restrict the usage of certain GDI APIs we use for image rendering. When working with a desktop client (WinForms or WPF report viewer), the printing process essentially is rendering the report using the [ImageRendering]({%slug telerikreporting/designing-reports/rendering-and-paging/design-considerations-for-report-rendering/image-rendering-design-considerations%}) extension in a Metafile. We use Metafile, because it is a vector format, hence supports scaling/zooming without quality loss. However, metafiles are not supported in Azure.

## Solution

In [R2 2018 Service Pack 1 (12.1.18.620)](https://www.telerik.com/support/whats-new/reporting/release-history/progress-telerik-reporting-r2-2018-sp1-12-1-18-620) we introduced an extended configuration especially for printing in raster files. The name of the rendering extension is **ImagePrint** and it can be set up to render in *TIFF*, *PNG*, *JPEG* or *BMP* when printing, instead of using metafile (*EMF*). The configuration section should look like as following:

````XML
<Telerik.Reporting>
	<extensions>
	<render>
		<extension name="IMAGEPrint">
		<parameters>
			<parameter name="OutputFormat" value="PNG"/>
		</parameters>
		</extension>
	</render>
	</extensions>
</Telerik.Reporting>
````

This setting will be respected when initiating printing from a WPF or WinForms viewer and the image, generated for printing, will be rendered in a **Bitmap** instead of **Metafile**. So, the approach will work, since Bitmaps are supported in Azure.

## Notes

Please consider that the default resolution of printed image is *96 DPI*. If the image appears pixelated when printed, try increase the resolution, setting the parameters *DpiX* and *DpiY* of **ImagePrint** extension. You can read more about the available extension settings in [Image Device Information Settings]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-export-formats/image-device-information-settings%}) help article.

## See Also

* [Preview Reports in Desktop Viewers Using REST Service Deployed in Azure]({%slug preview-reports-using-rest-service-deployed-in-azure.md%})
* [Problems When Rendering Teleik Reports in Azure]({%slug azure-reporting-problems%})
