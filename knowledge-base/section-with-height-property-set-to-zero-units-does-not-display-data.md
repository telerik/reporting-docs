---
title: Section with Height property set to 0(zero) units does not display data
description: A 'Property value is not valid.' error is thrown when a report section's/item's Height is set to zero.
type: how-to
page_title: Setting the Height of section to zero leads to an error
slug: section-with-height-property-set-to-zero-units-does-not-display-data
res_type: kb
---

## Environment

<table>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting</td>
	</tr>
	<tr>
		<td>Version</td>
		<td>R3 2016 and later</td>
	</tr>
</table>

## Cause\Possible Cause(s)

A Section's **Height** is set to 0(zero).

## Error Message

_Property value is not valid._

## Description

Setting a section's **Height** property via binding or code to 0 or _tending_ to 0 leads to an error after upgrading to **Telerik Reporting R3 2016**.

## Solution

In older versions, a commonly used workaround for shrinking sections was to set the sections' **Height** property via binding or in code behind to 0 or _tending_ to 0 (zero) units. We recommend changing the manually set **Height** to **at least 1px.**

## Notes

As of **R3 2016**, sections and Panel items have a **CanShrink properties** that should be used instead of setting manually their **Height properties**.

## See Also

- [Design Considerations for Report Item Layout]({%slug telerikreporting/designing-reports/report-structure/design-considerations-for-report-item-layout%}).
