---
title: Report Book Paging
page_title: Report Book Paging 
description: Report Book Paging
slug: telerikreporting/designing-reports/report-book/report-book-paging
tags: report,book,paging
published: True
position: 2
previous_url: /designing-reports-reportbook-paging
---

# Report Book Paging


## Report Book Paging

Reports are displayed in the order they were added to the report book, each report starting on a new page. The way pages are counted (the evaluation of the 'PageNumber' global object) may be different in the context of a report book compared to counting pages in a single report. The Report class has a property of type __PageNumberingStyle__ that will let you control the behavior of page counting in the context of a report book.

>note The  __PageNumberingStyle__  property has meaning and effect only when the report is part of a report book.


The PageNumberingStyle enumeration has three values with self-explanatory names. "ResetNumbering" resets page numbering while page count aggregation continues, ResetNumberingAndCount resets both page numbering and page count and "Continue" indicates that both page numbering and page count aggregations continue from where the previous report in the book has left off. The default value of this property is "Continue". Below is a small example of how to use the PageNumberingStyle assuming that each of the three reports has a total of two pages:

__The value of the TextBox in the PageHeader is equal to = "Page: " + PageNumber + " of " + PageCount__ 
>caption PageNumberingStyle.Continue

  

  ![](images/ReportBook_PageNumberingContinue.png)
>caption PageNumberingStyle.ResetNumbering

  

  ![](images/ReportBook_PageNumberingStyleResetNumbering.png)
>caption PageNumberingStyle.ResetNumberingAndCount

  

  ![](images/ReportBook_PageNumberingStyleResetNumberingAndCount.png)


## See Also

 * [Report Book Parameters]({%slug telerikreporting/designing-reports/report-book/report-book-parameters%})

 * [Page Settings, Sizes and Naming]({%slug telerikreporting/designing-reports/report-book/page-settings,-sizes-and-naming%})
