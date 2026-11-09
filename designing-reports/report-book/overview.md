---
title: Overview
page_title: Report Book Explained
description: "Learn what a Telerik ReportBook is, when to combine reports, which report sources it supports, and how it affects page layout and export results."
slug: telerikreporting/designing-reports/report-book/overview
tags: overview,reportbook,reportsource,report
published: True
position: 0
previous_url: /designing-reports-general-explanation, /designing-reports/report-book/
reportingArea: General
components: [general]
---

# Report Book Overview

A Telerik ReportBook combines multiple reports into one document for previewing, printing, or exporting. Reports appear in the order you add them, and each report starts on a new page.

## When to Use a ReportBook

Use a ReportBook when you need to:

* Combine multiple reports into one document for preview, printing, or export.
* Combine multiple instances of the same report with different settings into one document.
* Start each report on a new physical page or worksheet in an Excel workbook.
* Apply different [page settings](slug:telerikreporting/designing-reports/rendering-and-paging/understanding-pagination), such as page size or orientation, to each report.

## What Is a ReportBook

The `Telerik.Reporting.ReportBook` class exposes a `ReportSources` collection for the reports in the book. Add TRDX or TRDP files with a `UriReportSource`. Add report classes that inherit from `Telerik.Reporting.Report` with a `TypeReportSource`. The Reporting engine processes each report according to its report source.

>important Do not use `InstanceReportSource` or `XMLReportSource` with a ReportBook.

The [Report Book online demo](https://demos.telerik.com/reporting/report-book) shows a combined report. The demo is also available in the local Examples installed by default under `...Progress\Telerik Reporting {{site.suiteversion}}\Examples`. For code, see [how to create a report book at runtime](slug:telerikreporting/designing-reports/report-book/how-to-create-a-report-book-at-run-time).

>note When you reference reports stored in [Telerik Report Server](https://docs.telerik.com/report-server/introduction), use the *[CategoryName]/[ReportName]* URI path described in [working with Report Server reports](slug:telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/working-with-report-server-reports).

## See Also

* [Configure report book paging](slug:telerikreporting/designing-reports/report-book/report-book-paging)
* [Set page settings and sizes for report books](slug:telerikreporting/designing-reports/report-book/page-settings,-sizes-and-naming)
* [Work with report book parameters](slug:telerikreporting/designing-reports/report-book/report-book-parameters)
