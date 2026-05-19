---
title: Create a Feature Report with a Custom TOC Level
page_title: Create a Feature Report with a Custom TOC Level
description: "Build a Telerik Reporting feature report that demonstrates controlled table of contents hierarchy by using TocText and TocLevel."
type: how-to
slug: create-feature-report-custom-toc-level
tags: reporting, toc, table-of-contents, toclevel, toctext
ticketid: 1704368
res_type: kb
---

## Environment

<table>
  <tbody>
    <tr>
      <td>Product</td>
      <td>Progress® Telerik® Reporting</td>
    </tr>
    <tr>
      <td>Product Version</td>
      <td>2026 Q1 (20.0.26.402) and later</td>
    </tr>
    <tr>
      <td>Report Designer</td>
      <td>Standalone Report Designer or Visual Studio Report Designer</td>
    </tr>
  </tbody>
</table>

## Description

Create a simple feature report that demonstrates how `TocLevel` controls the TOC hierarchy independently from the default report structure.

The walkthrough uses static content so that you can reproduce the result without a custom data source.

## Solution

Use this procedure:

1. Create a new blank report.
1. Add a **Table of Contents** section from the report context menu.
1. In the **Properties** pane of the TOC section, open the `Levels` editor and add three levels.
1. In the report **Detail** section, add three **TextBox** items and set these values:
   - `TextBoxCountry`:
     - `Value`: `Country`
     - `TocText`: `Country`
   - `TextBoxCity`:
     - `Value`: `City`
     - `TocText`: `City`
   - `TextBoxStore`:
     - `Value`: `Store Name`
     - `TocText`: `Store Name`
1. Preview the report and verify that the TOC order follows the default hierarchy and item order.
1. Return to design view and set explicit TOC levels:
   - `TextBoxCountry` -> `TocLevel = 1`
   - `TextBoxStore` -> `TocLevel = 2`
   - `TextBoxCity` -> `TocLevel = 3`
1. Preview the report again and verify that the TOC now uses the custom level mapping.

The following structure is expected after the override:

```text
Level 1
└─ Country

Level 2
└─ Store Name

Level 3
└─ City
```

>note `TocLevel` has effect only when `TocText` is set on the same report item, section, or group.

>note `TocLevel` must evaluate to an integer that is greater than or equal to `1`.

## See Also

- [Table of Contents Overview](slug:telerikreporting/designing-reports/adding-interactivity-to-reports/table-of-contents/overview)
- [Controlled TOC Hierarchy](https://www.telerik.com/products/reporting/documentation/interactivity/table-of-contents/overview#controlled-toc-hierarchy)
- [ReportItemBase.TocText API](/api/Telerik.Reporting.ReportItemBase#Telerik_Reporting_ReportItemBase_TocText)
- [ReportItemBase.TocLevel API](/api/Telerik.Reporting.ReportItemBase#Telerik_Reporting_ReportItemBase_TocLevel)
