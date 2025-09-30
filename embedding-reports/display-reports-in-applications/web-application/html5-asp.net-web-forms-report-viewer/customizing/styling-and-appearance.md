---
title: Styling and Appearance
page_title: Styling and Appearance of the HTML5 ASP.NET WebForms ReportViewer
description: "Learn how the styling and appearance of the HTML5 ASP.NET WebForms Report Viewer can be changed in Telerik Reporting."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-asp.net-web-forms-report-viewer/customizing/styling-and-appearance
tags: styling,and,appearance
published: True
reporting_area: WebFormsWrapper
position: 1
previous_url: /html5-webforms-report-viewer-customizing-styling
---

# Styling and Appearance of the HTML5 WebForms Report Viewer

The article elaborates on the styles used by the WebForms wrapper of the HTML5 Report Viewer, and how they can be loaded manually in order to be modified.

The required stylesheets are provided automatically through a `HTTPHandler` via request to the Reporting REST service. If you want to customize the viewer styling, you can stop the `HTTPHandler` from providing report viewer required Kendo CSS and JavaScripts by manually registering the Kendo JavaScript and CSS in the page head. The same approach should be used also when it is required to change the default theme of the viewer.

Below is an example of how to do that:

```XML
<head>
	<!--kendo.all.min.js can be used as well instead of kendo.web.min.js, kendo.mobile.min.js or telerikReportViewer-kendo-->
	<script src="https://kendo.cdn.telerik.com/{{kendosubsetversion}}/js/kendo.web.min.js" /script>
	<!--kendo.mobile.min.js - optional, if gestures/touch support is required-->
	<script src="https://kendo.cdn.telerik.com/{{kendosubsetversion}}/js/kendo.mobile.min.js" /script>

	<!--telerikReportViewer-kendo - optional, if you need to use a theme different from the default one-->
	<script src="/api/reports/resources/js/telerikReportViewer-kendo" /script>

	<!-- the required Kendo styles -->
	<link href="https://kendo.cdn.telerik.com/themes/{{site.kendothemeversion}}/default/default-ocean-blue.css" rel="stylesheet" />
</head>
```

The HTML5 Web Forms Report Viewer is using the default viewer template. In order to use your own template, you have to provide path to your customized one to the [TemplateUrl](/api/Telerik.ReportViewer.Html5.WebForms.ReportViewer#Telerik_ReportViewer_Html5_WebForms_ReportViewer_TemplateUrl) property.

## See Also

- [Styling and Appearance Overview]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/customizing/styling-and-appearance/overview%})
- [Templates Overview]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/customizing/styling-and-appearance/templates-overview%})
- [Templates Structure]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/customizing/styling-and-appearance/templates-structure %})
