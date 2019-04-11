---
title: Design Time Problems. A multi-column report shows as a one-column report when used as a subreport.
description: A multi-column report shows fine when using Preview, but when used as a subreport, it shows as a one-column report only.
type: troubleshooting
page_title: A multi-column report shows as a one-column report when used as a subreport.
slug: troubleshooting-design-time-multi-column-report-shows-as-one-column-report-when-used-as-subreport
position: 
tags: 
ticketid: 
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
A multi-column report shows fine when using Preview, but when used as a subreport, it shows as a one-column report only.

## Solution
The multi-column functionality is intended to be used only in the main report because all report sections (excluding Page sections) are rendered in a column-wise layout. Thus the report can be only one column wide, and only its final content when growing will initially take the first column, then the next and so on. However, the content of the report items (including SubReports) cannot be split horizontally among the main report columns.
