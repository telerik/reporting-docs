---
title: How to Use Excel Sheet for DataSource in the Report
description: Explains how to use Excel Sheet as a datasource by using SQL DataSource
type: how-to
page_title: Using Excel Sheet for DataSource in the Report
slug: how-to-use-excel-sheet-for-datasource-in-the-report
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
You can connect to an Excel file through an [SQL DataSource](../sqldatasource) and ODBC connection, and use this connection in a Telerik Report. Usually, the Excel drivers come preinstalled in ODBC Data Source Administrator. If you do not want to use ODBC Data Source Administrator, it should be possible to connect to an Excel file directly with a correct connection string - see examples in [Microsoft Excel ODBC Driver connection strings](https://www.connectionstrings.com/microsoft-excel-odbc-driver/).

Note that the Excel driver is available in a 32-bit version of ODBC Data Source Administrator. Therefore this data source will be available only using the 32-bit version of Telerik Standalone Report Designer.

## Solution
1. Open the **ODBC Data Source Administrator** (the version 32-bit/64-bit depends on the version of the Standalone designer that you use) and add a new **System DSN**. For example, it can be named **ExcelDsn**.

2. Open the Standalone designer and add a new **SQL DataSource**;

3. Select **Build new data connection** and click on **Build**.

4. Click on **Use user or system data source name** and select **ExcelDsn**.

5. Follow the steps to complete the wizard.
