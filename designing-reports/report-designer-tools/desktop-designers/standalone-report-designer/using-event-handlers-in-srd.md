---
title: Event handlers in the Standalone Report Designer
page_title: Using event handlers in reports created with the Standalone Report Designer
description: "Learn how to use report event handlers in declarattive report definitions created with the Standalone Report Designer."
slug: telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/using-event-handlers-in-srd
tags: crating,using,event,handlers,standalone,report,designer
published: True
position: 8
---

# Using event handlers in the Standalone Report Designer

The Standalone Report Designer and Standalone Report Designer for .NET support attaching compiled code event handlers for the [`ItemDataBinding`](/api/telerik.reporting.reportitembase#Telerik_Reporting_ReportItemBase_ItemDataBinding), [`ItemDataBound`](/api/telerik.reporting.reportitembase#collapsible-Telerik_Reporting_ReportItemBase_ItemDataBound), and [`NeedDataSource`](/api/telerik.reporting.dataitem#Telerik_Reporting_DataItem_NeedDataSource) [report events]({%slug telerikreporting/using-reports-in-applications/program-the-report-definition/report-events/overview%}). This article describes how you can add handlers for these events to reports created with the Standalone Report Designer, as well as how you can use existing handlers from [__programmatic report definitions that have been imported into the Standalone Report Designer__]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/how-to-import-reports-created-with-the-vs-report-designer%}).

## Add event handlers to reports created with the Standalone Report Designer

Provided you have a report created with the Standalone Report Designer, the steps below will show you how to handle one of its events. For demonstration purposes, let's assume the report is named "CityReport" and you wish to handle its `NeedDataSource` event:

1.  Create a new empty class library and choose a target framework that is compatible with your [__version of the Standalone Report Designer__]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/overview%}#differences-between-the-net-and-net-framework-designers-functionality). The `.NET Standard 2.0` target framework should work in both versions of the designer.
1.  Add the `Telerik.Reporting` NuGet package to the project.
1.  Create a new class that inherits the [`Telerik.Reporting.Report`](/api/telerik.reporting.report) class and ensure its name matches the `(Name)` property of your report.
1.  Add a handler method for the `NeedDataSource` event.

    ```C#
    namespace ClassLibrary
    {
    	public class CityReport : Telerik.Reporting.Report
    	{
    		private void CityReport_NeedDataSource(object sender, System.EventArgs e)
    		{
    			var processingReport = (Telerik.Reporting.Processing.Report)sender;
    			processingReport.DataSource = new string[] { "Sofia", "London", "Tokyo" };
    		}
    	}
    }
    ```

1.  Build the project, copy the generated assembly from the bin folder to the installation directory of the Standalone Report Designer, and extend the configuration of the designer using the steps listed in the [__Extending Report Designer__]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/configuration/extending-report-designer%}) article.
1.  Open the "CityReport" report with the Standalone Report Designer and set its `NeedDataSource` property to the name of the method created in the previous steps - "CityReport_NeedDataSource".
1.  Preview the report.

## Use event handlers from imported programmatic report definitions in the Standalone Report Designer

Assuming you have a [__programmatic report definition__]({%slug telerikreporting/designing-reports/overview%}#programmatic-types) created with the Visual Studio Report Designer that handles one of the supported events, use the following approach to run the report in the Standalone Report Designer.

1. Copy the assembly containing the programmatic report definition to the installation directory of the Standalone Report Designer as well as any other assemblies it depends on and extend the configuration of the designer using the steps listed in the [__Extending Report Designer__]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/configuration/extending-report-designer%}) documentation article.
1. Import the programmatic report from its container assembly by following the instructions in the [__Importing Type Report Definitions__]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/how-to-import-reports-created-with-the-vs-report-designer%}) documentation article.
1. Preview the report and the code of the event handlers should be executed.

## See Also

- [Coded Reports in the Standalone Report Designer for .NET]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/srd-net-working-with-type-report-definitions%})
