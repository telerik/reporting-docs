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
This may be achieved by creating two report definitions for the same report and changing the report to be rendered when exporting (or printing). You may do this by handling the [exportBegin event]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/events/exportbegin(e,-args)%}) (or [printBegin event]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/events/printbegin(e,-args)%})). It will be necessary to set the **args.handled** to **true** and to use another (hidden) report viewer from where to export (or print). Here is sample code of the page that hosts the viewers (for export only) :  
  

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
                		exportReportViewerInstance = $("#reportViewer2").telerik_ReportViewer({
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
	    			serviceUrl: "/api/reports",
				exportBegin: onExportBegin,
				...
	    		})
	})
    </script>
</body>
```

Briefly, on the ExportBegin event of the main viewer _reportViewer1_, the export is cancelled (i.e. __args.handled__ set to __true__) and a custom export method is called. The latter configures the second viewer _reportViewer2_ with the same service and the required export report. The [export command]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/properties/commands%}) of the second viewer is triggered on the [renderingEnd]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/events/renderingend(e,-args)%}) event of the second viewer. If _reportViewer2_ already exists, only the name of the report is changed. The export format is taken from the original export.
Note that the _reportViewer2_ style __display__ is set to __none__.
