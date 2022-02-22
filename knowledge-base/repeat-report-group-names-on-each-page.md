---
title: Repeat Group Labels when Group Continues on the Next Page
description: Show report group title on each page so that the user knows when it begins and when continues
type: how-to
page_title: Repeat Group Names on Each Page
slug: repeat-report-group-names-on-each-page
position: 
tags: 
ticketid: 1546843
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
Here is what you may do when you want to display the Report group information in a different way, depending on whether it should appear on the 1st group page, 
on a mid-page for the group, or on the last page for the group.

## Suggested Workarounds
The paging information is available only in the [Page Sections](../designing-reports-creating-page-headers-and-footers) of the Report - see the 
[Report Structure](../designing-reports-understanding-report-structure). In the [Group Header/Footer Sections](../data-items-how-to-add-groups-to-report-item) that may be 
set to appear on each page, there is no information about the current page. For example, it is not known whether the group has records for the current page.  
For the above reason, you need to use the _Page Sections_ to display the information based on the page number for the group.  

### Workaround 1. Display All Group Header Information in the Page Header
Let's consider we have only one group in the Report and each page may contain only 1 or 2 group instances. The first line of the following [Expression]({% slug telerikreporting/designing-reports/connecting-to-data/expressions/overview %}) displays the name of the first group instance on the page. Note that the scope for the function is the name of the TextBox where we display the actual group detail value.
```
= PageExec("textBox2", Fields.Group) + 
IIF(PageExec("group", Fields.Value) = PageExec("textBox2", Fields.Value), "", "-Continued ") + 
IIF(PageExec("textBox2", Fields.Group) = PageExec("textBox2", Last(Fields.Group)), "", " / " + PageExec("textBox2", Last(Fields.Group)))
```
On the next _Expression_ line, we determine whether this group is a new one or continues from the previous page. In the latter case, we display "Continued". 
Note that the first scope is the group name, which assures that the returned value is the first value for the Report group.  
On the third _Expression_ line, we check whether another group starts on the same page. If so, we display also its name in the Page Header.  

Note that we used the __Last__ [Aggregate Function]({% slug telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/functions/aggregate-functions %}). Generally, the __PageExec__ [Page Function](../expressions-page-functions) accepts an aggregate function as second argument. We have skipped the __First__ aggregate function above as it is the default one that would be applied to the Field when an aggregate is omitted. 

The demo report demonstrating this approach can be downloaded from our [Reporting Samples GitHub Repo - ReportWithGroups](https://github.com/telerik/reporting-samples/blob/master/ReportWithGroups/ReportWithGroups.trdp).

### Workaround 2. Display the Group Header Information in the Page Header Only for Groups that Continue from the Previous Page
For this scenario we have multiple nested Report groups in the Report. We are going to use Group Headers to display the Group information only for the first occurrence of the group instance. Therefore, we keep __[GroupHeader > PrintOnEveryPage](../p-telerik-reporting-groupsection-printoneverypage)__ as __False__. If the group continues we will use the Page Header to display its customized group header information. Here is a sample _Expression_ that would display the grouping field/name followed by "-Continued":
```
= IIF(PageExec("group", Fields.Value) = PageExec("textBox2", Fields.Value), "", PageExec("textBox2", Fields.Group) + "-Continued ")
```
It is very similar to the second line of the _Expression_ we used in the first approach. Note that you need to use it for each of the nested groups, with the corresopnding group scope and name of the TextBox that displays the group detail data.  
We also have to take care of the corner case, when a group starts at the bottom of the previous page without displaying an item there. In this case, the group name won't appear on the second page's Page Header as the first detail of the group will be on this page. To fix this, you need to set all groups' properties [GroupKeepTogether](../t-telerik-reporting-groupkeeptogether) to __FirstDetail__ (the default is _None_).  

The demo report with four groups can be found in [Reporting Samples GitHub Repo - ReportWithFourGroups](https://github.com/telerik/reporting-samples/blob/master/ReportWithGroups/ReportWithFourGroups.trdp).

## See Also
[Page Sections](../designing-reports-creating-page-headers-and-footers)  
[Report Structure](../designing-reports-understanding-report-structure)  
[Group Header/Footer Sections](../data-items-how-to-add-groups-to-report-item)  
[Expression]({% slug telerikreporting/designing-reports/connecting-to-data/expressions/overview %})  
[Aggregate Function]({% slug telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/functions/aggregate-functions %})  
[Page Function](../expressions-page-functions)
[GroupHeader > PrintOnEveryPage](../p-telerik-reporting-groupsection-printoneverypage)
[GroupKeepTogether](../t-telerik-reporting-groupkeeptogether)
