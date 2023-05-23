---
title: About Telerik Reporting
page_title: Basic Concepts and Logic
description: "Learn more about the concepts and logic behind Telerik Reporting. Get general knowledge on what is Telerik Report, how you may create reports, connect them to data and preview the results."
slug: on-telerik-reporting
tags: telerik, reporting, basic, concepts, explanations, logic
published: True
previous_url: /best-practices-solution-structure
position: 0
---

# Basic Concepts in Telerik Reporting

Telerik Reporting is an embedded tool for creating and displaying reports in a visually structured and logically grouped way.

Telerik reports can be created for web or desktop applications which operate within various web and desktop frameworks.

## Scenarios for Using Telerik Reporting

Generally, you can use Telerik Reporting for two main purposes.

The first case is if you want to quickly connect to some data, either from a database or a remote web service, display it in a report, and share it with someone by exporting the content in PDF, for example. In this case, you can only install the product and use some of the basic functions provided by the Telerik Report Designers.

However, it's more likely that you'll need the full potential of Telerik Reporting&mdash;a highly functional tool with built-in wizards and templates, which provides a great number of options for customizing your reports and for presenting data in a beautiful, convenient, and easy-to-grasp way. Apart from designing your report in one of the Report Designers, you can display it in virtually any .NET or web application, and it will run on Windows, Linux, or MacOS.

## Creating Reports with Report Designers

The milestone during the report authoring is the designing of the report, which happens in the Report Designer. The Report Designer is a tool for creating and configuring reports.

### Report Designers

Telerik Reporting supports the following report designers:

* [Standalone Report Designer (Overview)]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/overview%})
* [Web Report Designer (Overview)]({%slug telerikreporting/designing-reports/report-designer-tools/web-report-designer/overview%})
* [Integrated Report Designer for Visual Studio (Overview)]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/visual-studio-report-designer/overview%})

All three Telerik Report Designers provide options for:

* Defining the required report layout by dragging and dropping various report items from a toolbox onto the designer surface. These items can vary from simple text blocks to complex widgets that visualize data relations like graph and map.
* Connecting the report to data by configuring different data source components. These components can connect to relational, multi-dimensional, ORM, or custom data-layer-based data sources, web services or static data files like CSV or JSON.
* Styling the report and its items by selecting colors from predefined palettes. You can apply styles on multiple items by using CSS-like selectors or by conditionally setting a particular style through a set of rules.

### Report Definition

The report definition is the model that contains the declarations of all the report items, data-binding components and rules, and styling options that build the report.

To create a report, you need to generate a report definition file by using the supported [Telerik Report Designers]({%slug telerikreporting/designing-reports/report-designer-tools/overview%}).

* If you design a report in the Report Designer for Visual Studio, the result is a class inheriting `Telerik.Reporting.Report`. These are the so called __Type Report Definitions__. They may be referenced also as _CLR_ (Common Language Runtime), _CS_ (C Sharp) or _VB_ (Visual Basic) report definitions. These separate CLR types may be passed to the Reporting engine through the built-in [TypeReportSource](/api/telerik.reporting.typereportsource).
* If you design a report through the Standalone Report Designer, the result is a `TRDX` or `TRDP` file containing a `Telerik.Reporting.Report` object serialized in plain or compressed XML. These reports are referenced as __Declarative Report Definitions__. They may be passed to the Reporting engine with the built-in [UriReportSource](/api/Telerik.Reporting.UriReportSource).
* If you design a report in code, the result is an instance of `Telerik.Reporting.Report` which is created at runtime or is a result of modifying an already designed report. These report definition instances may be passed to the Reporting engine with the built-in [InstanceReportSource](/api/Telerik.Reporting.InstanceReportSource). They may be serialized or packaged to an equivallent declarative report definition (TRDX or TRDP file).

When designing a report, you can either start from scratch with an empty report, or use one of the report template wizards that are tailored to fit a particular scenario, for example, a band report, an invoice, a product catalog, and so on. Report Designers add sections and items on your command, resulting in a template that you can further process by the Reporting engine.

The Report Designers provide a design-time preview in both [Interactive and Print previews]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/interactive-vs.-print-layout%}) to verify the designed template and how it will look with data.

### Connecting to Data

During the design stage, the report author has to configure the rules on how the data will be provided to the report. The components that are handling this task are the so-called data source components.

The data source components are designed for specific scenarios and their purpose is to fetch data from the remote data set and deliver it to the [data item]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/overview%}) that is used in the report, for example, `Table`, `Crosstab`, `Graph`, `Map`, or the report itself.

* To connect to a database through the ADO.NET, ODBC, or OleDB data provider, use an `SqlDataSource` component.
* To get data by using an MDX query from an OLAP cube model in a multi-dimensional data set, use a `CubeDataSource` component.
* To connect to a remote web service that returns data in a JSON format, use a `WebServiceDataSource` component.
* To use a collection of business objects as a data source, use a `ObjectDataSource` component.
* To get data in CSV or JSON from a static external file, or to embed static data in the report definition, use a `CSVDataSource` or `JSONDataSource` component.

There is no limitation of the number or type of data sources that you will use in a report. Usually one data source is connected to one report item, but it's a fairly common scenario to have a `Table` and a `Graph` item which are using the same data source component to provide different representations of the underlying data.

You can control the connection information that is used by the data sources externally with the application configuration file (`app.config`, `web.config`, or `appsettings.json`) or programmatically by using the `Telerik.Reporting` API model.

### Report Designers Interchangeability

The Report Designers support the conversion of report definition types to their own type. For example:

* If you have used the Web Report Designer or the Standalone Report Designer to create a `TRDX` or `TRDP` file, you can import the file into the Visual Studio Report Designer by using a dedicated [Import Wizard]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/visual-studio-report-designer/how-to-import-reports-created-with-standalone-report-designer%}).
* The opposite process is also supported. You can convert an assembly containing `Telerik.Reporting.Report` classes into a set of `TRDX` or `TRDP` files by using the [Import Wizard]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/how-to-import-reports-created-with-the-vs-report-designer%}) of the Standalone Report Designer.

When authoring reports in Visual Studio, it is recommended that you create a separate `ClassLibrary` project or use the Report Library project template to hold your reports designed in Visual Studio. This approach will facilitate the maintenance and usage of the reports in different projects.

The Visual Studio Project provides templates and wizard which will guide you in the process of creating reports and adding Report Viewers. These tools are available under the __Reporting__ category of the Visual Studio templates.

If you choose to use the Visual Studio Report Designer and store your reports as .NET classes, the most efficient way to structure your reporting solution is to first create a class library that contains your reports. Then, you can reference this class library in applications that view the reports. You can have any number of Windows or Web viewing applications which are re-using the same class library. This solution structure decouples your program logic from the report and its data.

Since the Standalone Report Designer and the Visual Studio Report Designer share a lot of common code, their [wizards]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/report-wizards/band-report-wizard/overview%}) and dialogs look and behave the same way. The Web Report Designer, which is a JavaScript widget, preserves a lot of this behavior for consistency, but upgrades it further to achieve better UX and provide higher productivity to the report authors.

## Viewing Reports with Report Viewers

When the report definition is ready and the report looks the way you want, you can show it in a Telerik Report Viewer for your web, mobile, or desktop application.

Report Viewers are UI components which allow you to display a report document in the UI of the application and to interact with it. The Report Viewers cover various technologies such as Angular, React, Blazor, HTML5/JS, ASP.NET Core, WinUI, WPF, Windows Forms, and some more.

Showing a report in a Telerik Report Viewer is fairly easy, especially when you use the Telerik Reporting Item Templates that will be set up in your Visual Studio by the Telerik Reporting installer. The Item Templates provide a Wizard-like interface that handles the configuration of the Report Viewer and adds the NuGet or binary assembly references that are needed to run the Telerik Reporting engine.

The Report Viewer usually needs only a Report Source that points to your report definition, and some configuration details that determine whether a remote (in web applications) or an embedded (in desktop applications) reporting engine will be used to process and render the report.
