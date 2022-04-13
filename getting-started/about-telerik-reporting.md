---
title: About Telerik Reporting
page_title: About Telerik Reporting
description: "Learn more about the concepts and logic behind Telerik Reporting."
slug: on-telerik-reporting
tags: telerik, reporting, basic, concepts, explanations, logic
published: True
position: 0
---

# About Telerik Reporting 

Telerik Reporting is an embedded tool for creating and displaying reports in a visually structured and logically grouped way. Telerik reports can be created for web or desktop applications which operate within various web and desktop frameworks.

## Scenarios for Using Telerik Reporting

Generally, you can use Telerik Reporting for two main purposes. 

The first case is if you want to quickly import some data, display it in a report, and share it with someone by exporting the content in PDF, for example. In this case, you can only install the product and use some of the basic functions provided by the Telerik Report Designers. 

However, Telerik Reporting is a highly functional tool with built-in wizards, and provides a great number of options for customizing your reports and presenting data in a beautiful, convenient, and easy-to-grasp way. Apart from quickly importing the data for presentation, you can also use the Telerik Reporting item templates that are incorporated in Visual Studio.

## Creating Reports with Report Designers  

The milestone during the report authoring is the designing of the report, which happens in the Report Designer. The Report Designer is a tool for creating and configuring reports. 

### Report Designers

Telerik Reporting supports the following report designers: 

* [Standalone Report Designer (Overview)]({% slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/overview %})
* [Web Report Designer (Overview)]({% slug telerikreporting/designing-reports/report-designer-tools/web-report-designer/overview %})
* [Integrated Report Designer for Visual Studio (Overview)]({% slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/visual-studio-report-designer/overview %}) 

All three Telerik Report Designers provide options for: 

* Defining the required report structure as a table with a title and a page header and footer
* Connecting the report to data by retrieving and processing information from relational, multi-dimensional, ORM, or custom data-layer-based data sources; for adding custom controls to visualize the data such as a pie chart
* Styling the report and its items by selecting colors from the incorporated color palette and other styling options.   

### Report Definition

To create a report, generate a report definition file by using the supported [Telerik Report Designers]({%slug telerikreporting/designing-reports/report-designer-tools/overview%}). Report definitions contain a structure and configuration for creating a project and can include a variety of report items and data source components. 

When designing a report, always start from an empty `Telerik.Reporting.Report` object. Report Designers add sections and items on your command, resulting in a template that can be further processed by the Reporting engine. Report Designers provide design-time preview in both  [Interactive and Print previews]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/interactive-vs.-print-layout%}), to verify the designed template and how it will look with data.  

### Connecting to Data 

Telerik Reporting can incorporate a new REST service end point or integrate a hosted report server. When creating a data source, Telerik Reporting provides the option for creating a shared connection or embedding its configuration in the report definition. Create a shared connection so that you can use it elsewhere. Then, configure the select statement that will pull data from the data base and bind the result set to the crosstab. 

The crosstab is a container for data that is bound from an underlying data source. It is a powerful control in reports because it provides a range of functions like aggregates, summing, and so on. Telerik Reporting will pull out the data from the underlying data source, and bind that data to the crosstab in the report definition. You need to specify the connection string in the `web.config` file. Telerik Reporting allows you to target multiple platforms but you need to ensure that you do the right thing in terms of setting configuration values.   

### Report Source

You need to specify how the report is created to let the Reporting engine know how to process it. For the purpose, you need to use a [Report Source object]({%slug telerikreporting/designing-reports/report-sources/overview%}). Report sources can be server-side or client-side, which is determined by the processing instance, either a Telerik Reporting Viewer or a `ReportProcessor` instance.

Reports are always processed and rendered on the server machine.

* If you design a report in the Report Designer for Visual Studio, the result is a class inheriting `Telerik.Reporting.Report`.

* If you design a report through the Standalone Report Designer, the result is a `TRDX` or `TRDP` file containing a `Telerik.Reporting.Report` object serialized in plain or compressed XML.             
           
* If you design a report in code, the result is an instance of `Telerik.Reporting.Report` which is created at runtime or is a result of modifying an already designed report.            

* If you design a report in a text or XML editor, the result is a `Telerik.Reporting.Report` object represented in XML, the same as the content of a `TRDX` file produced by the Standalone Report Designer.  

### Reports in Visual Studio

If reports are not modified manually, the Visual Studio Report Designer will be able to [import reports]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/visual-studio-report-designer/how-to-import-reports-created-with-standalone-report-designer%}) that were created in the Standalone Report Designer, and [vice versa]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/how-to-import-reports-created-with-the-vs-report-designer%}).

When authoring reports in Visual Studio, it is recommended that you create a separate `ClassLibrary` project or use the Report Library project template to hold your reports designed in Visual Studio. This approach will facilitate their maintenance and usage in different projects. The Visual Studio Project provides templates and wizard which will guide you in the process of creating reports and adding Report Viewers. These are available under the __Reporting__ category of the Visual Studio templates. 

### Report Wizards

[Report Wizards]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/report-wizards/band-report-wizard/overview%}) and dialogs are shared between the Report Designers.           

## Viewing Reports with Report Viewers

When the report definition is ready and the report looks the way you want, show it in a Telerik Report Viewer for your Web (Mobile) or Desktop environment. Report Viewers are UI components which allow you to display a report document in the UI of the application and to interact with it. The Report Viewers cover various technologies such as Angular, HTML5/JS, WPF, ASP.NET, Windows Forms, and more.

After you have a properly configured Report Source, you can use it for a Telerik Report Viewer or to [process a report programmatically]({%slug telerikreporting/using-reports-in-applications/call-the-report-engine-via-apis/embedded-report-engine%}). To display a report in a Report Viewer, use any of the available Report Viewers depending on the technology you use.  

If you choose to use the Visual Studio Report Designer and store your reports as .NET classes, the most efficient way to structure your reporting solution is to first create a class library that contains your reports. Then, you can reference that class library in applications that view the reports. You can have any number of Windows or Web viewing applications which are re-using the same class library. This solution structure decouples your program logic from the report and its data.         
  
