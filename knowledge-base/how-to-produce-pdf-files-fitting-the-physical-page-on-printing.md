---
title: How to Produce PDF Files Fitting the Physical Page on Printing
description: How to export PDF files fitting the physical page on printing.
type: how-to
page_title: How to generate PDF files fitting the physical page on printing
slug: how-to-produce-pdf-files-fitting-the-physical-page-on-printing
res_type: kb
---

## Environment

<table>
	<tbody>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
		</tr>
		<tr>
			<td>Rendering Format</td>
			<td>PDF</td>
		</tr>
	</tbody>
</table>

## Description

On printing a PDF file from a PDF Reader, there is an option **'Fit to Page'** allowing you to scale the document's content to fit the selected page size. This feature can be used to scale reports on printing them.  
  
## Solution    

1. Open the report in a Report Designer:
    
    - Set the report's **PageSettings.PaperKind** property to **Custom**
    
    - Set the report's **PagseSettings.PaperSize** property to a size allowing you to gather the whole content into a single page in [Print preview]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/interactive-vs.-print-layout%}).
    
2. Configure the PDF rendering extension:
    - Set its [ViewerPrintScaling]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-export-formats/pdf-device-information-settings%}) parameter to **AppDefault**. More details about the required settings can be found in [Telerik Reporting Configuration Section]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/overview%}) and [Extensions Element]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/extensions-element%}).
    - Set its Javascript parameter to ```"this.print({bUI: true, bSilent: false, bShrinkToFit: true});"```. This will force the PDF reader to raise its Print Dialog on opening the PDF file.

 For example:  

```xml
<configuration>
  <configSections>
    <section
            name="Telerik.Reporting"
            type="Telerik.Reporting.Configuration.ReportingConfigurationSection, Telerik.Reporting, Version=[X.X.X.X], Culture=neutral, PublicKeyToken=a9d7983dfcc261be"
            allowLocation="true"
            allowDefinition="Everywhere"/>
  </configSections>
  <Telerik.Reporting>
    <Extensions>
      <Render>
        <Extension name="PDF" description="PDF Description">
          <Parameters>
            <Parameter name="JavaScript" value="this.print({bUI: true, bSilent: false, bShrinkToFit: true});"/>
            <Parameter name="ViewerPrintScaling" value="AppDefault"/>
          </Parameters>
        </Extension>
      </Render>
    </Extensions>
  </Telerik.Reporting>
....
</configuration>
```

> The scaling mechanism of PDF Readers is out of the scope of the reporting engine. 
