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

The purpose of the report we are going to create is to list a number of _checks_, each containing details representing multiple _check stubs_, and let them be printed with particular requirements:

1. Each _check_ should start on a new page and its main/header information should be printed only on the page header of the first page associated with this _check_. The rest of the pages related to the _check_ must contain static text in the page header, for example, 'Void'.
1. The _stubs_ for the _check_ should be printed twice in parallel. The idea is for the printed reports to allow these two sections with the _check stubs_ to be easily cut, one going to the payees for their records.

## Solution

The report layout consists of three parts. The top part contains the main information about the _check_, or the static text ('Void') in a [Page Header]({%slug telerikreporting/designing-reports/report-structure/how-to/how-to-add-remove-page-header---footer-sections%})). The middle and bottom parts would represent the two _check stub_s.

The main challenge here is that if there are more _stub_ lines within a single _check_ that cannot fit on a single page, we need to ensure:

	* The second, third, etc. page for the same check contains only the remaining stub lines in both lists
	* The second, third, etc. page for the same check contains the static text ('Void') in its Page Header instead of the content in the first _check_ page


