---
title: How to Localize Report Server-Side Based on Report Parameter Value 
description: I would like the users of my Html5 Report Viewer to select the Report culture as a value of a Report Parameter. How can I apply the selected culture in Report rendering?
type: how-to
page_title: Localizing Report from the ReportsController
slug: localize-report-serverside-based-on-parameter
position: 
tags: 
ticketid: 1592067
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
In my scenario, the users would select the Report culture as a value of a Report Parameter in the Html5 Report Viewer. How can I apply the selected culture server-side for the Report rendering?

## Solution

The [CreateInstance](/api/telerik.reporting.services.webapi.reportscontrollerbase#Telerik_Reporting_Services_WebApi_ReportsControllerBase_CreateInstance_System_String_Telerik_Reporting_Services_WebApi_ClientReportSource_) and [CreateDocument](/api/telerik.reporting.services.webapi.reportscontrollerbase#Telerik_Reporting_Services_WebApi_ReportsControllerBase_CreateDocument_System_String_System_String_Telerik_Reporting_Services_WebApi_CreateDocumentArgs_) virtual methods are called always when you need to render the report in a viewer that utilizes the [Telerik Reporting REST Service]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/overview%}) for generating reports. In the former you have the [client reportSource]({%slug 
telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/reportsource(rs)%}), hence you may take the selected culture from the corresponding parameter. In the latter, you may provide the culture to the Reporting engine through the `DeviceInfo` dictionary in the [CreateDocumentArgs](/api/Telerik.Reporting.Services.WebApi.CreateDocumentArgs) `args` argument. 

Here is sample code, which assumes that the Report has a parameter called _lang_ that holds the selected culture name:

````CSharp
[Route("api/reports")]
public class ReportsController : ReportsControllerBase
{
	public static string Lang { get; set; }

	public ReportsController(IReportServiceConfiguration reportServiceConfiguration)
		: base(reportServiceConfiguration)
	{
	}

	//...

	public override IActionResult CreateInstance(string clientID, [FromBody] ClientReportSource reportSource)
	{
		Lang = reportSource.ParameterValues["lang"].ToString();

		return base.CreateInstance(clientID, reportSource);
	}

	public override IActionResult CreateDocument(string clientID, string instanceID, [FromBody] CreateDocumentArgs args)
	{
		args.DeviceInfo["CurrentCulture"] = Lang;
		args.DeviceInfo["CurrentUICulture"] = Lang;

		return base.CreateDocument(clientID, instanceID, args);
	}
}
````

The idea is to introduce a static string property, set its value in the `CreateInstance` method and use this value in the `CreateDocument` method.

>note The ReportsController gets instantiated on each request. Therefore, if the variable holding the culture name is not static, the value will be lost between the requests.

If you need to localize also the Text specifying the names of the Report Parameter editors in the Html5 Viewers, you need to use the [renderingEnd]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/events/renderingend(e,-args)%}) event to select the parameter editor's element and change its text based on the selected culture. Here is a sample jQuery code for the event handler:

````JavaScript
renderingEnd: function (e, args) {
	var langValue = e.data.sender.reportSource().parameters["lang"];

	var langParam = $(`.trv-parameter-header div[title='Language']`);
	if (langValue == "bg-BG") {
		langParam.text("Език");
	} else {
		langParam.text("Language");
	}
}
````

The reason for this is that the Parameters area of the viewer gets rendered with viewer loading, after calling the [Get Report Parameters]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/report-parameters-api/get-report-parameters%}) request that returns the visible Report Parameters with their default values. When the user selects new parameter values in the viewer, the _Get Report Parameters_ request is not performed and the names of the editors are not updated.

## See Also

* [How to pass culture via AJAX call from the HTML5 Report Viewer]({%slug how-to-send-culture-from-client-to-service%})
* [Localization of reports based on report parameter and RESX files]({%slug localization-of-reports-based-on-report-parameter-and-resx-files%})
* [Html5 Report Viewer event renderingEnd]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/events/renderingend(e,-args)%})
* [Reporting REST Service Get Report Parameters request]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/report-parameters-api/get-report-parameters%})
