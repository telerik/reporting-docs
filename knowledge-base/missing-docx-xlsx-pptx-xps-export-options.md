---
title: Missing DOCX, XLSX, PPTX, XPS export options in viewers or "X rendering format is not available" error message
description: Trying to export a report to a rendering format is failing due to that rendering format not being available..
type: how-to
page_title: The DOCX, XLSX, PPTX, XPS export options are not visible in report viewers or "X rendering format is not available" error message
slug: missing-docx-xlsx-pptx-xps-export-options
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
	    	<td>DOCX, XLSX, PPTX, XPS</td>
	    </tr>
       <tr>
	    	<td>Report Viewer</td>
	    	<td>All</td>
	    </tr>
    </tbody>
</table>

## Description

Trying to export a report to a rendering format is failing due to that rendering format not being available.

## Error Message

```
Missing DOCX, XLSX, PPTX, XPS export options.  
If you export programmatically, the error message will be: **"X rendering format is not available"**, where X is DOCX, XLSX, PPTX, XPS.  
```

## Possible Cause

Usually, this is related to not having Telerik Reporting rendering format specific assemblies not being referenced in the project or the rendering format being unavailable altogether due limitations in .NET Core projects - [.NET Core Support](../use-reports-in-net-core-apps).

## Solution

### XPS

  The **XPS** rendering extension requires the **Telerik.Reporting.XpsRendering.dll** assembly.   
  
### DOCX/PPTX/XLSX
 
  **DOCX/PPTX/XLSX** rendering extensions are OpenXML formats and they require **Telerik.Reporting.OpenXmlRendering.dll** and [Open XML SDK 2.0 for Microsoft Office](../installation-deploying-openxml) (**DocumentFormat.OpenXml.dll v.2.0.5022.0** or above).   
  
 If you are using DocumentFormat.OpenXml of version  2.5.5631.0, you will need binding redirect for the DocumentFormat.OpenXml.dll assembly - [Deploy Telerik Reporting with newer OpenXML SDK version](./deploy-telerik-reporting-with-newer-openxml-sdk-version).   
  
  In newer versions, the DocumentFormat.OpenXml assembly the PublicKeyToken is changed. Thus, if you are using DocumentFormat.OpenXml of version 2.7.2.0 you have to reference **Telerik.Reporting.OpenXmlRendering.2.7.2.** 
 
  > For even newer versions, also add the required **binding redirect**.  
  
  The assembly references must be added in the project that handles reports:

- If the project uses [ReportProcessor](../methods-t-telerik-reporting-processing-reportprocessor) instance, assembly references must be added in that project's configuration file;

- If the project uses a viewer that operates via [Telerik Reporting Service](../telerik-reporting-services), the assembly references must be added in the service project's configuration file;

- If the project uses a desktop viewer or the [obsolete ASP.NET WebForms ReportViewer control](../asp-net-report-viewer), assembly references must be added in the viewer project's configuration file;

- If you are testing the design-time preview in the [Standalone Report Designer](../standalone-report-designer), it is configured to let export in DOCX, PPTX, XLSX and XPS without additional settings;

- If you are testing the design-time preview in [Visual Studio Report Designer](../ui-report-designer), you may not have all export options, unless OpenXML SDK 2.0 is installed on the machine, or if OpenXML SDK 2.5 or greater is installed and you manually add a binding redirect for DocumentFormat.OpenXml.dll assembly in the corresponding *devenev.exe.config* file (Visual Studio configuration file). During the [installation](../installation-installing-from-msi), Telerik Reporting assemblies are automatically registered in the machine's GAC and the design-preview will load them automatically.  

## Notes

- If you do not want to install OpenXML SDK, copy **DocumentFormat.OpenXml.dll** next to the corresponding **devenv.exe** (Visual Studio exe).

- On deploying the application, verify that the above-listed assemblies are copied in the **bin folder**. For this purpose, select the references in Visual Studio and set their **CopyLocal** to **true**. 

