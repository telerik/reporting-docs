---
title: How to Add a Counter Depending on a Column Value?
description: How to get the number of data rows that have a specific value for a specific column
type: how-to
page_title: Count data records with specific column value
slug: count-records-with-specific-column-value
position: 
tags: 
ticketid: 1569798
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
I would like to add a total count depending on the value that I have in the "Category" field. I need to know how many Category = "A" and how many Category = "B" are there in the data.

## Solution
You may utilize the `Sum` [aggregate function]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/functions/aggregate-functions%}), and pass it as an argument either 1 or 0, depending on the value of the field, e.g. 'Category'. 

Here is a sample Expression that would return the count of the rows with Category = "A": `= Sum(IIF(Fields.Category = "A", 1, 0))`.

The Expression counts each 'A' Category value as 1 and the rest as 0, hence will return the number of A.
