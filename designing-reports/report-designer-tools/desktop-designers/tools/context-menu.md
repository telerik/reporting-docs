---
title: Context Menu
page_title: Context Menu of Report Designers
description: "Learn what are the major items in the Context Menu of Telerik Reporting Desktop Designers and how to use them."
slug: telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/context-menu
tags: context,menu
published: True
position: 5
previous_url: /ui-context-menu
reportingArea: General
---

# Report Designer Context Menu

The context menu will conditionally display items depending on the area of the report that was right-clicked. Some of the significant context menu items are:

* __View:__ The sub menu of View allows you to select[Data Explorer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/data-explorer%}), [Report Explorer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/report-explorer%}) and [Group Explorer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/group-explorer%}).
* __Style:__ Invokes the Edit Style dialog for the right-clicked item. From here you can set the Text, Background, Edges and Line style for the report items, sections or the report as a whole.
* __Copy, Paste, Reset Style:__ To copy the style from one item in the report, right-click a report item and select __Copy Style__, then right-click another report item and select __Paste Style__. Right-click and select __Reset Style__ to restore an items previous style before the paste.
* __Page Header, Page Footer, Report Header:__ and __Report Footer__ : These menu items can be toggled on and off to create and remove respective sections in the report.
* __Add New Group:__ This menu item adds a new group to the report and new group component to the tray below the report designer.
* __Groups:__ This menu item opens the __Group Collection Editor__ dialog and allows you to add or remove groups to the report.
* __Report Parameters:__ This menu item opens the __ReportParameter Collection Editor__ dialog and allows you to add or remove report parameters to the report.
* __Sorting:__ This menu item opens the __Edit Sorting__ dialog and allows you to add or remove sort expressions to sort the data in the report.
* __Filters:__ This menu item opens the __Edit Filters__ dialog and allows you to add or remove filter expressions to restrict the data that is being shown in the report.

In the figure below the menu is invoked in the area next to the report design surface.

![Context Menu of Report Designer invoked in the area next to report design surface. The View item is selected.](images/UI012.png)

In the example below, a [TextBox]({%slug telerikreporting/designing-reports/report-structure/textbox%}) was right-clicked to display its context menu. It includes the following menu items:

* __Bring To Front/Send To Back:__ Allow you to change the order of the items in the items collection of a section.
* __Select:__ Variations of this menu item allow you to select the report, sections in the report or items in sections of the report. The menu choices allow you to select elements of the report that are underneath the right-clicked item.
* __Expressions:__ This menu item invokes the [Edit Expression]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/edit-expression-dialog%}).
* __Format__ Selecting this item displays the [Format Builder]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/format-builder-dialog%}).
* __Conditional Formatting:__ This menu item invokes the [Conditional Formatting Rules Dialog]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/conditional-formatting-rules-dialog%}).

![Context Menu of Report Designer invoked over a TextBox. The Select item is highlighted and lets you select report elements underneath the right-clicked TextBox.](images/UI013.png)
