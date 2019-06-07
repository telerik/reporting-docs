---
title: Searching inside PDF content in Adobe Reader returns incorrect results
description: This article explains how to fix the search functionality inside Adobe Reader
type: troubleshooting
page_title: PDF content search in Adobe Reader returns incorrect results
slug: adobe-reader-search-in-pdf-not-working
position: 
tags: pdf, search, incorrect, adobe, acrobat
ticketid: 
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
		<td>3rd Party Application</td>
		<td>Adobe Acrobat, Adobe Reader</td>
	</tr>
</table>

## Problem
Using **Ctrl+F (Find)** to search inside the content of a report exported to PDF returns incorrect results, for instance, highlighting words which are not containing the search term.

## Solution
While investigating this issue the Reporting team noticed that some PDF readers, such as Foxit Reader, return correct search results for the same PDF file. This clue led us to the conclusion that the issue might be connected to the Adobe Reader **Search** settings. To open the settings go to **Edit > Preferences > Search**. There you will find the **Purge Cache Contents** button which saved the day. After we purged the cache the search functionality started working flawlessly. To prevent this from happening again for any PDF file that you open, disable the caching by unchecking **Enable fast find**.