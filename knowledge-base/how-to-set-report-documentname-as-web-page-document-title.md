---
title: How to Put the Report's DocumentName as a Title for the Browser Tab
description: How to set the Report DocumentName as a Web Page Document Title
type: how-to
page_title: Use Report DocumentName as a Document Title for the Web Page
slug: how-to-set-report-documentname-as-web-page-document-title
position: 
tags: 
ticketid: 1381205
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
The article explains how to set the Document Title that will appear in the browser tab of the Web Page hosting the [Html5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%}) or any of its wrappers to the __DocumentName__ of the Report. The referred sample project is built with the [Html5 Web Forms Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-asp.net-web-forms-report-viewer/overview%}).

## Solution
1. If the Report already has [Document Map]({%slug telerikreporting/designing-reports/adding-interactivity-to-reports/document-map/overview%}) go to the next step.
Otherwise, in the report definition set the [DocumentMapText](/api/telerik.reporting.reportitembase#collapsible-Telerik_Reporting_ReportItemBase_DocumentMapText) property of a report item (e.g. _TextBox_) to a valid value. The __DocumentMapText__ will introduce __Document Map__ in the Report. This way the __DocumentName__ of the Report would be included in the __bookmarkNodes__ collection of the __args__ object of the [renderingEnd]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/events/renderingend(e,-args)%}) event of the viewer. 
2. In the event handler of __renderingEnd__ the name of the Report can be taken from __args.bookmarkNodes__ and assigned to the title of the document:
```JavaScript
function OnRenderingEnd(e, args) {
    document.title = args.bookmarkNodes[0].text;
}
```
3. The _Document Map_ may be hidden in the viewer's initialization by setting _DocumentMapVisible_ to 'false'.

A sample WebForms project in C# can be found in our samples GitHub repository - [ReportNameAsWebPageTitle](https://github.com/telerik/reporting-samples/tree/master/ReportNameAsWebPageTitle).
