---
title: Using PrintPreview as a Default ViewMode in the Web Report Designer
description: Setting the PrintPreview as a default viewMode in the Web Report Designer
type: how-to
page_title: Setting the ViewMode of the Web Report Designer
slug: setting-the-viewmode-of-the-web-report-designer
position: 
tags: webreportdesigner, viewmode, printpreview
ticketid: 1561180
res_type: kb
---

## Environment
<table>
	<tbody>
		<tr>
			<td>Product Version</td>
			<td>13.2.19.918+</td>
		</tr>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
		</tr>
		<tr>
			<td>Report Viewer</td>
			<td>Blazor</td>
		</tr>
	</tbody>
</table>

## Description
Currently, the the [report viewer's options]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/report-viewer-initialization%}) 
of the [Web Report designer]({%slug telerikreporting/designing-reports/report-designer-tools/web-report-designer/overview%}) are not exposed. 
For that reason, you need to use a custom logic to set the default viewMode.

## Solution
In some of the upcoming releases, we will expose the viewer's options and you will be able to set them out of the box. For now, you need to use some custom code to set the default viewMode. Please, check the workaround below.

## Suggested Workarounds
If you are using the pure HTML Web Report Designer (not the Blazor wrapper), you can use the follwoing piece of code after the initialization of the designer"

````JavaScript
<script>
	// Second callback for mutationObserver will fire once WebReportDesigner is finished loading
	// This callback listenes for a click on the Preview button and triggers Print-preview mode while initialization of the ReportViewer
	const secondCallBack = function (mutationsList, observer) {
		$(".top-menu-area__button.-preview").on("click", () => requestAnimationFrame(() =>
			$("#webReportDesigner_preview").data("telerik_ReportViewer").bind(telerikReportViewer.Events.RENDERING_BEGIN, () => {
				$("#webReportDesigner_preview").data("telerik_ReportViewer").unbind(telerikReportViewer.Events.RENDERING_BEGIN);
				$("#webReportDesigner_preview").data("telerik_ReportViewer").viewMode("PRINT_PREVIEW");
			})));
	};
	// First callback waits for the loader HTML element to appear in the DOM, then creates a new MutationObserver for the loader
	const firstCallback = function (mutationsList, observer) {
		new MutationObserver(secondCallBack).observe(document.getElementsByClassName('twd-loader')[0], { attributes: true });
	};
	// Inital setup of the first MutationObserver
	const targetNode = document.getElementById('webReportDesigner');
	new MutationObserver(firstCallback).observe(targetNode, { childList: true });
</script>
````
 
