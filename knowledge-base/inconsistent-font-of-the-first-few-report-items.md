---
title: First Few Report Items Have an Incorrect Font
page_title: The font of the first few report items is not consistent with the rest
description: "Learn how to handle the scenario when the font of the first few report items is different from the rest, even though they use the same font and style in the report definition."
type: how-to
slug: inconsistent-font-of-the-first-few-report-items
res_type: kb
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

If you preview your report and notice that the first few report items do not have the font they are supposed to, but the rest of the items that are styled the same do, the following can be the issue.
If the application used to render the report is run under a separate user and the fonts used are not installed for **All Users**, the first few attempts the GDI+ library makes to resolve the fonts will fail. This will result in the first few items having a default fallback font.

## Solution 

Make sure that all fonts used in the report are installed for **All Users** on the machine used to render the report.
