---
title: Using in ASP.NET Core 3.1
page_title: Using HTML5 Report Viewer in ASP.NET Core 3.1
description: "Learn How to integrate the Telerik Reporting HTML5 Report Viewer in ASP.NET Core 3.1 applications."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/how-to-use-html5-report-viewer-in-an-asp.net-core-3.1-application
tags: how,to,use,html5,report,viewer,in,an,asp.net,core,3.1,application
published: True
position: 7
previous_url: /manual-setup-of-html5-report-viewer-in-asp-net-core-3
---

# Using the HTML5 Report Viewer in ASP.NET Core 3.1 Applications

This article guides you on how to add an HTML5 Report Viewer in an [ASP.NET Core 3.1](https://learn.microsoft.com/en-us/aspnet/core/?view=aspnetcore-3.1) web application.

## Prerequisites

The report viewer requires a reference to a running Reports Web Service. The report viewer can consume reports generated and served by any of the following Reports Web Service implementations:

* A service that runs in another application.
* A service that runs in a Telerik Report Server instance.
* A service that is hosted locally in the same application.

In case you need to host it locally, follow the article [How to Host Reports Service in ASP.NET Core 3.1]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/asp.net-core-web-api-implementation/how-to-host-reports-service-in-asp.net-core-3.1%}).

## Adding the HTML5 Report Viewer component using an item template

The HTML5 Report Viewer item template allows you to quickly and easily add the HTML5 Report Viewer to your application.

If you wish to connect the Report Viewer to a REST service, you can follow the steps outlined in the [How to Use HTML5 Report Viewer with REST Service]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/how-to-use-html5-report-viewer-with-rest-service%}) documentation article.

If you wish to connect the Report Viewer to a Report Server instance, refer to the article section [Configuring the HTML5 Report Viewer to work with Report Server using Item Templates]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/how-to-use-html5-report-viewer-with-report-server%}#configuring-the-html5-report-viewer-to-work-with-report-server-using-item-templates).

## Adding the HTML5 Report Viewer component manually

1. This tutorial uses the `Barcodes Report.trdp` report definitions file that must be located in a `Reports` folder inside the project. Follow the steps in the section [Add Report Definitions]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/asp.net-core-web-api-implementation/how-to-host-reports-service-in-asp.net-core-3.1%}#add-report-definitions) to make the `Barcodes Report.trdp` file available in your project.
1. Make sure that the app configuration inside the `Configure` method of the `Startup.cs` can serve static files:

	````C#
app.UseStaticFiles();
````


1. Add an HTML Page for the HTML5 Report Viewer by right-clicking on *wwwroot* and __Add > New Item... > HTML Page__. Name the file __index.html__ and add the HTML5 Report Viewer's initialization. For a detailed explanation, check the HTML5 Report Viewer [Manual Setup]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/manual-setup%}) help article. The required references to jQuery and Telerik Kendo UI CSS and JS files are listed in the example below. By default, the necessary Report Viewer scripts and styles are served by the REST Service. The complete report viewer page should look like this:

	````HTML
<!DOCTYPE html>
	<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>Telerik HTML5 Report Viewer Demo in ASP.NET Core</title>
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>>
		<link href="https://kendo.cdn.telerik.com/{{kendosubsetversion}}/styles/kendo.common.min.css" rel="stylesheet" />
		<link href="https://kendo.cdn.telerik.com/{{kendosubsetversion}}/styles/kendo.blueopal.min.css" rel="stylesheet" />
		<script src="/api/reports/resources/js/telerikReportViewer"></script>>
		<style>
			#reportViewer1 {
				position: absolute;
				left: 5px;
				right: 5px;
				top: 50px;
				bottom: 5px;
				overflow: hidden;
				font-family: Verdana, Arial;
			}
		</style>
	</head>
	<body>
		<div id="reportViewer1">
			loading...
		</div>
		<script>
			$(document).ready(function () {
				$("#reportViewer1")
					.telerik_ReportViewer({
						serviceUrl: "api/reports/",
						reportSource: {
							report: "Barcodes Report.trdp",
							parameters: {}
						},
						viewMode: telerikReportViewer.ViewModes.INTERACTIVE,
						scaleMode: telerikReportViewer.ScaleModes.SPECIFIC,
						scale: 1.0,
						enableAccessibility: false,
						sendEmail: { enabled: true }
					});
			});
		</script>
	</body>
	</html>
````


1. Set the *launchSettings.json* `launchUrl` to the new HTML page.
1. Finally, run the project to see the report.

## See Also

* [.NET Core Support]({%slug telerikreporting/using-reports-in-applications/dot-net-core-support%})
* [HTML5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%})
