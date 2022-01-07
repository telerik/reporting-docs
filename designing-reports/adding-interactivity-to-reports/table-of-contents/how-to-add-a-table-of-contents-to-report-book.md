---
title: How to Add a Table of Contents to Report Book
page_title: How to Add a Table of Contents to Report Book | for Telerik Reporting Documentation
description: How to Add a Table of Contents to Report Book
slug: telerikreporting/designing-reports/adding-interactivity-to-reports/table-of-contents/how-to-add-a-table-of-contents-to-report-book
tags: how,to,add,a,table,of,contents,to,report,book
published: True
position: 4
---

# How to Add a Table of Contents to Report Book

You can add a table of contents to the report book and click on entries in the table of contents to jump to specific areas within any report.       

## Adding a table of contents to a Report Book

1. Create a new report, add a TOC section to it, and configure its Title, Levels, and Styles as described in the [Overview]({%slug telerikreporting/designing-reports/adding-interactivity-to-reports/table-of-contents/overview%}) article. This special purpose report with its TOC section will be used to display the TOC entries from all of the reports in the Report Book.             

1. Tell the Report Book that it needs to use the specially created TOC report in step 1. to display its Table of Contents. This is achieved by setting the  [TocReportSource](/reporting/api/Telerik.Reporting.ReportBook#Telerik_Reporting_ReportBook_TocReportSource) property of the Report Book. In Visual Studio you can set the property using the Report Book designer (double-click on your Report Book class) or programmatically. In Standalone Report Designer you can set the TOC report source by clicking the corresponding button from the top menu. You need to use a suitable report source in this step. For more information please see [Report Sources Overview]({%slug telerikreporting/designing-reports/report-sources/overview%}).             

1. Configure where the TOC will appear in the Report Book. You can choose to position it before all of the reports or after them by setting the [TocPosition](/reporting/api/Telerik.Reporting.ReportBook#Telerik_Reporting_ReportBook_TocPosition) property.             

# See Also

 * [Overview]({%slug telerikreporting/designing-reports/adding-interactivity-to-reports/table-of-contents/overview%})

 * [Report Book Table of Contents]({%slug telerikreporting/designing-reports/report-book/report-book-table-of-contents%})
