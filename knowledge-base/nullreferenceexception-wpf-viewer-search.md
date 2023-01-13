---
title: NullReferenceException in WPF report viewer after invoking search dialog
description: Invoking search dialog in WPF viewer causes NullReferenceException
type: troubleshooting
page_title: NullReferenceException occurs in WPF report viewer after invoking search dialog
slug: nullreferenceexception-wpf-viewer-search
position: 
tags: wpfreportviewer,search
ticketid: 1168642
res_type: kb
---

## Environment
<table>
	<tr>
		<td>Product Version</td>
		<td>12.1 18.516</td>
	</tr>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting </td>
	</tr>
</table>


## Description

Invoking the search dialog in WPF report viewer results in NullReferenceException.

## Cause\Possible Cause(s)

XAML template of WPF report viewer (Telerik.ReportViewer.Wpf.xaml) is missing the elements required by the search functionality 
that was introduced in version 12.1 18.516. This can happen if the template was not updated after upgrading the project to the version 12.1 18.516.

## Solution

Viewer's template needs to be updated manually with the one provided with version 12.1 18.516. It can be found in
[Telerik Reporting installation folder]\Progress\Telerik Reporting R2 2018\Wpf\Themes\\[ThemeName] folder.

Custom templates need to be merged manually.

## See Also

[WPF viewer manual setup]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/wpf-application/how-to-add--manually-report-viewer-to-a-wpf-.net-framework-project%})




