---
title: Report File Formats
page_title: Report File Formats
description: Get familiar with the different types of report files offered by Telerik Reporting.
slug: report-file-formats
tags: report, file, format, trdp, trdx, trtx, trbp, cs
published: True
position: 1 
---

# Report File Formats

The file extensions **.trdp**, **.trdx**, **.trtx**, **.trbp**, and .NET type report definitions (.CS or .VB files) are used in Telerik Reporting to represent different types of report files. Here's a breakdown of what each one is for:

|Format| Description| Use Case|Designer Compatibility|
|----|----|----|----|
|.trdp|**T**elerik **R**eport **D**efinition **P**ackage - Full report with resources. Packaged binary (ZIP). XML-based, editable|Ideal for packaging a report with its assets (images, styles, etc.).|Used in both Web Report Designer and Standalone Report Designer.|
|.trdx|**T**elerik **R**eport **D**efinition **X**ML - Report definition only. Unlike .trdp (which is a packaged format), .trdx is plain XML, making it easier to version control, edit manually, or generate dynamically.|Better for deployment and performance|Supported in Standalone Report Designer and Web Report Designer.|
|.trtx|**T**elerik **R**eport **T**emplate **X**ML - XML file used as a template and contains the structure, layout, data bindings, and styling of a report.|Used to create new reports based on a predefined layout or style|Supported in Standalone Report Designer and Web Report Designer.|
|.trbp|**T**elerik **R**eport **B**ook **P**ackage - Stores a report book - a collection of multiple reports|Used when you want to combine several reports into one document (e.g., for printing or exporting)|Standalone Report Designer (and programmatically)|
|.NET type report definitions (.CS or .VB files)|.CS/.VB report definition inheriting from [Telerik.Reporting.Report](/api/telerik.reporting.report).|Ideal for developers who want full control over report generation through C#/VB code.|Visual Studio Report Designer|


## See Also

* [Report Designer Tools]({%slug telerikreporting/designing-reports/report-designer-tools/overview%})
