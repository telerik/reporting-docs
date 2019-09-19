---
title: Print dialog doesn't open in Google Chrome 77.0.3865.75 
description: Since the Google Chrome update to version 77.0.3865.75 the print functionality in the web-based viewers doesn't work
type: troubleshooting
page_title: Print functionality does not work in Google Chrome 77.0.3865.75 
slug: print-error-chrome
position: 
tags: HTML5Viewer, MVCReportViewer, WebFormsViewer, AngularViewer
ticketid: 1429178
res_type: kb
---

## Environment
<table>
	<tr>
		<td>Product Version</td>
		<td>13.1.19.618 and previous versions</td>
	</tr>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting</td>
	</tr>
</table>


## Description
After the Google Chrome update to version 77.0.3865.75, the print dialog doesn't open. In this article, you can find a workaround which makes possible downloading the report as a PDF file.

## Solution
The issue is resolved in the [R3 2019](https://www.telerik.com/support/whats-new/reporting/release-history/progress-telerik-reporting-r3-2019-13-2-19-918) release where the print button of the HTML5 Report Viewer renders the report for print purposes and opens it in a new browser tab. The auto-print script is still embedded in the document, but Google Chrome will wait for user interaction in order to show its print dialog.

## Workaround

For versions before R3 2019: by setting **FORCE_PDF_FILE** [printMode](../html5-report-viewer-api-printmodes) option of the report viewer, the widget will always export the report document to a PDF file with the special print script. For more information, check [Printing Reports](../html5-report-viewer-direct-print) article. 
For example in the [HTML5 Report viewer](../html5-report-viewer), you need to add the following line in the initialization of the viewer:

```JavaScript
$("#reportViewer1")
	.telerik_ReportViewer({                  
       serviceUrl: "/api/reports",
		...
       printMode: telerikReportViewer.PrintModes.FORCE_PDF_FILE
		},
...
```

Note that this setting will not open the Print Dialog automatically but it will trigger downloading the PDF file.
