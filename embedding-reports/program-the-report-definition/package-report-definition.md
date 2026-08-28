---
title: Package Report Definition
page_title: Packaging Report Definitions Explained
description: "Learn how to package and unpackage the Telerik Reporting report definitions, using the ReportPackager class."
slug: telerikreporting/using-reports-in-applications/program-the-report-definition/package-report-definition
tags: package, report, definition, reportpackager, TRDX, TRDP, TRDJ, CLR
published: True
position: 6
previous_url: /report-packaging-trdp
reportingArea: General
components: [general]
---

# Packaging and Unpackaging Report Definitions

The [ReportPackager](/api/Telerik.Reporting.ReportPackager) serializes the report definition in XML or JSON and, with zip compression, packages the definition and its resources. The resources are in their native format and archived for better performance. This way, the definition is faster to handle and more compact. This is the default report document format for the [Standalone Report Designer](slug:telerikreporting/designing-reports/report-designer-tools/overview#standalone-report-designer) and the [Web Report Designer](slug:telerikreporting/designing-reports/report-designer-tools/overview#web-report-designer).

> TRDJ report definitions were introduced with [2026 Q3 (20.2.26.812)](https://www.telerik.com/support/whats-new/reporting/release-history/progress-telerik-reporting-2026-q3-(20-2-26-812)) Telerik Reporting Release.

## Packaging .TRDX report definition

The following sample code snippet demonstrates how to package a predefined .TRDX (XML) report definition:

{{source=CodeSnippets\CS\API\Telerik\Reporting\ReportPackagerSnippets.cs region=CreatePackageFromXmlReportSnippet}}
{{source=CodeSnippets\VB\API\Telerik\Reporting\ReportPackagerSnippets.vb region=CreatePackageFromXmlReportSnippet}}

## Packaging .TRDJ report definition

The following sample code snippet demonstrates how to package a predefined .TRDJ (JSON) report definition:

{{source=CodeSnippets\CS\API\Telerik\Reporting\ReportPackagerSnippets.cs region=CreatePackageFromJsonReportSnippet}}
{{source=CodeSnippets\VB\API\Telerik\Reporting\ReportPackagerSnippets.vb region=CreatePackageFromJsonReportSnippet}}

>note Packaging and unpackaging JSON report definitions requires the 'Telerik.Reporting.JsonSerialization' assembly, which is not part of the 'Telerik.Reporting' assembly. To do this, install the 'Telerik.Reporting.JsonSerialization' NuGet package (or add a reference to 'Telerik.Reporting.JsonSerialization.dll') and make sure it is deployed next to 'Telerik.Reporting.dll'.

## Packaging CLR report definition

The following sample code snippet demonstrates how to package a predefined CLR (C# or VB) report definition:

{{source=CodeSnippets\CS\API\Telerik\Reporting\ReportPackagerSnippets.cs region=CreatePackageFromClrReportSnippet}}
{{source=CodeSnippets\VB\API\Telerik\Reporting\ReportPackagerSnippets.vb region=CreatePackageFromClrReportSnippet}}

## Unpackaging

The following sample code snippet demonstrates how to unpackage a predefined .TRDP report definition:

{{source=CodeSnippets\CS\API\Telerik\Reporting\ReportPackagerSnippets.cs region=UnpackageTrdpSnippet}}
{{source=CodeSnippets\VB\API\Telerik\Reporting\ReportPackagerSnippets.vb region=UnpackageTrdpSnippet}}

## See Also

* [Overview](slug:telerikreporting/designing-reports/report-designer-tools/overview)
