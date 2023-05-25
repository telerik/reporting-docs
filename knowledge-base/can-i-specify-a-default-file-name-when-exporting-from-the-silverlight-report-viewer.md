---
title: Specify a Default Filename on Export From Silverlight Viewer
description: "Learn how to bind a default file name when exporting from the Silverlight report viewer in Telerik Reporting."
type: how-to
page_title: Set default filename when exporting from Silverlight Report Viewer
slug: can-i-specify-a-default-file-name-when-exporting-from-the-silverlight-report-viewer
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
			<td>Report Viewer</td>
			<td>Silverlight</td>
		</tr>
	</tbody>
</table>

> The Silverlight Report Viewer and its WCF Reporting Service are no longer supported and deployed with the installation of Telerik Reporting. The last release of Telerik Reporting with included Silverlight Report Viewer is [R1 2023](https://www.telerik.com/support/whats-new/reporting/release-history/progress-telerik-reporting-r1-2023-17-0-23-118).

## Description

One cannot use the report name or specify a default file name when exporting from the Silverlight report viewer.

## Solution

By design, the [Report.DocumentName](/api/telerik.reporting.report#Telerik_Reporting_Report_DocumentName) property is used as a default file name for all exported files from the Telerik report viewers.

However, in Silverlight the [`SaveFileDialog.DefaultFileName`](https://learn.microsoft.com/en-us/previous-versions/windows/silverlight/dotnet-windows-silverlight/gg712979(v=vs.95)) setting is treated as security vulnerability. Thus, the `DefaultFileName` is only applied for [trusted applications](https://learn.microsoft.com/en-us/previous-versions/windows/silverlight/dotnet-windows-silverlight/ee721083(v=vs.95)).

## See Also

* [Change the default message in the Security warning prompt when adding the DefaultFileName property of SaveFileDialog in Silverlight5](https://social.msdn.microsoft.com/Forums/en-US/56772597-705e-4e6d-8545-9421ce07ebd6/change-the-default-message-in-the-security-warning-prompt-when-adding-the-defaultfilename-property?forum=silverlightgen).
