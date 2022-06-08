---
title: Expanding and Shrinking
page_title: Expanding and Shrinking
description: "Learn how to expand and shrink the Checkbox report item when working with Telerik Reporting."
slug: checkbox_expanding_shrinking
tags: telerik, reporting, report, items, checkbox, growing, shrinking
published: True
position: 2
---

# Expanding and Shrinking

By default, the size of a CheckBox item is set. 

To allow a CheckBox to expand vertically based on its contents, set the [`CanGrow`](/reporting/api/Telerik.Reporting.TextItemBase#Telerik_Reporting_TextItemBase_CanGrow) property to its default `True` value. 

To allow a CheckBox to shrink based on its contents, set the [`CanShrink`](/reporting/api/Telerik.Reporting.TextItemBase#Telerik_Reporting_TextItemBase_CanShrink) property to `True`. By default, `CanShrink` is `False`. The CheckBox will always enlarge to accommodate the first line of text even when `CanGrow` is `False`. 

