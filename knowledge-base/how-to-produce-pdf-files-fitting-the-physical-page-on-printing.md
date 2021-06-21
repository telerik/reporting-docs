---
title: How to produce PDF files fitting the physical page on printing
description: How to produce PDF files fitting the physical page on printing.
type: how-to
page_title: How to produce PDF files fitting the physical page on printing
slug: how-to-produce-pdf-files-fitting-the-physical-page-on-printing
res_type: kb
---

## Description
How to produce PDF files fitting the physical page on printing.  
  
## Solution   

On printing a PDF file from a PDF Reader, there is an option 'Fit to Page' allowing you to scale the document's content to fit the selected page size. This feature can be used to scale reports on printing them.  
  

For the purpose:  

1. Open the report in a Report Designer:
    - Set the report's *PageSettings.PaperKind* to *Custom*
    - Set the report's *PagseSettings.PaperSize* to a size allowing you to gather the whole content into a single page in *[Print preview](../report-viewers-interactive-print-view).*
2. Configure the PDF rendering extension:
    - Set its [ViewerPrintScaling](../device-information-settings-pdf) parameter to **AppDefault**. More details about the required settings can be found in [Telerik Reporting Configuration Section](../configuring-telerik-reporting) and [Extensions Element](../configuring-telerik-reporting-extensions).
    - Set its Javascript parameter to ```"this.print({bUI: true, bSilent: false, bShrinkToFit: true});"```. This will force the PDF reader to raise its Print Dialog on opening the PDF file.

 For example:  

```xml
<configuration>
  <configSections>
    <section
            name="Telerik.Reporting"
            type="Telerik.Reporting.Configuration.ReportingConfigurationSection, Telerik.Reporting, Version=10.1.16.615, Culture=neutral, PublicKeyToken=a9d7983dfcc261be"
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
  
>**Note**
> <br/>
> The scaling mechanism of PDF Readers is out of the scope of the reporting engine. 

