---
title: Interactive vs. Print Layout
page_title: Interactive and Print Layouts Explained
description: "Learn what are the Interactive and Print Layouts in Telerik Reporting Report Viewers and what is the difference between them."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/interactive-vs.-print-layout
tags: interactive,vs.,print,layout
published: True
position: 9
previous_url: /report-viewers-interactive-print-view
---

# Interactive and Print Layouts Overview

All report viewers can show a report in two distinctive report layouts:

* Interactive View
* Print Preview

## Interactive View

The __Interactive View__ is a logical layout that removes the strict restrictions for report pagination on the client by utilizing a simpler paging algorithm, which allows it to render reports faster. For example, if you use the crosstab's drill-down feature, the crosstab will expand its subcategories faster, because it will not recalculate the report's page size. Rather, this action will simply stretch the report.

The paging mechanism of the __Interactive View__ is based on soft page breaks, where the report is optimized for screen-based viewing and delivery. In other words, you could have a two-page long table which to appear in a single continuous form on the client with a vertical scroll bar (logical layout); when printed, the table will print on two separate sheets of paper (print layout).

> The Interactive layout is the default report layout which users see. You can control the default layout via the ViewMode property of the respective report viewer. In Interactive preview items like the Table/List/Crosstab are rendered into a single continuous page.

## Print Preview

The paging in __Print Preview__ layout is calculated based on the page settings (see [Understanding Pagination]({%slug telerikreporting/designing-reports/rendering-and-paging/understanding-pagination%})). When the report width is less than the page width specified in the page settings the report will grow horizontally to match the width of the page which may lead to the differences between design-time and print preview. When the report width is larger than the page width each logical page will cause a horizontal overflow and will continue on the next physical page. During the preparation of the report for printing, the latest state of the report will be printed, such as expanded/collapsed Crosstab categories. The __Print Preview__ is not interactive, it is dedicated only for printing. 
## See Also

* [Understanding Rendering Behaviors]({%slug telerikreporting/designing-reports/rendering-and-paging/understanding-rendering-behaviors%})
* [Design Considerations for Report Rendering]({%slug telerikreporting/designing-reports/rendering-and-paging/design-considerations-for-report-rendering/overview%})
