---
title: Providing Custom Templates
page_title: Providing Custom Templates for the HTML5 Report Viewer Explained
description: "Learn how to provide Custom Templates for changing the layout of the HTML5 Report Viewer in Telerik Reporting."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/customizing/styling-and-appearance/providing-custom-templates
tags: providing,custom,templates
published: True
position: 3
previous_url: /html5-report-viewer-customizing-providing-template
---

# Providing Custom Templates for the HTML5 Report Viewer

The article elaborates on how to use a customized HTML template for the HTML5 Report Viewer.

> All path references in the article should be adapted according to your project setup. For more information please refer to the MSDN article [ASP.NET Web Project Paths](https://learn.microsoft.com/en-us/previous-versions/ms178116(v=vs.140)). The mentioned Report Viewer Template files are provided with your Telerik Reporting Installation - [Installation Directories]({%slug telerikreporting/installation%}#directories-and-asemblies).

If you have a custom HTML template you should provide it to the telerik_ReportViewer plugin’s options:

````JavaScript
$("#reportViewer1").telerik_ReportViewer({
	serviceUrl: "../api/reports/",
	templateUrl: '/ReportViewer/templates/telerikReportViewerTemplate.html',
	reportSource: { report: "product catalog.trdp" }
});
````

The HTML template file is an HTML page while the templates are HTML document fragments inside HTML5 __template__ elements:

````HTML
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>Telerik HTML5 Report Viewer Templates</title>
	</head>
	<body>
		<template id="trv-report-viewer">
			<div class="trv-report-viewer" >
			...
			</div>
		</template>
	</body>
</html>
````

The templates are loaded during the initialization of the __telerik_ReportViewer__ widget. Since this is an asynchronous network operation(the template HTML is loaded with an HTTP GET request) that takes an unpredictable amount of time, the widget is not operational until it is successful; to find when the viewer is completely loaded provide a callback function to the __telerik_ReportViewer__ widget:

````JavaScript
$("#reportViewer1").telerik_ReportViewer({
	serviceUrl: "../api/reports/",
	templateUrl: '/ReportViewer/templates/telerikReportViewerTemplate',
	reportSource: { report: "product catalog.trdp" },
	ready: function() {
		// report viewer is now ready for action
	}
});
````


## See Also

* [HTML5 Report Viewer Overview]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%})
