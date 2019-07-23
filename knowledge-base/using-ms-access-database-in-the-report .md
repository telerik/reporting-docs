---
title: Using MS Access Database in the Report 
description: Since version 13.1.19.618 we provide support for MS Access. 
type: how-to
page_title: How to use MS Access Database in Telerik Report?
slug: using-ms-access-database-in-the-report 
position: 
tags: 
ticketid: 1417017
res_type: kb
---

## Environment
<table>
    <tbody>
	    <tr>
	    	<td>Product Version</td>
	    	<td>13.1.19.618</td>
	    </tr>
	    <tr>
	    	<td>Product</td>
	    	<td>Telerik Reporting</td>
	    </tr>
    </tbody>
</table>


## Description
This article lists the required steps for setting MS Access Database and using it in the report.

## Solution
1. Create a sample database in **Access**:
![](resources/AccessDB.png)
2. [Create a new report](../reporting/creating-the-report) and insert **SQL Data Source**.
3. Click on **Build new data connection** and select **OleDB Data Provider** from the dropdown.
4. The data source has to be a **Microsoft Access Database File (OLE DB)**.
5. Browse to the file’s location. 
6. Click **OK** and finish the Wizard with the default settings. 
7. In the **Configure data source command dialog**, click on **Query Builder** and mark the desired fields:
![](resources/configure-data-source.png)
