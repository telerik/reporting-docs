---
title: Report Book Table of Contents
page_title: Report Book Table of Contents | for Telerik Reporting Documentation
description: Report Book Table of Contents
slug: telerikreporting/designing-reports/report-book/report-book-table-of-contents
tags: report,book,table,of,contents
published: True
position: 3
---

# Report Book Table of Contents



The Report Book Table of Contents (TOC) provides a summary/overview of all the reports in a Report Book. The Report Book TOC gathers all of the TOC entries in all         of the report book reports and displays them together in a single TOC, which can be positioned at the beginning or at the end of the Report Book.         The user can click the entries in this TOC to navigate to the report and page where the item is located.       

The Report Book TOC works in a similar manner to the TOC in a single report. The main difference with the Report Book TOC is that it requires a separate report         to be created and its TocSection to be configured. For more details on how to configure the TocSection, please see [Overview]({%slug telerikreporting/designing-reports/adding-interactivity-to-reports/table-of-contents/overview%}).         The TocSection of this report, together with its Title, Levels, and Styles, will be used by the Report Book when the TOC for all reports is created.         To tell the Report Book which report will be used for the Table of Contents, you need to configure the          [TocReportSource](/reporting/api/Telerik.Reporting.ReportBook#Telerik_Reporting_ReportBook_TocReportSource)  property.         For more information on the topic, please see [How to Add a Table of Contents to Report Book]({%slug telerikreporting/designing-reports/adding-interactivity-to-reports/table-of-contents/how-to-add-a-table-of-contents-to-report-book%}).       

>note When a report inside the Report Book also has a TOC, its TocSection will not be moved or merged with the Report Book TOC. It will be displayed as part of the report it belongs to.            To avoid having multiple TOCs - one for the whole Report Book and other TOCs for the reports inside, you will need to hide the duplicate TocSections in their respective reports.         


# See Also


 * [Overview]({%slug telerikreporting/designing-reports/adding-interactivity-to-reports/table-of-contents/overview%})

 * [How to Add a Report Group to Table of Contents]({%slug telerikreporting/designing-reports/adding-interactivity-to-reports/table-of-contents/how-to-add-a-report-group-to-table-of-contents%})

 * [How to Add a Table Group to Table of Contents]({%slug telerikreporting/designing-reports/adding-interactivity-to-reports/table-of-contents/how-to-add-a-table-group-to-table-of-contents%})

 * [How to Add a Report Item to Table of Contents]({%slug telerikreporting/designing-reports/adding-interactivity-to-reports/table-of-contents/how-to-add-a-report-item-to-table-of-contents%})

 * [How to Add a Table of Contents to Report Book]({%slug telerikreporting/designing-reports/adding-interactivity-to-reports/table-of-contents/how-to-add-a-table-of-contents-to-report-book%})
