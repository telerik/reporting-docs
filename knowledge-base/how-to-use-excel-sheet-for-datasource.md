---
title: How to Use Excel Sheet for DataSource
description: Explains how to add SQL DataSource for using Excel Sheet for 
type: how-to
page_title: Using Excel Sheet for DataSource
slug: how-to-use-excel-sheet-for-datasource
position: 
tags: Excel, SQL DataSource
ticketid: 1511729
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
Connect to Excel

## Solution
1. Open the ODBC Data Source Administrator (the version 32-bit/64-bit depends on the version of the Standalone designer that you use) and add a new System DSN. For example, it can be named ExcelDsn.

2. Then open the Standalone designer and add a SQL DataSource;

3. Select Build new data connection and click on Build.

4. Click on Use user or system data source name and select ExcelDsn.

5. Follow the steps to complete the wizard.
