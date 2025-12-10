---
title: Configuring
page_title: Configuring the OpenClientDataSource Component at a Glance
description: "Learn how to Configure the Telerik Reporting OpenClientDataSource Component to connect to data from OpenEdge AppServer ABL procedures."
slug: telerikreporting/designing-reports/connecting-to-data/data-source-components/openclientdatasource-component/how-to-configure-the-openclientdatasource-component
tags: how,to,configure,the,openclientdatasource,component
published: True
position: 1
previous_url: /openclient-data-source-how-to-configure
reportingArea: General
---

# Configuring the OpenClientDataSource Component

You can connect to data from OpenEdge AppServer ABL procedures using the Telerik `OpenClientDataSource` component. To do this, you need the following prerequisites and configuration settings.

## Prerequisites

+ Running instance of OpenEdge AppServer with deployed [supported ABL procedure]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/openclientdatasource-component/overview%}).
+ Generated .NET 4.0 proxy assembly for the target procedure along with its dependencies:

	* [Preparing to generate proxies for a .NET client using ProxyGen or Batch ProxyGen](https://docs.progress.com/bundle/openedge-dotnet-open-clients-117/page/Preparing-to-generate-proxies-for-a-.NET-client-using-ProxyGen-or-Batch-ProxyGen.html?labelkey=product_openedge_117)
	* [Generating Proxies and Web Service Definitions](https://docs.progress.com/bundle/openedge-open-client-toolkit-introduction-117/page/Generating-Proxies-and-Web-Service-Definitions.html)

## Configuring the OpenClientDataSource Component

1. Add OpenClientDataSource component

	+ For VisualStudio use the OpenClientDataSource Toolbox item
	+ For Stand-alone Report Designer use the OpenEdge OpenClient Data Source tool located in the Data tab of the Ribbon bar

1. A wizard form is started guiding you through the process which helps you to setup all needed settings

	+ Proxy.NET assembly file along with its dependencies
	+ The AppObject proxy type name used to communicate with the AppServer
	+ The name of the method in the selected type which corresponds to the ABL procedure
	+ (Optional) The name of the Table which data should be retrieved. Applicable only if the data is returned as DATASET
	+ Input parameters that the procedure expects along with values and design-time parameter values
	+ AppServer connection settings

		1. Connection URL
		1. Username (when applicable)
		1. Password (when applicable)
		1. AppServer info (optional)
		1. Session model (managed/free)
