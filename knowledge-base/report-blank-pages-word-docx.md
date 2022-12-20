---
title: Blank pages in report documents rendered to word (.docx) format
description: Blank pages in report documents rendered to word (.docx) format
type: troubleshooting
page_title: Blank pages in report documents rendered to word (.docx) format
slug: report-blank-pages-word-docx
position: 
tags: 
ticketid: 1156009
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
		<td>Word (.docx)</td>
	</tr>
</table>

## Description

Blank pages occur only when the report is rendered in Word and the PageNumber expression is the same on the blank and the previous page. In other extensions like PDF blank pages are not observed. 

Telerik Reporting Word rendering pages the report according to the report page settings. However when the report is opened in Word the report is once again paged. This second paging can sometimes result in blank pages.

## Suggested Workarounds

In Telerik Reporting R2 2018 SP1 we have made some improvements to the Word rendering to better supports __PageSettings.ContinuousPaper__ and
we have introduced to the expressions [Global Object]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/global-objects%}) `RenderingFormat.Name`. Thus now we can avoid the first paging with the following [Binding]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/using-expressions/bindings%}):

<table>
	<tr>
		<td>Property path</td>
		<td>Expression</td>
	</tr>
	<tr>
		<td>PageSettings.ContinuousPaper</td>
		<td>= RenderingFormat.Name = "DOCX"</td>
	</tr>
</table>

##Trade-off

The `PageNumber` and `PageCount` expressions will evaluate to 1 on all pages.

## See Also

[Bindings]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/using-expressions/bindings%})
