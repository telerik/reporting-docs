---
title: Passing Parameters to HTML5 Viewer From the Model of a View
description: "Learn the specifics of passing a parameter to the Telerik Reporting HTML5 Report Viewer from the Model of a View."
type: how-to
page_title: Passing View Model as parameters values in the HTML5 Report Viewer
slug: pass-parameters-to-html5-report-viewer-from-a-views-model
tags: 
ticketid: 1587587
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
			<td>ASP.NET Core</td>
		</tr>
	</tbody>
</table>

## Description

When working with the HTML Report Viewer jQuery widget, passing parameters to it from the model of the view can be a bit tricky sometimes. This is due to the serialization and encoding of the model properties. The following article describes a general approach that can be used to both achieve the above, and reduce the amount of JSON one needs to type to initialize the viewer.

## Solution

1. Since the parameters dictionary is a child element of the `reportSource` property, as shown in the [HTML5 Report Viewer API Reference]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/report-viewer-initialization%}), we will create a custom model that represents the `reportSource` property:

	````C#
public class ReportSourceModel
	{
		public string Report { get; set; }
		public Dictionary<string, object> Parameters { get; set; }
	}
````


1. Then we can create an instance of this model and conveniently pass all the necessary parameters in our controller:

	````C#
public class HomeController : Controller
	{
		public IActionResult Index()
		{
			var reportSourceModel = new ReportSourceModel()
			{
				Report = "Product Line Sales.trdp",
				Parameters = new Dictionary<string, object>()
			};
			reportSourceModel.Parameters.Add("ProductCategory", "Clothing");
			reportSourceModel.Parameters.Add("ProductSubcategory", new string[] { "Caps", "Gloves", "Vests" });

			return View(reportSourceModel);
		}
	}
````


1. Once this is done, it is important that **the value we provide to the Report Viewer widget is serialized to JSON, and any HTML encoding is removed**. We can use the `Json.Serialize()` and the `Html.Raw()` methods respectively to accomplish this:

	````HTML
@using Demo.Models
	@model ReportSourceModel

	<div id="reportViewer1">
		loading...
	</div>

	@{
		var reportSource = Html.Raw(Json.Serialize(Model));
	}

	<script type="text/javascript">

		$("#reportViewer1")
			.telerik_ReportViewer({
				id: "reportviewer1",
				serviceUrl: "/api/reports/",
				reportSource: @reportSource
			});
		});
	</script>
````


## Demo Project

You can find a sample project that implements the above in the [following GitHub repo](https://github.com/telerik/reporting-samples/tree/master/HTML5ViewerParametersDemo).

## See Also

* [How to use Visual Studio Report Designer to edit CS Reports in .Net Core Projects]({%slug how-to-use-vs-designer-in-dotnet-core%})
