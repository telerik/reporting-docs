---
title: Printing Reports
page_title: Printing Reports 
description: Printing Reports
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/printing-reports
tags: printing,reports
published: True
position: 8
---

# Printing Reports

This article elaborates on how to setup the viewer for printing reports. 

The printing functionality is based on rendering the report in PDF format with special settings so when the PDF file opens in a browser, the PDF plug-in's __Print dialog__ is directly invoked. 

The print functionality requires:

* [Adobe Acrobat Reader](http://get.adobe.com/reader) / [Adobe Acrobat](http://acrobat.adobe.com) browser plug-in or Chrome PDF plug-in (for Chrome) should be installed and enabled. For more information on configuring the Adobe PDF plug-in please refer to the [Configure browser to use the Adobe PDF plug-in](http://helpx.adobe.com/acrobat/kb/pdf-browser-plugin-configuration.html)  article. If Adobe Reader or Chrome PDF plug-in is not detected, clicking the print button would export the report to PDF. Depending on the browser the PDF would either open directly for preview or ask you to save it as a file. 

* Disable any other PDF related plug-ins such as Foxit.

* JavaScript should be enabled in your browser.

* JavaScript should be enabled in Adobe Reader.

* (Internet Explorer only) [Print menu](http://maximumpcguides.com/windows-7/disable-the-print-menu-in-internet-explorer/) in IE group policy should be enabled. 

* (Internet Explorer only) ActiveX Filtering should be disabled.

> In  __Google Chrome 77+__ [printing is allowed only in response to a user gesture](https://pdfium.googlesource.com/pdfium.git/+/2021804f1b414c97667c03d7ab19daf66f6a19ef). This prevents the print dialog opening automatically when a PDF is embedded in a web page and the user needs to click on the print button manually to invoke the print preview dialog. 


> In  __Firefox 19+__ the default viewing option for PDF files is the  __PDF.js__, which is not added as a plug-in and Firefox does not expose the content type viewing preferences -  [Firefox bugs](https://bugzilla.mozilla.org/show_bug.cgi?id=840439). Thus the Adobe PDF plug-in is always active whether or not it is the preferred viewing option. To ensure the print operation in Firefox will be accomplished, clicking the print button would export the report to PDF which will be printed with the available client viewing tools. 

By default the viewer widget tries to use the PDF plug-in of the browser for printing. When it is not available or not supported, the widget falls back to exporting to a PDF file containing a special 'print' script. The purpose of this script is to open the Print dialog of the PDF reader right after the file has been opened. 

You can manually control the printing behavior through the [printMode]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/report-viewer-initialization%}) option when creating the report viewer widget. When the value is set to *telerikReportViewer.PrintModes.FORCE_PDF_FILE* the widget will always export the report document to a PDF file with the special 'print' script. When the value is set to *telerikReportViewer.PrintModes.FORCE_PDF_PLUGIN* the widget will always try to use the PDF plug-in. In this case if the browser doesn't have a PDF plug-in or it does not support the 'print' script nothing will happen. By default when the value is not expicitly set, the widget will try to automatically determine whether to export the report document or use the browser's PDF plug-in. This is equivalent to setting the *telerikReportViewer.PrintModes.AUTO_SELECT* value. 

You can also implement a custom logic for dynamically specifying the print mode. For example:
    
````js
// Force the viewer to always use the PDF plug-in for printing in Chrome browser.
// In the other browsers the report document will be downloaded as a PDF file:
 var printMode = /(chrome)/.test(navigator.userAgent.toLowerCase())
    ? telerikReportViewer.PrintModes.FORCE_PDF_PLUGIN
    : telerikReportViewer.PrintModes.FORCE_PDF_FILE;
 $("#reportViewer1")
  .telerik_ReportViewer({
         serviceUrl: "../api/reports/",
         templateUrl: 'src/templates/telerikReportViewerTemplate-x.x.x.x.html',
         reportSource: { report: "product catalog.trdp" },
         printMode: printMode
  });
````

where x.x.x.x is the version of Telerik Reporting (e.g. 16.0.22.119).

