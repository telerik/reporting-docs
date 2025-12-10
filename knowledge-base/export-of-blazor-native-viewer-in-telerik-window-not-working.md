---
title: Export of Blazor Native Report Viewer Not Working in Telerik Window
description: "Learn how to visualize the export menu of the Blazor Native Report Viewer that is hidden when the viewer is hosted in Telerik UI for Blazor TelerikWindow component."
type: how-to
page_title: The Export menu of the Blazor Native Report Viewer does not show when the viewer is in TelerikWindow
slug: export-of-blazor-native-viewer-in-telerik-window-not-working
ticketid: 1592541
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
			<td>Report Viewer</td>
			<td>Native Blazor</td>
		</tr>
	</tbody>
</table>


## Description

Clicking on the `Export` button from the menu of the [Native Blazor Report Viewer]({%slug telerikreporting/embedding-reports/display-reports-in-applications/web-application/native-blazor-report-viewer/overview%}) when hosted in the Telerik UI for Blazor [TelerikWindow](https://docs.telerik.com/blazor-ui/components/window/overview) modal window component doesn't display the expected available export formats. The problem is in the [ContextMenu](https://docs.telerik.com/blazor-ui/components/contextmenu/overview) that is opened when clicking on the `Export` button. It is hidden behind the modal window.

This is a known bug in the Telerik UI for Blazor - [The ContextMenu is hidden behind the Modal Window #2554](https://feedback.telerik.com/blazor/1520526-the-contextmenu-is-hidden-behind-the-modal-window). Solving this issue should also fix the problem in the viewer.

## Suggested Workarounds

Increase the Z-index of the Telerik UI for Blazor ContextMenu that lists the available export options, so that it is displayed on top of the TelerikWindow modal window. Here is a sample code you may add to the page with the viewer to fix the problem:

````HTML
<style>
	.k-animation-container {
		z-index: 15000;
	}
</style>
````

## See Also

* [The ContextMenu is hidden behind the Modal Window #2554](https://feedback.telerik.com/blazor/1520526-the-contextmenu-is-hidden-behind-the-modal-window)
* [Native Blazor Report Viewer]({%slug telerikreporting/embedding-reports/display-reports-in-applications/web-application/native-blazor-report-viewer/overview%})
* [TelerikWindow](https://docs.telerik.com/blazor-ui/components/window/overview)
