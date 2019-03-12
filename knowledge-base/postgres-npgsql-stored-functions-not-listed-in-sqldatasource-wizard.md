---
title: PostgreSQL Stored functions do not populate the dropdown in Report Designer's SqlDataSource wizard
description: When using PostgreSQL with NpgSql provider the Stored procedure dropdown is not populating in Report Designer's SqlDataSource wizard
type: troubleshooting
page_title: Report designer's SqlDataSource wizard does not list the PostgreSQL Stored functions when using NpgSql provider
slug: postgres-npgsql-stored-functions-not-listed-in-sqldatasource-wizard
position: 
tags: 
ticketid: 1382372
res_type: kb
---

## Environment
<table>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting</td>
	</tr>
</table>


## Description
When using PostgreSQL Stored Functions in the SqlDataSource the drop-down list of the Report Designer SqlDataSource wizard is not populated. The issue applies for NpgSql provider and PostgreSQL prior to version 11. 
  

## Solution
When the function is manually typed, it will be correctly executed. After recognizing the function, the SqlDataSource wizard populates the Query parameter successfully in the next window.  
Our assumption is that the ADO.NET provider can recognize the Stored Functions, but probably cannot associate them with Stored Procedures, hence our code does not populate the drop down. The real Stored Procedures were introduced with PostgreSQL version 11.
