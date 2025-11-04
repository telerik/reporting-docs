---
title: Overview
page_title: Report Designer Tools at a Glance
description: "Learn what Report Designer Tools are available in Telerik Reporting and how you may use them to create different report definitions."
slug: telerikreporting/designing-reports/report-designer-tools/overview
tags: overview
published: True
position: 0
previous_url: /report-designers, /designing-reports/report-designer-tools/, /uireportdesigner
---

# Report Designer Tools Overview

Use [Report Designers](https://www.telerik.com/products/reporting/creating-reports.aspx) to create Telerik Reporting report definitions. We provide three different report designers. All report authoring environments include features such as WYSIWYG report design surface, enhanced support for expressions, and wizards for creating graphs, maps, crosstabs, tables, band, and label reports. Define interactive features such as parameters, bookmarks, drill-through, and drilldown actions.

This document gives a brief overview of the available Report Designers.

## Standalone Report Designer

[Standalone Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/overview%}) is a standalone desktop application that features an easy-to-use environment. It is available for the .NET Framework and .NET 10:

* The executable file starting the application is `Telerik.ReportDesigner.exe` for the .NET Framework and `Telerik.ReportDesigner.Net.exe` for .NET 10. By default, it will be deployed upon product installation in the '(*Telerik Reporting installation folder*)\Report Designer' folder. For example, 'C:\Program Files (x86)\Progress\Telerik Reporting {{site.suiteversion}}\Report Designer'. The .NET 10 version is in the '\.NET' subfolder.
* Does not require Visual Studio;
* Works with XML report definitions packaged in a zip archive `.TRDP` or in the plain legacy format `.TRDX`:

	+ No need to recompile your projects when modifying the report definition;
	+ No need to upgrade - you can directly open older report definition with a newer version of the [Standalone Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/overview%}), report viewer or report service; The report definition will be automatically upgraded when edited and saved with the [Standalone Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/overview%});
	+ This format can be stored and managed with the [Report Server](https://docs.telerik.com/report-server/introduction) and other kinds of storage such as a database;
	+ The recommended XML report definition format is TRDP due to the following reasons:
	
		- The report resources are stored in the zip so the report definition is faster to handle and more compact.
		- Supports report [Localization]({%slug telerikreporting/designing-reports/localizing-reports%}).

## Visual Studio Report Designer

[Visual Studio Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/visual-studio-report-designer/overview%}) is a report authoring tool that runs in Visual Studio:

* Works with .NET type report definitions (.CS or .VB files):

	+ More difficult to maintain - the project should be built every time a report definition is modified and you should go through the [Upgrade Wizard]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/visual-studio-report-designer/upgrade-wizard%}) when upgrading your Telerik Reporting installation;
	+ Support for report events, still Telerik Reporting provides other declarative means to handle most of the complex tasks. For more information see [Report Events]({%slug telerikreporting/using-reports-in-applications/program-the-report-definition/report-events/overview%});

* The Visual Studio Report Designer opens automatically upon double-click of a.CS/.VB report definition inheriting from Telerik.Reporting.Report. You need the corresponding version of Telerik Reporting installed on the machine.
* Due to Visual Studio assembly caching mechanism, the designer preview is not guaranteed, when using [ObjectDataSource Component]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/objectdatasource-component/overview%}), [EntityDataSource Component]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/entitydatasource-component/overview%}) or [OpenAccessDataSource Component]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/openaccessdatasource-component/overview%}).

## Web Report Designer

The [Web Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/web-report-designer/overview%}) is a widget that allows developers to bring the report editing functionality directly to their web applications. Some of its advantages are:

* Users can edit reports directly in your web application - there is no need to use additional software to edit a report
* The Web Report Designer works with TRDP and TRDX report definitions
* There is a built-in report previewer
