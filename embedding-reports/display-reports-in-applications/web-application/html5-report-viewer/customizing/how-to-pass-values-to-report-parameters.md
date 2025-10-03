---
title: Passing Values to Report Parameters
page_title: Sending Values to Report Parameters from outside HTML5 ReportViewer
description: "Learn how to pass values to Report Parameters from Components located outside the HTML5 ReportViewer in Telerik Reporting."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/customizing/how-to-pass-values-to-report-parameters
tags: pass,values,report,parameters
published: True
reporting_area: HTML5
position: 4
previous_url: /html5-report-viewer-howto-custom-parameters
---

# Passing Values to Report Parameters from Components Outside the HTML5 Report Viewer

This topic explains how to use the custom parameters UI to update the report parameters instead of using the report viewer's default implementation of the parameters area. The report and all required parameters for it are packed in a ReportSource object. To update the report source the [ReportViewer.reportSource(rs)]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/reportsource(rs)%}) method is used.

To give an example, we will use the Invoice report from our examples and will update its __OrderNumber__ parameter from a custom parameter UI.

## Pass values to report parameters

> All path references in the described steps should be adapted according to your project setup. For more information, please refer to the MSDN article [ASP.NET Web Project Paths](https://learn.microsoft.com/en-us/previous-versions/ms178116(v=vs.140))

1. Add a new html page `CustomParameters.html` to the _CSharp.Html5Demo_ or _VB.Html5Demo_ project.
1. Add the references to all required JavaScript libraries and stylesheets:

	{{source=CodeSnippets\BlazorAppSnippets\wwwroot\manual-setup\customize\AddRequiredSriptsAndStyles.html}}

1. Display the custom parameter UI with a selector such as the [<select> element](https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Elements/select) with a few values :

	````HTML
<div id="invoiceIdSelector">
		<label for="invoiceId">Invoices</label>

		<select id="invoiceId" title="Select the Invoice ID">
			<option value="SO51081">SO51081</option>
			<option value="SO51082" selected="selected">SO51082</option>
			<option value="SO51083">SO51083</option>
		</select>
	</div>
````


1.  Add the ReportViewer placeholder element:

	````HTML
<div id="reportViewer1">
	loading...
</div>
````


1. Now, initialize the HTML5 Report Viewer widget. We will use the minimal set of all [possible options]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/report-viewer-initialization%}). Note that the value from the custom UI is used to set the __OrderNumber__ report parameter initially:

	````JavaScript
$(document).ready(function () {
		$("#reportViewer1").telerik_ReportViewer({
			serviceUrl: "api/reports/",
			reportSource: {
				report: "Invoice.trdp",
				parameters: {
					OrderNumber: $('#invoiceId option:selected').val()
					}
			}
		});
	});
````


1.  Add code that updates the `ReportSource` parameters collection with the selected **Invoice Id** from the dropdown selector:

	````JavaScript
$('#invoiceId').change(function () {
	var reportViewer = $("#reportViewer1").data("telerik_ReportViewer");
	reportViewer.reportSource({
		report: reportViewer.reportSource().report,
		parameters: { OrderNumber: $(this).val() }
		});
		//Setting the HTML5 Viewer's reportSource causes a refresh automatically
		//if you need to force a refresh for other cases, use:
		//viewer.refreshReport();
	});
````


1. The HTML page that we have just created should look like this:

	````HTML
<!DOCTYPE html>
	<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>Telerik HTML5 Report Viewer Demo With Custom Parameter</title>
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />

		<link href="https://kendo.cdn.telerik.com/themes/10.2.0/default/default-ocean-blue.css" rel="stylesheet" />

		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
		<script src="/api/reports/resources/js/telerikReportViewer"></script>

		<style>
			#reportViewer1 {
				position: absolute;
				inset: 5px;
				overflow: hidden;
				font-family: Verdana, Arial;
			}
		</style>
	</head>
	<body>
		<div id="invoiceIdSelector">
			<label for="invoiceId">Invoices</label>

			<select id="invoiceId" title="Select the Invoice ID">
				<option value="SO51081">SO51081</option>
				<option value="SO51082" selected="selected">SO51082</option>
				<option value="SO51083">SO51083</option>
			</select>
		</div>

		<div id="reportViewer1">
			loading...
		</div>

		<script type="text/javascript">
			$(document).ready(function () {
				$("#reportViewer1").telerik_ReportViewer({
						serviceUrl: "api/reports/",
						reportSource: {
							report: "Invoice.trdp",
							parameters: { OrderNumber: $('#invoiceId option:selected').val() }
						},
				});
			});

			$('#invoiceId').change(function () {
				var reportViewer = $("#reportViewer1").data("telerik_ReportViewer");
				reportViewer.reportSource({
					report: reportViewer.reportSource().report,
					parameters: { OrderNumber: $(this).val() }
				});
				//Setting the HTML5 Viewer's reportSource causes a refresh automatically
				//if you need to force a refresh for other cases, use:
				//viewer.refreshReport();
			});
		</script>
	</body>
	</html>
````


## See Also

* [HTML5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%})
* [Custom Parameter Editors]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/customizing/how-to-create-a-custom-parameter-editor%})
