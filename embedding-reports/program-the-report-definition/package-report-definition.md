---
title: Package Report Definition
page_title: Package Report Definition 
description: Package Report Definition
slug: telerikreporting/using-reports-in-applications/program-the-report-definition/package-report-definition
tags: package,report,definition
published: True
position: 6
---

# Package Report Definition

The [ReportPackager](/reporting/api/Telerik.Reporting.ReportPackager) serializes the report definition in XML and with a zip compression packages the definition and its resources. The resources are in their native format and archived for better performance. This way the definition is faster to handle and more compact. This is the default report document format for the [Standalone Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/overview%}#standalone-report-designer) and the [Web Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/overview%}#web-report-designer). 

## Packaging .TRDX report definition

The following sample code snipped demonstrates how to package a predefined .TRDX (XML) report definition:

{{source=CodeSnippets\CS\API\Telerik\Reporting\ReportPackagerSnippets.cs region=CreatePackageFromXmlReportSnippet}}
{{source=CodeSnippets\VB\API\Telerik\Reporting\ReportPackagerSnippets.vb region=CreatePackageFromXmlReportSnippet}}

## Packaging CLR report definition

The following sample code snipped demonstrates how to package a predefined CLR (C# or VB) report definition:

{{source=CodeSnippets\CS\API\Telerik\Reporting\ReportPackagerSnippets.cs region=CreatePackageFromClrReportSnippet}}
{{source=CodeSnippets\VB\API\Telerik\Reporting\ReportPackagerSnippets.vb region=CreatePackageFromClrReportSnippet}}

## Unpackaging

The following sample code snipped demonstrates how to unpackage a predefined .TRDP report definition:

{{source=CodeSnippets\CS\API\Telerik\Reporting\ReportPackagerSnippets.cs region=UnpackageTrdpSnippet}}
{{source=CodeSnippets\VB\API\Telerik\Reporting\ReportPackagerSnippets.vb region=UnpackageTrdpSnippet}}


## See Also

* [Overview]({%slug telerikreporting/designing-reports/report-designer-tools/overview%})
