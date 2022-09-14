---
title: Connection Unsuccessful. Check the Connection String and Try Again. Keyword not Supported Column Encryption Setting
description: The error is thrown in the Web Report Designer when you try to add a new SQL connection that contains column encryption setting in the query
type: troubleshooting
page_title: Keyword not supported column encryption setting error is thrown in Web Report Designer
slug: keyword-not-supported-column-encryption-setting-error-is-thrown-in-web-report-designer
position: 
tags: webreportdesigner, sqldatasource
ticketid: 1549910
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
			<td>Report Desginer</td>
			<td>Web Report Designer</td>
		</tr>
	</tbody>
</table>


## Description
The error is thrown when trying to connect to a SQL instance via Web Designer that has Always Encrypted enabled.


## Error Message
Connection unsuccessful. Check the connection string and try again. Keyword not supported: 'column encryption setting'.


## Solution
You need to use the Microsoft.Data.SqlClient data provider as explained in the [How to Use Microsoft.Data.SqlClient Data Provider in Web Report Designer]({%slug connecting-to-microsoft-data-sqlclient-in-web-report-designer%})
 KB article.

