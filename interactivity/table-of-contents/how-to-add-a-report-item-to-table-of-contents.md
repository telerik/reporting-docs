---
title: How to Add a Report Item to Table of Contents
page_title: How to Add a Report Item to Table of Contents 
description: How to Add a Report Item to Table of Contents
slug: telerikreporting/designing-reports/adding-interactivity-to-reports/table-of-contents/how-to-add-a-report-item-to-table-of-contents
tags: how,to,add,a,report,item,to,table,of,contents
published: True
position: 3
---

# How to Add a Report Item to Table of Contents


You can add a table of contents to the report and click on entries in the table of contents to jump to specific areas within a report.       

## Adding a report item to table of contents

1. In __Design view__ , make sure the Properties pane is visible. Select the report item that you want to add to the table of contents. In the Properties pane, type the text that you want to appear in the table of contents in the  [TocText](/reporting/api/Telerik.Reporting.ReportItemBase#Telerik_Reporting_ReportItemBase_TocText) property, or enter an expression that evaluates to a text.             

1. Repeat step 1 for every report item that you want to appear in the table of contents.

1. Enable the table of contents section from the report's context menu.

1. Click __Preview__ . The report runs and the table of contents displays the text you created. Click any link to jump to the report page and the exact location of that item.             

>note Report items positioned in the Page Header/Page Footer section of the report cannot be used to create entries in the table of contents. Setting the  [TocText](/reporting/api/Telerik.Reporting.ReportItemBase#Telerik_Reporting_ReportItemBase_TocText)  property of such item will have no effect.           


>note The order of entries in the table of contents is according to the order of the report items in the report items' collection, and not by the order in which the items appear in the report. Thus, to build a hierarchical table of contents, it is recommended to set the [TocText](/reporting/api/Telerik.Reporting.ReportItemBase#Telerik_Reporting_ReportItemBase_TocText) of report/table groups instead of report items.           


## See Also


 * [Overview]({%slug telerikreporting/designing-reports/adding-interactivity-to-reports/table-of-contents/overview%})
