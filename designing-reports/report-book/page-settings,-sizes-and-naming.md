---
title: Page Settings, Sizes and Naming
page_title: Page Settings, Sizes and Naming | for Telerik Reporting Documentation
description: Page Settings, Sizes and Naming
slug: telerikreporting/designing-reports/report-book/page-settings,-sizes-and-naming
tags: page,settings,,sizes,and,naming
published: True
position: 4
---

# Page Settings, Sizes and Naming

## Page Settings and Sizes

Physical page formats support combining reports with different page sizes into one report book. When rendering to one of those formats, each page will preserve the size from the page settings of the report it belongs to.
  

  ![](images/ReportBook6_PageSizes.png)


When exporting to XLS, each report will occupy a separate worksheet in the Excel workbook.

The CSV rendering extension simply combines all reports one after the other in the CSV file it produces.

>caution When viewing a Report Book in the Viewer the Page Settings button is disabled by design


## Document Name

You can use the __DocumentName__  property of a Report Book to suggest a file name when exporting in exactly the same manner as you would do with a single report.


# See Also

 * [Report Book Parameters]({%slug telerikreporting/designing-reports/report-book/report-book-parameters%})

 * [Report Book Paging]({%slug telerikreporting/designing-reports/report-book/report-book-paging%})