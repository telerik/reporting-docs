---
title: Bookmarks
page_title: Report Bookmarks
description: "Learn how to implement internal navigation in a report by adding custom Bookmark IDs to report items, sections or groups."
slug: telerikreporting/designing-reports/adding-interactivity-to-reports/bookmarks/overview
tags: bookmarks,overview,internal,navigation,reports,links
published: True
previous_url: /designing-reports-interactivity-bookmarks
---

# Bookmarks Overview

Add bookmarks to a report when you want to provide customized internal navigation in the report. Typically, you add bookmarks to locations in the report to which you want to direct users. You can create your own strings to use as bookmarks, or, for groups, you can set the bookmark to the group expression. After you create bookmarks, you can add report items that the user can click to go to each bookmark. These items are typically text boxes or images.

For example, if your report displays a table grouped by color, you would add a bookmark based on the group expression to the group header. Then, you would add a table with a single text box at the beginning of the report that displayed the color values, and set the bookmark link on that text box. When you click the color, the report jumps to the page that displays the group header row for that color. You can add a bookmark to any report item/group and add a bookmark link to any report item.

To define a bookmark on item/group use the [BookmarkId](/api/Telerik.Reporting.ReportItemBase#Telerik_Reporting_ReportItemBase_BookmarkId) property. To define a bookmark action add a [NavigateToBookmarkAction](/api/Telerik.Reporting.NavigateToBookmarkAction) on another item.

> important It is recommended that the `BookmarkId` property value is unique and conforms to the [C# Language Specification for Identifiers](https://learn.microsoft.com/en-us/dotnet/csharp/fundamentals/coding-style/identifier-names). If the `BookmarkId` contains characters which are not allowed by this specification, they will be escaped by the reporting engine.

## How to Add Bookmarks to a Report item

Add bookmarks to a report when you want to provide a customized table of contents or to provide customized internal navigation in the report. Typically, you add bookmarks to locations in the report to which you want to direct users.

You can create your own strings to use as bookmarks, or, for groups, you can set the bookmark to the group expression.

After you create bookmarks, you can add report items that the user can click to go to each bookmark. These items are typically text boxes or images.

### Adding a bookmark to a report item

1. In **Design view**, select a report item to which you want to add a bookmark. The properties for the selected item appear in the **Properties** pane.
1. In the [BookmarkId](/api/Telerik.Reporting.ReportItemBase#Telerik_Reporting_ReportItemBase_BookmarkId) property, type a string that is the label for this bookmark. Alternatively, click the ellipsis to open the Expression dialog box to specify an expression that evaluates to a label.

> note The [BookmarkId](/api/Telerik.Reporting.ReportItemBase#Telerik_Reporting_ReportItemBase_BookmarkId) can be any string, but it must be unique in the report. If the `BookmarkID` is not unique, an action to the bookmark finds the _first_ matching bookmark.

## How to Add Bookmarks to a Report group

Add bookmarks to a report when you want to provide a customized table of contents or to provide customized internal navigation in the report. Typically, you add bookmarks to locations in the report to which you want to direct users.

You can create your own strings to use as bookmarks, or, for groups, you can set the bookmark to the group expression. After you create bookmarks, you can add report items that the user can click to go to each bookmark. These items are typically text boxes or images.

### Adding a bookmark to a Report group

1. In **Design view**, right click outside the report sections, select View and open up the [Group Explorer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/group-explorer%}). Select a report group to which you want to add a bookmark. The properties for the selected group appear in the **Properties** pane.
1. In the [BookmarkId](/api/Telerik.Reporting.Group#Telerik_Reporting_Group_BookmarkId) property, type a string that is the label for this bookmark. Alternatively, click the ellipsis to open the **Expression** dialog box to specify an expression that evaluates to text. Typically for a group, the expression you type should be the group expression.

> note The [BookmarkId](/api/Telerik.Reporting.Group#Telerik_Reporting_Group_BookmarkId) can be any string, but it must be unique in the report. If the `BookmarkID` is not unique, an action to the bookmark finds the first matching bookmark.

## How to Add Bookmarks to a Table group

Add bookmarks to a report when you want to provide a customized table of contents or to provide customized internal navigation in the report. Typically, you add bookmarks to locations in the report to which you want to direct users.

You can create your own strings to use as bookmarks, or, for groups, you can set the bookmark to the group expression.

After you create bookmarks, you can add report items that the user can click to go to each bookmark. These items are typically text boxes or images.

### Adding a bookmark to a Table group

1. In **Design view**, right click outside the report sections, select View and open up the [Group Explorer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/group-explorer%}). Select a [Table](/api/Telerik.Reporting.Table), [Crosstab](/api/Telerik.Reporting.Crosstab) or [List](/api/Telerik.Reporting.List) report item, so the **Group Explorer** shows the respective groups. Select a group to which you want to add a bookmark, right click on it and select **Group Properties**. The properties for the selected group appear in the **Edit Table Group** dialog.
1. In the [BookmarkId](/api/Telerik.Reporting.TableGroup#Telerik_Reporting_TableGroup_BookmarkId) property, type a string that is the label for this bookmark. Alternatively, click the ellipsis to open the **Expression** dialog box to specify an expression that evaluates to text. Typically for a group, the expression you type should be the group expression.

> note The [BookmarkId](/api/Telerik.Reporting.TableGroup#Telerik_Reporting_TableGroup_BookmarkId) can be any string, but it must be unique in the report. If the `BookmarkID` is not unique, an action to the bookmark finds the first matching bookmark.

## See Also

- [Bookmark Action]({%slug telerikreporting/designing-reports/adding-interactivity-to-reports/actions/bookmark-action%})
