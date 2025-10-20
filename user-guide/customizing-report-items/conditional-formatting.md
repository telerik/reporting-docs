---
title: Conditional Formatting 
page_title: Web Report Designer - Conditional Formatting 
description: Learn how to apply conditional formatting in Telerik Web Report Designer to dynamically style report items based on data values or expressions, improving readability and visual impact.
slug: wrd-conditional-formatting
tags: web, report, design, customize, style, condition, formatting, properties, area 
published: True
position: 1
---
<style>
img[alt$="><"] {
  border: 1px solid lightgrey;
}
</style>

# Conditional Formatting 

To apply certain styling to report items, based on the value of a specific field, **Conditional formatting** is the way to do it. This approach allows you to dynamically change the appearance of report items based on data values or expressions (conditions). Thus, you can indicate values outside the expected range, e.g. if you want to visualize a TextBox, showing revenue, in red color if the revenie is less than 10000.

The following video tutorial shows how to display a Table Report Item (e.g. **LineTotal** TextBox) indicating the value in red color if the `value is less than 50` (condition) to increase the readability.

<iframe width="560" height="315" src="https://www.youtube.com/embed/gU749jR899U?si=RrgBdmOvMVWKH-I8" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

When **multiple** items are selected, even though ConditionalFormatting is technically supported on each individual item, the designer cannot guarantee consistent behavior across all selected items. Hence, it does not allow batch editing of conditional formatting rules to make alternating row style for all the cells belonging to the table row. It requires you to apply rules **individually** to each item:
* Select each TextBox (or other report item) one at a time.
* Add the same conditional formatting rule manually.

An alternative approach is to wrap multiple items in a Panel and apply conditional formatting to the panel. This approach is shown in the following video: 

<iframe width="560" height="315" src="https://www.youtube.com/embed/oise1nWPJ0I?si=3yaiqnIwZxoJgdKO" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

 


## See Also

* [Web Report Designer]({%slug user-guide/overview%})
* [Styling the Report]({%slug telerikreporting/designing-reports/styling-reports/using-styles-to-customize-reports%})
