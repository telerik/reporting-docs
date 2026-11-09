---
title: Overview
page_title: Report Designer Tools at a Glance
description: "Compare the Telerik Reporting Standalone, Visual Studio, and Web Report Designers to choose a tool for creating and editing report definitions."
slug: telerikreporting/designing-reports/report-designer-tools/overview
tags: overview
published: True
position: 0
previous_url: /report-designers, /designing-reports/report-designer-tools/, /uireportdesigner
reportingArea: General
components: [general]
---

# Overview

Use [Telerik Reporting designers](https://www.telerik.com/products/reporting/creating-reports.aspx) to create and edit report definitions. Telerik Reporting provides Standalone, Visual Studio, and Web Report Designers. All three environments include a WYSIWYG design surface, expression support, and wizards for creating graphs, maps, crosstabs, tables, band reports, and label reports. You can also define parameters, bookmarks, drill-through, and drilldown actions.

This overview explains the supported report definition types and the main differences between the designers.

## Standalone Report Designer

The [Standalone Report Designer](slug:telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/overview) is a desktop application that does not require Visual Studio. It is available for the .NET Framework and .NET:

* The .NET Framework executable is `Telerik.ReportDesigner.exe`. The .NET executable is `Telerik.ReportDesigner.Net.exe`.
* The product installer places the executables in the `Report Designer` folder. The .NET executable is in the `.NET` subfolder.
* Works with XML report definitions packaged in a ZIP archive (`.TRDP`) or stored in the plain legacy format (`.TRDX`):

	* You do not need to recompile a project when you modify the report definition.
	* You can open an older report definition with a newer version of the Standalone Report Designer, report viewer, or report service. The definition is upgraded when you edit and save it.
	* You can store and manage this format with [Telerik Report Server](https://docs.telerik.com/report-server/introduction) or other storage systems, such as a database.
	* TRDP is the recommended XML report definition format for the following reasons:
	
		* It stores report resources in the ZIP archive, which makes the definition more compact and faster to handle.
		* It supports report [localization](slug:telerikreporting/designing-reports/localizing-reports).

## Visual Studio Report Designer

The [Visual Studio Report Designer](slug:telerikreporting/designing-reports/report-designer-tools/desktop-designers/visual-studio-report-designer/overview) is a report authoring tool that runs in Visual Studio. It edits coded report definitions in C# and VB.NET files:

* It works with .NET type report definitions (`.cs` or `.vb` files).

	* You must build the project after you modify a report definition.
	* When you upgrade Telerik Reporting in a .NET Framework project, use the [Upgrade Wizard](slug:telerikreporting/designing-reports/report-designer-tools/desktop-designers/visual-studio-report-designer/upgrade-wizard).
	* Coded reports support report events. For more information, see [report events](slug:telerikreporting/using-reports-in-applications/program-the-report-definition/report-events/overview).

* The designer opens when you double-click a `.cs` or `.vb` report definition that inherits from `Telerik.Reporting.Report`. Install the corresponding Telerik Reporting version on the machine.
* Visual Studio assembly caching can prevent a reliable designer preview when you use [ObjectDataSource](slug:telerikreporting/designing-reports/connecting-to-data/data-source-components/objectdatasource-component/overview), [EntityDataSource](slug:telerikreporting/designing-reports/connecting-to-data/data-source-components/entitydatasource-component/overview), or [OpenAccessDataSource](slug:telerikreporting/designing-reports/connecting-to-data/data-source-components/openaccessdatasource-component/overview).

## Web Report Designer

The [Web Report Designer](slug:telerikreporting/designing-reports/report-designer-tools/web-report-designer/overview) is a widget that adds report editing to a web application. Its main capabilities include:

* Users can edit reports in your web application without additional desktop software.
* The Web Report Designer works with `.TRDP` and `.TRDX` report definitions.
* A built-in report previewer lets users preview reports in the application.

## See Also

* [Report file formats](slug:report-file-formats)
* [Standalone Report Designer overview](slug:telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/overview)
* [Visual Studio Report Designer overview](slug:telerikreporting/designing-reports/report-designer-tools/desktop-designers/visual-studio-report-designer/overview)
* [Web Report Designer overview](slug:telerikreporting/designing-reports/report-designer-tools/web-report-designer/overview)
