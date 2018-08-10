---
title: How to invoke Print Dialog from a web page without displaying the report
description: Invoke Print Dialog for a report but keep the original page content
type: how-to
page_title: Force browser to display Print Dialog without loading the report on the page
slug: display-print-dialog-without-displaying-report-on-webpage
position: 
tags: 
ticketid: 1337304
res_type: kb
---

## Environment
<table>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting</td>
	</tr>
</table>


## Description
Print a report directly at client-side without displaying it in the web page.

## Solution
The general approach is explained and demonstrated in the [Print a report directly at client-side without displaying it in a Viewer](https://www.telerik.com/support/kb/reporting/details/print-a-report-directly-at-client-side-without-displaying-it-in-a-viewer).

To avoid displaying the PDF report on the page, instead of creating a response that will update the current page, use an invisible _iframe_ attached run time, where to open the generated PDF. The PDF document should be saved in a folder accessible by the application, so that the _src_ attribute of the _iframe_ can point to the file.

Sample _ASP.NET Web Forms_ projects :

[ClientPrintingCSharp.zip](https://www.telerik.com/docs/default-source/knowledgebasearticleattachments/reporting/clientprintingcsharp.zip?sfvrsn=419df686_2)

[ClientPrintingVB](https://www.telerik.com/docs/default-source/knowledgebasearticleattachments/reporting/clientprintingvb.zip?sfvrsn=6abcacde_2)
