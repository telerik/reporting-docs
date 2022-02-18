---
title: authenticationToken(token)
page_title: authenticationToken(token) | for Telerik Reporting Documentation
description: authenticationToken(token)
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/authenticationtoken(token)
tags: authenticationtoken(token)
published: True
position: 3
---
<style>
table th:first-of-type {
    width: 15%;
}
table th:nth-of-type(2) {
    width: 85%;
}
</style>

# authenticationToken(token)

Sets the authentication token.

Parameters:


| Parameter | Description |
| ------ | ------ |
| __token__ |string; the authentication token. For more information please see jQuery.fn.telerik_ReportViewer’s authenticationToken option in [Report Viewer Initialization]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/report-viewer-initialization%}#Options);|


Returns: the current *ReportViewer* object.

    
````js
var reportViewer = $("#reportViewer1").data("telerik_ReportViewer");
reportViewer.authenticationToken("bad18eba1ff45jk7858b8ae88a77fa30");
````

