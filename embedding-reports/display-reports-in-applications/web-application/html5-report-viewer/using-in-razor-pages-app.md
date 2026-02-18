---
title: Using in Razor Pages
page_title: HTML5 Report Viewer in ASP.NET Core Razor Pages - Telerik Reporting
description: "Learn how to add an HTML5 Report Viewer in an ASP.NET Core Razor web application."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/using-in-razor-pages-app
tags: how,use,html5,report,viewer,asp.net,core,.net,razor,pages,application
published: True
reportingArea: HTML5
position: 6
---

# Overview

This article guides you on how to add an HTML5 Report Viewer in an [ASP.NET Core in .NET {{site.mindotnetversion}}+ Razor Pages](https://learn.microsoft.com/en-us/aspnet/core/razor-pages) application.

## Prerequisites

The report viewer requires a reference to a running Reporting REST Service. The report viewer can consume reports generated and served by any of the following service implementations:

- A service that runs in another application.
- A service that runs in a Telerik Report Server instance.
- A service that is hosted locally in the same application.

In case you need to host it locally, follow the article [How to Host Reports Service in ASP.NET Core in .NET]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/asp.net-core-web-api-implementation/how-to-host-reports-service-in-asp.net-core-in-.net-5%}).

## Using the Telerik Razor Report Viewer Page Item Templates

The [HTML5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%}) can be integrated into [ASP.NET Core in .NET {{site.mindotnetversion}}+ Razor Pages](https://learn.microsoft.com/en-us/aspnet/core/razor-pages) applications with the `Telerik Razor Report Viewer Page {{site.suiteversion}}` template.

If you wish to connect the Report Viewer to a REST service, you can follow the steps outlined in the [How to Use HTML5 Report Viewer with REST Service]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/how-to-use-html5-report-viewer-with-rest-service%}) documentation article.

If you wish to connect the Report Viewer to a Report Server instance, refer to the article section [Configuring the HTML5 Report Viewer to work with Report Server using Item Templates]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/how-to-use-html5-report-viewer-with-report-server%}#configuring-the-html5-report-viewer-to-work-with-report-server-using-item-templates).

## Manual Configuration in Razor Pages Apps

1.  This tutorial relies on having already created an **ASP.NET Core Razor Pages** application. If such is not present, follow the [Get started with Razor Pages in ASP.NET Core](https://learn.microsoft.com/en-us/aspnet/core/tutorials/razor-pages/razor-pages-start) as the first step.
1.  Make sure that the app configuration inside the `Configure` method of the `Startup.cs` can serve static files:

    ```C#
    app.UseStaticFiles();
    ```

1.  Add a new razor page to the **Pages** directory of the _Razor Pages_ application, and create a `ReportSourceModel` class in the `.cshtml.cs` file, which will be used to provide the report name and parameters.

    ```C#
    public class ReportSourceModel : PageModel
    {
    	private static readonly JsonSerializerOptions serializerOptions = new JsonSerializerOptions()
    	{
    		DefaultIgnoreCondition = JsonIgnoreCondition.WhenWritingNull,
    		PropertyNamingPolicy = JsonNamingPolicy.CamelCase
    	};

    	private readonly ILogger<ReportSourceModel> _logger;

    	public required string Report { get; set; }

    	public Dictionary<string, object> Parameters { get; } = new Dictionary<string, object>();

    	public string Serialize()
    	{
    		return JsonSerializer.Serialize(new { this.Report, this.Parameters }, serializerOptions);
    	}

    	public ReportSourceModel(ILogger<ReportSourceModel> logger)
    	{
    		this._logger = logger;
    	}

    	public void OnGet()
    	{
    	}
    }
    ```

1.  In the razor page's `.cshtml` file, initialize the HTML5 Report Viewer and pass the `ReportSourceModel` from the `@model`:

    ```CSHTML
    @page
    @model ReportSourceModel
    @{
    	ViewData["Title"] = "Telerik HTML5 Report Viewer Demo";
    	Model.Report = "Barcodes Report.trdp";
    	//Model.Parameters.Add("ParameterName", ParameterValue);
    }
    @section Scripts {
    	<head>
    		<title>Teleirk HTML5 Report Viewer in ASP.NET Core Razor Pages App</title>
    		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    		<link rel="stylesheet" href="https://kendo.cdn.telerik.com/themes/10.2.0/default/default-ocean-blue.css" />
    		<script src="/api/reports/resources/js/telerikReportViewer"s"></script>
    		<style>
    			body {
    				font-family: Verdana, Arial, sans-serif;
    				margin: 5px;
    			}
    			#reportViewer1 {
    				position: absolute;
    				left: 5px;
    				right: 5px;
    				top: 50px;
    				bottom: 5px;
    				overflow: hidden;
    				clear: both;
    			}
    		</style>
    	</head>
    	<body>
    		<div id="reportViewer1">
    			loading...
    		</div>
    		@{
    			var reportSourceModel = Html.Raw(Model.Serialize());
    		}
    		<script type="text/javascript">
    			$(document).ready(function () {
    				$("#reportViewer1")
    					.telerik_ReportViewer({
    						id: "reportviewer1",
    						serviceUrl: "/api/reports",
    						reportSource: @reportSourceModel,
    						enableAccessibility: false,
    					});
    			});
    		</script>
    	</body>
    }
    ```

1.  Run the application and navigate to the razor page with the [HTML5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%}) to verify that it loads successfully.

## See Also

- [HTML5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%})
- [YouTube video "Setting up Telerik Html5 Report Viewer with external Telerik Reporting REST Service in .NET 5"](https://www.youtube.com/watch?v=GeCUGTgZziI)
