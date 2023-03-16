---
title: The Silverlight Report Is Messed Up or Different from Design-Time Preview
page_title: The Silverlight Report Is Messed Up or Different from Design-Time Preview
description: "Learn how to handle the issue if the Silverlight ReportViewer report is messed up or different from the preview in design-time."
slug: silverlight-viewer-report-messed-different-from-designtime-preview
tags: telerik, reporting, troubleshoot, silverlight, reportviewer, report, messed, up, different, from, design, time, preview
published: True
type: troubleshooting
res_type: kb
sitemap: false
---

## Environment

<table>
	<tbody>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
		</tr>
		<tr>
			<td>Version</td>
			<td>Q2 2012 and later</td>
		</tr>
	  <tr>
			<td>Report Viewers</td>
			<td>Silverlight</td>
		</tr>
	</tbody>
</table>

> The Silverlight Report Viewer and its WCF Reporting Service are no longer supported and deployed with the installation of Telerik Reporting. The last release of Telerik Reporting with included Silverlight Report Viewer is [R1 2023](https://www.telerik.com/support/whats-new/reporting/release-history/progress-telerik-reporting-r1-2023-17-0-23-118).

## Description

The report in the Silverlight ReportViewer is messed up or different from the design-time preview.

## Cause

The Silverlight ReportViewer displays the rendered report in XAML format, so external styles may affect the produced XAML that contains standard elements like Canvas, TextBlock, and more.

## Solution  

Try to exclude styles to check if they change the displayed content or try to export in a format like PDF.         
