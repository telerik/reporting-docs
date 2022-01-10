---
title: Quickstart Overview
page_title: Overview | for Telerik Reporting Documentation
description: Overview
slug: telerikreporting/quickstart/overview
tags: overview
published: True
position: 0
---

# Quickstart Overview



This article discusses basic steps for creating a report and showing it in a viewer.

## Creating Reports

To create a report, create a report definition file by using the existing [Report Designers]({%slug telerikreporting/designing-reports/report-designer-tools/overview%}).           The report definition can include a variety of report items and datasource components. For more information check the [Designing Reports]({%slug telerikreporting/designing-reports/overview%}) articles.         

We provide two [Overview]({%slug telerikreporting/designing-reports/report-designer-tools/overview%}) options for report authoring.           To select the most appropriate option for your project see: [Overview]({%slug telerikreporting/designing-reports/report-designer-tools/overview%}) article.         

Once the report definition is ready and the report looks the way you want,           show it in a report viewer for Web (Mobile) or Desktop environment. For more information on the available           options to expose your reports see: [Using Telerik Reporting in Applications]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/overview%}).         

To get started with Telerik Reporting continue with the topics in this section.         

## General Information

When designing a report, always start from an empty Telerik.Reporting.Report object.           Report Designers add sections and items on your command, resulting in a template that can be further processed by the Reporting engine.           Report Designers provide design-time preview in both            [Interactive and Print previews]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/interactive-vs.-print-layout%}),           to verify the designed template and how it will look with data.         

Report Designers to create reports:

* In Visual Studio - the result is a class inheriting Telerik.Reporting.Report;

* Without Visual Studio, through the Standalone Report Designer -               the result is a TRDX|TRDP file containing a Telerik.Reporting.Report object serialized in plain|compressed XML;             

In case reports are not modified manually, the Visual Studio Report Designers will be able to [import reports]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/visual-studio-report-designer/how-to-import-reports-created-with-standalone-report-designer%})           created in the Standalone Report Designer, and [vice versa]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/how-to-import-reports-created-with-the-vs-report-designer%}).         

Our recommendation is to create a separate ClassLibrary project (or just use the Report Library project template)            to hold your reports designed in Visual Studio,           which will ease their maintenance and usage in different projects.           The available Visual Studio Project templates and wizard will guide you in the process of creating reports and adding Report Viewers.           You can search for them in the __Reporting__  category of VS templates.           [Report Wizards]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/report-wizards/band-report-wizard/overview%})            and dialogs are shared between Report Designers.

