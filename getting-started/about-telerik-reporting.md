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

The first case is if you want to quickly connect to some data - either from a database or a remote web service, display it in a report, and share it with someone by exporting the content in PDF, for example. In this case, you can only install the product and use some of the basic functions provided by the Telerik Report Designers. 

However, it's more likely you'd need to use the full potential of Telerik Reporting - a highly functional tool with built-in wizards and templates that provides a great number of options for customizing your reports and presenting data in a beautiful, convenient, and easy-to-grasp way. Apart from designing your report in one of our designers, you can display it in virtually any .NET or web application and it will run on Windows, Linux or MacOS.

## Creating Reports with Report Designers  

The milestone during the report authoring is the designing of the report, which happens in the Report Designer. The Report Designer is a tool for creating and configuring reports. 

### Report Designers

Telerik Reporting supports the following report designers: 

* [Standalone Report Designer (Overview)]({% slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/overview %})
* [Web Report Designer (Overview)]({% slug telerikreporting/designing-reports/report-designer-tools/web-report-designer/overview %})
* [Integrated Report Designer for Visual Studio (Overview)]({% slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/visual-studio-report-designer/overview %}) 

All three Telerik Report Designers provide options for: 

* Defining the required report layout by dragging and dropping various report items from a toolbox onto designer surface. These items can vary from simple text blocks to complex widgets that visualize data relations like graph and map.
* Connecting the report to data by configuring different data source components. They can connect to relational, multi-dimensional, ORM, or custom data-layer-based data sources, web services or static data files like CSV or JSON
* Styling the report and its items by selecting colors from predefined palettes, apply styles on multiple items using CSS-like selectors or conditionally setting a particular style through a set of rules.

### Report Definition

To create a report, generate a report definition file by using the supported [Telerik Report Designers]({%slug telerikreporting/designing-reports/report-designer-tools/overview%}). The report definition is the model that contains the declarations of all the report items, data-binding components and rules, and styling options that build the report.

* If you design a report in the Report Designer for Visual Studio, the result is a class inheriting `Telerik.Reporting.Report`.

* If you design a report through the Standalone Report Designer, the result is a `TRDX` or `TRDP` file containing a `Telerik.Reporting.Report` object serialized in plain or compressed XML.             
           
* If you design a report in code, the result is an instance of `Telerik.Reporting.Report` which is created at runtime or is a result of modifying an already designed report.

When designing a report, you can either start from a scratch with an empty report, or use one of the report template wizards that are tailored to fit a particular scenario - band report, invoice, product catalog, etc. Report Designers add sections and items on your command, resulting in a template that can be further processed by the Reporting engine. Report Designers provide design-time preview in both  [Interactive and Print previews]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/interactive-vs.-print-layout%}), to verify the designed template and how it will look with data.  

### Connecting to Data 

During the design stage the report author should configure the rules on how the data will be provided to the report. The components that are handling this task are named `data source components`. They are designed for specific scenarios and their purpose is to fetch data from the remote data set and deliver it to the data item used in the report - `Table`, `Crosstab`, `Graph`, `Map` or the report itself.

* To connect to a database via ADO.NET, ODBC or OleDB data provider, use a `SqlDataSource` component.
* To get data using a MDX query from a OLAP cube model in a multi-dimensional data set, use a `CubeDataSource` component.
* To connect to a remote web service that returns data in JSON format, use a `WebServiceDataSource` component.
* To use a collection of business objects as a data source, use a `ObjectDataSource` component.
* To get data in CSV or JSON from a static external file, use a `CSVDataSource` or `JSONDataSource` component.

There is no limitation of the number of type of data sources used in a report. Usually one data source is connected to one report item, but it's a fairly common scenario to have a `Table` and `Graph` item using the same data source component in order to provide different representation of the underlying data.

The connection information used by the data sources can be controlled externally: via the application configuration file (app.config, web.config or appsettings.json), or programmatically, using the Telerik.Reporting API model.

### Report Designers Interchangeability

The report designers support convertion of report definition types to their own type. If you have used the Web Report Designer or the Standalone Report Designer to create a `TRDX` or `TRDP` file, it can be imported into Visual Studio Report Designer via a dedicated [Import Wizard]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/visual-studio-report-designer/how-to-import-reports-created-with-standalone-report-designer%}). The opposite process is also supported - you can convert an assembly containing `Telerik.Reporting.Report` classes into set of `TRDX` or `TRDP` files using the Standalone Report Designer's [Import Wizard]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/how-to-import-reports-created-with-the-vs-report-designer%}).

When authoring reports in Visual Studio, it is recommended that you create a separate `ClassLibrary` project or use the Report Library project template to hold your reports designed in Visual Studio. This approach will facilitate their maintenance and usage in different projects. The Visual Studio Project provides templates and wizard which will guide you in the process of creating reports and adding Report Viewers. These are available under the __Reporting__ category of the Visual Studio templates. If you choose to use the Visual Studio Report Designer and store your reports as .NET classes, the most efficient way to structure your reporting solution is to first create a class library that contains your reports. Then, you can reference that class library in applications that view the reports. You can have any number of Windows or Web viewing applications which are re-using the same class library. This solution structure decouples your program logic from the report and its data.

Since Standalone Report Designer and Visual Studio Report Designer share a lot of common code, their [wizards]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/report-wizards/band-report-wizard/overview%}) and dialogs look and behave the same way. The Web Report Designer, which is a JavaScript widget, preserves a lot of this behavior for consistency, but upgrades it further to achieve better UX and provide higher productivity to the report authors.

## Viewing Reports with Report Viewers

When the report definition is ready and the report looks the way you want, show it in a Telerik Report Viewer for your web, mobile or desktop application. Report Viewers are UI components which allow you to display a report document in the UI of the application and to interact with it. The Report Viewers cover various technologies such as Angular, React, Blazor, HTML5/JS, ASP.NET Core, WinUI, WPF, Windows Forms and some more.

Showing a report in a Telerik Report Viewer is fairly easy, especially when you use our Item Templates that will be set up in your Visual Studio by our installer. The Item Templates provide a Wizard-like interfaces that handles the configuration of the Report Viewer and adds the Nuget or binary assembly references, needed to run the Telerik Reporting engine. The Report Viewer usually needs only a Report Source that points to your report definition, and some configuration details that determine whether a remote (in web apps) or embedded (in desktop apps) reporting engine will be used to process and render the report.
 
