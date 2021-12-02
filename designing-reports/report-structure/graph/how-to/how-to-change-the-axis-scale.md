---
title: How to Change the Axis Scale
page_title: How to Change the Axis Scale | for Telerik Reporting Documentation
description: How to Change the Axis Scale
slug: telerikreporting/designing-reports/report-structure/graph/how-to/how-to-change-the-axis-scale
tags: how,to,change,the,axis,scale
published: True
position: 5
---

# How to Change the Axis Scale



You can customize the scale to better meet your needs. When the values that are plotted in the chart cover a very large range,         you can change the axis scale to a Logarithmic scale. In other cases you may need a DateTime scale.       

## How to change the axis scale to Logarithmic:

1. On the design surface, click on the axis.             The selected axis properties are listed in the Property Browser.             

1. In the __Misc__  section for __Scale__  select the __Logarithmic Scale__  option.             

1. Set the __Groupings__  and __Series.X/X0/Y/Y0__  expressions to a __numeric__  field.             

## How to change the axis scale to Numerical:

1. On the design surface, click on the axis.             The selected axis properties are listed in the Property Browser.             

1. In the __Misc__  section for __Scale__  select the __Numerical Scale__  option.             

1. Set the __Groupings__  and __Series.X/X0/Y/Y0__  expressions to a __numeric__  field.             

## How to change the axis scale to DateTime:

1. On the design surface, click on the axis.             The selected axis properties are listed in the Property Browser.             

1. In the __Misc__  section for __Scale__  select the __DateTime Scale__  option.             

1. Set the __Groupings__  and __Series.X/X0/Y/Y0__  expressions to a __DateTime__  field.             

## How to change the axis scale to Category:

1. On the design surface, click on the axis.             The selected axis properties are listed in the Property Browser.             

1. In the __Misc__  section for __Scale__  select the __Category Scale__  option.             

1. Remove the corresponding field from the series definition. If you have selected the X axis, remove the __Series.X/X0__  expression.               If you have selected the Y axis, remove the __Series.Y/Y0__  expression.                The entries (labels and tick marks for the category axis) are determined by the fields used in the CategoryGroups.Groupings expression.             

>note The Scale settings are reset to  __Category Scale__ , when you use the Report Designer to change the Graph or specific Series Chart Type.           


# See Also

