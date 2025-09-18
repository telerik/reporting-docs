---
title: Print dialog doesn't open in Google Chrome 77.0.3865.75 
description: Since the Google Chrome update to version 77.0.3865.75, the print functionality in the web-based viewers doesn't work
type: troubleshooting
page_title: Print functionality does not work in Google Chrome 77.0.3865.75 
slug: print-error-chrome
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

After the Google Chrome update to version 77.0.3865.75, the print dialog doesn't open. 
The printing functionality of all web viewers is based on PDF rendering and invoking the browser's PDF plug-in printing functionality. Note that for security reasons, an application that is running in a browser cannot access the machine resources directly, e.g., printers. These are technical restrictions imposed by the browser and beyond the Telerik Reporting control.

## Solution

The issue is resolved in the [R3 2019](https://www.telerik.com/support/whats-new/reporting/release-history/progress-telerik-reporting-r3-2019-13-2-19-918) release, where the print button of the HTML5 Report Viewer renders the report for print purposes and opens it in a new browser tab. The auto-print script is still embedded in the document, but Google Chrome will wait for user interaction in order to show its print dialog.

## Workaround for the HTML5-based Report Viewers

This workaround was proposed by one of our users- check the post from **Thanh** in [Print Dialog doesn't appear in Google Chrome 77.0.3865.75](https://feedback.telerik.com/reporting/1429337-print-dialog-doesn-t-appear-in-google-chrome-77-0-3865-75) thread. It allows you to trigger the print dialog on the **Print** click. Our user **Naumand** updated it, so the same functionality is achieved in Firefox. 
Here are the required steps:
1) Add a reference to the [Print.js](https://printjs.crabbly.com/) third-party library in the viewer's page (above the reference to the viewer's JavaScript file).
2) Copy the **telerikReportViewer-x.x.x.x.js** file locally and refer to it in the page from the local source. For example, if the viewer is copied to the folder _"(base application folder)/ReportViewer"_ the references may look like:

````JavaScript
<head>
    ...

    <script src="https://printjs-4de6.kxcdn.com/print.min.js"></script>

    <script src="/ReportViewer/telerikReportViewer-13.2.19.918.js"></script>
   ...
````

3) Modify the code of the **telerikReportViewer-x.x.x.x.js** file - function **printDesktop(src)**. Its original implementation is:

````JavaScript
function printDesktop(src) {
    window.open(src, "_blank");
}
````

Change it to:

````JavaScript
trv.printManager = function () {
   var iframe;
   function printDesktop(src) {
       if (window.navigator.userAgent.toLowerCase().indexOf("chrome") > -1) {
           printJS({ printable: src, type: 'pdf', showModal: true });
       } else {
           if (!iframe) {
               iframe = document.createElement("IFRAME");
               iframe.style = "position:absolute; left: -10000px; top: -10000px;";
           }
           iframe.src = src;
           document.body.appendChild(iframe);
       }
   }
````


## Workaround 2 for the HTML5-based Report Viewers

Set the **FORCE_PDF_FILE** [printMode]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/telerikreportviewer-namespace/printmodes%}) option of the report viewer, the widget will always export the report document to a PDF file with the special print script. For more information, check [Printing Reports]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/printing-reports%}) article. 
For example, in the [HTML5 Report viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%}), you need to add the following line in the initialization of the viewer:

````JavaScript
$("#reportViewer1")
	.telerik_ReportViewer({                  
       serviceUrl: "/api/reports",
		...
       printMode: telerikReportViewer.PrintModes.FORCE_PDF_FILE
		},
...
````

Note that this setting will not open the Print Dialog automatically, but it will trigger downloading the PDF file.

## Workaround for the obsolete ASP.NET Web Forms Report Viewer

This workaround was also provided by one of our users, **Michael**, in the Feedback portal post. Here the **ReportViewer.prototype.PrintReport** is overridden:

````JavaScript
<div>
<form runat="server">
    <telerik:ReportViewer
        ID="reportViewer1"
        Width="1300px"
        Height="900px"
        EnableAccessibility="false"
        runat="server">
    <ReportSource IdentifierType="UriReportSource" Identifier="SampleReport.trdp">
    </ReportSource>
   <sendemail enabled="false" />
    </telerik:ReportViewer>
 </form>

<script type="text/javascript">
    ReportViewer.prototype.PrintReport = function () {
        switch (this.defaultPrintFormat) {
            case "Default":
                this.DefaultPrint();
                break;
            case "PDF":
                this.PrintAs("PDF");
                previewFrame = document.getElementById(this.previewFrameID);
                previewFrame.onload = function () { previewFrame.contentDocument.execCommand("print", true, null); }
                break;
        }
    };
</script>
</div>
````

