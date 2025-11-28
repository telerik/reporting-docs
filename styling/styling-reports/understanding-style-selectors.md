---
title: Style Selectors
page_title: Style Selectors at a glance
description: "Find out more about what a style selector is, the currently available style selectors, the differences between them, and how to use them."
slug: telerikreporting/designing-reports/styling-reports/understanding-style-selectors
tags: understanding, style, selectors
published: True
position: 1
previous_url: /style-understanding-style-selectors
reportingArea: General
---

# Understanding the Style Selectors

Style Selectors are used to define how a style will be applied globally to items in a report. Each Style Rule that you create (either in code or using the StyleRule Collection Editor) must be created as one of the following four selectors:

* `TypeSelector`
* `AttributeSelector`
* `StyleSelector`
* `DescendantSelector`

## Available Style Selectors

### TypeSelector

A `TypeSelector` applies to all report items of a particular type, for example a __Telerik.Reporting.TextBox__ or a __Telerik.Reporting.PageFooterSection__.

When a style is defined as a `TypeSelector`, the formatting for that style is automatically applied to all items on the report that match the type.

### AttributeSelector

An `AttributeSelector` applies to all report items with a particular attribute (such as Color=Red).

Using an `AttributeSelector` Style Rule, you could specify that any report item on the report that has children (for example. where the value of the `HasChildren` property is equal to `True` ) should be `Bold`.

### StyleSelector

A `StyleSelector` applies to all report items with a particular style name. When defining a `StyleSelector` style, use the `Name` property to create a name for the style. Each report item has a `StyleName` property. By setting the value of `StyleName` to the name of the `StyleSelector` Style Rule, that report item will display the attributes of the named style.

### DescendantSelector

A `DescendantSelector` applies to all parent/child report item combinations. The actual Style Rule for the child can be specified by any type of __Selector__.

For example, you can specify that any __TextBox__ that exists inside of a __ReportHeaderSection__ should have a particular style using a __TypeSelector__ within the __DescendantSelector__.

Alternatively, you can create multiple __StyleSelector__ Style Rules with the same Name and that descend from different report item types, such as __DetailSection__ or __GroupSection__. Report items with this Name value in their `StyleName` property will apply the correct style based on where they are placed in the report , even if they are moved.

## See Also

* [Using Styles to Customize Reports]({%slug telerikreporting/designing-reports/styling-reports/using-styles-to-customize-reports%})
* [Creating Style Rules]({%slug telerikreporting/designing-reports/styling-reports/creating-style-rules%})
