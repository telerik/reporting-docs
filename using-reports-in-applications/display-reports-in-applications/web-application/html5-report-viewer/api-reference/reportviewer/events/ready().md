---
title: ready()
page_title: ready() | for Telerik Reporting Documentation
description: ready()
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/events/ready()
tags: ready()
published: True
position: 0
---

# ready()



A callback function that will be called when the viewer content has been loaded from the template and is ready to display reports           or perform any other operations on it. The function is executed in the context of the ReportViewer object that is available through           the __this__ object.         

    
````js
// $(handler) is jQuery's shorthand for $(document).ready(handler)
$(function () {
  $("#reportViewer1").telerik_ReportViewer({
    serviceUrl: "api/reports/",
    reportSource: {
        report: "Telerik.Reporting.Examples.CSharp.Invoice, CSharp.ReportLibrary"
    },
    ready: function() {
    }
});
````

## Event Binding

