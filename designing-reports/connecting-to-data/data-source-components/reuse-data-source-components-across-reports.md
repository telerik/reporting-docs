---
title: Reuse Data Source components across Reports
page_title: Reuse Data Source components across Reports | for Telerik Reporting Documentation
description: Reuse Data Source components across Reports
slug: telerikreporting/designing-reports/connecting-to-data/data-source-components/reuse-data-source-components-across-reports
tags: reuse,data,source,components,across,reports
published: True
position: 13
---

# Reuse Data Source components across Reports



The article elaborates how to reuse a [Data Source component]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/overview%}) across multiple reports.       

## Reuse data source components across reports in Visual Studio

You can create a custom component, inheriting a Telerik Reporting Data Source component, that is configured with the desired settings.

1. From the Project menu select __Add__  -> __New Item__ 

1. In the __Add New Item__  dialog box, choose a __Component Class__  and click __Add__ .                   The new file is added to the project and automatically opened in Visual Studio.

1. Change the base class from __Component__  to the appropriate Telerik Reporting Data Source component (Telerik.Reporting.SqlDataSource, Telerik.Reporting.ObjectDataSource, Telerik.Reporting.EntityDataSource, Telerik.Reporting.OpenAccessDataSource) as shown in the following code snippet:               

    
    ````cs
public partial class Component1 : Telerik.Reporting.SqlDataSource
````
````vb.net
Partial Class Component1
Inherits Telerik.Reporting.SqlDataSource
````

1. __Save__  and __rebuild__  the project.               

1. Right click the component class ->__View Designer__ 

1. Click __Configure data source__ 

1. Follow the wizard

1. __Save__  and __rebuild__ 

1. The Project Data Source is now listed under the __Project Data Sources__  node,                 if you run Project -> Add New Item -> Telerik Report [VERSION] Wizard.                 And the Prject Data Source is available in the Visual Studio Toolbox, if you open a report in the Visual Studio Report Designer.               

## Reuse data source components across reports in the Standalone Report Designer

The Standalone Report Designer can load data from external assemblies, which excludes custom data source components.           For more details, check [Extending Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/configuration/extending-report-designer%}).         

Instead, you can create __templates__  with initial settings like configured data source components and layout           elements - [Report Templates]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/report-templates%}).         

# See Also
[Use DataObject as a datasource for nested data items (data-binding via expressions)](50936e55-b122-4378-8abd-4031e7ae713d#DataObjectAsDataSource)

 * [How to Databind to Collection Properties (data-binding via expressions)](http://www.telerik.com/support/kb/reporting/details/how-to-databind-to-collection-properties)

