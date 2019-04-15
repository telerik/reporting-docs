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
There are several reasons that could cause broken layout after upgrading. We can define three main scenarios:

## Possible Cause 1
Scenario: Using default template and styles. 
Possible cause: If older version of the assemblies are used (since the default template comes from our assembly).

## Solution 1
Web-based viewers are widgets, that get content produced on the server by the [Reporting REST service](../telerik-reporting-rest-conception). Make sure that latest assemblies are referenced in the Rest Service project.

## Possible Cause 2
Scenario: Using custom (local) template and styles.
Possible cause: If the custom template is not containing the new changes from the latest release.

## Solution 2
All local loaded Telerik Report Viewer resources **should be updated manually on upgrade** to contain the new changes. They could be found in default Telerik Reporting installation folder. For example *C:\Program Files (x86)\Progress\Telerik Reporting **VERSION**\Html5\ReportViewer*.

## Possible Cause 3
Scenario: Either using default template or custom one
Possible cause: If older template is still cached by browsers

## Solution 3
After updating the assemblies/merging the newest changes, make sure that browser cache is cleared. Browsers often cache html and css files to optimize the page loading. Sometimes they do not detect modified files.

## See Also
- [Styling and Appearance](../html5-report-viewer-styling-and-appearance)
- [Providing Custom Templates](../html5-report-viewer-customizing-providing-template)
