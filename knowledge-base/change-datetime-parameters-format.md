---
title: Change DateTime parameter format (HTML5 Report Viewer)
description: How to change DateTime parameter format (HTML5 Report Viewer)
type: how-to
page_title: Change DateTime parameter format (HTML5 Report Viewer)
slug: change-change-datetime-parameters-format
position: 
tags: 
ticketid: 1381033
res_type: kb
---

## Environment
<table>
	<tr>
		<td>Product Version</td>
		<td>13.0.19.116</td>
	</tr>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting</td>
	</tr>
</table>


## Description
How could I change DateTime parameter format?

## Solution
Telerik Report Viewer uses [Kendo UI](https://www.telerik.com/kendo-ui) for its default template. The DateTime parameter is a [Kendo UI DatePicker widget](https://docs.telerik.com/kendo-ui/api/javascript/ui/datepicker) 
which supports formating the value displayed in the input. To change the format, you need to listen for [renderingEnd](../html5-report-viewer-reportviewer-events-renderingend) event on the Telerik Report Viewer, 
which is fired after the report and the parameter area are loaded and rendered on the page. Then get the Kendo DatePicker widget and set the wanted format.
For more information on date and time formats please refer to [Date Formatting](https://docs.telerik.com/kendo-ui/framework/globalization/dateformatting).

```JavaScript
$("#reportViewer1")
	.telerik_ReportViewer({                  
		renderingEnd: function () {
        var datepickers = $("#reportViewer1").find("[data-role='datepicker']");
        
        if (datepickers.length) {
            datepickers.each(function (index) {
                $(this).data("kendoDatePicker").setOptions({
                    format: "MM/dd/yy"
                });
            });

        }
    }
...
```
