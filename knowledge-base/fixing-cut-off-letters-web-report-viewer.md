---
title: Resolving Letters Being Cut Off in the Web Report Viewer
description: Explains how to resolve the issue of letters being cut off in the Web Report Viewer, which does not occur in the standalone viewer or printed reports.
type: how-to
page_title: Fixing Cut-Off Letters in Web Report Viewer
meta_title: Fixing Cut-Off Letters in Web Report Viewer
slug: fixing-cut-off-letters-web-report-viewer
tags: reporting, textbox, web-report-viewer, text-cut-off, properties, can-shrink, measurement-units
res_type: kb
ticketid: 1693245
---

## Environment

<table>
<tbody>
<tr>
<td> Product </td>
<td> Reporting </td>
</tr>
<tr>
<td> Version </td>
<td> 19.1.25.716 </td>
</tr>
</tbody>
</table>

## Description

I noticed that some letters are cut off when viewing reports in the Web Report Viewer. The report displays correctly in the standalone viewer and when printed. Testing the issue in an empty project showed the same behavior, indicating it is not related to custom styling.

This knowledge base article also answers the following questions:
- How to fix text getting cut off in the Web Report Viewer?
- Why do letters appear truncated in the Web Report Viewer but not in the standalone viewer?
- How to adjust TextBox settings to display text correctly in Reporting?

## Solution

To resolve the issue, adjust the size and properties of the [TextBox](https://docs.telerik.com/reporting/report-items/textbox) controls in your report:

1. Increase the size of each `TextBox` element to ensure adequate space for text rendering.
2. Set the `CanShrink` property of each `TextBox` to `False`. This prevents the control from shrinking beyond the required dimensions for proper text display.
3. Switch the measurement units for your report to pixels (`px`) instead of millimeters (`mm`). Using pixels minimizes inaccuracies that can occur when switching between units.
4. Convert any dimensions in millimeters to pixels. For example, if the `RowHeight` is set to 4mm, convert it to pixels using a unit-conversion tool like [Convert Millimeter to Pixel (X)](https://www.unitconverters.net/typography/millimeter-to-pixel-x.htm). For 4mm, use approximately 15px.

### Example Adjustment

```xml
<TextBox Name="ExampleTextBox" Width="100px" Height="15px" CanShrink="False" />
```

Make similar adjustments for all `TextBox` elements in your report.

## See Also

- [TextBox Documentation](https://docs.telerik.com/reporting/report-items/textbox)
- [Convert Millimeter to Pixel (X)](https://www.unitconverters.net/typography/millimeter-to-pixel-x.htm)
- [Web Report Viewer Overview](https://docs.telerik.com/reporting/html5-web-report-viewer-overview)
