---
title: Unable to Upgrade after Using the Upgrade Wizard
page_title: Unable to Upgrade after Using the Upgrade Wizard Troubleshooting
description: "Learn how to upgrade your Telerik Reporting Web Site projects. The Upgrade wizard fails for web sites as it is not designed to handle them."
slug: unable-to-upgrade-after-wizard
tags: telerik, reporting, troubleshoot, unable, to, upgrade, after, wizard
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
	</tbody>
</table>

## Description

The website Telerik Reporting project is not upgraded after running the Upgrade Wizard.

## Cause

The [Upgrade Wizard]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/visual-studio-report-designer/upgrade-wizard%}) as well as all Telerik Reporting Wizards and Designers are not designed to handle website projects because websites handle assembly references in a different way.

## Solution

Manually add viewers or upgrade the website. Design reports in an external `ClassLibrary` project that is referenced by the website project. For more information, refer to the article on [upgrading Telerik Reporting projects]({%slug telerikreporting/upgrade/overview%}).
