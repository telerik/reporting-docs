---
title: How to Add a Bookmark Action
page_title: How to Add a Bookmark Action | for Telerik Reporting Documentation
description: How to Add a Bookmark Action
slug: telerikreporting/designing-reports/adding-interactivity-to-reports/actions/how-to/how-to-add-a-bookmark-action
tags: how,to,add,a,bookmark,action
published: True
position: 1
---

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
````C#
	Telerik.Reporting.NavigateToBookmarkAction bookmarkAction1 = new Telerik.Reporting.NavigateToBookmarkAction();
	textBox2.DocumentMapText = "MyBookMark";
	bookmarkAction1.TargetBookmarkId = "MyBookMark";
	textBox1.Action = bookmarkAction1;
````
{{source=CodeSnippets\VB\API\Telerik\Reporting\ActionSnippets.vb region=AddNewNavigateToBookMarkSnippet}}
````VB
	Dim bookmarkAction1 As New Telerik.Reporting.NavigateToBookmarkAction()
	textBox2.DocumentMapText = "MyBookMark"
	bookmarkAction1.TargetBookmarkId = "MyBookMark"
	textBox1.Action = bookmarkAction1
````

# See Also

 * [How to: Add a Drillthrough Report Action]({%slug telerikreporting/designing-reports/adding-interactivity-to-reports/actions/how-to/how-to-add-a-drillthrough-navigate-to-report-action%})

 * [How to: Add a Hyperlink Action]({%slug telerikreporting/designing-reports/adding-interactivity-to-reports/actions/how-to/how-to-add-a-hyperlink-action%})
 
 * [Expressions Overview]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/overview%})
 
 * [Data Items Overview]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/overview%})