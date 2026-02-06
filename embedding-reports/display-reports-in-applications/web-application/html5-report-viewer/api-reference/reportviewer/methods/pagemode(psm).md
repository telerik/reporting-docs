---
title: pageMode(psm)
page_title: The pageMode(psm) method of the HTML5 Report Viewer explained
description: "Learn more about the pageMode(psm) method of the Telerik Reporting HTML5 Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/pagemode(psm)
tags: pagemode(psm)
published: True
reportingArea: HTML5
position: 10
previous_url: /html5-report-viewer-reportviewer-methods-pagemode-psm, /embedding-reports/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/pagemode(psm)
---

<style>
table th:first-of-type {
	width: 25%;
}
table th:nth-of-type(2) {
	width: 75%;
}
</style>

# The `pageMode(psm)` method of the HTML5 Report Viewer

Sets the page mode and automatically reloads the current report (if any) into the new view.

Parameters:

| Parameter | Description |
| ------ | ------ |
| __psm__ |string; the page mode. For more information please see jQuery.fn.telerik_ReportViewer’s pageMode option in [Report Viewer Initialization]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/report-viewer-initialization%}#options).|

Returns: the current *ReportViewer* object.

````JavaScript
var reportViewer = $("#reportViewer1").data("telerik_ReportViewer");
reportViewer.pageMode(telerikReportViewer.PageModes.SINGLE_PAGE);
````


## See Also

* [HTML5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%})
