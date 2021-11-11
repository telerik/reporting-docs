---
title: Conditional Page Breaks.
description: Inserting Page Breaks under certain conditions. 
type: how-to
page_title: Insering Page Breaks.
slug: conditional-page-breaks
res_type: kb
---

## Environment

<table>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting</td>
	</tr>
  	<tr>
		<td>Rendering Extension</td>
		<td>PDF</td>
	</tr>
</table>

## Description

A common report layout includes report groups. Often to visually distinguish these groups, a page break is added to the last group footer section. However, when you have another report section after the group section with **PageBreak=After**, the design behavior is to push the content to a new page. 

This is desired for the different group instances but sometimes you want to render a report footer section immediately after the last group footer. In this case, the most straightforward solution is to apply [Binding](../expressions-bindings) to the first group header section:  
  
## Solution

|  Property path   <br> |   Expression |
| --- | --- |
|  PageBreak |   = IIF(RowNumber()&gt;1, 'Before', 'None') |

  
[PageBreak enum values](../t-telerik-reporting-pagebreak) are as follows:  
  
- None

- Before

- After

- BeforeAndAfter   

