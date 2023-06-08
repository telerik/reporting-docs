---
title: HTML5 ReportViewer Layout Breaks after Upgrade
page_title: HTML5 ReportViewer with broken appearance after Upgrade
description: "Learn why the HTML5 Report Viewer appearance may not be as expecterd after upgrading Telerik Reporting and how to fix the problem."
type: troubleshooting
slug: after-upgrade-html5-viewer-template-is-broken
tags: telerik, reporting, HTML5, reportviewer, templates, upgrade
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

How can I fix the broken layout of the HTML5 ReportViewer after upgrading the Telerik Reporting version?

## Cause

The possible causes for this issues depend on the scenario:

* Utilizing the default template and styles&mdash;As the default template comes from the Telerik reporting assembly, it is possible that you are using a previous version of the assemblies.
* Utilizing a custom (local) template and styles&mdash;It is possible that the custom template is not containing the new changes from the latest release.
* Utilizing either the default or custom template&mdash;It is possible that the older template is still cached by browsers.

## Solution

* For the default template and styles scenario&mdash;Web-based viewers are widgets that get content produced on the server by the [Reporting REST service]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/overview%}). Make sure that latest assemblies are referenced in the Rest Service project.
* For the custom template and styles scenario&mdash;All local loaded Telerik Report Viewer resources have to be manually updated on upgrade to include the new changes. The resources are located in the default Telerik Reporting installation folder, for example, at `C:\Program Files (x86)\Progress\Telerik Reporting {{site.suiteversion}}\Html5\ReportViewer`.
* For either the default or custom template&mdash;After updating the assemblies or merging the latest changes, make sure that the browser cache is cleared. Browsers often cache HTML and CSS files to optimize the page loading. Sometimes they do not detect modified files.

## See Also

* [Styling and Appearance]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/customizing/styling-and-appearance/overview%})
* [Providing Custom Templates]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/customizing/styling-and-appearance/providing-custom-templates%})
