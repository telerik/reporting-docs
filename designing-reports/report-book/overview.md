---
title: Overview
page_title: Report Book Explained
description: "Learn how Telerik Reporting Report Books combine multiple reports for preview, printing, and export, with separate page settings for each report."
slug: telerikreporting/designing-reports/report-book/overview
tags: overview,reportbook,reportsource,report
published: True
position: 0
previous_url: /designing-reports-general-explanation, /designing-reports/report-book/
reportingArea: General
components: [general]
---

# Report Book Overview

A report book combines multiple reports into a single document for previewing, printing, or exporting. The reports appear in the order you add them, and each report starts on a new page.

## When to Use a Report Book

Use a Report Book when you need to:

* Combine multiple reports into a single document for preview, printing, or export.
* Combine multiple instances of the same report with different settings into a single document for preview, printing, or export.
* Start each report on a new physical page or worksheet in an Excel workbook.
* Apply different [page settings](slug:telerikreporting/designing-reports/rendering-and-paging/understanding-pagination), such as page size and orientation.

## What Is a Report Book

A `ReportBook` is a class that inherits `Telerik.Reporting.ReportBook`. Its `ReportSources` collection accepts supported [ReportSource](slug:telerikreporting/designing-reports/report-sources/overview) types, such as `TypeReportSource` for report classes and `UriReportSource` for report definition files such as TRDX and TRDP. The Reporting Engine processes each report according to its `ReportSource` type.

>important `InstanceReportSource` and `XmlReportSource` cannot be used with the ReportBook.

The [Report Book online demo](https://demos.telerik.com/reporting/report-book) is also available in the local Examples folder. The folder is installed by default under `...Progress\Telerik Reporting {{site.suiteversion}}\Examples`. For an example of creating a `ReportBook` instance at runtime, see [creating a Report Book at runtime](slug:telerikreporting/designing-reports/report-book/how-to-create-a-report-book-at-run-time).

>note When you reference reports stored in the [Telerik Report Server](https://docs.telerik.com/report-server/introduction), use the `[CategoryName]/[ReportName]` path in the URI. For details, see [working with Report Server reports](slug:telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/working-with-report-server-reports).

## See Also

* [Create a Report Book at runtime](slug:telerikreporting/designing-reports/report-book/how-to-create-a-report-book-at-run-time)
* [Configure Report Book page settings](slug:telerikreporting/designing-reports/report-book/page-settings,-sizes-and-naming)
