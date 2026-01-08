---
title: Set the File Path of JSON or CSV DataSource Through Report Parameter
description: This article explains how to set the file path of the CSV or JSON file of JSON or CSV DataSource through a report parameter
type: how-to
page_title: Set the File Path of JSON or CSV DataSource Through Report Parameter
slug: set-the-file-path-of-json-or-csv-datasource-through-report-parameter
position:
tags: JsonDataSource, CsvDataSource, Report Parameter
ticketid: 1506700
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

This article explains how to set the file path of the CSV or JSON file of [JsonDataSource]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/jsondatasource-component%}) or [CsvDataSource]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/csvdatasource-component/overview%}) through a [Report Parameter]({%slug telerikreporting/designing-reports/connecting-to-data/report-parameters/overview%}).

## Solution

You can use the [Utility function]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/functions/utility-functions%}) **Uri** to set the CSV/JSON file through a report parameter. For example:

1. Create a Report Parameter called **uriParameter** - [Approaches for Adding Report Parameters]({%slug telerikreporting/designing-reports/connecting-to-data/report-parameters/how-to-add-report-parameters%})
1. Set the [Binding property]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/using-expressions/bindings%}) of the [data item]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/overview%}) that will use the data source component:

**Property path**: `DataSource.Source`

**Expression**: `= Uri(Parameters.uriParameter.Value, "relative")`

## Workaround for older versions

If the **Uri** function is not available in the report designer, the desired functionality can be also achieved through a custom [User function]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/extending-expressions/user-functions%}) that returns the [Uri](https://learn.microsoft.com/en-us/dotnet/api/system.uri) of the CSV or JSON file based on the passed report parameter.
You can follow the steps below:

1. [Create a new Class Library](https://learn.microsoft.com/en-us/dotnet/core/tutorials/library-with-visual-studio) and add the **static** method below. In this case, the sample is for an _absolute_ path:

   ```C#
   public static Uri setCsvSource(string path)
   {
   	return new Uri(path, UriKind.Absolute);
   }
   ```

1. Build the project so that an assembly(`.dll`) is generated
1. Register the generated `.dll` as it is explained in the [Extending Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/configuration/extending-report-designer%}) article. You will need to open the **Telerik.ReportDesigner.exe.config** file and add the following XML:

   ```XML
   <Telerik.Reporting>
   	<AssemblyReferences>
   		<add name="MyUserFunction" />
   	</AssemblyReferences>
   </Telerik.Reporting>
   ```

1. Set the following [Binding]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/using-expressions/bindings%}) to the data item that uses the data source component:

   **Property path**: `DataSource.Source`

   **Expression**: = `MyUserFunction.Class1.setCsvSource(Parameters.csvSource.Value)`

   > **Parameters.csvSource.Value** should hold the path to the CSV file.

1. If you display the report in a .NET Framework application, you will need to register the DLL in the `web.config`/`app.config` file of the project too:

   ```XML
   <Telerik.Reporting>
   	<AssemblyReferences>
   		<add name="MyUserFunction" />
   	</AssemblyReferences>
   </Telerik.Reporting>
   ```

## Demo

You can find a sample report with the **Uri** function, a project with for the User Function, and a report that uses it in our [GitHib repository](https://github.com/telerik/reporting-samples/tree/master/Set%20URI%20of%20CSV%20or%20JSON%20DataSource%20dynamically).
