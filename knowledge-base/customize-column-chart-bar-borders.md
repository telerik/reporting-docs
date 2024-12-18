 ---
title: Setting Borders on Column Chart Bars
description: "Learn how to customize the borders of bar elements within a column chart in Telerik Reporting."
type: how-to
page_title: How to Customize Column Chart Bar Borders
slug: customize-column-chart-bar-borders
tags: progress® telerik® reporting, chart, column, border, style
res_type: kb
ticketid: 1673094
---

## Description

In Telerik Reporting, you may want to customize the appearance of column chart bars by setting borders around them for visual emphasis or stylistic purposes. This knowledge base article answers the following questions:

- How can I set borders for the bars of a column chart?
- What properties control the appearance of bar borders in a column chart?
- Can I set only the left and right borders of a column chart bar?

## Environment

| Product | Version          |
| ------- | ---------------- |
| Progress® Telerik® Reporting | 18.3.24.1112 |

## Solution

To customize the borders of the bars in a column chart, follow these steps:

1. Select the bar you want to customize within the column chart.
2. Expand the **DataPointStyle** property of the selected bar.
3. To define the appearance of the bar borders, use the **LineWidth**, **LineColor**, and **LineStyle** properties. 
   - **LineWidth**: Sets the thickness of the border. If it's set to 0, no border will be displayed. To show the border, specify a positive value, such as `5px`.
   - **LineColor**: Determines the color of the border.
   - **LineStyle**: Defines the style of the border lines, such as solid, dashed, or dotted.

The following screenshot shows what the bar would look like with borders.

![Setting Borders on Column Chart Bars](images/BordersOnColumnChartBars.png)

> It's important to note that it is not possible to set borders only on the left and right sides of the bars. The border will enclose the bar on all four sides once the **LineWidth** is set to a value greater than 0.

## See Also

- [Telerik Reporting Documentation]({%slug telerikreporting/welcome-to-telerik-reporting!%})
- [Change the Gap between the Bars in the Graph]({%slug telerikreporting/designing-reports/report-structure/graph/how-to/how-to-change-the-gap-between-the-bars%})
- [Add Series to the Graph]({%slug telerikreporting/designing-reports/report-structure/graph/how-to/how-to-add-series%})
