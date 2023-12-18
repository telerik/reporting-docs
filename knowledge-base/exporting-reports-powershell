---
title: Generating Reports in PowerShell
description: Learn how to export reports in PowerShell using Telerik Reporting.
type: how-to
page_title: Exporting Reports in Powershell | Telerik Reporting
slug: exporting-reports-powershell
tags: powershell, export, report, PDF
res_type: kb
---

## Environment

| Property | Value |
|----------|-------|
| Product  | Progress Telerik Reporting |

## Description

In some scenarios, you may need to quickly export a bunch of small reports. You could create a console application and generate them programmatically but wouldn't it be easier to have a small script you can easily edit and execute directly from the terminal?

## Solution

You can achieve that using [PowerShell](https://learn.microsoft.com/en-us/powershell/scripting/overview) by loading the `Telerik.Reporting` assembly, as well as any other assemblies your report may depend on, and generating the report with the [ReportProcessor class](/api/telerik.reporting.processing.reportprocessor), as described in the [Generate Reports Programmatically]({%slug telerikreporting/using-reports-in-applications/call-the-report-engine-via-apis/embedded-report-engine%}) article.

The following PowerShell script illustrates how you can export a report to PDF:

````PowerShell
Add-Type -path "Telerik\Reporting\Installation\Directory\Bin\netstandard2.0\Telerik.Reporting.dll";

$reportProcessor = New-Object Telerik.Reporting.Processing.ReportProcessor;
$format = "PDF"
$deviceInfo = New-Object System.Collections.Hashtable;
$reportSource = New-Object Telerik.Reporting.UriReportSource;
$reportSource.Uri = "Location\Of\TRDP\Or\TRDX\Report.trdp";
$param1 = "Necessary parameter";
$param2 = 10;
$reportSource.Parameters.Add("ReportParameterName1", $param1);
$reportSource.Parameters.Add("ReportParameterName2", $param2);

$renderingResult = $reportProcessor.RenderReport($format, $reportSource, $deviceInfo)
$fileName = $renderingResult.DocumentName + "." + $renderingResult.Extension;
$path = "Location\Of\PDF\Export\" + $fileName

[System.IO.File]::WriteAllBytes($path, $renderingResult.DocumentBytes)
````

If you encounter any errors, you can add the following snippet at the beginning of the script to generate a trace log. This log should contain more specific information about what is going wrong and help you narrow down the issue faster.

````PowerShell
$listener = new-object System.Diagnostics.TextWriterTraceListener "Location\Of\Trace\Log.txt"
[System.Diagnostics.Trace]::Listeners.Add($listener)
[System.Diagnostics.Trace]::AutoFlush = $True;
````

## See Also

* [PowerShell](https://learn.microsoft.com/en-us/powershell/scripting/overview)
* [ReportProcessor](/api/telerik.reporting.processing.reportprocessor)
* [Generate Reports Programmatically]({%slug telerikreporting/using-reports-in-applications/call-the-report-engine-via-apis/embedded-report-engine%})
