---
title: authenticationToken(token)
page_title: authenticationToken(token) | for Telerik Reporting Documentation
description: authenticationToken(token)
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/authenticationtoken(token)
tags: authenticationtoken(token)
published: True
position: 3
---

# authenticationToken(token)



Sets the authentication token.

Parameters:

| Parameter | Description |
| ------ | ------ |
| __token__ |string; the authentication token. For more information please see jQuery.fn.telerik_ReportViewer’s authenticationToken option in [](c578f366-93da-4dd1-8972-6efbc5a1790b#Options);|

Returns: the current *ReportViewer*  object.         

    
````js
var reportViewer = $("#reportViewer1").data("telerik_ReportViewer");
reportViewer.authenticationToken("bad18eba1ff45jk7858b8ae88a77fa30");
````

