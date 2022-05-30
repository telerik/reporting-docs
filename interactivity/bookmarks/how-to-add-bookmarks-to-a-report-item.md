---
title: How to Add Bookmarks to a Report item
page_title: How to Add Bookmarks to a Report item 
description: How to Add Bookmarks to a Report item
slug: telerikreporting/designing-reports/adding-interactivity-to-reports/bookmarks/how-to-add-bookmarks-to-a-report-item
tags: how,to,add,bookmarks,to,a,report,item
published: True
position: 1
---

# How to Add Bookmarks to a Report item

Add bookmarks to a report when you want to provide a customized table of contents or to provide customized internal navigation in the report. Typically, you add bookmarks to locations in the report to which you want to direct users. You can create your own strings to use as bookmarks, or, for groups, you can set the bookmark to the group expression. After you create bookmarks, you can add report items that the user	can click to go to each bookmark. These items are typically text boxes or images. 

## Adding a bookmark to a report item

1. In __Design view__  , select a report item to which you want to add a bookmark. The properties for the selected item appear in the __Properties__ pane.

1. In the [BookmarkId](/reporting/api/Telerik.Reporting.ReportItemBase#Telerik_Reporting_ReportItemBase_BookmarkId) property, type a string that is the label for this bookmark. Alternatively, click the ellipsis to open the Expression dialog box to specify an expression that evaluates to a label.

>note The  [BookmarkId](/reporting/api/Telerik.Reporting.ReportItemBase#Telerik_Reporting_ReportItemBase_BookmarkId) can be any string, but it must be unique in the report. If the __BookmarkID__ is not unique, an action to the bookmark finds the first matching bookmark.

# See Also

 * [Bookmarks Overview]({%slug telerikreporting/designing-reports/adding-interactivity-to-reports/bookmarks/overview%})
 
 * [How to Add Bookmarks to a Report group]({%slug telerikreporting/designing-reports/adding-interactivity-to-reports/bookmarks/how-to-add-bookmarks-to-a-report-group%})
  
 * [How to Add Bookmarks to a Table group]({%slug telerikreporting/designing-reports/adding-interactivity-to-reports/bookmarks/how-to-add-bookmarks-to-a-table-group%})