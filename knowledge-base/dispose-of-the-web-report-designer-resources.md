---
title: Disposing of the Web Report Designer Resources
description: "Learn when and how to dispose of the resources loaded by the Web Report Designer in Telerik Reporting."
type: how-to
page_title: Removing the Resources of the Telerik Web Report Designer
slug: dispose-of-the-web-report-designer-resources
position: 
tags: 
ticketid: 1566062
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
			<td>Project Type</td>
			<td>Web Application</td>
		</tr>
    <tr>
			<td>Report Designer</td>
			<td>Web Report Designer</td>
		</tr>
	</tbody>
</table>


## Description

When the [Web Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/web-report-designer/overview%}) is initialized, it loads various stylesheets including its own theme. The Web Report Designer theme is based on the [Kendo UI Default SCSS-based theme for the Kendo UI components](https://www.npmjs.com/package/@progress/kendo-theme-default) and *overrides* some of the default styles. As a result, if another kendo theme is loaded in the application, since a lot of the style rules are similar, they will get overriden.

This cannot be avoided as long as the Web Report Designer is present on the page. When navigating away from the page with the Web Report Designer, its resources can be manually removed returning your application theme to normal.

## Suggested Workarounds

The following code can be executed after the Web Report Designer has been removed from the page DOM or after navigating to a page without the designer:

````JavaScript
$("link").each(function () 
	{ 
		var isReportingLink = $(this).attr("href").indexOf("api/reportdesigner") > -1;
		if(isReportingLink){
			$(this).remove();
		}
	})
````

## Notes

Depending on what [Route](https://learn.microsoft.com/en-us/dotnet/api/microsoft.aspnetcore.mvc.routeattribute) has been set in the [ReportDesignerController](/api/telerik.webreportdesigner.services.controllers.reportdesignercontrollerbase), the `string` provided to the [indexOf](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/indexOf) function may need to be changed.

## See Also

* [Web Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/web-report-designer/overview%})
* [Kendo UI Default SCSS-based theme for the Kendo UI components](https://www.npmjs.com/package/@progress/kendo-theme-default)
