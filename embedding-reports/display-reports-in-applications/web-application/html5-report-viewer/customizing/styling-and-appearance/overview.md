---
title: Overview
page_title: Styling and Appearance of the HTML5 Report Viewer at a Glance
description: "Learn how the styling and appearance of the HTML5 Report Viewer can be changed in Telerik Reporting."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/customizing/styling-and-appearance/overview
tags: overview
published: True
reporting_area: HTML5
position: 0
previous_url: /html5-report-viewer-styling-and-appearance, /embedding-reports/display-reports-in-applications/web-application/html5-report-viewer/customizing/styling-and-appearance/
---

# Styling and Appearance of the HTML5 Report Viewer

The article elaborates on the styles used by the HTML5 Report Viewer, and how they can be loaded manually to be modified.

The styling and appearance of the HTML5 Report Viewer are controlled entirely through a set of CSS3 styles organized in classes with predefined names.

All viewer-related classes are supplied by a single CSS stylesheet that is referenced in the report viewer HTML template. The template is provided by the Reporting REST service. To enforce a custom template with a custom or default CSS, specify the **templateUrl** of the HTML5 Viewer widget option.

For reference, you can use the templates located in **%programfiles(x86)%\Progress\Reporting {{site.suiteversion}}\Html5\ReportViewer\templates**:

```JavaScript
<script type="text/javascript">
	$("#reportViewer1")
	.telerik_ReportViewer({
		serviceUrl: "/api/reports/",
		templateUrl: "/custom-templates-directory/templates/telerikReportViewerTemplate-{{buildversion}}.html"
	});
</script>
```

The template relies on the [Kendo UI SASS Themes](https://docs.telerik.com/kendo-ui/styles-and-layout/sass-themes/overview) to provide layout settings and the color schema for the HTML5 Report Viewer:

```HTML
<link href="https://kendo.cdn.telerik.com/themes/{{site.kendothemeversion}}/default/default-ocean-blue.css" rel="stylesheet" />
```

The default report viewer template and stylesheet depend on CSS media queries to adapt its layout according to the device and display. For the media queries to be activated properly, the browser’s viewport needs to be configured as follows:

```HTML
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
```

## See Also

- [HTML5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%})
- [Report Viewer Initialization]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/report-viewer-initialization%})
