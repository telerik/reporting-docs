---
title: Set the File Path of JSON or CSV DataSource Through Report Parameter
description: This article explains how to set the file path of the CSV or JSON file of  JSON or CSV DataSource through a report parameter
type: how-to
page_title: Set the File Path of JSON or CSV DataSource Through Report Parameter
slug: set-the-file-path-of-json-or-csv-datasource-through-report-parameter
position: 
tags: JsonDataSource, CSV DataSource, Report Parameter
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
This article explains how to set the file path of the CSV or JSON file of  JSON or CSV DataSource through a report parameter and user function.

## Solution
The desired functionality can be achieved through UserFunction where the source of the CSV is set via report parameter. You can follow the steps below:
1) Create a new class library and add the method that returns Uri pointing to the file with the CSV- the sample is for the absolute path:

public static Uri setCsvSource(string path)
{
    string filePath = path;
    Uri pathFile = new Uri(filePath, UriKind.Absolute);
    return pathFile;
}
2) Build the project;

3) Register the generated dll as it is explained in the Extending Report Designer article. You will need to modify the Telerik.ReportDesigner.exe.config file and add the following XML:

	<Telerik.Reporting>
		<AssemblyReferences>
			<add name="MyUserFunction" />
		</AssemblyReferences>
	</Telerik.Reporting>
4) Set the source of the datasource of the table through the following Binding:
Property path: DataSource.Source
Expression: = MyUserFunction.Class1.setCsvSource(Parameters.csvSource.Value)

Parameters.csvSource.Value should hold the path to the CSV file.

5) If you display the report in the ASP.NET MVC application, you will need to register the DLL in the web.config file of the project too:

<Telerik.Reporting>
	<AssemblyReferences>
		<add name="MyUserFunction" />
	</AssemblyReferences>
</Telerik.Reporting>
Please, take a look at the attached sample and let me know if I can assist you any further.

## Notes
bla bla
