---
title: After upgrade, HTML5 viewer has broken layout
description: After upgrade, HTML5 viewer has broken layout and parameters are missing
type: troubleshooting
page_title: After upgrade, HTML5 viewer's template is broken
slug: after-upgrade-html5-viewer-template-is-broken
position: 
tags: HTML5Viewer, Templates, Upgrade
ticketid: 1388060
res_type: kb
---

## Environment
<table>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting</td>
	</tr>
	<tr>
		<td>Project Type</td>
		<td>Web Application</td>
	</tr>
	<tr>
		<td>Report Viewer</td>
		<td>Any web-based viewer</td>
	</tr>
</table>


## Description
How to fix broken report viewer layout after upgrading Telerik Reporting version?

## Cause\Possible Cause(s)
We constantly strive to provide the best user experience to our customers. This means the report viewer's styling and HTML template are being modified or extended.

For example, in our [R1 2019](https://www.telerik.com/support/whats-new/reporting/release-history/progress-telerik-reporting-r1-2019-13-0-19-116) release, we have significantly improved the user experience for all web report viewers by including continuous pages scroll, parameters input flexibility, and splitter for parameters and document map areas. 

## Solution
In general, using custom HTML template or CSS for modifying the report viewer, the updated template files **should be merged manually on upgrade**. The newest template files can be found in Telerik Reporting installation folder, for example *C:\Program Files (x86)\Progress\Telerik Reporting **<VERSION>**\Html5\ReportViewer*.

After merging the newest changes, make sure that browser cache is cleared as browsers often cache html and css files to optimize the page loading. Sometimes they do not detect modified files.

## See Also
- [Styling and Appearance](https://docs.telerik.com/reporting/html5-report-viewer-styling-and-appearance)
- [Providing Custom Templates](https://docs.telerik.com/reporting/html5-report-viewer-customizing-providing-template)
