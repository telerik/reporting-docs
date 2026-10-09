---
title: Excluding Report Items from the Accessibility Tree
page_title: Excluding Report Items from PDF and HTML5 Accessibility Trees
description: "Learn how to use the AccessibleRole property to exclude report items from PDF and HTML5 accessibility trees while keeping rendered content visible."
slug: telerikreporting/designing-reports/exclude-report-items-from-accessibility-tree
tags: accessibility,accessible-role,pdf,html5,expressions
tag: new
published: True
position: 17
reportingArea: General
components: [general]
---

# Excluding Report Items from PDF and HTML5 Accessibility Trees

Set the `AccessibleRole` property to `Ignored` to keep a report item out of the accessibility tree without hiding it from the rendered report. This behavior applies to accessible PDF and HTML5 output.

> The feature was introduced with [Telerik Reporting 2026 Q3 (20.2.26.1007)](https://www.telerik.com/support/whats-new/reporting/release-history/progress-telerik-reporting-2026-q3-(20-2-26-1007))

## Overview

The `Ignored` value is case-insensitive. You can set it directly or use the `AccessibleRoles.Ignored` reporting constant in an expression:

`=AccessibleRoles.Ignored`

The ignored item and all its descendants are excluded from the accessibility tree. The report content remains visible.

## PDF Rendering

Enable PDF accessibility to apply the `Ignored` role to the tagged structure tree. Telerik Reporting omits the ignored item and its descendants from that tree, and renders their visual content as artifacts.

The ignored content remains visible in the PDF, but are hidden from screen readers.

## HTML5 Rendering

When HTML5 accessibility is enabled, the ignored item and its descendants remain in the DOM and in the visual output. Telerik Reporting adds `aria-hidden="true"` to every element in the ignored subtree, so screen readers skip the content.

This per-element attribute also applies to descendants of containers. The HTML5 renderer can place report items as separate sibling elements in the DOM, so hiding only the container element would not hide those descendants from assistive technologies.

## Container Scope

Setting `AccessibleRole` to `Ignored` on a container excludes the container and all its descendants. This includes report sections, panels, tables, table rows and cells, and subreports.

A normal container can also contain both ignored and accessible children.

## See Also

- [Use reporting constants in expressions](slug:telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/constants)
- [AccessibleRole property](/api/Telerik.Reporting.ReportItemBase#Telerik_Reporting_ReportItemBase_AccessibleRole)
- [AccessibleRoles enum](/api/Telerik.Reporting.AccessibleRoles)
