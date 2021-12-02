---
title: clearReportSource()
page_title: clearReportSource() | for Telerik Reporting Documentation
description: clearReportSource()
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/clearreportsource()
tags: clearreportsource()
published: True
position: 5
---

# clearReportSource()



## 

Clears the current reportSource from the viewer internal state and from its persisted session in the browser. Called in order to force the viewer to respect the newly set reportSource on a server postback.         

Returns: a reference for the reportViewer object.

	
````html
<input id="buttonChangeReportSource" type="submit" value="Change Report Source" />
````
````js
$(document).ready(function () {
    $("#buttonChangeReportSource").on("click", function () {
        var viewer = $("#reportViewer1").data("telerik_ReportViewer");
        viewer.clearReportSource();
    });
});
````



# See Also

