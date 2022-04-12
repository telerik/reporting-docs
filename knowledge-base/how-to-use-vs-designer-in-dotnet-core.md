---
title: How to use Visual Studio Report Designer to edit CS Reports in .Net Core Projects
description: Learn how to use Visual Studio Report Designer to edit C Sharp Reports in .Net Core Projects.
type: how-to
page_title: Use VS Report Designer to edit CS Reports in .Net Core.
slug: how-to-use-vs-designer-in-dotnet-core
position: 
tags: 
ticketid: 
res_type: kb
---

## Environment
<table>
	<tbody>
		<tr>
			<td>Product Version</td>
			<td>13.0.19.116+</td>
		</tr>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
		</tr>
		<tr>
			<td>.Net Framework</td>
			<td>.NET Core 3.0+</td>
		</tr>
	</tbody>
</table>


## Description

Currently, the .NET Core frameworks do not support the design time components we need for the [Visual Studio Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/visual-studio-report-designer/overview%}). Without these components we cannot provide a quality design-time experience. 

This KB article describes a workaround for using the Visual Studio Report Designer to edit C Sharp reports hosted in a .NET Core/5/6 ClassLibrary project.

## Suggested Workaround

The CSharp code of a report definition is identical in .NET Framework and in .NET Core. For that reason, it is possible to link the report definition files hosted in a .NET Core ClassLibrary project to the corresponding files hosted in a .NET Framework ReportLibrary project. This way, all the changes made with the Visual Studio Report Designer to the report in the .NET Framework project will be automatically applied to the .NET Core project. 

Lets assume that we already have a ReportLibrary project in .NET Framework. Here are the necessary steps to link it to a .NET Core ClassLibrary project:

1. Create a new .NET Core 3.1/5/6 ClassLibrary project. You may delete the default CS file usually named _Class1.cs_. 

2. Add references to the following assemblies/NuGet packages in the project: 

    * __Telerik.Reporting__ - defines the needed report definition elements
    * __System.Resources.Extensions__ - needed to resolve the resources from the RESX file

3. Add the corresponding CS report file from the .NET Framework project to the .NET Core project through the _Add_ -> _Existing Item..._ option of the project context menu. 

	![alt text](https://www.telerik.com/docs/default-source/knowledgebasearticleattachments/reporting/addexistingitem.png?sfvrsn=a3ec3f95_2 "Add Existing Item") 

	When selecting the CS file make sure to select __Add As Link__ from the _Add Existing Item_ wizard. The corresponding DESIGNER.CS file will be added automatically. 

	![alt text](https://www.telerik.com/docs/default-source/knowledgebasearticleattachments/reporting/addaslink.png?sfvrsn=b5e4fd9f_2 "Add As Link") 

4. Add in the same way also the RESX file of the report definition. 

5. Reference the .NET Core ClassLibrary project in your .NET Core project hosting the Telerik Reporting engine. Pass the [AssemblyQualifiedName](https://docs.microsoft.com/en-us/dotnet/api/system.type.assemblyqualifiedname?view=netcore-3.1) of the report class to the Reporting engine. Use [TypeReportSourceResolver](/reporting/api/Telerik.Reporting.Services.TypeReportSourceResolver.html) for resolving your reports in a Telerik Reporting REST Service. 

A demo solution demonstrating the approach may be found in our GitHub repo - [VS Designer in .NET Core](https://github.com/telerik/reporting-samples/tree/master/VS%20designer%20Core)

## See Also

[Make Visual Studio designer work with .NET Core](https://feedback.telerik.com/reporting/1383925-make-visual-studio-designer-work-with-net-core-a-k-a-sdk-style-projects)
