---
title: Search Inside PDF Content in Adobe Reader Returns Incorrect Results
page_title: PDF Content Search in Adobe Reader Returns Incorrect Results
description: "Learn how to fix the search functionality inside Adobe Reader when it returns incorrect results from documents generated with Telerik Reporting."
type: troubleshooting
slug: adobe-reader-search-in-pdf-not-working
tags: telerik, reporting, pdf, search, incorrect, adobe, acrobat
res_type: kb
---

## Environment

<table>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting</td>
	</tr>
	<tr>
		<td>Rendering Format</td>
		<td>PDF</td>
	</tr>
	<tr>
		<td>Third-Party Application</td>
		<td>Adobe Acrobat, Adobe Reader</td>
	</tr>
</table>

## Description

Using `Ctrl`+`F` (the Find functionality) to search inside the content of a report exported to PDF returns incorrect results. For example, highlighting words which are not containing the search term.

## Solution

Some PDF readers, such as Foxit Reader, return correct search results for the same PDF file. Therefore, the issue might be connected to the **Search** settings of Adobe Reader.

To open and update the settings, go to **Edit** > **Preferences** > **Search**. Click the **Purge Cache Contents** button to purge the cache and enable the search functionality to work flawlessly.

To prevent this issue from happening again for any PDF file that you open, disable the caching by unchecking **Enable fast find**.
