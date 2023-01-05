---
title: Disable Double Click Zooming for Telerik Reporting Html5 Report Viewer
description: By default double click switches between the scale modes of the viewer. Here we explain how to disable this behavior.
type: how-to
page_title: Disable Switching Between Scale Modes on Double Click.
slug: disable-switching-between-scale-modes-with-double-click.
position: 
tags: 
ticketid: 1422303
res_type: kb
---

## Environment
<table>
	<tbody>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
		</tr>
	</tbody>
</table>


## Description
Double-click in the Html5 Viewer content area switches between the __Scale modes__ *__full page__*, __*page width*__ and __*custom scale factor*__ - [Report Viewer Initialization]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/report-viewer-initialization%}). The double-tap functionality is set via [kendoTouch](https://docs.telerik.com/kendo-ui/api/javascript/mobile/ui/touch) settings on creating the viewer's HTML elements in the telerikReportViewer JavaScript file.

## Solution
The easiest option to remove this functionality is by unbinding the "doubletap" event in the __pageReady__ event of the viewer. For this purpose you may add the following handler for the __pageReady__ [Client Event]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/events/pageready(e,-args)%}):
```JavaScript
<script>
    function onReady(e, args) {
        var kendoTouch = $(".trv-pages-area").data("kendoTouch");

        if (kendoTouch) {
            kendoTouch.unbind("doubletap");
        }
    }
	
    $(document).ready(function () {
        $("#reportViewer1")
            .telerik_ReportViewer({
                ...
                pageReady: onReady
            });
    });
</script>
```

With the above changes, the double-click in the viewer will be handled by the default browser double-click behavior. Generally, it will select the region where the user has clicked.
