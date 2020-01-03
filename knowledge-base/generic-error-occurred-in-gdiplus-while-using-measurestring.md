---
title: “A generic error occurred in GDI+” while using MeasureString
description: Very long strings in TextBox cause GDI+ error
type: troubleshooting
page_title: GDI+ error for string with more than 32000 symbols
slug: generic-error-occurred-in-gdiplus-while-using-measurestring
position: 
tags: GDI+, generic error
ticketid: 1167211
res_type: kb
---

## Environment
<table>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting </td>
	</tr>
</table>


## Description
GDI+ error can occur when previewing a report if there is a report item (TextBox) containing a very long string (more than __32000 symbols__).

## Solution
["A generic error occurred in GDI+" while using MeasureString](https://stackoverflow.com/questions/30556042/a-generic-error-occurred-in-gdi-while-using-measurestring) is a bug introduced in Windows 8, as discussed in the referred Stackoverflow thread. 
  
To overcome the problem with rendering very long text we strongly recommend to **limit** the string lengths of the incoming data to 32000 symbols.
If this is not possible, consider the following workaround.

## Suggested Workarounds
Instead of TextBox use a **List** data item with a single TextBox inside. The DataSource of the List can be an _ObjectDataSource_ with a single string _Field_ - the Text to be displayed.  
The DataMember of the ObjectDataSource should return a single record when the Text is less than 32000 symbols.  
When the Text length is in the interval (32000, 64000\] symbols the Text should be split in two data records, and so on. 
This way the Text will be displayed in the appropriate number of TextBoxes (with less that 32000 symbols) depending on its length.

Sample C# and VB ReportLibrary projects demonstrating the approach can be found in [our GitHub samples](https://github.com/telerik/reporting-samples/tree/master/DisplayTextWithMoreThan3200symbols). You need to build the projects and preview the Reports with the Visual Studio Report Designer. Select the text option for the Report Parameter value to see the large text that is displayed in a List component in a series of dynamically generated TextBoxes.
