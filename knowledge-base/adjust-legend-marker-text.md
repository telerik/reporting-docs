---
title: Adjusting Legend Marker Position
description: Learn how to move the legend marker closer to the legend text in Telerik Reporting charts.
type: how-to
page_title: How to Move Legend Markers Closer to the Text
slug: adjust-legend-marker-text
tags: legend, chart, styling, telerik, reporting
res_type: kb
ticketid: 1672494
---

## Environment

<table>
<tbody>
<tr>
<td>Product</td>
<td>Progress® Telerik® Reporting</td>
</tr>
</tbody>
</table>

## Description

In Telerik Reporting, adjusting the position of the legend markers relative to the legend text can enhance the readability and aesthetic appeal of your reports. This knowledge base article also answers the following questions:
- How can I customize the legend item padding in Telerik Reporting?
- Is it possible to adjust the spacing between legend markers and text?
- What methods are available for styling the legend in Telerik Reporting?

## Solution

To adjust the legend marker position in Telerik Reporting, you have two main approaches:

### Using the Map Legend Styling and Formatting

Refer to the official Telerik documentation on [Styling and Formatting the Map Legend](https://docs.telerik.com/reporting/report-items/map/formatting-a-map/legend#setting-the-size) to learn how to position your legend item effectively. This guide provides comprehensive instructions on customizing the appearance of your map legend, including size and positioning.

### Adjusting Legend Text Padding

For more precise control over the spacing between the legend markers and the text, the `Series.LegendItem.Style.Padding` property offers a flexible solution. By applying negative padding, you can move the legend text closer to the markers. The `Padding` property affects the space around the legend text, allowing for fine-tuning of its position relative to the legend markers.

Here's an example on how to adjust the padding:

```csharp
// Adjust the legend text padding to move it closer to the markers
yourSeries.LegendItem.Style.Padding.Left = -10; // Adjust the value as needed
```

This code snippet demonstrates how to customize the left padding of the legend item's style, effectively moving the text closer to the legend markers. Adjust the padding value according to your specific layout requirements.

## See Also

- [Telerik Reporting Documentation](https://docs.telerik.com/reporting/)
- [API Reference: GraphSeriesBase.LegendItem Property](https://docs.telerik.com/reporting/api/telerik.reporting.graphseriesbase#collapsible-Telerik_Reporting_GraphSeriesBase_LegendItem)
- [Formatting a Map Legend in Telerik Reporting](https://docs.telerik.com/reporting/report-items/map/formatting-a-map/legend#setting-the-size)
