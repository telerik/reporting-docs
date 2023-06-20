---
title: Use the Report's DocumentName as a Title for the Browser Tab
description: "Learn how to set the Report's DocumentName property value as a Web Page Document Title in Telerik Reporting."
type: how-to
page_title: Using Report DocumentName as a Document Title for the Web Page
slug: how-to-set-report-documentname-as-web-page-document-title
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

The article explains how to set the Document Title that will appear in the browser tab of the Web Page hosting the [Html5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%}) or any of its wrappers to the `DocumentName` of the Report. The referred sample project is built with the [Html5 Web Forms Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-asp.net-web-forms-report-viewer/overview%}).

## Solution

1. If the Report already has [Document Map]({%slug telerikreporting/designing-reports/adding-interactivity-to-reports/document-map/overview%}) go to the next step. Otherwise, in the report definition set the [DocumentMapText](/api/telerik.reporting.reportitembase#collapsible-Telerik_Reporting_ReportItemBase_DocumentMapText) property of a report item (e.g. _TextBox_) to a valid value. The `DocumentMapText` will introduce `Document Map` in the Report. This way the `DocumentName` of the Report would be included in the `bookmarkNodes` collection of the `args` object of the [renderingEnd]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/events/renderingend(e,-args)%}) event of the viewer.

2. In the event handler of `renderingEnd` the name of the Report can be taken from `args.bookmarkNodes` and assigned to the title of the document:

	````JavaScript
function OnRenderingEnd(e, args) {
		document.title = args.bookmarkNodes[0].text;
	}
````


3. The `Document Map` may be hidden in the viewer's initialization by setting `DocumentMapVisible` to `false`.

A sample WebForms project in C# can be found in our samples GitHub repository - [ReportNameAsWebPageTitle](https://github.com/telerik/reporting-samples/tree/master/ReportNameAsWebPageTitle).
