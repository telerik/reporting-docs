---
title: Change PageSettings from the client side (HTML5 Report Viewer)
description: How to change report's PageSettings from the client side (HTML5 Report Viewer)
type: how-to
page_title: Change PageSettings from the client side (HTML5 Report Viewer)
slug: change-page-settings-from-the-client-side
position: 
tags: 
ticketid: 1348293
res_type: kb
---

## Environment
<table>
	<tr>
		<td>Product Version</td>
		<td>12.2 18.1017</td>
	</tr>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting</td>
	</tr>
</table>


## Description
How would I dynamically change report properties / settings from the report viewer client side?

## Solution
Report settings can be modified from the client side through [report parameters]({%slug telerikreporting/designing-reports/connecting-to-data/report-parameters/overview%}). In case the value of some report property is bound to a report parameter value, changing the value of report parameter from the client side would change the value of the report property.
For example, to bind *Report.PageSettings.Landscape* property to a report parameter, add [a binding]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/using-expressions/bindings%}) into Report.Bindings collection. An example binding rule in the Edit Bindings dialog:
```
Property path: PageSettings.Landscape
Expression: = Parameters.Landscape.Value
```

All visible (Visible=true) report parameters can be changed from the client side using parameters area of the report viewer. Report parameter can also be hidden (will not appear in the viewer's parameters area) and you can pass the value to this parameter using **reportSource.parameters** collection of the viewer:

```JavaScript
$("#reportViewer1")
	.telerik_ReportViewer({                  
		serviceUrl: "/api/reports",
		reportSource: {                      
			report: "SampleReport.trdp",
			parameters: { Landscape: true }
		},
...
```
