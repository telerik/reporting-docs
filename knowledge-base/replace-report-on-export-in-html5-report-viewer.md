---
title: Replace report on export in the Html5 Viewer
description: How to replace the report when exported from Html5 Report Viewer
type: how-to
page_title: Replace report when exporting from Html5 Viewer
slug: replace-report-on-export-in-html5-report-viewer
position: 
tags: 
ticketid: 1413421
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
In some cases, the report needs to be previewed with one layout in the viewer and exported (or printed) with a (slightly) different layout.

## Solution
This may be achieved by creating two report definitions for the same report and changing the report to be rendered when exporting (or printing). You may do this by handling the [exportBegin event](../html5-report-viewer-reportviewer-events-exportbegin) (or [printBegin event](../html5-report-viewer-reportviewer-events-printbegin)). It will be necessary to set the **args.handled** to **true** and to use another (hidden) report viewer from where to export (or print). Here is a sample code of the page that hosts the viewer that does this for the export :  
  

```JavaScript

<head>
    ... 
    <style>
 	...
	#reportViewer1 {
            ...
        }
		
        #reportViewer2 {
            position: absolute;
            overflow: hidden;
            clear: both;
            display: none;
        }
    </style>
</head>
<body>
    <div id="reportViewer1">
        loading...
    </div>
 
    <div id="reportViewer2">
    </div>
	
   <script type="text/javascript">
        $(document).ready(function () {
         
        var exportReportViewerInstance;
        var format = "PDF";
 
        function onExportBegin(e, args) {
            args.handled = true;
            exportReport("Barcodes Report.trdp", args.format);
        }
 
        function exportReport(reportName, exportFormat) {
            format = exportFormat;
 
            if (!exportReportViewerInstance) {
                exportReportViewerInstance = $("#reportViewer2")
                    .telerik_ReportViewer({
                        serviceUrl: "api/reports",
                        reportSource: {
                            report: reportName
                        },
                        renderingEnd: function (e, args) {
                            e.target.commands.export.exec(format);
                        }
                    }).data("telerik_ReportViewer");
 
            } else {
                exportReportViewerInstance.reportSource({
                    report: reportName
                });
            }
        }
		
		$("#reportViewer1")
                .telerik_ReportViewer({
					...
				})
		})
     </script>
</body>
```
