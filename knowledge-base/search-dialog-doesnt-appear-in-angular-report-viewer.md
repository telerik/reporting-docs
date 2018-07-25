---
title: Search dialog doesn't appear in Angular Report Viewer
description: Clicking on the search button in the toolbar that does not show the search dialog.
type: troubleshooting
page_title: Search dialog doesn't appear in Angular Report Viewer
slug: search-dialog-doesnt-appear-in-angular-report-viewer
position: 
tags: AngularReportViewer, Search
ticketid: 1178574
res_type: kb
---

## Environment
<table>
	<tr>
		<td>Product Version</td>
		<td>12.1.18.516 - R3 2018</td>
	</tr>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting </td>
	</tr>
	<tr>
		<td>Viewer</td>
		<td>Angular Viewer</td>
	</tr>
</table>


## Description
When attempting to open the search dialog from Angular Report Viewer's toolbar icon, an error with message *'$inputBox.kendoComboBox is not a function'* is thrown in telerikReportViewer.js file. 

## Error Message
The stack trace of the error is:
```
ERROR TypeError: $inputBox.kendoComboBox is not a function
    at ensureInitialized (telerikReportViewer.js:5217)
    at toggle (telerikReportViewer.js:5196)
    at toggleSearchDialog (telerikReportViewer.js:5190)
    at Object.eval (telerikReportViewer.js:5165)
    at Object.trigger (telerikReportViewer.js:1330)
    at Object.trigger (telerikReportViewer.js:1317)
    at eventFactory (telerikReportViewer.js:1299)
    at Object.setSearchDialogVisible (telerikReportViewer.js:1777)
    at Object.CommandSet.toggleSearchDialog [as exec] (telerikReportViewer.js:4033)
    at HTMLAnchorElement.commandHandler (telerikReportViewer.js:4677)
```

## Cause\Possible Cause(s)
The issue was introduced due to the fact that Telerik Reporting ships a subset of Kendo UI widgets excluding the [kendoComboBox](https://www.telerik.com/kendo-ui/combobox) widget (which was indicated by the error in developer tools console).

## Solution
The fix for this error will be introduced with the next official version (R3 2018) of Telerik Reporting.

## Suggested Workarounds
There is a possible workaround by replacing the Kendo UI JavaScript distributed by Telerik Reporting with the content of the *telerikReportViewer.kendo.min.js* file which could be downloaded from [here](https://www.telerik.com/docs/default-source/knowledgebasearticleattachments/reporting/telerikreportviewer-kendo-min.zip?sfvrsn=af62bd98_2). 
The used subset can be found in the Telerik Angular Report Viewer NPM package, i.e. 

```
node_modules\@progress\telerik-angular-report-viewer\dist\dependencies\telerikReportViewer.kendo-<VERSION>.min.js.
```

## Notes
Follow our [release notes](https://www.telerik.com/support/whats-new/reporting/release-history) where we will duly note any fixes/improvements/features.
