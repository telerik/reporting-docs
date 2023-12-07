---
title: Overview
page_title: OpenClientDataSource Component at a Glance
description: "Learn more about the OpenClientDataSource Component in Telerik Reporting and how to use it in your reports."
slug: telerikreporting/designing-reports/connecting-to-data/data-source-components/openclientdatasource-component/overview
tags: overview
published: True
position: 0
previous_url: /OpenClientDataSource, /designing-reports/connecting-to-data/data-source-components/openclientdatasource-component/
---

# OpenClientDataSource Component Overview

OpenClient data source is a component dedicated to feeding report data items from OpenEdge AppServer ABL procedures. In order to communicate with the AppServer the data source component uses an Open Client .NET proxy class library that is generated using the OpenEdge .NET Proxy Generator tool:

* [Preparing to generate proxies for a .NET client using ProxyGen or Batch ProxyGen](https://docs.progress.com/bundle/openedge-dotnet-open-clients-117/page/Preparing-to-generate-proxies-for-a-.NET-client-using-ProxyGen-or-Batch-ProxyGen.html?labelkey=product_openedge_117)
* [Generating Proxies and Web Service Definitions](https://docs.progress.com/bundle/openedge-open-client-toolkit-introduction-117/page/Generating-Proxies-and-Web-Service-Definitions.html)

## Supported ABL Procedures

To be suitable for reporting purposes the ABL procedure has to have the following properties:

* The procedure should not be nested
* The data should be returned as an OUTPUT or INPUT-OUTPUT parameter of type DATASET or DATATABLE
* To have data schema while designing reports it is recommended to specify schema for the DATASET/DATATABLE

## Supported developer platforms

* .NET Framework 4.0 and above

## See Also

* [Telerik.Reporting.OpenClientDataSource](/reporting/api/Telerik.Reporting.OpenClientDataSource)
* [Preparing to generate proxies for a .NET client using ProxyGen or Batch ProxyGen](https://docs.progress.com/bundle/openedge-dotnet-open-clients-117/page/Preparing-to-generate-proxies-for-a-.NET-client-using-ProxyGen-or-Batch-ProxyGen.html?labelkey=product_openedge_117)
* [Generating Proxies and Web Service Definitions](https://docs.progress.com/bundle/openedge-open-client-toolkit-introduction-117/page/Generating-Proxies-and-Web-Service-Definitions.html)
