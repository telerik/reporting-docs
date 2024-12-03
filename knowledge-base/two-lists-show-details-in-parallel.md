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

The report layout consists of three parts. The top part contains the main information about the _check_, or the static text ('Void') in a header. The middle and bottom parts would represent the two identical (or different, depending on the scenario, but representing the same data rows) _check stubs_.

The main challenge here is that if there are more _stub_ lines within a single _check_ that cannot fit on a single page, we need to ensure:

	* The second, third, etc. page for the same check contains the static text ('Void') in its header instead of the content in the first _check_ page
	* The second, third, etc. page for the same check contains only the remaining stub lines in both lists


We may use two [Lists/Tables]({%slug telerikreporting/designing-reports/report-structure/table-crosstab-list/overview%}) for the duplicated _check stub_s. In Telerik Reporting, the report items are rendered orderly. This means, that the Reporting Engine will render the first List and then will continue with the second List. Therefore, the requirement cannot be achieved with the regular workflow.

Let's try with [Report Groups]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/grouping-data/how-to-add-groups-to-report%}) and inner [List Groups]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/grouping-data/how-to-add-groups-to-table-item-and-crosstab-item%}). This will let us split the data in groups, and render each one on different pages. This will require proper grouping criteria to split the content into groups. For example, an index, if we knew the number of lines on each page. Therefore, the zero-based 'Index' field is included in the _stub check_ schema of the sample [TwoParallelLists.trdx](https://github.com/telerik/reporting-samples/blob/master/Sample%20Reports/TwoParallelLists.trdx) downloadable from our _reporting-samples_ GitHub repository.

Here are the main steps for achieving the requirement with the above approach:

I had to add groups, Lists, Panels, etc, and change their KeepTogether and CanShring properties to achieve the exact behavior.

1. Add Report Group by a unique field, for example, '= Fields.Number' from the main DataSource in the sample report. In the Group Header include the section with the header _check_ information and let it be rendered only once per group by leaving its 'PrintOnEveryPage' to be 'False' (default).
1. In the detail section of the Report add a List with one Panel at the top and two identical inner Lists following it. Introduce a Grouping to the detail group of the outer List, which should depend on the number of rows per page. In our sample, we may have 2 lines per page, and the grouping is '= Fields.Index/ 2'. In other scenarios, you would divide by more, depending on the maximum number of rows per page.
1. In the top Panel of the outer List, we will display the 'VOID' text or other static content when the data is split into multiple pages. It should have the same height as the Group Header, as it would replace it on the second and further pages for the group. We need to hide this panel for the first page of the group, which may be done with [Conditional Formatting]({%slug telerikreporting/designing-reports/styling-reports/conditional-formatting%}) when `= First(Fields.Index)     =     0` as on the second and next pages the first index will have other value.

1. Inner Lists???

https://supportheroes.telerik.com/ticket/1670679

4. I changed some PageBreaks, KeepTogether, and CanShrink from the previous version of the report. I may miss some of them, so I won't specify them here. You may check them from the attached sample report.
