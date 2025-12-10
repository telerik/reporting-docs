---
title: Panel
page_title: Panel Report Item at a Glance
description: "Learn more about the Telerik Reporting Panel which acts as a container for other report items and how to arrange its layout and accommodate its content through the supported global properties."
slug: telerikreporting/designing-reports/report-structure/panel
tags: telerik, reporting, report, items, panel, organize, layout, accommodate, content, shrink, global, properties
published: True
position: 8
previous_url: /report-items-panel, /reportitemspanel
reportingArea: General
---

# Panel Report Item Overview

The Panel report item serves as a container to group or separate multiple report items based on specific criteria, and is not associated with data.

> The Panel acts as a container for items that you either create inside it or drag into it. For example, if you draw a Panel around an item that already exists in the Report Designer, the Panel will not act as its container.

You can use the Panel to organize the layout of a report and allow the rendering of items without affecting the content outside the Panel itself.

The Panel grows to accommodate its content, and as of the R3 2016 release, you can set the report item to shrink by setting its `CanShrink` property to `true`.

The Panel enables you to set global properties, such as __Visible__, which affect all hosted report items.

When you move the Panel, the items that are contained within it move along with it.

The following image shows a Panel which contains two [TextBox]({%slug telerikreporting/designing-reports/report-structure/textbox%}) report items.

![A Panel with two TextBox report items](images/Panel.png)

## Next Steps 

* [Organizing the Report Layout with the Panel]({%slug telerikreporting/designing-reports/report-structure/design-considerations-for-report-item-layout%})
* [Using Styles to Customize Reports]({%slug telerikreporting/designing-reports/styling-reports/using-styles-to-customize-reports%})
* [(API) Panel](/api/Telerik.Reporting.Panel)
* [Demo Page for Telerik Reporting](https://demos.telerik.com/reporting)
* [Knowledge Base Section](/knowledge-base)

## See Also

* [Telerik Reporting Homepage](https://www.telerik.com/products/reporting)
* [Reporting Forums](https://www.telerik.com/forums/reporting)
* [Reporting Blog](https://www.telerik.com/blogs/tag/reporting)
* [Reporting Videos](https://www.telerik.com/videos/reporting)
* [Reporting Roadmap](https://www.telerik.com/support/whats-new/reporting/roadmap)
* [Reporting Pricing](https://www.telerik.com/purchase/individual/reporting)
* [Reporting Training](https://learn.telerik.com/learn/course/external/view/elearning/19/reporting-report-server-training)
