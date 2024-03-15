---
title: Creating a Funnel Chart in Telerik Reporting
description: Learn how to create a funnel chart in Telerik Reporting.
type: how-to
page_title: How to Create a Funnel Chart in Telerik Reporting
slug: create-funnel-chart-telerik-reporting
tags: Telerik Reporting,Funnel Chart,Bar Chart,Centered Bars
res_type: kb
---

## Environment

| Property | Value |
| --- | --- |
| Product | Progress® Telerik® Reporting |

## Description

I would like to create a funnel chart in Telerik Reporting. How can I achieve this?

## Solution

While there is no out-of-the-box funnel chart type in Telerik Reporting, one can achieve a similar result using the existing bar chart by [adding two bar series]({%slug telerikreporting/designing-reports/report-structure/graph/how-to/how-to-add-series%}) that share a category group and have opposite values.
For example, if the value field is called "Value", the X-axis expression can be `= Sum(Fields.Value) / 2.0` for one of the series and `= - Sum(Fields.Value) / 2.0` for the other.
This will force the two series to display on both sides of the Y-axis and center the bars in the graph's surface area.

## Demo
You can find a [Sample Funnel Chart Report](https://github.com/telerik/reporting-samples/blob/master/Sample%20Reports/Funnel%20Chart.trdx) that illustrates the above in our GitHub Reporting-Samples repository.

## Notes

Please note that this workaround provides a similar visual effect to a funnel chart. If Telerik Reporting implements a funnel chart type in the future, you may consider using that for a more streamlined approach.

## See Also

* [Add Series to the Graph]({%slug telerikreporting/designing-reports/report-structure/graph/how-to/how-to-add-series%})
* [Funnel Chart Report](https://github.com/telerik/reporting-samples/blob/master/Sample%20Reports/Funnel%20Chart.trdx)
