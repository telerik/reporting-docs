---
title: scale(scale)
page_title: scale(scale) | for Telerik Reporting Documentation
description: scale(scale)
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/scale(scale)
tags: scale(scale)
published: True
position: 15
---

# scale(scale)



Sets the scale factor and scale mode. For more information please see jQuery.fn.telerik_ReportViewer’s scale and scaleMode options in [](c578f366-93da-4dd1-8972-6efbc5a1790b#Options).

Parameters:

| Parameter | Description |
| ------ | ------ |
| __scale__ |object with properties:<br/>* *scale* <br/>* *scaleMode* |

Returns: the current *ReportViewer* object.         

    
````js
var reportViewer = $("#reportViewer1").data("telerik_ReportViewer");
reportViewer.scale({
scaleMode: “SPECIFIC”,
scale: 0.75
});
````

