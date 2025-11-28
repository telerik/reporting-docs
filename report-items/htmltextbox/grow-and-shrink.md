---
title: Growing and Shrinking
page_title: Growing and Shrinking of the HtmlTextBox Report Item
description: "Learn how to accommodate the content of the Telerik Reporting HtmlTextBox report item by allowing it to grow or shrink correspondingly."
slug: htmltextbox_grow_and_shrink
tags: telerik, reporting, report, items, htmltextbox, growing, shrinking, accommodate, content
published: True
position: 5
reportingArea: General
---

# Growing and Shrinking of HtmlTextBox

By default, the HtmlTextBox report item has its size set.

To allow the HtmlTextBox to expand vertically based on its content, set its [`CanGrow`](/reporting/api/Telerik.Reporting.TextItemBase#Telerik_Reporting_TextItemBase_CanGrow) property to its default `True` value.

To allow the HtmlTextBox to shrink based on its content, set its [`CanShrink`](/reporting/api/Telerik.Reporting.TextItemBase#Telerik_Reporting_TextItemBase_CanShrink) property to `True`. By default, `CanShrink` is set to `False`. Note that the HtmlTextBox will always grow to accommodate the first line of text even when `CanGrow` is `False`.

## See Also

* [HtmlTextBox Class API Reference](/api/telerik.reporting.htmltextbox)
* [Demo Page for Telerik Reporting](https://demos.telerik.com/reporting)
* [Knowledge Base Section](/knowledge-base)
