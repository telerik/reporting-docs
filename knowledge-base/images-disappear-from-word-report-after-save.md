---
title: Images Disappear from the DOCX Report Document after Saving It in Word
description: In large Word documents images may disappear after saving
type: troubleshooting
page_title: Images not shown in Word report
slug: images-disappear-from-word-report-after-save
position: 
tags: 
ticketid: 1536895
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
			<td>Export Format</td>
			<td>DOCX</td>
		</tr>
	</tbody>
</table>


## Description
You may experience the issue when you re-save the generated DOCX report using Microsoft Word.
After some pages, the images may start being substituted by the below error message.

## Error Message
"The linked image cannot be displayed. The file may have been moved, renamed, or deleted. Verify that the link points to the correct file and location."

## Steps to Reproduce
1) Export a large report in DOCX format from a ReporViewer or with the ReportProcessor. For example, a report with many images.

2) Open the generated DOCX file in Microsoft Word.

3) Save it again after a very short time to the same or another file. To reproduce the issue you need to make sure that the report hasn't been entirely opened by Word 
when you save it.

4) Close Word and open the just saved DOCX file.

## Cause\Possible Cause(s)
The issue is probably due to the time that Word uses for rendering all the pages of the document. If you save before this rendering has finished, Word saves the 
DOCX file without the images on the last pages as they haven't been loaded.

## Solution
Make sure that the Microsoft Word application has opened the entire document before saving the DOCX file.

## Note
The issue does not occur in any Telerik ReportViewer but only after saving the DOCX file and opening with Word.
