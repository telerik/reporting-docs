---
title: Images are Shrunk in DOCX, XLSX, PPTX formats on Mac machines
description: The Images' sizes are incorrect in DOCX, XLSX, PPTX formats on Mac machines.
type: how-to
page_title: Images are rendered smaller in DOCX, XLSX, PPTX rendering extensions on Mac machines
slug: images-are-shrunk-in-docx-xlsx-pptx-formats-on-mac-machines
res_type: kb
---

## Environment

<table>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting</td>
	</tr>
  	<tr>
		<td>OS</td>
		<td>MacOS</td>
	</tr>
  	<tr>
		<td>Rendering Extensions</td>
		<td>DOCX, XLSX, PPTX</td>
	</tr>
</table>

## Description

The Graph, Map and Barcode items are rendered as **EMF** in OpenXML formats like DOCX, XLSX, PPTX. On Mac machines, the images may appear shrunk.  
  
## Solution
 
To avoid the issue, you can force the rendering engine to create **Bitmap** images instead of EMF by setting the corresponding rendering extension's **UseMetafile** parameter.   

For .NET Framework projects

```XML
<!-- web.config/app.config -->
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

For .NET Core projects:

```JavaScript
"telerikReporting": {
    "extensions": [
      {
        "name": "DOCX",
        "parameters": [
          {
            "Name": "UseMetafile",
            "Value": "false"
          }
        ]
      }
    ]
  }
```

## Notes

The DOCX/PPTX/XLSX rendering extensions require the **Telerik.Reporting.OpenXmlRendering.dll** and the [Open XML SDK 2.0 for Microsoft Office](../installation-deploying-openxml)(**DocumentFormat.OpenXml.dll v.2.0.5022.0** or above with proper [binding redirects](https://docs.microsoft.com/en-us/dotnet/framework/configure-apps/file-schema/runtime/bindingredirect-element?redirectedfrom=MSDN)).

## See Also

 [Telerik Reporting Configuration Section](../configuring-telerik-reporting)
 
 [Extensions Element](../configuring-telerik-reporting-extensions)
 
 [PPTX rendering extension's parameters](../device-information-settings-powerpoint) 
 
 [DOCX rendering extension's parameters](../device-information-settings-word) 
 
 [XLSX rendering extension's parameters](../device-information-settings-excel-2007) 
