---
title: Resize the HTML5 Report Viewer to Accommodate Its Content
description: "Learn how to resize the HTML5 Report Viewer and its MVC wrapper to accommodate its content in this step-by-step tutorial for Telerik Reporting."
type: how-to
page_title: Resize the HTML5 Viewer and its MVC wrapper to accommodate its content
slug: how-to-resize-the-report-viewer-to-accommodate-its-content
position: 
tags: 
res_type: kb
---

## Environment

<table>
	<tr>
		<td>Product Version</td>
		<td>13.0.19.116</td>
	</tr>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting</td>
	</tr>
	<tr>
		<td>Report Viewers</td>
		<td>HTML5 Report Viewer, HTML5 ASP.NET MVC Report Viewer, HTML5 ASP.NET Web Forms Report Viewer, Angular Report Viewer</td>
	</tr>
</table>

## Description

When the report page displayed in the [HTML5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%}) is too long, a vertical scrollbar appears inside the viewer. This behavior aids in viewer-exclusive webpages, but may not look perfect in more complex user applications which might have their own containers with scrollbars, or even a scrollbar appearing in the browser. Multiple scrollbars inside a single webpage may deteriorate the overall user experience.

## Solution

The default behavior of the viewer can be changed so the viewer is resized automatically in order to accommodate the currently displayed report page. To achieve that follow these steps:

### Steps for the pure HTML5 Report Viewer

1. Remove the default report viewer container styles if they are present in your application:

	````CSS
#reportViewer1 {
		position: absolute;
		left: 5px;
		right: 5px;
		top: 40px;
		bottom: 5px;
		overflow: hidden;
		clear: both;
	}
````


1. Add the following styles to the page:

	````CSS
#reportViewer1 {
		height: 600px;
	}

	#reportViewer1 .k-splitter .k-scrollable {
		overflow: hidden;
	}
````


1. Set the viewer page mode to the single page.

	````JavaScript
$(document).ready(function () {
		$("#reportViewer1")
			.telerik_ReportViewer({
				serviceUrl: "api/reports/",
				reportSource: {
					report: "Telerik.Reporting.Examples.CSharp.ReportCatalog, CSharp.ReportLibrary"
				},
				pageMode: telerikReportViewer.PageModes.SINGLE_PAGE,
			});
	});
````


1. Subscribe to the viewer's `pageReady` event and set the Viewer hight based on the report page content:

	````JavaScript
$(document).ready(function () {
		$("#reportViewer1")
			.telerik_ReportViewer({
				serviceUrl: "api/reports/",
				reportSource: {
					report: "Telerik.Reporting.Examples.CSharp.ReportCatalog, CSharp.ReportLibrary"
				},
				//Resize the viewer when the page is ready
				pageReady: function (e, args) {
					resizeViewer();
				}
			});
		
		function resizeViewer() {
			var pageHeight = $(".trv-pages-area .trv-page-wrapper").height() + $(".trv-nav").outerHeight() + 2, // Calculate the report page height
				viewer = $("#reportViewer1"),
				viewerHeight = viewer.height();
		
			if (viewerHeight !== pageHeight ) {
				viewer.height(pageHeight);
				var documentMapSplitter = $(".trv-document-map-splitter").data("kendoSplitter");
				documentMapSplitter.resize(true);
		
				var parameterSplitter = $(".trv-parameters-splitter").data("kendoSplitter");
				parameterSplitter.resize(true);
			}
		}
	});
````


### Steps for the MVC wrapper for HTML5 Report Viewer

1. The same as for the pure HTML5 Report Viewer
1. The same as for the pure HTML5 Report Viewer
1. Set the viewer's page mode to the single page:

	````C#
@(Html.TelerikReporting().ReportViewer()
		.Id("reportViewer1")
		//...
		.PageMode(PageMode.SinglePage)
	)
````


1. Subscribe to the viewer's `pageReady` event and set the viewer's height based on the report page content:

	````C#
@(Html.TelerikReporting().ReportViewer()
		.Id("reportViewer1")
		//...
		.PageMode(PageMode.SinglePage)
		.ClientEvents(
			events => events
						.PageReady("onPageReady")
		)
	)
````

	````JavaScript
<script type="text/javascript">
	function onPageReady() {
		resizeViewer();
	}

	function resizeViewer() {
		var pageHeight = $(".trv-pages-area .trv-page-wrapper").height() + $(".trv-nav").outerHeight() + 2, // Calculate the report page height
			viewer = $("#reportViewer1"),
			viewerHeight = viewer.height();
	
		if (viewerHeight !== pageHeight ) {
			viewer.height(pageHeight);
			var documentMapSplitter = $(".trv-document-map-splitter").data("kendoSplitter");
			documentMapSplitter.resize(true);
	
			var parameterSplitter = $(".trv-parameters-splitter").data("kendoSplitter");
			parameterSplitter.resize(true);
		}
	}
</script>
````

