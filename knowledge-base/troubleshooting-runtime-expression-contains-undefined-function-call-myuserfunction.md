---
title: Run Time Problems. The expression contains undefined function call MyUserFunction().
description: Error with message 'The expression contains undefined function call MyUserFunction()' occurs in the report.
page_title: The expression contains undefined function call MyUserFunction().
slug: troubleshooting-runtime-expression-contains-undefined-function-call-myuserfunction
position: 
tags: 
ticketid: 
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
An error with red message 'The expression contains undefined function call _MyUserFunction()_.' occurs in the report.

## Solution
There are three cases in which this error message occurs:
 - The function name is typed in manually in the Expression, without building the class library, and it does not exist yet.
 - Using the function with incorrect number/type of parameters. The passed fields must match the function signature.
 - The field specified in the function is null. Make sure such cases are handled in the user function.
