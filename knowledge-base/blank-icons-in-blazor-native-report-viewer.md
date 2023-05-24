---
title: Toolbar Icons and Search Dialog of the Native Blazor Viewer Appear Blank
page_title: Icons are not visualized in the toolbar and search dialog of the Native Blazor Viewer
description: "Learn how to visualize all the toolbar and search dialog icons of the Native Blazor Report Viewer built with Telerik Blazor UI 3.7.0 when using Telerik Blazor UI 4.0.0."
type: how-to
slug: blank-icons-in-blazor-native-report-viewer
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
			<td>Application Type</td>
			<td>Web Application</td>
		</tr>
	<tr>
			<td>Report Viewer</td>
			<td>Blazor Native Report Viewer</td>
		</tr>
		<tr>
			<td>Version</td>
			<td>17.0.23.118 or lower</td>
		</tr>
	</tbody>
</table>

## Description

The issue is described in the bug report [Several icons are not visualized in the toolbar and search dialog of the Native Blazor Report Viewer](https://feedback.telerik.com/reporting/1594670-several-icons-are-not-visualized-in-the-toolbar-and-search-dialog-of-the-native-blazor-report-viewer).

The [Blazor Native Report Viewer]({%slug telerikreporting/embedding-reports/display-reports-in-applications/web-application/native-blazor-report-viewer/overview%}) with version _17.0.23.118_ or lower is built with _Telerik.UI.forBlazor 3.7.0_ components.

With [Telerik.UI.forBlazor 4.0.0](https://www.telerik.com/support/whats-new/blazor-ui/release-history/ui-for-blazor-4-0-0) the Telerik Blazor UI team introduced a breaking change in _Icon_ names. Instead of _String_, they should be referenced as the newly introduced _Enum_ values - see [Icons List](https://docs.telerik.com/blazor-ui/common-features/icons#icons-list).

## Solution

### With Telerik Blazor UI version __4.0.0__

Apply the following changes in:

* `_Layout.cshtml` for .NET 6 projects
* `Host.cshtml` for .NET 7 projects

1. Download the CSS file [icon-patch.css](./resources/icon-patch.css) from our GitHub repository and save it to your project, for example in the folder `wwwroot/css`.
1. Reference the `icon-patch.css` after the CSS file of the viewer:

	`<link rel="stylesheet" href="css/icon-patch.css" />`

1. Change the Kendo Theme CSS reference to version 4.0.0:

	`<link rel="stylesheet" href="https://blazor.cdn.telerik.com/blazor/4.0.0/kendo-theme-default/all.css" />`

The relevant part of the code in the CSHTML file should look like:

````CSHTML
<script src="_content/Telerik.UI.for.Blazor/js/telerik-blazor.js"></script>
<script src="_content/Telerik.ReportViewer.BlazorNative/js/reporting-blazor-viewer.js"></script>

<link rel="stylesheet" href="https://blazor.cdn.telerik.com/blazor/4.0.0/kendo-theme-default/all.css" />

<link href="_content/Telerik.ReportViewer.BlazorNative/css/reporting-blazor-viewer.css" rel="stylesheet" />
<link rel="stylesheet" href="css/icon-patch.css" />
````

### With Telerik Blazor UI version __4.0.1__ or higher

Apply the following changes in:

* `_Layout.cshtml` for .NET 6 projects
* `Host.cshtml` for .NET 7 projects

1. Download the CSS file [icon-patch-4-0-1.css](./resources/icon-patch-4-0-1.css) from our GitHub repository and save it to your project, for example in the folder `wwwroot/css`.
1. Reference the `icon-patch-4-0-1.css` after the CSS file of the viewer:

	`<link rel="stylesheet" href="css/icon-patch-4-0-1.css" />`

1. Change the Kendo Theme CSS reference to version 4.0.1:

	`<link rel="stylesheet" href="https://blazor.cdn.telerik.com/blazor/4.0.1/kendo-theme-default/all.css" />`

The relevant part of the code in the CSHTML file should look like:

````CSHTML
<script src="_content/Telerik.UI.for.Blazor/js/telerik-blazor.js"></script>
<script src="_content/Telerik.ReportViewer.BlazorNative/js/reporting-blazor-viewer.js"></script>

<link rel="stylesheet" href="https://blazor.cdn.telerik.com/blazor/4.0.1/kendo-theme-default/all.css" />

<link href="_content/Telerik.ReportViewer.BlazorNative/css/reporting-blazor-viewer.css" rel="stylesheet" />
<link rel="stylesheet" href="css/icon-patch-4-0-1.css" />
````

## See Also

* [Blazor Native Report Viewer]({%slug telerikreporting/embedding-reports/display-reports-in-applications/web-application/native-blazor-report-viewer/overview%})
* [Telerik Blazor UI Icons List](https://docs.telerik.com/blazor-ui/common-features/icons#icons-list)
* [Telerik.UI.forBlazor 4.0.0](https://www.telerik.com/support/whats-new/blazor-ui/release-history/ui-for-blazor-4-0-0)
