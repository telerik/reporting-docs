---
title: Set DatePicker Culture in MVC Report Viewer
description: "Learn how to set another language/culture for the Kendo DatePicker widget in MVC Report Viewer."
type: how-to
page_title: Changing the culture of the DatePicker in MVC Report Viewer
slug: set-another-language-datepicker-html5-reportviewer-mvc
tags: Localization, HTML5MVCReportViewer
ticketid: 1495437
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

The culture of the Kendo widgets, such as the [Kendo DatePicker](https://docs.telerik.com/kendo-ui/controls/datepicker/overview) is controlled outside of the [HTML5-based Report Viewers]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%}) and must be set separately.

This KB article gives a brief description of how to set up the Kendo widgets to work with another language. The example will demonstrate the date representation in `Spanish`.

## Solution

1. Add the required culture script to the page after loading `jQuery` and the Kendo subset of the Report Viewer as demonstrated in the example below:

	````HTML
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://demos.telerik.com/reporting/api/reports/resources/js/telerikReportViewer-kendo"></script>
	<script src="http://kendo.cdn.telerik.com/{{kendosubsetversion}}/js/cultures/kendo.culture.es-PY.min.js"></script>
	<script src="https://demos.telerik.com/reporting/api/reports/resources/js/telerikReportViewer"></script>
````


1. Then, the culture of the Kendo widget must be set through the [`kendo.culture`](https://docs.telerik.com/kendo-ui/api/javascript/kendo/methods/culture) function and it should be executed before the report viewer's initialization code:

	````HTML
<script type="text/javascript">
		kendo.culture("es-PY");
	
			$("#reportViewer1")
				.telerik_ReportViewer({
					serviceUrl: "https://demos.telerik.com/reporting/api/reports/",
					reportSource: {
						report: "Employee Sales Summary.trdx",
					}
				});
	</script>
````


## Demo

A sample project can be found in our [GitHub repository](https://github.com/telerik/reporting-samples/tree/master/Change%20of%20Culture%20of%20Kendo%20DatePicker%20in%20the%20HTML5%20MVC%20RV).

## See Also

* [Kendo UI for jQuery Internationalization Overview](https://docs.telerik.com/kendo-ui/globalization/intl/overview)
