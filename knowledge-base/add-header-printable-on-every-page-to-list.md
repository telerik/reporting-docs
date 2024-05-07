---
title: Add Header Printable on Every Page to List Data Item
page_title: Add Table Header to List Item
description: "Learn how you may add a static Table Header that may be printed on every page to a List Data Item in Telerik Reporting."
type: how-to
slug: add-header-printable-on-every-page-to-list
res_type: kb
---

## Environment

<table>
	<tbody>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
		</tr>
		<tr>
			<td>Report Designers</td>
			<td>Visual Studio/Standalone Report Designer </td>
		</tr>
	</tbody>
</table>

## Description

When you add a [List data item]({%slug table_template_items%}#list) in the report designer, it contains only a detail group with a Panel inside:

![List item when added to a new report in the Standalone Report Designer.](images/AddList.png)

In many scenarios, you may need to add and display Headers in the List that repeat on every page.

## Solution

The List is a variation of the Table as explained in the article [Template Variations of the Table Report Item]({%slug table_template_items%}) and exposes the property [ColumnHeadersPrintOnEveryPage](/api/telerik.reporting.table#Telerik_Reporting_Table_ColumnHeadersPrintOnEveryPage). The property lets you print the Table Header on every page where the table/list appears.

By default, the List lacks the Table Header, so we need to add it to use the property and display a header on every page. Here are the necessary steps:

1. Insert a Row to the List:

	* Right-click over the List to open the [Context Menu]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/context-menu%})
	* Select `Insert Row` -> `Outside Group - Above`

	![Insert a row to the List in the Standalone Report Designer.]()
	
	The new row is a header for your List. You may display aggregated values from the DataSource of the List like Totals, Averages, etc. This row cannot be displayed on every page.

1. Add a Parent Group to the group defined by the just inserted row:

	* Select the List and go to the [Group Explorer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/group-explorer%})
	* Right-click over the column group to open the Context Menu:

		![Add Parent group to the Column Group of the List in the Standalone Report Designer.]()

	* Select `Add Group` -> `Parent Group`. This opens the Table Group wizard
	* Add a constant value, for example, `1` as a Grouping `Expression`. You may need to check and uncheck the _Add Header/Footer_ to enable the _OK_ button that will let you proceed:

		![Configure the static Table Group of the List in the Standalone Report Designer.]()

	The wizard adds a new Table Header to the List. This is the header that respects the `ColumnHeadersPrintOnEveryPage` property.

1. (optional) Delete the row we added initially if you don't need it
