---
title: authenticationToken(token)
page_title: The authenticationToken(token) method of the HTML5 Report Viewer
description: "Learn more about the authenticationToken(token) method of the Telerik Reporting HTML5 Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/authenticationtoken(token)
tags: authenticationtoken(token)
published: True
reportingArea: HTML5
position: 3
previous_url: /html5-report-viewer-reportviewer-methods-authenticationtoken, /embedding-reports/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/authenticationtoken(token)
---

<style>
table th:first-of-type {
	width: 15%;
}
table th:nth-of-type(2) {
	width: 85%;
}
</style>

# The `authenticationToken(token)` method of the HTML5 Report Viewer

Sets the authentication token.

Parameters:

| Parameter | Description |
| ------ | ------ |
| __token__ |string; the authentication token. For more information please see jQuery.fn.telerik_ReportViewer’s authenticationToken option in [Report Viewer Initialization]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/report-viewer-initialization%}#Options);|


Returns: the current *ReportViewer* object.

````JavaScript
var reportViewer = $("#reportViewer1").data("telerik_ReportViewer");
reportViewer.authenticationToken("bad18eba1ff45jk7858b8ae88a77fa30");
````


## See Also

* [HTML5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%})
