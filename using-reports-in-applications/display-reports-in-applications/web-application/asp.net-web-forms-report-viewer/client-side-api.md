---
title: Client-Side API
page_title: Client-Side API | for Telerik Reporting Documentation
description: Client-Side API
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/asp.net-web-forms-report-viewer/client-side-api
tags: client-side,api
published: True
position: 6
---

# Client-Side API



>note This is a legacy report viewer and for new projects our recommendation is to use the latest web forms report viewer -           [HTML5 Web Forms Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-asp.net-web-forms-report-viewer/overview%})

## Accessing the client-side report viewer object

The __ReportViewer__  control creates a client-side object with the __ClientID__  of the viewer. You can obtain reference to it by using the following JavaScript code:

*var viewer = ```<%=ReportViewer1.ClientID%>```* 

## Client API

|  __Member__  |  __Parameters__  |  __Description__  |
| ------ | ------ | ------ |
|PrintReport()|N/A|Starts printing of the document. Uses the Adobe PDF Reader browser plug-in if available. Otherwise it exports the report to PDF.|
|set_CurrentPage(pageNumber)| __pageNumber:__ number of the page(starts from 1).|Specifies the number of the page which has to be displayed in the viewer.|
|get_CurrentPage()||Returns the number of the page currently shown in the viewer.|
|get_TotalPages()||Returns the total count of document pages.|
|CanMoveToPage(pageNumber)| __pageNumber__ : the number of the page to which you want to navigate.|Checks whether is possible to navigate to a specific page.|
|RefreshReport()|N/A|Refreshes the report.|
|ExportReport(format)|The available formats are listed in the [Export Formats]({%slug telerikreporting/using-reports-in-applications/export-and-configure/export-formats%})article.|Exports the document to one of the specified formats.|
|PrintAs(format)| __format:__ <br/>*  __"PDF":__ uses the Adobe PDF Reader add-on.<br/>*  __"Default":__ uses the default printing capabilities of the browser.|Forces the viewer to print the document according to the specified print *format* .|
|ShowDocumentMap()||Shows the DocumentMap|
|HideDocumentMap()||Hides the DocumentMa|


