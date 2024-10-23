---
title: Configuring the Image Rendering Extension to generate TIFF files
description: Modify the Image Rendering Extension to generate high resolution (300 x 300 dpi) images and register four new formats that use the CCITT G3/G4, RLE and None compressions.
type: how-to
page_title: Edit the Image Rendering Extension to produce TIFF files
slug: configuring-the-image-rendering-extension-to-generate-tiff-files
res_type: kb
---

## Environment
<table>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting</td>
	</tr>
   <tr>
		<td>Rendering Extension</td>
		<td>Image</td>
	</tr>
</table>

## Description

By default, the Image Rendering Extension generates **TIFF** files with **LZW** compression and resolution 96 x 96 dpi. In case you need bi-tonal (black and white) images, for example when you need to send the rendered report by fax, you may consider using any of the **CCITT Group 3/Group 4** or **RLE** compressions which will produce files with smaller size.  
    
## Solution

The example below shows a sample application [configuration file](https://docs.microsoft.com/en-us/dotnet/framework/configure-apps) (*App.config* or *Web.config*) in which we modify the original **Image** rendering extension settings to generate high resolution (300 x 300 dpi) images and register four new formats that use the **CCITT G3/G4**, **RLE** and **None** compressions.   
    
```xml
<?xml version="1.0"?> 
<configuration> 
  <!-- The configSectins element should be the first child element of configuration --> 
  <configSections> 
    <section 
      name="Telerik.Reporting" 
      type="Telerik.Reporting.Configuration.ReportingConfigurationSection, Telerik.Reporting, Version=x.x.x.x, Culture=neutral, PublicKeyToken=a9d7983dfcc261be" 
      allowLocation="true" 
      allowDefinition="Everywhere"/> 
  </configSections> 
    <!-- Substitute Version=X.X.X.X with the assembly version you are using! --> 
  <Telerik.Reporting> 
    <Extensions> 
      <Render> 
        <!--This is the original Image rendering extension with modified settings to output high resolution TIFF – 300 x 300 dpi. Also we override the description attribute to hint on the changed resolution.--> 
        <Extension name="Image" description="TIFF file Hi res"> 
          <Parameters> 
            <Parameter name="DpiX" value="300" /> 
            <Parameter name="DpiY" value="300" /> 
          </Parameters> 
        </Extension> 
        <!--Each of the next Extension tags adds a new rendering extension with unique name. The value provided for the TiffCompression parameter defines the compression method to be used. The description attribute is the string to be displayed in the viewer controls, so that the end users can distinguish the export options.--> 
        <Extension name="TIFF_CCITT3" 
                   type="Telerik.Reporting.ImageRendering.ImageReport, Telerik.Reporting, Version=x.x.x.x, Culture=neutral, PublicKeyToken=a9d7983dfcc261be" 
                   description="TIFF file (CCITT Group 3)"> 
          <Parameters> 
            <Parameter name="TiffCompression" value="ccitt3" /> 
          </Parameters> 
        </Extension> 
        <Extension name="TIFF_CCITT4" 
                   type="Telerik.Reporting.ImageRendering.ImageReport, Telerik.Reporting, Version=x.x.x.x, Culture=neutral, PublicKeyToken=a9d7983dfcc261be" 
                   description="TIFF file (CCITT Group 4)"> 
          <Parameters> 
            <Parameter name="TiffCompression" value="ccitt4" /> 
          </Parameters> 
        </Extension> 
        <Extension name="TIFF_RLE" 
                   type="Telerik.Reporting.ImageRendering.ImageReport, Telerik.Reporting, Version=x.x.x.x, Culture=neutral, PublicKeyToken=a9d7983dfcc261be" 
                   description="TIFF file (Rle)"> 
          <Parameters> 
            <Parameter name="TiffCompression" value="rle" /> 
          </Parameters> 
        </Extension> 
        <Extension name="TIFF_NONE" 
                   type="Telerik.Reporting.ImageRendering.ImageReport, Telerik.Reporting, Version=x.x.x.x, Culture=neutral, PublicKeyToken=a9d7983dfcc261be" 
                   description="TIFF file (None)"> 
          <Parameters> 
            <Parameter name="TiffCompression" value="none" /> 
          </Parameters> 
        </Extension> 
      </Render> 
    </Extensions> 
  </Telerik.Reporting>   
</configuration> 
``` 
   
As a result, in the Report Viewer's drop-down with the available export formats, you will see all of the above registered **TIFF** extensions.  

## Notes

- In Telerik Reporting, device information settings are used to pass rendering parameters to a rendering extension.  
   
- Device information settings can be set in a variety of ways. The &lt;Telerik.Reporting&gt; configuration section can be used to specify rendering parameters globally. Programmatically, the [ReportProcessor.RenderReport()](/api/telerik.reporting.processing.reportprocessor#collapsible-Telerik_Reporting_Processing_ReportProcessor_RenderReport_System_String_Telerik_Reporting_ReportSource_System_Collections_Hashtable_) method may be used. 

        
## See Also  
 
[Configuring Telerik Reporting]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/overview%})

[Device Information Settings]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-export-formats/overview%})

[Configuring Apps by using Configuration Files](https://docs.microsoft.com/en-us/dotnet/framework/configure-apps/)

 
