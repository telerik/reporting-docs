---
title: Bookmarks Overview
page_title: Overview 
description: Overview
slug: telerikreporting/designing-reports/adding-interactivity-to-reports/bookmarks/overview
tags: overview
published: True
position: 0
---

# Bookmarks Overview

Add bookmarks to a report when you want to provide customized internal navigation in the report. Typically, you add bookmarks to locations in the report to which you want to direct users. You can create your own strings to use as bookmarks, or, for groups, you can set the bookmark to the group expression. After you create bookmarks, you can add report items that the user can click to go to each bookmark. These items are typically text boxes or images. For example, if your report displays a table grouped by color, you would add a bookmark based on the group expression to the group header. Then you would add a table with a single text box at the beginning of the report that displayed the color values, and set the bookmark link on that text box. When you click the color, the report jumps to the page that displays the group header row for that color. You can add a bookmark to any report item/group and add a bookmark link to any report item.       

To define a bookmark on item/group use the  [BookmarkId](/reporting/api/Telerik.Reporting.ReportItemBase#Telerik_Reporting_ReportItemBase_BookmarkId) property. To define a bookmark action add a          [NavigateToBookmarkAction](/reporting/api/Telerik.Reporting.NavigateToBookmarkAction) on another item.       

>important It is recommended that the BookmarkId property value is unique and conforms to the  [C# Language Specification for Identifiers](https://docs.microsoft.com/en-us/dotnet/csharp/fundamentals/coding-style/identifier-names). If the BookmarkId contains characters which are not allowed by this specification, they will be escaped by the reporting engine.       

# See Also

 * [How to Add a Bookmark Action]({%slug telerikreporting/designing-reports/adding-interactivity-to-reports/actions/how-to/how-to-add-a-bookmark-action%})