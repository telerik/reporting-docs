---
title: Using the ObjectDataSource Component in Visual Studio Report Designer
description: Learn how to configure the ObjectDataSource Component in VS Report Designer.
type: how-to
page_title: How to Configure the ObjectDataSource Component in VS Report Designer
slug: using-objectdatasource-in-vs-designer
tags: reporting, object, data, source, objectdatasource, designer, vs, visual, studio, net, framework
res_type: kb
---

## Environment

| Version | Product | Author | 
| ---- | ---- | ---- |
| | Visual Studio Report Designer |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description

This tutorial shows how to configure and use the [ObjectDataSource]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/objectdatasource-component/overview%}) component in the [Visual Studio Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/visual-studio-report-designer/overview%}) while creating a Report.

## Solution

1. Let's start with creating a Class library (**.NET Framework**) project (e.g. CarsLibraryDemo) that will be used as a data collection for feeding the [ObjectDataSource]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/objectdatasource-component/connecting-the-objectdatasource-component-to-a-data-source%}). Build the project to produce a dll in the bin folder.
1. Create another Class library (**.NET Framework**) project and add a **Report** class using the [Item Templates]({%slug reporting-integration-with-visual-studio%}) in Visual Studio. Add a reference to the Class Library project or to the dll that contains the data source definition.
1. Extend the Visual Studio Report Designer by adding an AssemblyReferences in Telerik.Reporting section of the application configuration file. The **'devenv.exe.config'** file resides in *'C:\Program Files (x86)\Microsoft Visual Studio X.0\Common7\IDE'* by default (it is recommended to create a backup copy before modifying it). 

	````XML
<?xml version="1.0"?>
	<configuration>
		<configSections>
			<section name="Telerik.Reporting" type="Telerik.Reporting.Configuration.ReportingConfigurationSection, Telerik.Reporting" allowLocation="true" allowDefinition="Everywhere" />
		</configSections>
	...
		<Telerik.Reporting>
			<assemblyReferences>
				<add name="yourAssemblyName"/>
			</assemblyReferences>
		</Telerik.Reporting>
	...
	</configuration>
````

>important Do not forget to close the Visual Studio instance before modifying its configuration file. Run `Notepad` (or other editing tool) as an administrator to perform the changes.

![ObjectDataSource from an External assembly](images/objectdatasource-populated-from-external-assembly-in-vs-designer.gif)

## See Also

- [Visual Studio Templates]({%slug reporting-integration-with-visual-studio%})
- [Connecting the ObjectDataSource component to a Data Source]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/objectdatasource-component/connecting-the-objectdatasource-component-to-a-data-source%})
- [Binding ObjectDataSource Component to a BusinessObject]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/objectdatasource-component/how-to/how-to-bind-to-a-businessobject%})
