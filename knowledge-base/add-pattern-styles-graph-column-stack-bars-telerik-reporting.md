---
title: Adding Pattern Styles to Graph Column Stack Bars
description: Learn how to add pattern styles to graph column stack bars using background images in Telerik Reporting.
type: how-to
page_title: How to Add Pattern Styles to Graph Column Stack Bars
slug: add-pattern-styles-graph-column-stack-bars-telerik-reporting
tags: telerik, reporting, graph, column stack bar, pattern style, background image
res_type: kb
ticketid: 1634546
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

This knowledge base article explains how to add pattern styles to graph column stack bars in Telerik Reporting using background images. The goal is to achieve visually appealing pattern styles similar to those seen in specific designs or screenshots.

This knowledge base article also answers the following questions:
- How to use background images to create pattern styles in graph column stack bars?
- What kind of image should be used to create a specific pattern style in Telerik Reporting?
- How to adjust the density of a pattern style in graph column stack bars?

## Solution

To add a pattern style to graph column stack bars in Telerik Reporting, use the background image property of the graph column. Creating patterns involves using small images and taking advantage of the repeat functionality. The key is to adjust the size of the background image to control the pattern's density.

1. Create a small image (e.g., 10x10 pixels) using an image editing tool like Paint. This image will serve as the pattern.
2. Save the image in an accessible location for your Telerik Report project.
3. In your Telerik Report designer, select the graph column stack bar you wish to style.
4. Set the `BackgroundImage` property of the graph column stack bar to the path of your created image.
5. Use the `BackgroundRepeat` property to set how the image should repeat. This creates the pattern effect across the graph column stack bar.
6. Adjust the size of the image if necessary to control the pattern's density. Smaller images will create a denser pattern, while larger images will create a more sparse pattern.

By following these steps, you can achieve a pattern style similar to the desired design in your Telerik Report. Experiment with different sizes and designs of the background image to find the perfect pattern for your report.

## See Also

- [Telerik Reporting Graphs](https://docs.telerik.com/reporting/graphoverview)
- [How to use the Report Designer](https://docs.telerik.com/reporting/standalonereportdesigner)
- [Styling Reports](https://docs.telerik.com/reporting/styling-reports)
