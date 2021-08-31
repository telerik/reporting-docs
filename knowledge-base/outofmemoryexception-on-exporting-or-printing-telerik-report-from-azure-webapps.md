---
title: GDI+ error or OutOfMemoryException on exporting or printing Telerik report from Azure Web Apps
description: GDI+ error or OutOfMemoryException on attempting to render a Telerik Report to another rendering format from Azure Web Apps. 
type: how-to
page_title: GDI+ error or OutOfMemoryException on exporting or printing Telerik report from Azure Web Apps
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

```
System.OutOfMemoryException: Out of memory.
...
```

## Cause

The reason for the error is that Windows Azure Web Apps restricts application from accessing some system resources, including the **GDI API**, and rendering extensions such as PDF would not be able to produce a document.  
  
## Solution

1. Use Azure Web Role to host the application or the module handling the report processing and rendering e.g., switch to Azure Cloud Service or other plan.

2. Use Azure Web Apps - Basic and Standard modes only. As of <a href="https://social.msdn.microsoft.com/forums/azure/en-US/d14bc4fa-256e-4f8f-9682-432ab556f74d/report-viewer-control-fix-for-export-to-pdf-available?forum=windowsazurewebsitespreview" target="_blank">July, 2014 Microsoft released an update</a> allowing applications hosted in Azure Web Apps to generate PDF and Excel files. If the reports contain Barcode, Map, Graph item or other rendered as a Metafile(EMF), you will need to turn of the usage of Metafile and use Bitmap.  

For the purpose:

   - Declare <a href="../configuring-telerik-reporting">Telerik.Reporting section</a>;
   - Add the setting for the <a href="../device-information-settings-word" target="_blank">DOCX</a>. <a href="../device-information-settings-powerpoint" target="_blank">PPTX</a>, <a href="../device-information-settings-excel-2007" target="_blank">XLSX</a> and <a href="../device-information-settings-rtf" target="_blank">RTF</a> rendering extensions:  

```XML
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
```


