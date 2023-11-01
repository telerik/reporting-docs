---
title: WebServiceDataSource Wizard Displays object Object
description: "Learn why the last step of the WebServiceDataSource wizard of the Web Report Designer displays object Object and how to fix that."
type: troubleshooting
page_title: WebServiceDataSource Wizard Preview page prints object Object
slug: webservicedatasource-preview-displays-object-object-in-net-framework
tags: Web Report Designer, WebServiceDataSource, ASP.NET Framework
ticketid: 1626423
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
			<td>ASP.NET Web Application</td>
		</tr>
		<tr>
			<td>Target Framework</td>
			<td>.NET Framework</td>
		</tr>
	</tbody>
</table>

## Description

When I attempt to preview the data of the WebServiceDataSource component in the last page of the wizard, instead of seeing the response printed on the page, it displays `[object Object]`s.

## Cause

In the `.NET Framework` implementation of the [`ReportDesignerControllerBase`](/api/telerik.webreportdesigner.services.controllers.reportdesignercontrollerbase) class, which must be used to create a controller for the Report Designer service in the project, the [`PreviewWebServiceData(DataSourceInfo)`](/api/telerik.webreportdesigner.services.controllers.reportdesignercontrollerbase#collapsible-Telerik_WebReportDesigner_Services_Controllers_ReportDesignerControllerBase_PreviewWebServiceData_Telerik_WebReportDesigner_Services_Models_DataSourceInfo_) method returns a JSON response instead of a stringified JSON, thus the inner text of the element on the page cannot be bound correctly.

## Suggested Workarounds

As a workaround, the [`PreviewWebServiceData(DataSourceInfo)`](/api/telerik.webreportdesigner.services.controllers.reportdesignercontrollerbase#collapsible-Telerik_WebReportDesigner_Services_Controllers_ReportDesignerControllerBase_PreviewWebServiceData_Telerik_WebReportDesigner_Services_Models_DataSourceInfo_) method of the report designer controller can be overridden to return a plain text response instead of JSON:

````CSharp
public override IHttpActionResult PreviewWebServiceData(DataSourceInfo dataSourceInfo)
{
	var baseResult = (ResponseMessageResult)base.PreviewWebServiceData(dataSourceInfo);
	var jsonString = baseResult.Response.Content.ReadAsStringAsync().Result;

	return Ok(jsonString);
}
````

## See Also

* [Configuring the Web Report Designer in ASP.NET Framework application]({%slug telerikreporting/designing-reports/report-designer-tools/web-report-designer/how-to-set-up-in-.net-framework-application%})
* [Web Report Designer - WebServiceDataSource Wizard Tutorial]({%slug telerikreporting/designing-reports/report-designer-tools/web-report-designer/tools/WebServiceDataSource-wizard%})
