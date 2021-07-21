---
title: Oracle error ORA-01008 - Not all variables bound 
description: Oracle error ORA-01008 - Not all variables bound 
type: troubleshooting
page_title: Oracle error ORA-01008 - Not all variables bound 
slug: oracle-error-ora-01008-on-report-preview 
ticketid: 1526844
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

On previewing the report in a report viewer, an Oracle error **'ORA-01008: Not all variables are bound'** is thrown. Sometimes, the report will display without errors in the [Standalone Report Designer](../standalone-report-designer) but the error gets thrown when displaying that same report in a report viewer. 

Usually, the error occurs when there is **one or more** SQL parameter/s used at **two or more places** in the query used by the [SqlDataSource component](../sqldatasource) and the data provider being used is the **Oracle.ManagedDataAccess** provider.

## Solution

There are two approaches that can be taken in this case:

1. Since the issue is only present in the **Oracle.ManagedDataAccess** data provider, switching to the **System.Data.OracleClient** data provider will fix the problem.

2. With the Oracle.ManagedDataAccess data provider, client have, so far, reported the issue appearing only when there one or more SQL parameter/s used at two or more places in the query. Make sure that each parameter is used only **once** and the issue should go away.


> **Note**
> <br/>
> This error is related to the Oracle.ManagedDataAccess data provider itself and is out of the scope of Telerik Reporting.

## See Also

[Using Parameters with the SqlDataSource component](../sql-data-source-using-parameters)
