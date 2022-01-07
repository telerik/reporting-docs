---
title: Understanding Style Selectors
page_title: Understanding Style Selectors | for Telerik Reporting Documentation
description: Understanding Style Selectors
slug: telerikreporting/designing-reports/styling-reports/understanding-style-selectors
tags: understanding,style,selectors
published: True
position: 1
---

# Understanding Style Selectors


Style Selectors are used to define how a style will be applied globally to items in a report. Each Style Rule that you create (either in code or using the StyleRule Collection Editor) must be created as one of the following four selectors:

* __TypeSelector__ 

* __AttributeSelector__ 

* __StyleSelector__ 

* __DescendantSelector__ 

## Understanding Style Selectors

### TypeSelector

A __TypeSelector__  applies to all report items of a particular type, for example a __Telerik.Reporting.TextBox__  or a __Telerik.Reporting.PageFooterSection__.


When a style is defined as a __TypeSelector__ , the formatting for that style is automatically applied to all items on the report that match the type.

### AttributeSelector

An __AttributeSelector__  applies to all report items with a particular attribute (such as Color=Red). 

Using an __AttributeSelector__ Style Rule, you could specify that any report item on the report that has children (for example. where the value of the __HasChildren__  property is equal to __True__ ) should be __Bold__.

### StyleSelector

A __StyleSelector__  applies to all report items with a particular style name. When defining a __StyleSelector__  style, use the __Name__  property to create a name for the style. Each report item has a __StyleName__  property. By setting the value of __StyleName__  to the name of the __StyleSelector__  Style Rule, that report item will display the attributes of the named style.

### DescendantSelector

A __DescendantSelector__  applies to all parent/child report item combinations. The actual Style Rule for the child can be specified by any type of __Selector__. 

For example, you can specify that any __TextBox__  that exists inside of a __ReportHeaderSection__  should have a particular style using a __TypeSelector__  within the __DescendantSelector__. 

Alternatively, you can create multiple __StyleSelector__ Style Rules with the same Name and that descend from different report item types, such as __DetailSection__  or __GroupSection__. Report items with this Name value in their __StyleName__  property will apply the correct style based on where they are placed in the report , even if they are moved.

# See Also


 * [Using Styles to Customize Reports]({%slug telerikreporting/designing-reports/styling-reports/using-styles-to-customize-reports%})

 * [Creating Style Rules]({%slug telerikreporting/designing-reports/styling-reports/creating-style-rules%})
