---
title: HTML5 Report Viewer height issue on certain screen resolutions
description: HTML5 Report Viewer height issue on certain screen resolutions
type: troubleshooting
page_title: HTML5 Report Viewer height issue on certain screen resolutions
slug: html5-report-viewer-height-issue-on-certain-screen-resolutions
position: 
tags: HTML5ReportViewer
ticketid: 1342562
res_type: kb
---

## Environment
<table>
	<tr>
		<td>Product Version</td>
		<td>12.1.18.620</td>
	</tr>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting</td>
	</tr>
	<tr>
		<td>Project Type</td>
		<td>Web Application</td>
	</tr>
	<tr>
		<td>Viewer</td>
		<td>HTML5 Viewer</td>
	</tr>
</table>


## Description
When using the specific resolution, the height of the sheet where the report should be rendered is reduced. It is reproducible after an update to version 12.1.18.620 of Telerik Reporting. 

## Cause\Possible Cause(s)
This is a known issue which comes from the '@media' CSS style rule of the viewer, which matches only some certain types of screens, like for example MacBook 13 inch, iPad Pro or any other device with min-device-width: 1024px, max-device-width: 1366px and min-device-pixel-ratio: 1.5.

## Solution
The fix is available in the Internal Build version of [Telerik Reporting R3 2018 SP1 (12.2.18.1003)](https://www.telerik.com/support/whats-new/reporting/release-history/progress-telerik-reporting-r3-2018-sp1-12-2-18-1003). The Internal Build should be available for download from your [Telerik account](https://www.telerik.com/account).

## Suggested Workarounds
In case it is not possible to upgrade to the specified Internal Build version or higher, a possible workaround is to go to *telerikReportViewer.css* file and manually comment/delete the following lines of code:
```CSS
/* ----------- iPad Pro ----------- */
/* Portrait and Landscape */
@media only screen
  and (min-device-width: 1024px)
  and (max-device-width: 1366px)
  and (-webkit-min-device-pixel-ratio: 1.5) {
    .sheet {
        height: 100% !important;
        overflow: scroll;
    }
}
```
