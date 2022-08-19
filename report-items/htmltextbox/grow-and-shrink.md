---
title: HtmlTextBox Overview
page_title: HtmlTextBox Report Item Overview
description: "Learn more about the Telerik Reporting HtmlTextBox report item and its key features covering style through HTML tags and CSS attributes, using embedded expressions, and more."
slug: telerikreporting/designing-reports/report-structure/htmltextbox/overview
tags: telerik, reporting, report, items, htmltextbox, overview, key, features
published: True
position: 0
previous_url: /report-items-html-text-box
---

# Growing and Shrinking

By default, HtmlTextBoxes are a set size. If you want to allow an HtmlTextBox to expand vertically based on its contents, set the [CanGrow](/reporting/api/Telerik.Reporting.TextItemBase#Telerik_Reporting_TextItemBase_CanGrow)  property to True (default value). If you want to allow a TextBox to shrink based on its contents, set the [CanShrink](/reporting/api/Telerik.Reporting.TextItemBase#Telerik_Reporting_TextItemBase_CanShrink) property to True (default value is False). The HtmlTextBox would always grow to accommodate the first line of text even when _CanGrow_ is _False_. 

