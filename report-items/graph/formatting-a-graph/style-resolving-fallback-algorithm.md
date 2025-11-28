---
title: Series Style Propagation
page_title: Style Resolving Fallback Algorithm
description: "Learn more about the style resolving fallback algorithm and the way the styles of the Graph report item are propagated when working with Telerik Reporting."
slug: telerikreporting/designing-reports/report-structure/graph/formatting-a-graph/style-resolving-fallback-algorithm
previous_url: /report-items/graph/formatting-a-graph/overview, /style-resolving-fallback-algorithm
tags: telerik, reporting, report, items, graph, styling, formatting, style, resolving, fallback, algorithm, propagation
published: True
position: 0
reportingArea: General
---

# Propagation of the Graph Series Styles

The diagram in this article illustrates the way the series styles of the Graph are propagated and how the style resolving algorithm falls back among the style definitions.

* The boxes on the top row represent the report items contained in a Graph series.
* __Applicable properties__ is a list of properties that are applied to the report item style.

	If set, the [conditional formatting rules and definitions]({%slug telerikreporting/designing-reports/styling-reports/conditional-formatting%}) affect the report item style.

* The **LegendItem Mark** consists of a line and a marker. The color of the mark line is set by the line color of the **LineSeries**. The color of the marker and its line properties are affected by the **DataPointStyle** definition.
* Setting a conditional formatting rule that changes the line style on the Line or Area series definition will affect the line style of the legend marker. However, setting a similar conditional formatting rule on the **DataPoint** will not affect the marker style of the **LegendItem** and it will be only applied on the **DataPoint** style.

![A Diagram of the Style Resolving Fallback Algorithm Showing how the Series Styles of the Graph are Propagated](images/Graph/StyleResolvingFallbackAlgorithm.png)

## See Also

* [Demo Page for Telerik Reporting](https://demos.telerik.com/reporting)
* [Structure and Elements of the Graph]({%slug telerikreporting/designing-reports/report-structure/graph/structure%})
* [Conditional Formatting]({%slug telerikreporting/designing-reports/styling-reports/conditional-formatting%})
* [Style Inheritance and Overriding]({%slug telerikreporting/designing-reports/styling-reports/style-inheritance-and-overriding%}) 
* [GraphSeries](/api/Telerik.Reporting.GraphSeries)
