---
title: How to preserve the wider whitespace in the HtmlTextBox elements text
description: How to respect the whole whitespace in the text of the elements of the HtmlTextBox
type: how-to
page_title: Keep whitespace in HtmlTextBox
slug: how-to-keep-whitespace-in-htmltextbox
position: 
tags: 
ticketid: 1518771
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
The whitespace in the Html elements, for example, the paragraph `<p>` element of the HtmlTextBox is reduced to a single space. This article explains how you may keep 
the whole whitespace.

## Suggested Workarounds
You may use the `&nbsp;` (non-breaking space) extended HTML character. For example, you may replace the occurrence of two spaces with `&nbsp;&nbsp;` through 
the built-in _Replace_ [Text Function]({% slug telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/functions/text-functions %}).  
Here is a sample [Expression]({% slug telerikreporting/designing-reports/connecting-to-data/expressions/overview %}) :
```
=Replace(Fields.Value,'  ','&nbsp;&nbsp;')
```
