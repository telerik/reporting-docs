---
title: Pass parameter value to MVC report viewer
description: Sometimes you need to set the report source and report parameters from the Home Controller or you can also query them in the URL
type: how-to
page_title: How to set the report source and report parameters from the controller in ASP.NET MVC project through a model?
slug: set-report-source-and-parameters-through-model
position: 
tags: HTML5 MVC Report Viewer
ticketid: 1412220
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
			<td>Report Viewer</td>
			<td>HTML5 ASP.NET MVC</td>
		</tr>
	</tbody>
</table>


## Description

This article shows how to set the report source and report parameters from the controller in ASP.NET MVC project through a model. The attached project demonstrates the following approach:

## Solution

1. The report contains 2 [report parameters]({%slug telerikreporting/designing-reports/connecting-to-data/report-parameters/overview%})- **Parameter1** and **Parameter2**. The initial value of the first one is "Item1" and of the second one is "Value1".

2. Add a new Model called **ReportModel**. It has 2 properties - a string which holds the **ReportName** and **Dictionary** for the parameters:

	````C#
public class ReportModel
	{
		public string ReportName { get; set; }
		public Dictionary<string,object> Parameters { get; set; }
	}
````


3. Go to the **HomeController**.

4. Add the **Model** namespace through a using.

5. Change the **ActionResult** method of the page which contains the report viewer as follows:

	````C#
public ActionResult Index()
	{
		Dictionary<string,object>values = new Dictionary<string, object>() { { "Parameter1", "Item2" }, { "Parameter2", "Value2" } };
		ReportModel reportModel = new ReportModel()
		{
			ReportName = "SampleReport.trdp",
			Parameters = values
		};
		return View(reportModel);
	}
````


6. Go to the page of the report viewer and add the model under the list with usings. For example: 

	````
	@model PassParameter.Models.ReportModel
	````


7. Change the **ReportSource** in the initialization of the report viewer as follows:

	````
	.ReportSource(Model.ReportName, Model.Parameters)
	````


8. You can also query the report name and parameters in the URL by adding the following **Action** in the **HomeController**: 

	````C#
public ActionResult Report(string id, string parameter1, string parameter2)
	{
		Dictionary<string, object> values = new Dictionary<string, object>() { { "Parameter1", parameter1 }, { "Parameter2", parameter2 } };
		ReportModel reportModel = new ReportModel()
		{
			ReportName = $"{id}.trdp",
			Parameters = values
		};
		return View("Index", reportModel);
	}
````

Note that this is in case you use the default MapRoute : url: "{controller}/{action}/{id}". It can be found in App_Start/RouteConfig.cs or in Global.asax file in the MVC project. With another routing may not work this way.
 Then the URL might look: http://localhost:XXXXX/Home/Report/SampleReport?parameter1=Item3&parameter2=Value3

The demo application could be downloaded from [here](https://github.com/telerik/reporting-samples/tree/master/ModelMvc). Run the [Upgrade Wizard]({% slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/visual-studio-report-designer/upgrade-wizard %}) before  starting the application.
