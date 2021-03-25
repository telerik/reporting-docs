---
title: Set the File Path of JSON or CSV DataSource Through Report Parameter
description: This article explains how to set the file path of the CSV or JSON file of  JSON or CSV DataSource through a report parameter
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
This article explains how to set the file path of the CSV or JSON file of [JSON DataSource](../jsondatasource-component) or [CSV DataSource](../csvdatasource-component) through a [Report Parameter](../designing-reports-parameters).


## Solution
You can use the [Utility function](../expressions-utility-functions) **GetUri**/**Uri** to set the CSV/JSON file through a report parameter. 
1) Add a report parameter called **uriParameter**;
2) Set the [Binding property](../expressions-bindings) of the data item(report, table, list, crosstab) that will use the datasource. In this example, we will set it to the table:

**Property path**: DataSource.Source

**Expression**: = GetUri(Parameters.uriParameter.Value, "relative")


## Workaround for older versions
If the GetUri/ Uri function is not available in the report designer, the desired functionality can be also achieved through and [User function](../expressions-user-functions) that returns the Uri of the CSV or JSON file based on the passed report parameter. You can follow the steps below:
1) Create a new Class Library and add the method below. In this case, the sample is for the absolute path:

```CSharp
public static Uri setCsvSource(string path)
{
    string filePath = path;
    Uri pathFile = new Uri(filePath, UriKind.Absolute);
    return pathFile;
}
```

2) Build the project;

3) Register the generated dll as it is explained in the [Extending Report Designer](../standalone-report-designer-extending-configuration) article. You will need to open the **Telerik.ReportDesigner.exe.config** file and add the following XML:

```XML
	<Telerik.Reporting>
		<AssemblyReferences>
			<add name="MyUserFunction" />
		</AssemblyReferences>
	</Telerik.Reporting>
```

4) Set the following [Binding](../expressions-bindings) to the data item that uses the datasource:
**Property path**: DataSource.Source

**Expression**: = MyUserFunction.Class1.setCsvSource(Parameters.csvSource.Value)

**Parameters.csvSource.Value** should hold the path to the CSV file.

5) If you display the report in the ASP.NET Framework application, you will need to register the DLL in the web.config file of the project too:

```XML
<Telerik.Reporting>
	<AssemblyReferences>
		<add name="MyUserFunction" />
	</AssemblyReferences>
</Telerik.Reporting>
```

If the project is .NET Core, you will need to add the following piece of code in the appsettings.json file:
```JSON
 "telerikReporting": {
   "assemblyReferences": [
     {
       "name": "MyUserFunction"
     }
   ]
 }
```

## Demo
You can find a sample report with the Uri/GetUri function and a project with for the User Function and a report that uses it in our [GitHib repository](https://github.com/telerik/reporting-samples/tree/master/Set%20URI%20of%20CSV%20or%20JSON%20DataSource%20dynamically).
