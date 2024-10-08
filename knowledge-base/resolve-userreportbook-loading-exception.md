---
title: The type UserReportBook cannot be loaded
description: "Learn how to address the exception encountered when opening ReportBooks after updating to Telerik Reporting version 18.2.24.924."
type: troubleshooting
page_title: Fix type UserReportBook cannot be loaded Error
slug: resolve-userreportbook-loading-exception
tags: telerik, reporting, reportbook, exception, configuration, typereferences
res_type: kb
ticketid: 1666256
---

## Environment

<table>
    <tbody>
        <tr>
            <td>Product</td>
            <td>Progress® Telerik® Reporting</td>
        </tr>
        <tr>
            <td>Version</td>
            <td>18.2.24.924</td>
        </tr>
    </tbody>
</table>

## Description

After installing version `18.2.24.924` of Telerik Reporting, an exception occurs when trying to open a [Report Book]({%slug telerikreporting/designing-reports/report-book/overview%}) in the [Standalone Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/overview%}) or a custom application. The error message indicates that the reporting engine prevents loading types not listed as trusted or essentially needed.

## Cause

The issue is due to type restriction changes introduced in Telerik Reporting version `18.2.24.924`. These changes enhance application security by preventing the loading of untrusted or unnecessary types - [Type Restrictions in Telerik Reporting]({%slug telerikreporting/upgrade/2024/2024-q3-18-2-24-924%}#type-restrictions).

## Error Message

```
Telerik.Reporting.Utils.TypePermissionException: The type "Telerik.Reporting.UserReportBook" contained in assembly "Telerik.Reporting, Version=18.2.24.924, Culture=neutral, PublicKeyToken=a9d7983dfcc261be" cannot be loaded. 
To help improve the application's security, the reporting engine prevents loading types that are not essentially needed or listed as trusted by the user. If you consider particular types or assemblies as trusted include them in the corresponding TypeReferences or AssemblyReferences element of the 'Telerik.Reporting' configuration section in the application's configuration file.
   at Telerik.Reporting.TypeValidation.TypeValidator.ValidateSerializationType(Type type)
   at Telerik.Reporting.TypeValidation.SafeActivator.CreateInstanceSafe(Type type, Object[] parameters)
   at Telerik.ReportDesigner.Packages.ReportDesigner.Serialization.ComponentActivator.CreateInstance(IDesignerHost host, Type type, String name, IConvertersContainer converters)
   at Telerik.ReportDesigner.Packages.ReportDesigner.Serialization.ReportXmlSerializer.ObjectXmlHostReader.CreateInstance(Type type, String name)
   at Telerik.Reporting.Serialization.ObjectReader.CreateInstance(Type type)
   at Telerik.Reporting.Serialization.ObjectReader.ReadObject(Type type)
   at Telerik.Reporting.Serialization.ObjectReader.ReadXmlElement(String name)
   at Telerik.Reporting.Serialization.ObjectReader.Deserialize(IResourceHandler handler)
   at Telerik.Reporting.XmlSerialization.XmlSerializerBase.Deserialize(XmlReader reader, IResourceHandler resourceHandler)
   at Telerik.Reporting.XmlSerialization.XmlSerializerBase.Deserialize(Stream stream, IResourceHandler resourceHandler)
   at Telerik.ReportDesigner.Packages.ReportDesigner.Serialization.ReportXmlSerializer.Deserialize(Stream stream, IResourceHandler resourceHandler)
   at Telerik.Reporting.ReportPackager.UnpackageDocument(Stream packageStream)
   at Telerik.ReportDesigner.Packages.ReportDesigner.Serialization.PackageDocDataHandler.DeserializeReportDocument(IDesignerLoaderHost targetHost)
   at Telerik.ReportDesigner.Packages.ReportDesigner.Serialization.PackageDocDataHandler.UploadReportDocument(IDesignerLoaderHost targetHost)
   at Telerik.ReportDesigner.Packages.ReportDesigner.Serialization.DocData.UploadReportDocument(IDesignerLoaderHost host)
   at Telerik.ReportDesigner.Packages.ReportDesigner.Serialization.ReportDocumentDesignerLoader.PerformLoad(IDesignerSerializationManager serializationManager)
```

## Solution

To resolve this issue and use Report Books with version `18.2.24.924`, register the type `Telerik.Reporting.UserReportBook` from the `Telerik.Reporting` assembly in the [typeReferences]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/typeReferences-element%}) element in the configuration file of the project (e.g., `appsettings.json`, `App.config`, `Web.config`). 

````JSON
"telerikReporting": {
    "typeReferences": [
        {
            "typeName": "Telerik.Reporting.UserReportBook",
            "assemblyName": "Telerik.Reporting",
            "publicKeyToken": "a9d7983dfcc261be"
        }
    ]
}
````
````XML
<?xml version="1.0"?>
<configuration>
    <configSections>
        <section name="Telerik.Reporting" type="Telerik.Reporting.Configuration.ReportingConfigurationSection, Telerik.Reporting" allowLocation="true" allowDefinition="Everywhere" />
    </configSections>
    <Telerik.Reporting>
        <TypeReferences>
            <add typeName="Telerik.Reporting.UserReportBook" assemblyName="Telerik.Reporting" publicKeyToken ="a9d7983dfcc261be" />
        </TypeReferences>
    </Telerik.Reporting>
</configuration>
````


This configuration explicitly declares the `Telerik.Reporting.UserReportBook` type as trusted, allowing the Telerik Reporting engine to load it without triggering the security exception.

> If the exception occurs when opening the Report Book within the Standalone Report Designer, register the type in its `.config` file which is in the same directory as the executable.

## See Also

- [Type Restrictions in Telerik Reporting]({%slug telerikreporting/upgrade/2024/2024-q3-18-2-24-924%}#type-restrictions)
- [TypeReferences Element Configuration - Telerik Reporting]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/typeReferences-element%})
