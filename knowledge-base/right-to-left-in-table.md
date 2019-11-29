---
title: Right to Left Format in Table
description: Sometimes you want to put the group value in table on the right side
type: how-to
page_title: Setting the Group to be on the right of a table
slug: right-to-left-in-table
position: 
tags: 
ticketid: 1435165
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
By default, the group value will be displayed on the left side of the table. There are some workarounds that allow putting the group on the right.

## Solution
Workaround 1 demonstrated in Report1:

1) Add a [CSV DataSource](../csvdatasource-component) (with **Group**, **Item** and **Value** fields) and set it to be the **DataSource** of the report.

2) [Add a group to the report](../data-items-how-to-add-groups-to-report-item): right-click outside the report -> **Add New Group**
and set the **Expression** to be "=Fields.Group";

3) In the **groupHeaderSection** add a textbox whose **Value** is  "=Fields.Group";

4) In the detail section, add textboxes containing "= Fields.Value" and "= Fields.Item"

Workaround 2 demonstrated in Report2:

1) Add a [CSV DataSource](../csvdatasource-component) (with **Group**, **Item** and **Value** fields) but don't set it to be the datasource of the report;

2) Add a table that displays only the **Item** and **Value** fields.

3) Right-click over the table -> **Add group** -> **Row group -  Parent Group**;

4) Set the **Expression** to be "=Fields.Group";

5) Mark **Add Header** -> **OK**;

6) Right-click over the table -> **Insert row** -> **Outside Group Above**;

7) Move the headers of the table over "= Fields.Value" and "= Fields.Item";

8) Right-click over the table -> **Insert Column** -> **Right**;

9) Merge the upper header and set its **Value** to be  "=Fields.Group";

10) Remove the unnecessary column of the group (**Delete column only**) and row;

Note that the limitation of this solution is that if you set the property **ColumneHeadersPrintOnEveryPage** will not work as expected.

## Notes
You can download the reports from [here](https://github.com/telerik/reporting-samples/tree/master/RightToLeftFormatInGroup).
