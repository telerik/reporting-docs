---
title:  Remove the Last PageBreak for a Report Group
description: Add PageBreaks between Report Groups but not after the last one
type: how-to
page_title: PageBreaks only between Report Groups
slug: remove-last-pagebreak-for-report-group
position: 
tags: 
ticketid: 1538811
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
In many reporting scenarios, you would like to have page breaks between report groups. You may easily achieve this, for example, by setting the 
[PageBreak](../p-telerik-reporting-reportsection-pagebreak) property of the Group Footer section to 'After'. However, the page break will occur also after 
the last Group Footer. Here we explain how to avoid the last page break.

## Suggested Workarounds
You may use [Bindings](../expressions-bindings) to set the __PageBreak__ property of the [Group Header or Footer](../data-items-how-to-add-groups-to-report-item) conditionally.
The exact conditional [Expression](../report-expressions) will depend on the data that is grouped.  

For example, in the following Expression, we compare the last value in the group with the last value of the entire report data, and if they coincide, 
the Group Footer PageBreak is set to "None".

```
=IIF(Last(Fields.value) = Exec("Report1", Last(Fields.value)), "None", "After")
```


The Expression assumes that the data sorting/filtering is not modified in the group. If there is sorting or 
additional filtering in the data, you must take this into account in the Expression. The Expression assumes also that the last data values don't repeat among the groups.
We use the _Exec_ [data function](../expressions-data-functions) to access the data scope of the Report that is parent for the Report Group.
