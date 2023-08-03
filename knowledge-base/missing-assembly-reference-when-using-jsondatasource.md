---
title: Missing assembly reference when using JsonDataSource component
description: "Learn why the Report shows error saying that Telerik.Reporting.WebServiceDataSource assembly is missing and how to fix it."
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

`The data provider of type 'Telerik.Reporting.Processing.WebServiceDataSource.JsonDataProvider, Telerik.Reporting.WebServiceDataSource, Version={{site.buildversion}}, Culture=neutral, PublicKeyToken=a9d7983dfcc261be' defined for data sources of type 'Telerik.Reporting.JsonDataSource' cannot be resolved. Are you missing an assembly reference?`

## Cause\Possible Cause(s)

The [JsonDataSource Component]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/jsondatasource-component%}) depends on the WebServiceDataSource functionalities. The latter are hosted in a separate assembly due to WebServiceDataSource dependecy on the `System.Net.Http`.

## Solution

In order to preview reports that utilize JsonDataSource component, it is required to reference the `Telerik.Reporting.WebServiceDataSource` DLL or the corresponding NuGet package in the application. The assembly is supposed to be referenced in the project where the Reporting engine runs.

* For HTML5 Report Viewer or any of its wrappers, this is the [Telerik Reporting REST Service]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/overview%}) project.
* When [exporting the report programmatically]({%slug telerikreporting/using-reports-in-applications/call-the-report-engine-via-apis/embedded-report-engine%}) you should reference the assembly in the project that utilizes the [ReportProcessor](/api/Telerik.Reporting.Processing.ReportProcessor).
* In Visual Studio Report Designer the needed assemblies are resolved in the context of the Visual Studio application. Generally, it looks for them in the [Global Assembly Cache (GAC)](https://learn.microsoft.com/en-us/dotnet/framework/app-domains/gac) and then in the folders specified in the configuration file of the Visual Studio application, which is `devenv.exe.config` - see [Troubleshooting Visual Studio Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/visual-studio-report-designer/visual-studio-problems%}).

	We don't deploy the assembly `Telerik.Reporting.WebServiceDataSource.dll` in the GAC due to its dependency on `System.Net.Http` which is not deployed there by default. Hence, even if our assembly gets successfully resolved, the error may persist due to the external assembly. The workaround is to copy the file `Telerik.Reporting.WebServiceDataSource.dll` in the Visual Studio folder, for example, `C:\Program Files\Microsoft Visual Studio\2022\Professional\Common7\IDE`. If this doesn't help, you should copy also the `System.Net.Http.dll` there.

## See Also

* [JsonDataSource Component]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/jsondatasource-component%})
