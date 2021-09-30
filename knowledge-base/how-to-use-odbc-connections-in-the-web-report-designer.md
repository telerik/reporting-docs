---
title: Using ODBC in the Web Report Designer
description: Explains how to use ODBC connection in the Web Report Designer depending on the framework
type: how-to
page_title: How to work with ODBC connections in the Web Report Designer in .NET Core and .NET Framework applications
slug: how-to-work-with-ODBC-connections-in-the-web-report-designer-in-new-core-and-new-framework-applications
position: 
tags: webreportdesigner,odbc
ticketid: 1478987
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
			<td>Report designer</td>
			<td>Web Report Designer</td>
		</tr>
	</tbody>
</table>


## Description
The ODBC connections are supported in the [Web Report Designer](./web-report-designer). For .NET Framework applications this comes out-of-the-box. In .NET Core 3.1+ they are supported as long as the System.Data.ODBC classes are supported.

## Solution for .NET Core applications
The **System.Data.ODBC** is not part of the framework, but is supported through .NET Platform Extensions.
Find more information in the [OdbcConnection Class](https://docs.microsoft.com/en-us/dotnet/api/system.data.odbc.odbcconnection?view=dotnet-plat-ext-3.1) article from Microsoft.

The web app that hosts the Web Report Designer needs to have a reference to **System.Data.ODBC** (usually through a Nuget package).
Also, since .NET Core apps do not have access to machine.config, they cannot read the already registered DbProviderFactories,
so the System.Data.ODBC provider needs to be registered manually in DbProviderFactories. 

We advise to do that somewhere in the application start, or (even better) in the static constructor of ReportDesignerController, so it would look like this:

```cs
[Route("api/reportdesigner")]
    public class ReportDesignerController : ReportDesignerControllerBase
    {
        static ReportDesignerController()
        {
            Telerik.Reporting.Processing.Data.DbProviderFactories.RegisterFactory("System.Data.Odbc", System.Data.Odbc.OdbcFactory.Instance);
        }
        public ReportDesignerController(IReportDesignerServiceConfiguration reportDesignerServiceConfiguration, IReportServiceConfiguration reportServiceConfiguration)
            : base(reportDesignerServiceConfiguration, reportServiceConfiguration)
        {
        }
    }
```    
    

The [How to register a DbProviderFactory in a .NET Core project](./how-to-register-db-provider-factory-in-net-core-project) KB article explains how to register a DbProviderFactory instance in .NET Core apps.

## Solution for .NET Framework applications
If you use the Web Report Designer in .NET Framework app, there should not be any problems with ODBC connections whatsoever,
because System.Data.ODBC is part of .NET Framework and the machine's DbProviderFactories already have the ODBC provider registered.

## See Also
- [Web Report Designer](./web-report-designer)
- [OdbcConnection Class](https://docs.microsoft.com/en-us/dotnet/api/system.data.odbc.odbcconnection?view=dotnet-plat-ext-3.1)
- [How to register a DbProviderFactory in a .NET Core project](./how-to-register-db-provider-factory-in-net-core-project)
