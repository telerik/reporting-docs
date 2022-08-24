---
title: Context Menu 
page_title: Context Menu of the Table Report Item 
description: "Learn more about the context menu provided by the Telerik Reporting Table report item and how to configure and use the feature."
slug: table_context_menu
tags: telerik, reporting, report, items, table, crosstab, list, context, menu
published: True
position: 6
---

# Context Menu

When you click on a Table/Crosstab cell, you select a TextBox item. Although this is standard TextBox report item, when it is in the context of a Table/Crosstab/List item, its context menu would show settings for the Table/Crosstab/List item besides the [usual TextBox item's attributes it shows]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/context-menu%}). To see an option you need to click either on an item or on the row/column handlers (the gray rectangles appearing when the whole Table item is selected). The Context Menu is functionally dependent on where exactly you click, and offers possible actions that are allowed and you can take (see image below). 

  ![](images/CrossTabContextMenu2.png)

The Groups can be Parent, Child and Adjacent according to the hierarchy level. However when it comes to row/column operations they're referred to as inside and outside group i.e. a static row/column is added inside or outside of the current group.

When you select several cells which belong to a single dynamic (or static) group, then the Ccontext Menu would show Merge Cells option. Once cells from a single group are merged they can be later split by selecting the merged cell and choosing Split Cells from the menu.

