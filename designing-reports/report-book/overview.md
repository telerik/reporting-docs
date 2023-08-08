---
title: Overview
page_title: Report Book Explained
description: "Learn what is the Telerik Report Book and how and when it should be used to best benefit from its functionalities."
slug: telerikreporting/designing-reports/report-book/overview
tags: overview
published: True
position: 0
previous_url: /designing-reports-general-explanation
---

# Report Book Overview

The main goal of a report book is to combine different reports into one for the purposes of printing them at once or exporting them to a single file. Reports are displayed in the order they were added to the report book, each report starting on a new page.       

## Why to use a ReportBook:

* You need to combine multiple reports into a single document for preview, print, and export;

* You need to combine multiple instances of the same report with different settings into a single document for preview, print, and export;

* You need each report to start on a new physical page, sheet in Excel Workbook;

* You need each report to have different [page settings]({%slug telerikreporting/designing-reports/rendering-and-paging/understanding-pagination%}) like page size and orientation;             

## What is a ReportBook

A Report Book is a class inheriting `Telerik.Reporting.ReportBook`. The `ReportBook.ReportSources` collection allows you to add reports of different formats (XML, TRDX and TRDP files, run-time instances, or classes inheriting `Telerik.Reporting.Report`) into the book, where the Reporting Engine knows how to process the separate reports based on the type of the used [Report Source]({%slug telerikreporting/designing-reports/report-sources/overview%}) for adding them.         

>note Note that __Instance__ and __XML__ Report Sources cannot be used with the ReportBook.           

The [Report Book online demo](https://demos.telerik.com/reporting/report-book) is available also in the local Examples installed by default under *...Progress\Telerik Reporting R3 2021\Examples* . An example of how to create a ReportBook instance at run-time can be found in [Create a Report Book at run-time]({%slug telerikreporting/designing-reports/report-book/how-to-create-a-report-book-at-run-time%}).         
