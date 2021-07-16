---
title: Graph item with DateTimeScale and one category slot displays only the first date of the year
description: Graph item with DateTimeScale and one category slot displays only the first date of the year.
type: how-to
page_title: Graph item with DateTimeScale and one category slot displays only the first date of the year
slug: graph-item-with-datetimescale-and-one-category-slot-displays-only-the-first-date-of-the-year
res_type: kb
---

## Description
  
Тhe Graph item with **DateTimeScale** and one category slot displays only the first date of the year.  
  
## Solution

The [DateTime](../t-telerik-reporting-datetimescale) scale is designed to work with a date range and it needs at least two dates in order to determine the minimum and maximum range values, and then - the used [BaseUnit](../p-telerik-reporting-datetimescale-baseunit). When the data doesn't supply such a range, the algorithm sets the [BaseUnit](../p-telerik-reporting-datetimescale-baseunit) to [Years](../t-telerik-reporting-datetimescaleunits) and falls back to the first date of the current year. That's why you will get a date like *2016-01-01*, if you change the **BaseUnit** to **Auto**.   
  

Set the **Minimum** and **Maximum** of the scale dynamically using [Bindings](../expressions-bindings) and the approach from [How to: Use Bindings to Control the Coordinate System Properties](../graphhowtousebindingstocontrolcsproperties).
