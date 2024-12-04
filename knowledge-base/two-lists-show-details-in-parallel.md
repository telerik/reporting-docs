---
title: Check with Stubs. Report with Two Lists Showing the Same Data in Parallel Page by Page
description: "Learn how to create a report that shows the same data twice per page in parallel in Telerik Reporting. The approach is relevant for printing checks with stubs."
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

The report layout consists of three parts. The top part contains the main information about the _check_, or the static text ('Void') in a header. The middle and bottom parts would represent the two identical (or different, depending on the scenario, but representing the same data rows) _check stubs_. Here is how our final report will look in the PrintPreview mode of the Standalone Report Designer:

![The first and second page of the Check Stubs sample report 'TwoParallelLists.trdx' in PrintPreview of the Standalone Report Designer]()

The main challenge here is that if there are more _stub_ lines within a single _check_ that cannot fit on a single page, we need to ensure:

* The second, third, etc. page for the same check contains the static text ('Void') in its header instead of the content in the first _check_ page
* The second, third, etc. page for the same check contains only the remaining stub lines in both lists

We may use two [Lists/Tables]({%slug telerikreporting/designing-reports/report-structure/table-crosstab-list/overview%}) for the duplicated _check stubs_. In Telerik Reporting, the report items are rendered in  order. This means, that the Reporting Engine will render the first List and then will continue with the second List. Therefore, the requirement cannot be achieved with the regular workflow.

## Solution

Let's try with [Report Groups]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/grouping-data/how-to-add-groups-to-report%}) and inner [List Groups]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/grouping-data/how-to-add-groups-to-table-item-and-crosstab-item%}). This will let us split the data in groups, and render each one on different pages. This will require proper grouping criteria to split the content into groups. For example, an index, if we knew the number of lines on each page. Therefore, the zero-based 'Index' field is included in the _stub check_ schema of the sample [TwoParallelLists.trdx](https://github.com/telerik/reporting-samples/blob/master/Sample%20Reports/TwoParallelLists.trdx) downloadable from our _reporting-samples_ GitHub repository.

1. [Add Report Group]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/grouping-data/how-to-add-groups-to-report%}) grouped by a unique field, for example, `= Fields.Number` from the main DataSource in the sample report. In the Group Header include the section with the header _check_ information and let it be rendered only once per group by leaving its `PrintOnEveryPage` to be `False` (default).
1. In the detail section of the Report add a List ('list1' in the sample). In the list default Panel 'panel1' add one Panel at the top ('panel5') and two identical Panels ('panel2' and 'Payment Stub Panel') with inner Lists ('list2' and 'list3') following it. Use the [Group Explorer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/group-explorer%}) to introduce a Grouping to the detail group of the outer List, which should depend on the number of rows per page. In our sample, we may have 2 lines per page, and the grouping is `= Fields.Index/ 2`. In other scenarios, you would divide by more, depending on the maximum number of rows per page.

	Other settings for the outer List:
	* Use [Bindings]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/using-expressions/bindings%}) to set the `DataSource` to the corresponding data field of the main DataSource. In the sample use `= Fields.StubLines`.
	* `CanShrink` of the List main Panel 'panel1' should be `True`.
	* Set `GroupKeepTogether` for the DetailGroup of the List to `True`.

1. In the top Panel `panel5` of the outer List, we will display the 'VOID' text or other static content when the data is split into multiple pages. It should have the same height as the Report Group Header, as it would replace it on the second and further pages for the _check_. We need to hide this panel for the first page of the group, which may be done with [Conditional Formatting]({%slug telerikreporting/designing-reports/styling-reports/conditional-formatting%}) when `= First(Fields.Index)     =     0` as on the second and next pages the first index will have other value. Use the Conditional Formatting to set the `Visible` property of the top Panel `panel5` to `False`.
1. The inner identical panels with the _check stubs_ should contain the inner lists with the details and the _stub_ headers. Let the latter be in TextBoxes outside the list.

	Use [Bindings]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/using-expressions/bindings%}) to set the `DataSource` to `= ReportItem.DataObject`. This [Expression]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/overview%}) passes the parent data to the list.

	Let's display the total for the _stubs_ on the page in a separate TextBox below the List - 'textBox22' and 'textBox23', correspondingly for the two identical lists.

## Additional Resources

Download a sample report - [TwoParallelLists.trdx](https://github.com/telerik/reporting-samples/blob/master/Sample%20Reports/TwoParallelLists.trdx).
