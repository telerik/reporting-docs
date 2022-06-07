---
title: Hyperlink Action
page_title: Hyperlink Action 
description: Hyperlink Action
slug: telerikreporting/designing-reports/adding-interactivity-to-reports/actions/hyperlink-action
tags: hyperlink,action
published: True
position: 5
---

# Hyperlink Action

You can add a hyperlink to a report item so that a user can access a Web page by clicking the item. A hyperlink can be a static URL or an expression that evaluates to a URL. If you have a field in a database	that contains URLs, the expression can contain that field, resulting in a dynamic list of hyperlinks in the report. You can define a hyperlink on any report item. 

>warning Hyperlink URL-s should be absolute by design. This ensures they are compatible with all of the report viewers and supported rendering formats. 

To define a hyperlink add a [NavigateToUrlAction](/reporting/api/Telerik.Reporting.NavigateToUrlAction) on an item. 

You can also specify whether the URL is opened in the same or new browser window using the [Target](/reporting/api/Telerik.Reporting.NavigateToUrlAction#Telerik_Reporting_NavigateToUrlAction_Target) property. 

> Opening URL in the same window is only applicable for the [ASP.NET Web Forms Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/asp.net-web-forms-report-viewer/overview%}) and [Silverlight Application]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/silverlight-application/overview%}). For the others, the [NavigateToUrlAction](/reporting/api/Telerik.Reporting.NavigateToUrlAction) would be opened in a new window. 

# How to Add a Hyperlink Action

Add a hyperlink to a URL when you want users to be able to click a link in a report and open a browser to the URL you specify. You must ensure that the user has access to the URL that you provide i.e. it allows anonymous access or does not require credentials. You can add a hyperlink to a URL to any item that has an Action property. 

## Adding a Hyperlink action using Report Designer

1. In Design view, right-click a report item to which you want to add a link and then click __Properties__.

1. In the Properties dialog box, click __Action__.

1. Select __Navigate to URL__. An additional section appears in the dialog box for this option.

1. In __Target URL__  TextBox, type a URL or an expression that evaluates to a URL.

1. Click __OK__.

1. To test the link, run the report and click the report item with the applied __Action__. For TextBoxes, it is helpful to change the color and effect of the text to indicate that the text is a link. For example, change the color to blue and the effect to underline by setting the corresponding __Font__  properties of the TextBox.

## Adding a Hyperlink action programatically

{{source=CodeSnippets\CS\API\Telerik\Reporting\ActionSnippets.cs region=AddNewNavigateToUrlSnippet}}
{{source=CodeSnippets\VB\API\Telerik\Reporting\ActionSnippets.vb region=AddNewNavigateToUrlSnippet}}


## See Also

 * [Drillthrough Report Action]({%slug telerikreporting/designing-reports/adding-interactivity-to-reports/actions/drillthrough-report-action%})

 * [Bookmark Action]({%slug telerikreporting/designing-reports/adding-interactivity-to-reports/actions/bookmark-action%})
 
 * [Expressions Overview]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/overview%})
 
 * [Data Items Overview]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/overview%})
