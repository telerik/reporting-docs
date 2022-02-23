---
title: Third-Party Dependencies
page_title: Third-Party Dependencies 
description: Third-Party Dependencies
slug: telerikreporting/using-reports-in-applications/third-party-dependencies
tags: third-party,dependencies
published: True
position: 9
---

# Third-Party Dependencies



The proper functioning of some specific Telerik Reporting features depends on third-party utilities         such as ADOMD.NET and Open XML.       

## Deploying ADOMD.NET

To connect to Microsoft Analysis Services and to execute an MDX query against the desired OLAP cube, the           [CubeDataSource]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/cubedatasource-component/overview%}) component by Telerik Reporting internally uses the ADOMD.NET client data provider.         

ADOMD.NET is a.NET object model that is used for building client applications which access XML for           Analysis 1.1 compliant data providers such as the data provider by the XML for Analysis 1.1 SDK.           To download the ADOMD.NET, refer to the            [ADOMD.NET download link](http://www.microsoft.com/downloads/en/details.aspx?FamilyID=790d631b-bff9-4f4a-b648-e9209e6ac8ad).         

## Deploying Open XML

To export its reports in Open XML formats (such as `.docx`, `.xlsx`, or `.pptx`),           Telerik Reporting requires the Open XML SDK (`DocumentFormat.OpenXml.dll`).         

Open XML is an open ECMA 376 standard that is approved as the ISO/IEC 29500 standard for           defining a set of XML schemas for representing spreadsheets, charts, presentations, and word-processing documents.           All MS Office Word 2007, Excel 2007, and PowerPoint 2007 use Open XML as their default file format.         

The `DocumentFormat.OpenXml` assembly has two versions with different Public Key Tokens. To provide support for both,           Telerik Reporting delivers the following `Telerik.Reporting.OpenXmlRendering` assemblies:         

* `Telerik.Reporting.OpenXmlRendering.dll`−Supports `DocumentFormat.OpenXml.dll` versions 2.0.5022.0 and 2.5.5631.0.             

* `Telerik.Reporting.OpenXmlRendering.2.7.2.dll`−Supports `DocumentFormat.OpenXml.dll` version 2.7.2.0 and later.             

> Always use the latest available version for generating compatible document types.             To use later versions than the versions previously listed, add a              [bindingRedirect](http://msdn.microsoft.com/en-us/library/eftw1fys(v=vs.110).aspx)              to the configuration file of the application for the `DocumentFormat.OpenXml.dll` assembly.           


To download the Open XML by using the NuGet feed, refer to the            [DocumentFormat.OpenXml NuGet package](https://www.nuget.org/packages/DocumentFormat.OpenXml/).         

To avoid using the NuGet feed and download the Open XML, download and install            [Open XML SDK 2.0 for Microsoft Office](http://www.microsoft.com/downloads/en/details.aspx?FamilyId=C6E744E5-36E9-45F5-8D8C-331DF206E0D0).

