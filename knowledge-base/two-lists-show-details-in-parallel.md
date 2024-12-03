---
title: Report with Two Lists Showing the Same Data in Parallel Page by Page
description: "Learn how to create a report that shows the same data twice per page in parallel in Telerik Reporting."
type: how-to
page_title: Two Lists Showing the Same Data in Parallel
slug: two-lists-show-details-in-parallel
tags: telerik, reporting, group, list, paging
ticketid: 1670679
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

The purpose of the report we are going to create is to list a number of checks, each containing details representing multiple payments, and let them be printed with particular requirements:

1. Each check main/header information should be printed only on the page header of the first page associated with this check. The rest of the pages related to the check must contain static text in the page header, for example, 'Void'.
1. The details should be printed twice in parallel. The idea is for the printed reports to allow these two sections to be separated/cut, one going to the client and the other staying with the service provider.


The report layout consists of three parts. The top part contains the main information about the check.





the middle and bottom thirds will be slight variations on the check stub. The layout must be sufficiently flexible as to be able to handle an arbitrary number of PrintedCheck classes in the list. Furthermore, the check stub sections need to be sufficiently intelligent such that if there are more stub lines than will fit in a single section, a 2nd page will be generated which contains only the remaining stub lines but does not reprint the check in the top third.
