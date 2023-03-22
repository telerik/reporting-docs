---
title: Overview
page_title: Styling and Appearance of the HTML5 Report Viewer at a Glance
description: "Learn how the styling and appearance of the HTML5 Report Viewer can be changed in Telerik Reporting."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/customizing/styling-and-appearance/overview
tags: overview
published: True
position: 0
previous_url: /html5-report-viewer-styling-and-appearance
---

# Styling and Appearance of the HTML5 Report Viewer

The article elaborates on the styles used by the HTML5 Report Viewer, and how they can be loaded manually in order to be modified.

The styling and appearance of the HTML5 Report Viewer is controlled entirely through a set of CSS3 styles organized in classes with predefined names.

> All path references in the article should be adapted according to your project setup. For more information please refer to the MSDN article [ASP.NET Web Project Paths](https://learn.microsoft.com/en-us/previous-versions/ms178116(v=vs.140)) The mentioned Report Viewer Template files are provided with your Telerik Reporting Installation - [Installation Directories]({%slug telerikreporting/installation%}#directories-and-asemblies).

All viewer related classes are supplied by a single CSS stylesheet referenced in the report viewer HTML template. The template is provided by the Reporting REST service. To force a custom template with  a custom or default CSS specify the __templateUrl__ of the HTML5 Viewer widget option. For reference you can use the templates located in __%programfiles(x86)%\Progress\Reporting {{site.suiteversion}}\Html5\ReportViewer\templates__:

````JavaScript
<script type="text/javascript">
	$("#reportViewer1")
	.telerik_ReportViewer({
		serviceUrl: "/api/reports/",
		templateUrl: /ReportViewer/templates/telerikReportViewerTemplate-{{buildversion}}.html
		......
	});
</script>
````

In addition the Kendo UI CSS needs to be supplied in order for the Kendo UI widgets to be operational:

````HTML
<link href="/kendo/styles/kendo.common.min.css" rel="stylesheet" />
````

While these classes provide layout settings the HTML5 Report Viewer depends on the Kendo UI themes for its colors (theme):

````HTML
<link href="/kendo/styles/kendo.blueopal.min.css" rel="stylesheet" />
````

The default template depends on Telerik Web UI font, that is provided by the Reporting REST service. 

Additionally we provide a template that depends on  [Font Awesome](https://fontawesome.com/)  for the menu icons. Font Awesome is not part of the Telerik HTML5 Report Viewer distribution and could be obtained from [https://fontawesome.com/download](https://fontawesome.com/download).

> Please note that you are not required nor limited to use our font or Font Awesome. The distributed templates provide only a base/reference implementation of the report viewer’s content that can be modified according to your needs.

In order to use Font Awesome you have to specify the font awesome template. The template is located in (%programfiles(x86)%\Progress\Reporting {{site.suiteversion}}\Html5\ReportViewer\templates):

````JavaScript
<script type="text/javascript">
	$("#reportViewer1")
	.telerik_ReportViewer({
		templateUrl: /ReportViewer/templates/telerikReportViewerTemplate-FA-{{buildversion}}.html
		....
</script>
````

The default viewer template and stylesheet depend on CSS media queries to adapt its layout according to the device and display. In order the media queries to be activated properly the browser’s viewport needs to be initialized like this:

````HTML
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
````

## See Also

* [HTML5 Report Viewer - Overview]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%})
* [Report Viewer Initialization]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/report-viewer-initialization%})
