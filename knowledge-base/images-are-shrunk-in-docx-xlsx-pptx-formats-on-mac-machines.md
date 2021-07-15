---
title: Images are Shrunk in DOCX, XLSX, PPTX formats on Mac machines
description: Images are Shrunk in DOCX, XLSX, PPTX formats on Mac machines.
type: how-to
page_title: Images are Shrunk in DOCX, XLSX, PPTX formats on Mac machines
slug: images-are-shrunk-in-docx-xlsx-pptx-formats-on-mac-machines
res_type: kb
---

## Description

Images are Shrunk in DOCX, XLSX, PPTX formats on Mac machines.  
  
## Solution

The Graph, Map and Barcode items are rendered as **EMF** in OpenXML formats like DOCX, XLSX, PPTX. On Mac machines the images may appear shrunk. To avoid the issue, you can force the rendering engine to create Bitmap images instead of EMF by setting the corresponding rendering extension's **UseMetafile** parameter.  
 
For more details about the settings: 
- [Telerik Reporting Configuration Section](../configuring-telerik-reporting)
- [Extensions Element](../configuring-telerik-reporting-extensions)
- [PPTX](../device-information-settings-powerpoint) rendering extension's parameters
- [DOCX](../device-information-settings-word) rendering extension's parameters
- [XLSX](../device-information-settings-excel-2007) rendering extension's parameters

 An example of the settings:  

```XML
<!-- For Viewers and Reporting REST and WCF services -->
<configuration>
    <configSections>
        <section
                name="Telerik.Reporting"
                type="Telerik.Reporting.Configuration.ReportingConfigurationSection, Telerik.Reporting, Version=x.x.x.x, Culture=neutral, PublicKeyToken=a9d7983dfcc261be"
                allowLocation="true"
                allowDefinition="Everywhere"/>
    </configSections>
<Telerik.Reporting>
        <extensions>
            <render>
                <extension name="DOCX">
                    <parameters>
                        <parameter name="UseMetafile" value="false"/>
                    </parameters>
                </extension>
            </render>
        </extensions>
    </Telerik.Reporting>
    …
</configuration>
```

> **Note** 
> <br/>
> DOCX/PPTX/XLSX rendering extensions require **Telerik.Reporting.OpenXmlRendering.dll** and [Open XML SDK 2.0 for Microsoft Office](../installation-deploying-openxml)(*DocumentFormat.OpenXml.dll v.2.0.5022.0* or above with proper [binding redirect](https://docs.microsoft.com/en-us/dotnet/framework/configure-apps/file-schema/runtime/bindingredirect-element?redirectedfrom=MSDN)).

