---
title: Error Message About Object Type Conversion
page_title: Troubleshooting Error Message about Object Type Conversion
description: "Learn how to troubleshoot and fix an error about failed object type conversion from the same type in Telerik Reporting."
slug: object-type-conversion-error
tags: telerik, reporting, troubleshoot, error, object, type, conversion
published: True
type: troubleshooting
res_type: kb
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
			<td>WinForms, WPF, ASP.NET</td>
		</tr>
	</tbody>
</table>

## Description

An `Object of type 'XXX' cannot be converted to type 'XXX'` occurs where `XXX` is the same `Type`.

## Cause

The possible reason for the issue is that not all Telerik Reporting assemblies are upgraded to the same version.

## Solution

1. Run the [Upgrade Wizard]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/visual-studio-report-designer/upgrade-wizard%}).
1. Restart Visual Studio.
1. Manually verify that all Telerik Reporting assemblies are upgraded to the same version. For more information, refer to the article on [upgrading Telerik Reporting projects]({%slug telerikreporting/upgrade/overview%}).

## See Also

* [Upgrade Wizard]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/visual-studio-report-designer/upgrade-wizard%})
* [Upgrading Telerik Reporting Projects]({%slug telerikreporting/upgrade/overview%})
