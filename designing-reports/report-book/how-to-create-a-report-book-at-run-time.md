---
title: Creating a Report Book at Runtime
page_title: Instantiating Report Books at runtime
description: "Learn how a Telerik ReportBook object can be created and edited at runtime through code in order to render multiple reports at the same time."
slug: telerikreporting/designing-reports/report-book/how-to-create-a-report-book-at-run-time
tags: how,create,instantiate,report,book,runtime
published: True
position: 6
previous_url: /designing-reports-reportbook-creating-reportbook-run-time
reportingArea: General
---

# How to Create a Report Book at Runtime

You can programmatically create a report book at runtime by using the Telerik Reporting API.

The following steps are required to create a report book at runtime:

1. Create an instance of the ReportBook class
1. Add the necessary ReportSources to its `ReportSources` collection.

Alternatively, you can derive from the ReportBook class and initialize the book in the constructor if you want to separate the report book implementation details from the rest of your code.

>note The [ReportBook](/api/telerik.reporting.reportbook) is an [IReportDocument](/api/telerik.reporting.ireportdocument). The latter exposes [ReportParameters property](/api/telerik.reporting.ireportdocument#Telerik_Reporting_IReportDocument_ReportParameters) that is _obsolete_ and the ReportBook doesn't implement it. Thus, the ReportBook doesn't have a collection of parameters.
>
>The [ReportSource]({%slug telerikreporting/designing-reports/report-sources/overview%}#available-report-sources) with a ReportBook as report document exposes [ParameterCollection](/api/telerik.reporting.parametercollection). The values from the collection will be distributed among the reports in the ReportBook as explained in the article [Report Book Parameters]({%slug telerikreporting/designing-reports/report-book/report-book-parameters%}).

In the sample below we add two reports and a Table of Contents (TOC):

1. First is the 'WeekdayReport', which is a CS/VB class inheriting from Telerik.Reporting.Report. It is added as a `TypeReportSource` - check [Available ReportSources]({%slug telerikreporting/designing-reports/report-sources/overview%}).
1. Second is the 'Glossary.trdp' report created with the Standalone Designer. It is added wrapped in a `UriReportSource`. You need to specify the relative or full path to the TRDP file:
1. (optional)Finally, we add the 'TocReport.trdp', which contains only a TOC section, as a [TocReportSource](/api/telerik.reporting.reportbook#Telerik_Reporting_ReportBook_TocReportSource) of the ReportBook.

{{source=CodeSnippets\CS\API\Telerik\Reporting\ReportBookSnippets.cs region=CreateReportBook}}
{{source=CodeSnippets\VB\API\Telerik\Reporting\ReportBookSnippets.vb region=CreateReportBook}}

