---
title: Missing assembly reference when using JsonDataSource component
description: Report shows error saying that Telerik.Reporting.WebServiceDataSource assembly is missing
type: troubleshooting
page_title: Missing Reference to Telerik.Reporting.WebServiceDataSource on Previewing Report
slug: missing-assembly-reference-when-using-jsondatasource
position: 
tags: 
ticketid: 1460044
res_type: kb
---

## Environment
<table>
	<tbody>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
		</tr>
	</tbody>
</table>


## Description

Error on previewing the report that ulitizes JsonDataSource component.

## Error Message

The data provider of type 'Telerik.Reporting.Processing.WebServiceDataSource.JsonDataProvider, Telerik.Reporting.WebServiceDataSource,
Version=14.0.20.219, Culture=neutral, PublicKeyToken=a9d7983dfcc261be' defined for data sources of type 
'Telerik.Reporting.JsonDataSource' cannot be resolved. Are you missing an assembly reference?

## Cause\Possible Cause(s)

The usage of the JsonDataSource component which depends on some of the WebServiceDataSource functionalities. 

## Solution

In order to preview reports that utilize JsonDataSource component, it is required to reference the Telerik.Reporting.WebServiceDataSource 
DLL or the corresponding NuGet package in the application.

The assembly is supposed to be referenced in the project where the Reporting engine runs. If you use the HTML5 Report Viewer or any of 
its wrappers, this is the Telerik Reporting REST Service project. If you export the report programmatically you should reference the assembly 
in the project that utilizes the ReportProcessor.

## See Also

[JsonDataSource Component](../jsondatasource-component)
