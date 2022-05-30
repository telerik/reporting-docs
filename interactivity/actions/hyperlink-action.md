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

# See Also

 * [How to: Add a Hyperlink Action]({%slug telerikreporting/designing-reports/adding-interactivity-to-reports/actions/how-to/how-to-add-a-hyperlink-action%})
 