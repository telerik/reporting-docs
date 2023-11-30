---
title: Visual Studio Report Designer is Blank
description: "Learn why the Visual Studio Report Designer may appear blank when trying to open a Report."
type: troubleshooting
page_title: Blank Visual Studio Report Designer
slug: vs-report-designer-is-blank
tags: vs,designer
res_type: kb
---

## Environment

<table>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting</td>
	</tr>
</table>

## Description

The [Visual Studio Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/visual-studio-report-designer/overview%}) does not display anything when trying to open a report. 

## Solution

1. Run the [Upgrade Wizard]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/visual-studio-report-designer/upgrade-wizard%}).
1. Restart Visual Studio.
1. If the report cannot be loaded by the Visual Studio Report Designer, navigate to the definition of the `InitializeComponent` report method. As a result, you will see the Designer Report class.
1. If the Designer Report class is not visible, refer to the KB article on [Visual Studio Report Designer being blank]({%slug visual-studio-report-designer-is-blank%}).
