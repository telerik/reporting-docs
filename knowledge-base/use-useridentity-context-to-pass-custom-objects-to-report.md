---
title: How to Use UserIdentity.Context to Pass Custom Objects to the Report
description: How to use objects from UserIdentity.Context in Report Expressions
type: how-to
page_title: Passing Custom Objects to the Report with the UserIdentity.Context
slug: use-useridentity-context-to-pass-custom-objects-to-report
position: 
tags: 
ticketid: 1459613
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
In some scenarios, it may be necessary to pass custom object values directly to the Report, without using 
[Global Objects](../expressions-global-objects) as Report Parameters.

## Solution
The [UserIdentity](../t-telerik-reporting-processing-useridentity) object has a property __Context__ that by default is _Null_. 
It is of type _System.Collections.Concurrent.ConcurrentDictionary<string, object>_. You may read more about how to pass a value to 
this property in the 
[How to use information from HttpContext in Custom Report Resolver]({% slug how-to-pass-information-from-httpcontext-to-reporting-engine %}) 
KB article. Then in the report, you may access the values of the collection.  
For example, the first value of the collection may be used in an [Expression]({% slug telerikreporting/designing-reports/connecting-to-data/expressions/overview %}) like:
```
= Item(0, UserIdentity.Context.Values)
```
Note that you won't be able to access the property _UserIdentity.Context.Values_ directly in the Expression editor of 
the Report Designers. You will have to type it manually.
