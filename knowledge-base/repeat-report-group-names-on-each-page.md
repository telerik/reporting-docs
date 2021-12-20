---
title: Repeat Group Labels when Group Continues on the Next Page
description: Show report group title on each page so that the user know when it begins and when continues
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
For example, the following [Expression](../report-expressions) displays the name of the first group, which child is rendered on the first row of the page - the first line 
of the _Expression_. Note that the scope for the function is the name of the TextBox where we display the actual value.
```
= PageExec("textBox2", Fields.Group) + 
IIF(PageExec("group", Fields.Value) = PageExec("textBox2", Fields.Value), "", "-Continued ") + 
IIF(PageExec("textBox2", Fields.Group) = PageExec("textBox2", Last(Fields.Group)), "", " / " + PageExec("textBox2", Last(Fields.Group)))
```
On the next _Expression_ line, we determine whether this group is a new one or continues from the previous page. In the latter case, we display "Continued". 
Note that the first scope is the group name, which assures that the returned value is the first value for the Report group.  
On the last _Expression_ line, we check whether another group starts on the same page. If so, we display also its name in the Page Header. Note that we used the 
__Last__ [Aggregate Function](../expressions-aggregate-functions). Generally, the __PageExec__ [Page Function](../expressions-page-functions) requires an aggregate function. 
We have skipped the __First__ aggregate function above as it is the default one that would be applied to the Field when an aggregate is omitted. 
The demo report demonstrating the approach can be downloaded from our [Reporting Samples GitHub Repo](https://github.com/telerik/reporting-samples/tree/master/ReportWithGroups).

## See Also
[Page Sections](../designing-reports-creating-page-headers-and-footers)  
[Report Structure](../designing-reports-understanding-report-structure)  
[Group Header/Footer Sections](../data-items-how-to-add-groups-to-report-item)  
[Expression](../report-expressions)  
[Aggregate Function](../expressions-aggregate-functions)  
[Page Function](../expressions-page-functions)
