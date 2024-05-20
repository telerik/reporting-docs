---
title: Bookmark Action
page_title: Configuring the Bookmark Action 
description: "Learn more about how the end-user can interact with the report to move from one report area to another."
slug: telerikreporting/designing-reports/adding-interactivity-to-reports/actions/bookmark-action
tags: bookmark,action
published: True
position: 4
previous_url: /designing-reports/adding-interactivity-to-reports/actions/how-to/how-to-add-a-bookmark-action, /designing-reports-interactivity-bookmark-action, /designing-reports-interactivity-how-to-add-bookmark
---

# Bookmark Action Overview

A bookmark action is a link that a user clicks to move to another area or report item in a report. To create a bookmark, set a bookmark on the destination report item and add bookmark action on report items that users should click to jump to the bookmarked report item. You can set bookmarks on any report item, including text boxes, images, charts, and gauges. You can add multiple bookmark actions to the same bookmark. To define a bookmark action add a [NavigateToBookmarkAction](/api/Telerik.Reporting.NavigateToBookmarkAction) on another report item/section. 

# How to Add a Bookmark Action

## Adding a bookmark action using the Report Designer

1. In Design view, right-click the report item to which you want to add a link and then click __Properties__.

1. In The Properties dialog box for that report item, click __Action__.

1. Select __Navigate to bookmark__. An additional section appears in the dialog box for this option.

1. In the __Target bookmark by Value__  textbox, type a bookmark or an expression that 
	evaluates to a bookmark.

1. Click __OK__. 

1. To test the link, run the report and click the report item with the applied Action. For TextBox items, it is
	helpful to change the style of the text to indicate to the user that the text is a link. For example, 
	change the color to blue and the effect to underline by setting the corresponding Font properties of the TextBox.

## Adding a bookmark action programatically

{{source=CodeSnippets\CS\API\Telerik\Reporting\ActionSnippets.cs region=AddNewNavigateToBookMarkSnippet}}
{{source=CodeSnippets\VB\API\Telerik\Reporting\ActionSnippets.vb region=AddNewNavigateToBookMarkSnippet}}


## See Also

 * [Drillthrough Report Action]({%slug telerikreporting/designing-reports/adding-interactivity-to-reports/actions/drillthrough-report-action%})

 * [Hyperlink Action]({%slug telerikreporting/designing-reports/adding-interactivity-to-reports/actions/hyperlink-action%})
 
 * [Expressions Overview]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/overview%})
 
 * [Data Items Overview]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/overview%})
