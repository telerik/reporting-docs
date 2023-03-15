---
title: clearReportSource()
page_title: The clearReportSource() method of the HTML5 Report Viewer explained
description: "Learn more about the clearReportSource() method of the Telerik Reporting HTML5 Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/clearreportsource()
tags: clearreportsource()
published: True
position: 5
previous_url: /html5-report-viewer-reportviewer-methods-clearreportsource
---

# The `clearReportSource()` method of the HTML5 Report Viewer

Clears the current reportSource from the viewer internal state and from its persisted session in the browser. Called in order to force the viewer to respect the newly set reportSource on a server postback.

Returns: a reference for the reportViewer object.

````HTML
<input id="buttonChangeReportSource" type="submit" value="Change Report Source" />
````
````JavaScript
$(document).ready(function () {
	$("#buttonChangeReportSource").on("click", function () {
		var viewer = $("#reportViewer1").data("telerik_ReportViewer");
		viewer.clearReportSource();
	});
});
````

