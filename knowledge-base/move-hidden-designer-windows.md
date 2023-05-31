---
title: Adjust Popup Windows of the Report Designer
description: "Learn how to re-adjust a popup window of the Desktop Report Designer with the keyboard in Telerik Reporting."
type: how-to
page_title: Repositioning hidden windows of the Report Designer
slug: move-hidden-designer-windows
tags: Designer
ticketid: 406760
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
			<td>Report Designer</td>
			<td>Standalone and Visual Studio</td>
		</tr>
	</tbody>
</table>

## Description

After switching back from using a 2 monitor setup to a single monitor, some of the popup windows of the Report Designer that were displayed on my second monitor are now unreachable with the mouse.

How to reposition the windows for single monitor without connecting with the 2nd monitor again?

## Solution

1. Open a report in the Desktop Report Designer with the misplaced windows.
1. Open the popup window that needs adjusting.
1. Use the `Alt` + `Space` key combination to focus the window. This will also open the window's context menu.

	> You won't see the window and the opened menu as they will be occur virtually away from the monitor, in the location of the second monitor you used to have.

1. Press the `M` key to select the `Move` option. Now you should be able to move the focused window with the arrow keys, or by dragging it with the mouse.

Alternatively, for the [Standalone Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/overview%}), you may delete the user configuration file to reset to positions of the popup windows locations. Details on the approach may be found in the KB article [How to edit connection strings saved by the Standalone Report Designer?]({%slug how-to-edit-connection-strings-saved-by-the-standalone-report-designer%}).

## See Also

* [Standalone Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/overview%})
* [Visual Studio Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/visual-studio-report-designer/overview%})
* [How to edit connection strings saved by the Standalone Report Designer?]({%slug how-to-edit-connection-strings-saved-by-the-standalone-report-designer%})
