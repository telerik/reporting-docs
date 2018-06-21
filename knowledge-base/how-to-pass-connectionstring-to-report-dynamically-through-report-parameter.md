---
title: Change Connection String dynamically through a report parameter
description: How to modify connection string of a report definition run-time
type: how-to
page_title: Assign connection string dynamically using report parameter and bindings
slug: how-to-pass-connectionstring-to-report-dynamically-through-report-parameter
position: 
tags: 
ticketid: 1172947
res_type: kb
---

## Environment
<table>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting </td>
	</tr>
</table>


## Description
Sometimes it is necessary to change dynamically the connection string of a report and/or data item. This could be done in the report definition using dedicated report parameters.

## Solution
 Here are the steps:
1. In the report definition introduce a new Report Parameter (for example _ConnectionStringParameter_) - the connection string will be passed to the Report via this parameter.  
2. In the Report or other [Data item](https://docs.telerik.com/reporting/data-items) (Table, List, etc.) where the connection string is supposed to be changed dynamically introduce a new [Binding](https://docs.telerik.com/reporting/expressions-bindings) as shown below:  
  

```XML
Property path                   |   Expression

DataSource.ConnectionString     |   Parameters.ConnectionStringParameter.Value
```

## Notes
The _DataSource.ConnectionString_ property is not listed in the dropdown and must be typed manually.  

The proposed approach cannot be used to modify the Connection String of Report Parameter -\> AvailableValues -\> DataSource as report parameters do not expose Bindings.
