---
title: Hide/Change HTML5 Report Viewer toolbar buttons
description: How to hide or change HTML5 Report Viewer toolbar buttons
type: how-to
page_title: Hide/Change HTML5 Report Viewer toolbar buttons
slug: hide-or-change-html5-report-viewer-toolbar-buttons
position: 
tags: Html5ReportViewer
ticketid: 1173112
res_type: kb
---

## Environment
<table>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting</td>
	</tr>
	<tr>
		<td>Viewer</td>
		<td>HTML5 Viewer</td>
	</tr>
</table>


## Description
Sometimes it would be nice to hide some of the buttons from the toolbar that are not in use.

## Solution
Toolbar buttons can be hidden in two ways:

1. Using custom HTML template for the viewer instead of the default one. Firstly, the template should be provide to the *reportViewer1* element options, like for example:
    ```JavaScript
    $("#reportViewer1")
        .telerik_ReportViewer({
            serviceUrl: "/api/reports/",
            templateUrl: /ReportViewer/templates/telerikReportViewerTemplate.html
            ...
    });
    ```
    Then change/remove the buttons from the provided template as follows:
    ```HTML
    <div class="trv-content-wrapper k-content">
        <div class="trv-nav k-widget">
            <ul tabindex="1" aria-label="Main menu" class="trv-menu-large" data-role="telerik_ReportViewer_MainMenu">
                <!-- start removing buttons from here -->
                <li><a data-command="telerik_ReportViewer_historyBack" title="Navigate Backward" href="#"><i class="t-font-icon t-i-undo"></i></a></li>
                <li><a data-command="telerik_ReportViewer_historyForward" title="Navigate Forward" href="#"><i class="t-font-icon t-i-redo"></i></a></li>
    
                <li><a data-command="telerik_ReportViewer_refresh" href="#" title="Refresh"><i class="t-font-icon t-i-refresh-a"></i></a></li>
    
                <li><a data-command="telerik_ReportViewer_goToFirstPage" title="First Page" href="#"><i class="t-font-icon t-i-arrow-double-60-w"></i></a></li>
                <li><a data-command="telerik_ReportViewer_goToPrevPage" title="Previous Page" href="#"><i class="t-font-icon t-i-seek-w"></i></a></li>
    
                <li title="Page Number Selector" class="trv-report-pager">
                    <input data-role="telerik_ReportViewer_PageNumberInput" type="number" />
                    <span> / </span>
                    <span data-role="telerik_ReportViewer_PageCountLabel"></span>
                </li>
    
                <li><a data-command="telerik_ReportViewer_goToNextPage" title="Next Page" href="#"><i class="t-font-icon t-i-seek-e"></i></a></li>
                <li><a data-command="telerik_ReportViewer_goToLastPage" title="Last Page" href="#"><i class="t-font-icon t-i-arrow-double-60-e"></i></a></li>
    
                <li><a data-command="telerik_ReportViewer_togglePrintPreview" title="Toggle Print Preview" href="#"><i class="t-font-icon t-i-file"></i></a></li>
    
                <li id="main-menu-export-command">
                    <a title="Export" href="#" data-command="telerik_ReportViewer_export"><i class="t-font-icon t-i-download"></i> </a>
                    <ul data-command-list="export-format-list" id="mainmenu-export-format-list"></ul>
                </li>
    
                <li><a data-command="telerik_ReportViewer_print" title="Print" href="#"><i class="t-font-icon t-i-print"></i></a></li>
    
                <li><a data-command="telerik_ReportViewer_toggleDocumentMap" title="Toggle Document Map" href="#"><i class="t-font-icon t-i-book"></i></a></li>
                <li><a data-command="telerik_ReportViewer_toggleParametersArea" title="Toggle Parameters Area" href="#"><i class="t-font-icon t-i-filter"></i></a></li>
    
                <li><a title="Zoom In" href="#" data-command="telerik_ReportViewer_zoomIn"><i class="t-font-icon t-i-zoom-in"></i></a></li>
                <li><a title="Zoom Out" href="#" data-command="telerik_ReportViewer_zoomOut"><i class="t-font-icon t-i-zoom-out"></i></a></li>
                <li><a title="Toggle FullPage/PageWidth" href="#" data-command="telerik_ReportViewer_toggleZoomMode"><i class="t-font-icon t-i-zoom"></i></a></li>
            </ul>
            ...
    ```
    For reference, please check [Providing Custom Templates]({% slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/customizing/styling-and-appearance/providing-custom-templates %}) help article.
2. Using custom CSS rules or JavaScript, for example:
``` JavaScript
$("#reportViewer1")
   .telerik_ReportViewer({                
       serviceUrl: "api/reports/",
       ...
       ready: function () {
           $("[data-command='telerik_ReportViewer_historyBack']").parent().hide();
       }
});
```
The above code will hide Navigate Back button using the callback function set as [viewer's ready option]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/report-viewer-initialization%}).
