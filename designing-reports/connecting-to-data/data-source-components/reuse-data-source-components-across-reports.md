---
title: Reuse Data Sources
page_title: Reusing Data Sources across Telerik Reports
description: "Learn how you may Reuse Data Source components across Telerik Reports with these step-by-step instructions."
slug: telerikreporting/designing-reports/connecting-to-data/data-source-components/reuse-data-source-components-across-reports
tags: reuse,data,source,components,across,reports
published: True
position: 35
previous_url: /data-source-how-to-add-project-data-source
reportingArea: General
---

# Reuse Data Source Components Across Reports

The article elaborates how to reuse a [Data Source component]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/overview%}) across multiple reports.

## Reuse data source components across reports in Visual Studio

You can create a custom component, inheriting a Telerik Reporting Data Source component, that is configured with the desired settings.

1. From the Project menu select **Add** -> **New Item**.
1. In the **Add New Item** dialog box, choose a **Component Class** and click **Add**. The new file is added to the project and automatically opened in Visual Studio.
1. Change the base class from `Component` to the appropriate Telerik Reporting Data Source component (`Telerik.Reporting.SqlDataSource`, `Telerik.Reporting.ObjectDataSource`, `Telerik.Reporting.EntityDataSource`, `Telerik.Reporting.OpenAccessDataSource`) as shown in the following code snippet:

   ```C#
   public partial class Component1 : Telerik.Reporting.SqlDataSource
   ```
   ```VB
   Partial Class Component1
   Inherits Telerik.Reporting.SqlDataSource
   ```

1. **Save** and **Rebuild** the project.
1. Right click the component class ->**View Designer**.
1. Click **Configure data source**.
1. Follow the wizard.
1. **Save** and **rebuild**.
1. The Project Data Source is now listed under the **Project Data Sources** node, if you run Project -> Add New Item -> Telerik Report [VERSION] Wizard. And the Prject Data Source is available in the Visual Studio Toolbox, if you open a report in the Visual Studio Report Designer.

## Reuse data source components across reports in the Standalone Report Designer

The Standalone Report Designer can load data from external assemblies, which excludes custom data source components. For more details, check [Extending Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/configuration/extending-report-designer%}).

Instead, you can create **templates** with initial settings like configured data source components and layout elements - [Report Templates]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/report-templates%}).

## See Also

- [Expressions with ReportItem.DataObject]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/how-to-use-the-reportitem.dataobject-property-in-expressions%})
- [How to Databind to Collection Properties (data-binding via expressions)]({%slug how-to-databind-to-collection-properties%})
