---
title: Font Is Missing in the Report Designers
description: "Learn the reason why some fonts may not be found by the report designers."
type: troubleshooting
page_title: Font is not available in the report designers
slug: font-is-missing-in-report-designers
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
			<td>All</td>
		</tr>
		<tr>
			<td>Report Designer</td>
			<td>All</td>
		</tr>
	</tbody>
</table>

## Description

In this article, we will explain why a font may be missing in the Report Designers and how to possibly fix that.

## Solution

- Is the missing font **OpenType**?

The Telerik Reporting engine uses the **GDI+** library and depends on the fonts that **GDI+** supports.

In this line of thought, .NET supports **only** TrueType fonts. Thus, you can not use **OpenType** fonts with Telerik Reporting. If applicable. you can convert the OpenType font to **TrueType** using a [free online converter](http://www.freefontconverter.com/).

> If the font is TrueType, check if the font is installed in **%windir%\fonts**.

## See Also

* [How to install or remove a font in Windows](https://support.microsoft.com/en-us/windows/how-to-install-or-remove-a-font-in-windows-f12d0657-2fc8-7613-c76f-88d043b334b8)
