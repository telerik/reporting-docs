---
title: Manual Setup
page_title: Manual Setup of the HTML5 Report Viewer
description: "Learn how to set up manually the Telerik Reporting HTML5 Report Viewer in Web applications in the .NET Framework."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/manual-setup
tags: manual,setup
published: True
reporting_area: HTML5
position: 4
previous_url: /html5-report-viewer-embedding
---

# Manual Setup of the HTML5 Report Viewer in Web Applications in the .NET Framework

In this article, you will learn how to manually add the HTML5 Report Viewer to an HTML page and display a report. This approach allows for full control over the configuration.

If you are looking for a less complicated approach, consider using the [Visual Studio item templates]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/how-to-use-html5-report-viewer-with-rest-service%}).

## Prerequisites

Before you continue, make sure that the following prerequisites are met:

1. Familiarity with the HTML5 Report Viewer [Requirements]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/requirements-and-browser-support%}).
1. A running application that hosts a Reporting REST service at address _/api/reports_. For more information, see [Telerik Reporting REST Services]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/overview%}).
1. A script with the custom [Kendo UI for jQuery](https://www.telerik.com/kendo-jquery-ui) distribution for Telerik Reporting (located in the **[TelerikReporting_InstallDir]\Html5\ReportViewer\js** folder) or with the mainstream Kendo UI distribution downloaded locally or via the [Kendo UI CDN service](https://docs.telerik.com/kendo-ui/intro/installation/cdn-service).
1. (Optional) If [programmatic type reports]({%slug telerikreporting/designing-reports/overview%}#programmatic-types) are used, add a reference from the project that hosts the Reporting REST service to the `Reports Library` project with the reports.

   > You must load only one version of [Kendo UI for jQuery](https://www.telerik.com/kendo-jquery-ui) styles and scripts on the page - [Kendo Widgets Requirements]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/requirements-and-browser-support%}#KendoWidgetsRequirements).

## Utilizing the HTML5 Report Viewer

The following steps produce an HTML page with settings similar to these in the integration demo projects installed by default under `C:\Program Files (x86)\Progress\Telerik Reporting {{site.suiteversion}}\Examples\CSharp\`:

1.  Create an HTML5 page:

	````HTML
<!DOCTYPE html>
	<html xmlns="http://www.w3.org/1999/xhtml">
		<head>
			<title>Telerik HTML5 Report Viewer</title>
		</head>
		<body>
		</body>
	</html>
````


1. Initialize the browser’s viewport in the `<head>` element:

	````HTML
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
````

	The viewport `META` tag is used to control the layout on mobile browsers.

1.  Add a reference to jQuery in the `<head>` element:

	````HTML
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
````


	> jQuery must be loaded before creating the viewer object.jQuery must be loaded only once on the page.

1. Add references to the Kendo UI Sass styles in the `<head>` element:

	````HTML
<link href="https://kendo.cdn.telerik.com/themes/10.2.0/default/default-ocean-blue.css" rel="stylesheet" />
````


1.  Add references to the HTML5 Report Viewer JavaScript file in the `<head>` element:

	````HTML
<script src="/api/reports/resources/js/telerikReportViewer"></script>
````


	>The report viewer JavaScript must be referenced after any other Kendo UI for jQuery widgets or bundles.

	If no **Kendo** widgets are utilized on the page, the report viewer will register a custom Kendo subset to enable the required Kendo widgets. The subset is served from the report service. If Kendo is used on the page or the CDN is preferred, make sure the following widgets are referenced:

	````HTML
<!--
	<script src="https://kendo.cdn.telerik.com/{{kendosubsetversion}}/js/kendo.core.min.js"></script>
	<script src="https://kendo.cdn.telerik.com/{{kendosubsetversion}}/js/kendo.data.odata.min.js"></script>
	<script src="https://kendo.cdn.telerik.com/{{kendosubsetversion}}/js/kendo.data.min.js"></script>
	<script src="https://kendo.cdn.telerik.com/{{kendosubsetversion}}/js/kendo.userevents.min.js"></script>
	<script src="https://kendo.cdn.telerik.com/{{kendosubsetversion}}/js/kendo.selectable.min.js"></script>
	<script src="https://kendo.cdn.telerik.com/{{kendosubsetversion}}/js/kendo.calendar.min.js"></script>
	<script src="https://kendo.cdn.telerik.com/{{kendosubsetversion}}/js/kendo.fx.min.js"></script>
	<script src="https://kendo.cdn.telerik.com/{{kendosubsetversion}}/js/kendo.draganddrop.min.js"></script>
	<script src="https://kendo.cdn.telerik.com/{{kendosubsetversion}}/js/kendo.mobile.scroller.min.js"></script>
	<script src="https://kendo.cdn.telerik.com/{{kendosubsetversion}}/js/kendo.virtuallist.min.js"></script>
	<script src="https://kendo.cdn.telerik.com/{{kendosubsetversion}}/js/kendo.popup.min.js"></script>
	<script src="https://kendo.cdn.telerik.com/{{kendosubsetversion}}/js/kendo.list.min.js"></script>
	<script src="https://kendo.cdn.telerik.com/{{kendosubsetversion}}/js/kendo.combobox.min.js"></script>
	<script src="https://kendo.cdn.telerik.com/{{kendosubsetversion}}/js/kendo.datepicker.min.js"></script>
	<script src="https://kendo.cdn.telerik.com/{{kendosubsetversion}}/js/kendo.resizable.min.js"></script>
	<script src="https://kendo.cdn.telerik.com/{{kendosubsetversion}}/js/kendo.dropdownlist.min.js"></script>
	<script src="https://kendo.cdn.telerik.com/{{kendosubsetversion}}/js/kendo.multiselect.min.js"></script>
	<script src="https://kendo.cdn.telerik.com/{{kendosubsetversion}}/js/kendo.splitter.min.js"></script>
	<script src="https://kendo.cdn.telerik.com/{{kendosubsetversion}}/js/kendo.window.min.js"></script>
	<script src="https://kendo.cdn.telerik.com/{{kendosubsetversion}}/js/kendo.color.min.js"></script>
	<script src="https://kendo.cdn.telerik.com/{{kendosubsetversion}}/js/kendo.slider.min.js"></script>
	<script src="https://kendo.cdn.telerik.com/{{kendosubsetversion}}/js/kendo.button.min.js"></script>
	<script src="https://kendo.cdn.telerik.com/{{kendosubsetversion}}/js/kendo.colorpicker.min.js"></script>
	<script src="https://kendo.cdn.telerik.com/{{kendosubsetversion}}/js/kendo.editor.min.js"></script>
	<script src="https://kendo.cdn.telerik.com/{{kendosubsetversion}}/js/kendo.listview.min.js"></script>
	<script src="https://kendo.cdn.telerik.com/{{kendosubsetversion}}/js/kendo.menu.min.js"></script>
	<script src="https://kendo.cdn.telerik.com/{{kendosubsetversion}}/js/kendo.panelbar.min.js"></script>
	<script src="https://kendo.cdn.telerik.com/{{kendosubsetversion}}/js/kendo.tooltip.min.js"></script>
	<script src="https://kendo.cdn.telerik.com/{{kendosubsetversion}}/js/kendo.treeview.min.js"></script>
	<script src="https://kendo.cdn.telerik.com/{{kendosubsetversion}}/js/kendo.touch.min.js"></script>
	kendo.mobile.min.js - optional, if gestures/touch support is required
	<script src="https://kendo.cdn.telerik.com/{{kendosubsetversion}}/js/kendo.mobile.min.js"></script>
	kendo.all.min.js or kendo.web.min.js can be used as well if Kendo is used outside the report viewer
	<script src="https://kendo.cdn.telerik.com/{{kendosubsetversion}}/js/kendo.web.min.js"></script>
	-->
````


1.  Add a `<div>` element to the `<body>` element that will serve as a placeholder for the viewer’s widget. The `<div>` element's ID attribute serves as a key(Id) for the viewer object. Its content (_loading..._) will be displayed while the viewer’s content is being loaded (from the template):

	````HTML
<div id="reportViewer1">
		loading...
	</div>
````


1. Add the following script element at the bottom of the `<body>` element and initialize the HTML5 Report Viewer widget through the reportViewer1 `<div>` element that we added above:

	````HTML
<script type="text/javascript">
		$("#reportViewer1")
			.telerik_ReportViewer({
				serviceUrl: "/api/reports/",
				reportSource: {
					report: "Dashboard.trdp",
					parameters: {
						ReportYear: 2002
					}
				}
			});
	</script>
````


	>The viewer's  __reportSource__ consists of report and parameters attributes, where __report__ is the string description of the report that will be displayed, and __parameters__ is a collection of parameter keys and values that will be sent to the report. The report's string description is handled on the server by the [report source resolver used in the Reporting REST service]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-service-report-source-resolver/overview%}).

1.  Make the viewer fill the entire browser window. Add the following style to the `<head>` element:

	````HTML
<style>
	#reportViewer1 {
		position: absolute;
		inset: 5px;
	}
</style>
````


	> The above CSS rule will be applied on the `<div>` element holding the viewer object. The HTML elements building the viewer object will be sized based on the size of this container `<div>` element. To make the viewer fit in another container, use *position:relative* and provide width and height values.

1. The HTML page that we have just created should look like this:

	````HTML
<!DOCTYPE html>
	<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>Telerik HTML5 Report Viewer</title>
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />

		<link href="https://kendo.cdn.telerik.com/themes/10.2.0/default/default-ocean-blue.css" rel="stylesheet" />

		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
		<script src="/api/reports/resources/js/telerikReportViewer"></script>

		<style>
			#reportViewer1 {
				position: absolute;
				inset: 5px;
			}
		</style>
	</head>
	<body>
		<div id="reportViewer1">
			loading...
		</div>
		<script type="text/javascript">
		$("#reportViewer1")
			.telerik_ReportViewer({
				serviceUrl: "/api/reports/",
				reportSource: {
					report: "Dashboard.trdp",
					parameters: {
						ReportYear: 2002
					}
				}
			});
		</script>
	</body>
	</html>
````

1. Run the project and navigate to the page with the HTML5 Report Viewer that we have just created.

## See Also

* [HTML5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%})
