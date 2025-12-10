---
title: How to modify the content of the toolbar inside the HTML5 viewer
description: "Learn how to add, remove or update buttons inside the toolbar of the HTML5 SASS-compatible viewer"
type: how-to
page_title: How to modify the content of the toolbar inside the HTML5 viewer
slug: html5-modify-viewer-toolbar
tags: progress, telerik, reporting, html5
res_type: kb
---

## Environment

<table>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting</td>
	</tr>
    <tr>
		<td>Version</td>
		<td>19.1.25.521</td>
	</tr>
	<tr>
		<td>Viewer</td>
		<td>HTML5 Viewer</td>
	</tr>
</table>

## Description

[Telerik Reporting version 19.1.25.521](https://www.telerik.com/support/whats-new/reporting/release-history/progress-telerik-reporting-2025-q2-19-1-25-521) introduced a revamped **HTML5 Report Viewer** which has a modified toolbar component. This knowledge base article explains how to make slight modifications to the toolbar by adding, removing or updating the available buttons and their functionality.

## Solution

Let's start with the steps required to remove or hide a toolbar component. The easiest way to achieve this is by deleting the element markup in the HTML template file (`telerikReportViewerTemplate-*.html` by default or the file associated with the `templateUrl` option in the viewer settings). For example, to remove the _Toggle FullPage/PageWidth_ button you have to open the template file, and find and delete the button element that has the `data-command="telerik_ReportViewer_toggleZoomMode"` attribute. This approach ensures that the button is never rendered.

````HTML
<!-- Find the element below inside the HTML template and remove it -->
<button data-role="toggle-button" data-icon="toggle-full-screen-mode" data-command="telerik_ReportViewer_toggleZoomMode" title="menuPageStateTitle" aria-label="ariaLabelMenuPageState"></button>
````

Alternatively, to hide an element programatically or based on a condition you can use the `ready` function of the `telerik_ReportViewer` object. The `data-command` attribute can be used as a reliable selector for which element to manipulate, but you can also use the `aria-label` or `title` attributes with the same success. Here is the example on how to hide the print button:

````JavaScript
var reportViewer = $("#report-viewer").telerik_ReportViewer({
	serviceUrl: "http://<my-hostname>/api/reports/",
	// ... any other settings ...,
	ready: function() {
		var someCondition = true; // can be evaluated based on other parameter or a result of a request
		if (someCondition) {
			$("[data-command='print']").hide();
		}
	}
}).data("telerik_ReportViewer");
````

The next few lines cover the scenario of modifying an existing toolbar element - to be precise, how to replace the export dropdown with a button that exports the report always in PDF format. To achieve this, you have to open the HTML template file (`telerikReportViewerTemplate-*.html` by default or the file associated with the `templateUrl` option in the viewer settings), find the button with `data-command="telerik_ReportViewer_export"` attribute and replace the entire button markup with the following:

````HTML
<button data-role="button" data-icon="download" data-command="telerik_ReportViewer_export" data-command-parameter="PDF" title="Export PDF" title="menuExportTitle" aria-label="ariaLabelMenuExport"></button>
````

With the button always exporting the report in PDF format perhaps we should also modify the icon to reflect this change. This can be accomplished by modifying the `data-icon` value and replacing `download` with `file-pdf`. At the time of writing this article, you can use the majority of icons that are listed on the [Progress Design System Kit Iconography](https://www.telerik.com/design-system/docs/foundation/iconography/icon-list/) page.

Finally, let's see how to add new buttons with custom functionality attached to them. Start by adding the button to the HTML template, somewhere inside the `div` element with `data-role="telerik_ReportViewer_Toolbar"` attribute. The example below adds a new button with a question mark icon at the end of the toolbar.

````HTML
<!-- ...other toolbar buttons -->
<button data-role="button" id="custom-button" data-icon="question-circle" data-command="telerik_ReportViewer_customButton" title="My Custom Button" aria-label="My Custom Button"></button>
````

Then, inside the HTML file which initializes the report viewer, create a custom command and attach it to the reportViewer object. The command code can be added either after the report viewer initialization, or inside the `ready` method.

````JavaScript
var reportViewer = $("#report-viewer").telerik_ReportViewer({
	serviceUrl: "http://<my-hostname>/api/reports/",
	// ... any other settings ...,
	ready: function() {
        // reportViewer.commands.customButton =  {
        //     exec: () => {
        //         console.log("custom button exec");
        //     },
        // };
	}
}).data("telerik_ReportViewer");

reportViewer.commands.customButton =  {
    exec: () => {
        console.log("custom button exec");
    },
};
````

## Notes

The examples in this article outline only some of the basic modifications that users can make to the toolbar component. Do not hesitate to open support tickets if you are facing difficulties with implementing more complex scenarios or have suggestions on how to improve the default toolbar experience.
