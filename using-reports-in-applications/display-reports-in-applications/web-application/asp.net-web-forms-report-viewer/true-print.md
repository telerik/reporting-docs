---
title: True Print
page_title: True Print | for Telerik Reporting Documentation
description: True Print
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/asp.net-web-forms-report-viewer/true-print
tags: true,print
published: True
position: 3
---

# True Print



>note This is a legacy report viewer and for new projects our recommendation is to use the latest web forms report viewer -           [HTML5 Web Forms Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-asp.net-web-forms-report-viewer/overview%})


## 

This article elaborates on the specifics for printing a report on the client side.         

The True printing is the only way to support multi-page reports printing in most of the browsers. The True print is rendering the report           in PDF with special settings so when the PDF file opens in browser, the PDF plug-in print dialog is invoked.           This functionality is available for the           [ASP.NET report viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/asp.net-web-forms-report-viewer/overview%}) and           [Silverlight report viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/silverlight-application/overview%}).         

If you want to use the True print, the following requirements must be satisfied: 

*  [Adobe Reader](http://get.adobe.com/reader/) 

* Disable any other PDF related plug-ins such as Foxit.

* JavaScript should be enabled in your browser.

* JavaScript should be enabled in Adobe Reader.

* UnmanagedCode permission is required due to the used PDF rendering. See[Medium Trust Support]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/medium-trust-support%})

* (Silverlight viewer only)[UseNativePrinting](/reporting/api/Telerik.ReportViewer.Silverlight.ReportViewer#Telerik_ReportViewer_Silverlight_ReportViewer_UseNativePrinting)property should be false. Telerik Reporting WCF Service should be properly configured e.g. resource endpoint should be present.
            See[How to Add Telerik Reporting WCF Service to Web Application]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-wcf-service/how-to-add-telerik-reporting-wcf-service-to-web-application%})

* (Internet Explorer only) [Print menu](http://maximumpcguides.com/windows-7/disable-the-print-menu-in-internet-explorer/) 

* (Internet Explorer only) ActiveX Filtering should be disabled.

The [Silverlight report viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/silverlight-application/overview%}) additionally supports Silverlight Native print so you can           avoid the True print requirements. In order to enable the Silverlight native print set the  [UseNativePrinting](/reporting/api/Telerik.ReportViewer.Silverlight.ReportViewer#Telerik_ReportViewer_Silverlight_ReportViewer_UseNativePrinting)            property to True.         

>important In Firefox 19+ the default viewing option for PDF files is the  __PDF.js__ ,             which is not added as a plug-in and Firefox does not expose the content type viewing preferences -  [Firefox bugs](https://bugzilla.mozilla.org/show_bug.cgi?id=840439) .             Thus the Adobe PDF plug-in is always active whether or not it is the preferred viewing option.             To ensure the print operation in Firefox will be accomplished, clicking the print button would             export the report to PDF which will be printed with the available client viewing tools.           


# See Also

