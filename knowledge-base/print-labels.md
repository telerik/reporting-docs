---
title: Preferred Rendering Extension for Producing Labels
description: "Learn what is the preferred report rendering extension for producing labels and how to print labels with the best result."
type: how-to
page_title: What is the preferred rendering extension for printing labels?
slug: print-labels
tags: 
res_type: kb
---

## Environment

<table>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting</td>
	</tr>
</table>

## Description and Solution

To achieve the best results when producing labels, use the desktop viewers ([WinForms]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/windows-forms-application/overview%}) or [WPF]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/wpf-application/overview%})). You can directly print the report from the viewer (as they are working directly with the printer settings). Or, if you want to store the report for later use, you can export it to PDF or TIFF and print it later. The PDF and TIFF image formats are page-oriented formats. As a result, you can set properties to precisely control how pages will look when viewed in PDF or TIFF formats. That makes this formats more suitable for printing on paper.
