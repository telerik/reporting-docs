---
title: The Expression Contains Undefined MyUserFunction
page_title: Error 'The Expression Contains Undefined MyUserFunction'
description: "Learn how to handle the possible causes if `The Expression Contains Undefined MyUserFunction` occurs in Telerik Reporting."
slug: undefined-myuserfunction-error
tags: telerik, reporting, run, time, expression, contains, undefined, myuserfunction, function, call, error, occurs
published: True
type: troubleshooting
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
			<td>Version</td>
			<td>Q2 2012 and later</td>
		</tr>
	</tbody>
</table>

## Description

A `The expression contains undefined function call MyUserFunction()` error message occurs.

## Cause

The possible causes for the error message to occur are the following:

* The function name is typed in manually in the expression, without building the class library, and it does not exist yet.
* The function is used with an incorrect number or type of parameters. The passed fields must match the function signature.
* The field specified in the function is `null`. Make sure such cases are handled in the user function.

## Solution

Depending on each possible cause scenario, handle the issue respectively, as described above.
