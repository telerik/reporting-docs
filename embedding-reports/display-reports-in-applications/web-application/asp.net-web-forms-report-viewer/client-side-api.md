---
title: Client-Side API
page_title: ASP.NET WebForm Report Viewer Client-Side API
description: "Learn more about the Client-Side API methods/functions exposed by the ASP.NET WebForms Report Viewer."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/asp.net-web-forms-report-viewer/client-side-api
tags: client-side,api
published: True
position: 6
previous_url: /asp-net-report-viewer-clientAPI
---

<style>
	table th:first-of-type {
		width: 20%;
	}
	table th:nth-of-type(2) {
		width: 35%;
	}
	table th:nth-of-type(3) {
		width: 45%;
	}
</style>

# Client-Side API Overview

> This is a legacy report viewer and for new projects our recommendation is to use the latest WebForms Report Viewer - [HTML5 Web Forms Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-asp.net-web-forms-report-viewer/overview%})

## Accessing the client-side report viewer object

The __ReportViewer__ control creates a client-side object with the `ClientID` of the viewer. You can obtain reference to it by using the following code:

````JavaScript
var viewer = `<%=ReportViewer1.ClientID%>`
````

## Client API

| __Member__ | __Parameters__ | __Description__ |
| ------ | ------ | ------ |
|PrintReport()|N/A|Starts printing of the document. Uses the Adobe PDF Reader browser plug-in if available. Otherwise it exports the report to PDF.|
|set_CurrentPage(pageNumber)| __pageNumber:__ the number of the page(starts from 1).|Specifies the number of the page which has to be displayed in the viewer.|
|get_CurrentPage()|N/A|Returns the number of the page currently shown in the viewer.|
|get_TotalPages()|N/A|Returns the total count of document pages.|
|CanMoveToPage(pageNumber)| __pageNumber__ : the number of the page(starts from 1).|Checks whether it is possible to navigate to the specified page.|
|RefreshReport()|N/A|Refreshes the report.|
|ExportReport(format)|The available formats are listed in the [Export Formats]({%slug telerikreporting/using-reports-in-applications/export-and-configure/export-formats%}) article.|Exports the document to one of the specified formats.|
|PrintAs(format)| __format:__<ul><li>__"PDF":__ uses the Adobe PDF Reader add-on.</li><li>__"Default":__ uses the default printing capabilities of the browser.</li></ul>|Forces the viewer to print the document according to the specified print *format*.|
|ShowDocumentMap()|N/A|Shows the Document Map|
|HideDocumentMap()|N/A|Hides the Document Map|
