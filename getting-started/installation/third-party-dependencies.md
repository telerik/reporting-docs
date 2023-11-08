---
title: Third-Party Dependencies
page_title: Third-Party Dependencies for Enriching Reporting Functionalities
description: "Learn more about the third-party dependencies when working with Telerik Reporting that let you use specific features like Open XML rendering and ADOMD.NET."
slug: telerikreporting/using-reports-in-applications/third-party-dependencies
previous_url: /using-reports-in-applications/third-party-dependencies, /installation-deploying-adomd.net, /installation-deploying-openxml
tags: third-party,dependencies
published: True
position: 20
---

# External Dependencies for Enriched Functionality

The proper functioning of some specific Telerik Reporting features depends on third-party utilities such as ADOMD.NET and Open XML.

## Deploying ADOMD.NET

ADOMD.NET is a .NET Framework object model that is used for building client applications which access XML for Analysis 1.1 compliant data providers such as the data provider by the XML for Analysis 1.1 SDK. To download the ADOMD.NET, refer to the [ADOMD.NET download link](https://www.microsoft.com/en-us/download/details.aspx?id=55264).

To connect to Microsoft Analysis Services and to execute an MDX query against the desired OLAP cube, the Telerik Reporting [CubeDataSource]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/cubedatasource-component/overview%}) component internally uses the ADOMD.NET client data provider.

## Deploying Open XML

Open XML is an open ECMA 376 standard that is approved as the ISO/IEC 29500 standard for defining a set of XML schemas for representing spreadsheets, charts, presentations, and word-processing documents. All MS Office Word 2007, Excel 2007, and PowerPoint 2007 use Open XML as their default file format.

To export its reports in Open XML formats, such as `.docx`, `.xlsx`, or `.pptx`, Telerik Reporting requires the `DocumentFormat.OpenXml.dll` Open XML SDK.

The `DocumentFormat.OpenXml` assembly has two versions with different Public Key Tokens. To provide support for both, Telerik Reporting delivers the following `Telerik.Reporting.OpenXmlRendering` assemblies:

* `Telerik.Reporting.OpenXmlRendering.dll`−Supports 2.0.5022.0 and 2.5.5631.0 `DocumentFormat.OpenXml.dll` versions.
* `Telerik.Reporting.OpenXmlRendering.2.7.2.dll`−Supports 2.7.2.0 and later `DocumentFormat.OpenXml.dll` versions.

> To generate compatible document types, always use the latest available version. To use later versions other than the versions previously listed, add [`bindingRedirect`](https://learn.microsoft.com/en-us/dotnet/framework/configure-apps/file-schema/runtime/bindingredirect-element) for `DocumentFormat.OpenXml.dll` assembly to the configuration file of the application.

To download Open XML by using the NuGet feed, refer to the [`DocumentFormat.OpenXml` NuGet package](https://www.nuget.org/packages/DocumentFormat.OpenXml/).

To avoid using the NuGet feed and download Open XML, download and install [Open XML SDK 2.0 for Microsoft Office](https://learn.microsoft.com/en-us/previous-versions/office/developer/office-2010/bb456487(v=office.14)).
